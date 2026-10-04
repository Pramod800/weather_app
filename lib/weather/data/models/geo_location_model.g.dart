// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeoLocationModel _$GeoLocationModelFromJson(Map<String, dynamic> json) =>
    _GeoLocationModel(
      name: json['name'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      country: json['country'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$GeoLocationModelToJson(_GeoLocationModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lat': instance.lat,
      'lon': instance.lon,
      'country': instance.country,
      'state': instance.state,
    };
