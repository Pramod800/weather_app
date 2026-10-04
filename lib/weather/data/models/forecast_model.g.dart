// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForecastModel _$ForecastModelFromJson(Map<String, dynamic> json) =>
    _ForecastModel(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => ForecastEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastModelToJson(_ForecastModel instance) =>
    <String, dynamic>{'list': instance.list};

_ForecastEntry _$ForecastEntryFromJson(Map<String, dynamic> json) =>
    _ForecastEntry(
      dt: (json['dt'] as num?)?.toInt(),
      main: json['main'] == null
          ? null
          : Main.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      pop: (json['pop'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ForecastEntryToJson(_ForecastEntry instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'pop': instance.pop,
    };
