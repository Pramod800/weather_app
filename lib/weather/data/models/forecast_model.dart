import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';

part 'forecast_model.freezed.dart';
part 'forecast_model.g.dart';

/// Response of OpenWeather `/data/2.5/forecast` (5 days in 3-hour steps).
@freezed
abstract class ForecastModel with _$ForecastModel {
  const factory ForecastModel({List<ForecastEntry>? list}) = _ForecastModel;

  factory ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastModelFromJson(json);
}

@freezed
abstract class ForecastEntry with _$ForecastEntry {
  const factory ForecastEntry({
    int? dt,
    Main? main,
    List<Weather>? weather,

    /// Probability of precipitation, 0 to 1.
    double? pop,
  }) = _ForecastEntry;

  factory ForecastEntry.fromJson(Map<String, dynamic> json) =>
      _$ForecastEntryFromJson(json);
}
