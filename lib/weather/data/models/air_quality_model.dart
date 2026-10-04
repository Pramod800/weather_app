import 'package:freezed_annotation/freezed_annotation.dart';

part 'air_quality_model.freezed.dart';
part 'air_quality_model.g.dart';

/// Response of OpenWeather `/data/2.5/air_pollution`.
@freezed
abstract class AirQualityModel with _$AirQualityModel {
  const factory AirQualityModel({List<AirQualityEntry>? list}) =
      _AirQualityModel;

  factory AirQualityModel.fromJson(Map<String, dynamic> json) =>
      _$AirQualityModelFromJson(json);
}

@freezed
abstract class AirQualityEntry with _$AirQualityEntry {
  const factory AirQualityEntry({
    AirQualityIndex? main,

    /// Pollutant concentrations in µg/m³, keyed like `pm2_5`, `pm10`, `o3`.
    Map<String, double>? components,
  }) = _AirQualityEntry;

  factory AirQualityEntry.fromJson(Map<String, dynamic> json) =>
      _$AirQualityEntryFromJson(json);
}

@freezed
abstract class AirQualityIndex with _$AirQualityIndex {
  const factory AirQualityIndex({int? aqi}) = _AirQualityIndex;

  factory AirQualityIndex.fromJson(Map<String, dynamic> json) =>
      _$AirQualityIndexFromJson(json);
}
