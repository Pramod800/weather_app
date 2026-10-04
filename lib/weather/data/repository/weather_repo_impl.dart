import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/weather/data/data_source/local_storage.dart';
import 'package:weather_app/weather/data/data_source/weather_remote_data_source.dart';
import 'package:weather_app/weather/data/mappers/weather_report_mapper.dart';
import 'package:weather_app/weather/data/models/open_meteo_models.dart';
import 'package:weather_app/weather/domain/entities/place.dart';
import 'package:weather_app/weather/domain/entities/weather_report.dart';
import 'package:weather_app/weather/domain/location_service.dart';
import 'package:weather_app/weather/domain/weather_repo.dart';

class WeatherRepoImpl implements WeatherRepo {
  WeatherRepoImpl({
    required WeatherRemoteDataSource remote,
    required LocalStorage storage,
    required LocationService location,
    DateTime Function() now = DateTime.now,
  }) : _remote = remote,
       _storage = storage,
       _location = location,
       _now = now;

  final WeatherRemoteDataSource _remote;
  final LocalStorage _storage;
  final LocationService _location;
  final DateTime Function() _now;

  @override
  Future<Either<Failure, WeatherReport>> fetchReport(Place place) async {
    final lat = place.latitude;
    final lon = place.longitude;
    try {
      // Air quality is a nice-to-have; the report is still useful without.
      final airRequest = _remote
          .fetchAirQuality(latitude: lat, longitude: lon)
          .then<Map<String, dynamic>?>((data) => data)
          .onError<Failure>((_, _) => null);
      final placeRequest = place.name.isEmpty
          ? _named(place)
          : Future.value(place);
      final forecast = await _remote.fetchForecast(
        latitude: lat,
        longitude: lon,
      );
      place = await placeRequest;

      final raw = <String, dynamic>{
        'forecast': forecast,
        'air': await airRequest,
        'fetchedAt': _now().toUtc().toIso8601String(),
      };
      final report = _parse(place, raw, isFromCache: false);
      await _storage.writeReport(place.id, raw);
      return right(report);
    } on Failure catch (failure) {
      return left(failure);
    } on Object {
      // The service answered, but not with something we can read.
      return left(const Failure(FailureType.server));
    }
  }

  @override
  WeatherReport? cachedReport(Place place) {
    final raw = _storage.readReport(place.id);
    if (raw == null) return null;
    try {
      return _parse(place, raw, isFromCache: true);
    } on Object {
      return null;
    }
  }

  /// How many years back "this day in past years" reaches.
  static const pastYears = 5;

  @override
  Future<Either<Failure, List<DailyForecast>>> fetchPastYears(
    Place place,
    DateTime date,
  ) async {
    final day = date.toIso8601String().substring(0, 10);
    try {
      // A past day never changes, so one fetch per place and day is enough.
      final cached = _storage.readHistory(place.id);
      final List<dynamic> responses;
      if (cached != null && cached['date'] == day) {
        responses = cached['days'] as List<dynamic>;
      } else {
        responses = await Future.wait([
          for (var years = 1; years <= pastYears; years++)
            _remote.fetchArchiveDay(
              latitude: place.latitude,
              longitude: place.longitude,
              date: DateTime.utc(date.year - years, date.month, date.day),
            ),
        ]);
        await _storage.writeHistory(place.id, {'date': day, 'days': responses});
      }

      return right([
        for (final response in responses)
          ?mapArchiveDay(
            ForecastResponse.fromJson(response as Map<String, dynamic>),
          ),
      ]);
    } on Failure catch (failure) {
      return left(failure);
    } on Object {
      return left(const Failure(FailureType.server));
    }
  }

  @override
  Future<Either<Failure, List<PlaceSnapshot>>> fetchSnapshots(
    List<Place> places,
  ) async {
    if (places.isEmpty) return right(const []);
    try {
      final responses = await _remote.fetchCurrentForMany(
        latitudes: [for (final place in places) place.latitude],
        longitudes: [for (final place in places) place.longitude],
      );
      return right([
        for (final (i, place) in places.indexed)
          if (i < responses.length)
            ?mapPlaceSnapshot(
              place,
              ForecastResponse.fromJson(responses[i] as Map<String, dynamic>),
            ),
      ]);
    } on Failure catch (failure) {
      return left(failure);
    } on Object {
      return left(const Failure(FailureType.server));
    }
  }

  @override
  Future<Either<Failure, List<Place>>> searchPlaces(String query) async {
    try {
      final response = GeocodingResponse.fromJson(
        await _remote.searchPlaces(query),
      );
      final places = <Place>[];
      for (final result in response.results) {
        final name = result.name;
        final lat = result.latitude;
        final lon = result.longitude;
        if (name == null || lat == null || lon == null) continue;
        final place = Place(
          name: name,
          latitude: lat,
          longitude: lon,
          country: result.countryCode,
          state: result.admin1,
        );
        // The geocoder returns near-duplicates for some cities.
        if (!places.contains(place)) places.add(place);
      }
      return right(places);
    } on Failure catch (failure) {
      return left(failure);
    } on Object {
      return left(const Failure(FailureType.server));
    }
  }

  @override
  Future<Either<Failure, Place>> locate() async {
    try {
      final coordinates = await _location.currentCoordinates();
      return right(
        Place(
          name: '',
          latitude: coordinates.latitude,
          longitude: coordinates.longitude,
        ),
      );
    } on Failure catch (failure) {
      return left(failure);
    }
  }

  /// Looks up what the device's position is called. A weather report is
  /// worth showing even when that lookup fails, so it never throws.
  Future<Place> _named(Place place) async {
    try {
      final json = await _remote.reverseGeocode(
        latitude: place.latitude,
        longitude: place.longitude,
      );
      final address = json['address'] as Map<String, dynamic>? ?? const {};
      final name =
          address['city'] ??
          address['town'] ??
          address['village'] ??
          address['municipality'] ??
          address['county'] ??
          json['name'];
      if (name is! String || name.isEmpty) {
        return place.copyWith(name: _unnamedPlace);
      }
      return Place(
        name: name,
        latitude: place.latitude,
        longitude: place.longitude,
        country: (address['country_code'] as String?)?.toUpperCase(),
        state: address['state'] as String?,
      );
    } on Object {
      return place.copyWith(name: _unnamedPlace);
    }
  }

  static const _unnamedPlace = 'My location';

  WeatherReport _parse(
    Place place,
    Map<String, dynamic> raw, {
    required bool isFromCache,
  }) {
    final air = raw['air'] as Map<String, dynamic>?;
    return mapWeatherReport(
      place: place,
      forecast: ForecastResponse.fromJson(
        raw['forecast'] as Map<String, dynamic>,
      ),
      airQuality: air == null ? null : AirQualityResponse.fromJson(air),
      fetchedAt: DateTime.parse(raw['fetchedAt'] as String),
      isFromCache: isFromCache,
    );
  }
}
