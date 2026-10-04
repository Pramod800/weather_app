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

  /// Places whose name matches [query].
  Future<Either<Failure, List<Place>>> searchPlaces(String query);

  /// Where the device is. The returned place has no name yet;
  /// [fetchReport] fills it in.
  Future<Either<Failure, Place>> locate();
}
