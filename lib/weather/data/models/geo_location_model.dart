import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_location_model.freezed.dart';
part 'geo_location_model.g.dart';

/// One match from OpenWeather `/geo/1.0/direct`.
@freezed
abstract class GeoLocationModel with _$GeoLocationModel {
  const factory GeoLocationModel({
    String? name,
    double? lat,
    double? lon,
    String? country,
    String? state,
  }) = _GeoLocationModel;

  factory GeoLocationModel.fromJson(Map<String, dynamic> json) =>
      _$GeoLocationModelFromJson(json);
}
