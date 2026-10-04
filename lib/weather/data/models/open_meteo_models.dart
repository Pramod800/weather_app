import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_meteo_models.freezed.dart';
part 'open_meteo_models.g.dart';

/// Response of Open-Meteo `/v1/forecast`, requested with
/// `timeformat=unixtime`. Hourly and daily data arrive as parallel lists:
/// index `i` of every list describes the same hour or day.
@freezed
abstract class ForecastResponse with _$ForecastResponse {
  const factory ForecastResponse({
    @JsonKey(name: 'utc_offset_seconds') int? utcOffsetSeconds,
    CurrentBlock? current,
    HourlyBlock? hourly,
    DailyBlock? daily,
  }) = _ForecastResponse;

  factory ForecastResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseFromJson(json);
}

@freezed
abstract class CurrentBlock with _$CurrentBlock {
  const factory CurrentBlock({
    int? time,
    @JsonKey(name: 'temperature_2m') double? temperature,
    @JsonKey(name: 'apparent_temperature') double? apparentTemperature,
    @JsonKey(name: 'relative_humidity_2m') double? humidity,
    @JsonKey(name: 'is_day') int? isDay,
    @JsonKey(name: 'weather_code') int? weatherCode,
    @JsonKey(name: 'cloud_cover') double? cloudCover,
    @JsonKey(name: 'pressure_msl') double? pressure,
    @JsonKey(name: 'wind_speed_10m') double? windSpeed,
    @JsonKey(name: 'wind_direction_10m') double? windDirection,
    double? visibility,
  }) = _CurrentBlock;

  factory CurrentBlock.fromJson(Map<String, dynamic> json) =>
      _$CurrentBlockFromJson(json);
}

/// Values can be null where the model has no data for that hour.
@freezed
abstract class HourlyBlock with _$HourlyBlock {
  const factory HourlyBlock({
    @Default([]) List<int> time,
    @JsonKey(name: 'temperature_2m') @Default([]) List<double?> temperature,
    @JsonKey(name: 'weather_code') @Default([]) List<int?> weatherCode,
    @JsonKey(name: 'precipitation_probability')
    @Default([])
    List<double?> precipitationProbability,
    @JsonKey(name: 'is_day') @Default([]) List<int?> isDay,
  }) = _HourlyBlock;

  factory HourlyBlock.fromJson(Map<String, dynamic> json) =>
      _$HourlyBlockFromJson(json);
}

@freezed
abstract class DailyBlock with _$DailyBlock {
  const factory DailyBlock({
    /// Midnight of each day on the place's wall clock, as a UTC timestamp.
    @Default([]) List<int> time,
    @JsonKey(name: 'weather_code') @Default([]) List<int?> weatherCode,
    @JsonKey(name: 'temperature_2m_max')
    @Default([])
    List<double?> temperatureMax,
    @JsonKey(name: 'temperature_2m_min')
    @Default([])
    List<double?> temperatureMin,
    @Default([]) List<int?> sunrise,
    @Default([]) List<int?> sunset,
    @JsonKey(name: 'precipitation_probability_max')
    @Default([])
    List<double?> precipitationProbabilityMax,
    @JsonKey(name: 'precipitation_sum')
    @Default([])
    List<double?> precipitationSum,
    @JsonKey(name: 'uv_index_max') @Default([]) List<double?> uvIndexMax,
  }) = _DailyBlock;

  factory DailyBlock.fromJson(Map<String, dynamic> json) =>
      _$DailyBlockFromJson(json);
}

/// Response of Open-Meteo `/v1/air-quality`.
@freezed
abstract class AirQualityResponse with _$AirQualityResponse {
  const factory AirQualityResponse({AirQualityCurrent? current}) =
      _AirQualityResponse;

  factory AirQualityResponse.fromJson(Map<String, dynamic> json) =>
      _$AirQualityResponseFromJson(json);
}

@freezed
abstract class AirQualityCurrent with _$AirQualityCurrent {
  const factory AirQualityCurrent({
    /// European Air Quality Index; 0 is cleanest, above 100 is extreme.
    @JsonKey(name: 'european_aqi') double? europeanAqi,
    @JsonKey(name: 'pm2_5') double? pm25,
  }) = _AirQualityCurrent;

  factory AirQualityCurrent.fromJson(Map<String, dynamic> json) =>
      _$AirQualityCurrentFromJson(json);
}

/// Response of Open-Meteo geocoding `/v1/search`. `results` is absent when
/// nothing matches.
@freezed
abstract class GeocodingResponse with _$GeocodingResponse {
  const factory GeocodingResponse({
    @Default([]) List<GeocodingResult> results,
  }) = _GeocodingResponse;

  factory GeocodingResponse.fromJson(Map<String, dynamic> json) =>
      _$GeocodingResponseFromJson(json);
}

@freezed
abstract class GeocodingResult with _$GeocodingResult {
  const factory GeocodingResult({
    String? name,
    double? latitude,
    double? longitude,
    @JsonKey(name: 'country_code') String? countryCode,

    /// First-level region, such as a state or province.
    String? admin1,
  }) = _GeocodingResult;

  factory GeocodingResult.fromJson(Map<String, dynamic> json) =>
      _$GeocodingResultFromJson(json);
}
