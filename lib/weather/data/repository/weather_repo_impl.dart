import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/weather/data/data_source/local_storage.dart';
import 'package:weather_app/weather/data/data_source/weather_remote_data_source.dart';
import 'package:weather_app/weather/data/mappers/weather_report_mapper.dart';
import 'package:weather_app/weather/data/models/air_quality_model.dart';
import 'package:weather_app/weather/data/models/forecast_model.dart';
import 'package:weather_app/weather/data/models/geo_location_model.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';
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
      final [weather, forecast] = await Future.wait([
        _remote.fetchCurrentWeather(latitude: lat, longitude: lon),
        _remote.fetchForecast(latitude: lat, longitude: lon),
      ]);

      final raw = <String, dynamic>{
        'weather': weather,
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

  @override
  Future<Either<Failure, List<Place>>> searchPlaces(String query) async {
    try {
      final results = await _remote.searchPlaces(query);
      final places = <Place>[];
      for (final item in results) {
        final model = GeoLocationModel.fromJson(item as Map<String, dynamic>);
        final name = model.name;
        final lat = model.lat;
        final lon = model.lon;
        if (name == null || lat == null || lon == null) continue;
        final place = Place(
          name: name,
          latitude: lat,
          longitude: lon,
          country: model.country,
          state: model.state,
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

  WeatherReport _parse(
    Place place,
    Map<String, dynamic> raw, {
    required bool isFromCache,
  }) {
    final air = raw['air'] as Map<String, dynamic>?;
    return mapWeatherReport(
      place: place,
      weather: WeatherModel.fromJson(raw['weather'] as Map<String, dynamic>),
      forecast: ForecastModel.fromJson(raw['forecast'] as Map<String, dynamic>),
      airQuality: air == null ? null : AirQualityModel.fromJson(air),
      fetchedAt: DateTime.parse(raw['fetchedAt'] as String),
      isFromCache: isFromCache,
    );
  }
}
