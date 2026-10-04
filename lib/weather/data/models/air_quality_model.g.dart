// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AirQualityModel _$AirQualityModelFromJson(Map<String, dynamic> json) =>
    _AirQualityModel(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => AirQualityEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AirQualityModelToJson(_AirQualityModel instance) =>
    <String, dynamic>{'list': instance.list};

_AirQualityEntry _$AirQualityEntryFromJson(Map<String, dynamic> json) =>
    _AirQualityEntry(
      main: json['main'] == null
          ? null
          : AirQualityIndex.fromJson(json['main'] as Map<String, dynamic>),
      components: (json['components'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$AirQualityEntryToJson(_AirQualityEntry instance) =>
    <String, dynamic>{'main': instance.main, 'components': instance.components};

_AirQualityIndex _$AirQualityIndexFromJson(Map<String, dynamic> json) =>
    _AirQualityIndex(aqi: (json['aqi'] as num?)?.toInt());

Map<String, dynamic> _$AirQualityIndexToJson(_AirQualityIndex instance) =>
    <String, dynamic>{'aqi': instance.aqi};
