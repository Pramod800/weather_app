import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/weather/domain/entities/place.dart';
import 'package:weather_app/weather/domain/entities/weather_report.dart';

abstract interface class WeatherRepo {
  /// Fetches current conditions, forecast and air quality for [place] and
  /// stores the result for offline use.
  Future<Either<Failure, WeatherReport>> fetchReport(Place place);

  /// The last report stored for [place], or null when there is none.
  WeatherReport? cachedReport(Place place);

  /// What the weather was at [place] on the same calendar day as [date]
  /// in each of the previous years, most recent first.
  Future<Either<Failure, List<DailyForecast>>> fetchPastYears(
    Place place,
    DateTime date,
  );

  /// The current weather at each of [places], in one request.
  Future<Either<Failure, List<PlaceSnapshot>>> fetchSnapshots(
    List<Place> places,
  );

  /// Places whose name matches [query].
  Future<Either<Failure, List<Place>>> searchPlaces(String query);

  /// Where the device is. The returned place has no name yet;
  /// [fetchReport] fills it in.
  Future<Either<Failure, Place>> locate();
}
