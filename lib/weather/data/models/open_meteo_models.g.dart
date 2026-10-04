// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_meteo_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForecastResponse _$ForecastResponseFromJson(Map<String, dynamic> json) =>
    _ForecastResponse(
      utcOffsetSeconds: (json['utc_offset_seconds'] as num?)?.toInt(),
      current: json['current'] == null
          ? null
          : CurrentBlock.fromJson(json['current'] as Map<String, dynamic>),
      hourly: json['hourly'] == null
          ? null
          : HourlyBlock.fromJson(json['hourly'] as Map<String, dynamic>),
      daily: json['daily'] == null
          ? null
          : DailyBlock.fromJson(json['daily'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastResponseToJson(_ForecastResponse instance) =>
    <String, dynamic>{
      'utc_offset_seconds': instance.utcOffsetSeconds,
      'current': instance.current,
      'hourly': instance.hourly,
      'daily': instance.daily,
    };

_CurrentBlock _$CurrentBlockFromJson(Map<String, dynamic> json) =>
    _CurrentBlock(
      time: (json['time'] as num?)?.toInt(),
      temperature: (json['temperature_2m'] as num?)?.toDouble(),
      apparentTemperature: (json['apparent_temperature'] as num?)?.toDouble(),
      humidity: (json['relative_humidity_2m'] as num?)?.toDouble(),
      isDay: (json['is_day'] as num?)?.toInt(),
      weatherCode: (json['weather_code'] as num?)?.toInt(),
      cloudCover: (json['cloud_cover'] as num?)?.toDouble(),
      pressure: (json['pressure_msl'] as num?)?.toDouble(),
      windSpeed: (json['wind_speed_10m'] as num?)?.toDouble(),
      windDirection: (json['wind_direction_10m'] as num?)?.toDouble(),
      visibility: (json['visibility'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CurrentBlockToJson(_CurrentBlock instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature,
      'apparent_temperature': instance.apparentTemperature,
      'relative_humidity_2m': instance.humidity,
      'is_day': instance.isDay,
      'weather_code': instance.weatherCode,
      'cloud_cover': instance.cloudCover,
      'pressure_msl': instance.pressure,
      'wind_speed_10m': instance.windSpeed,
      'wind_direction_10m': instance.windDirection,
      'visibility': instance.visibility,
    };

_HourlyBlock _$HourlyBlockFromJson(Map<String, dynamic> json) => _HourlyBlock(
  time:
      (json['time'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  temperature:
      (json['temperature_2m'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList() ??
      const [],
  weatherCode:
      (json['weather_code'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toInt())
          .toList() ??
      const [],
  precipitationProbability:
      (json['precipitation_probability'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList() ??
      const [],
  isDay:
      (json['is_day'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toInt())
          .toList() ??
      const [],
);

Map<String, dynamic> _$HourlyBlockToJson(_HourlyBlock instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature,
      'weather_code': instance.weatherCode,
      'precipitation_probability': instance.precipitationProbability,
      'is_day': instance.isDay,
    };

_DailyBlock _$DailyBlockFromJson(Map<String, dynamic> json) => _DailyBlock(
  time:
      (json['time'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  weatherCode:
      (json['weather_code'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toInt())
          .toList() ??
      const [],
  temperatureMax:
      (json['temperature_2m_max'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList() ??
      const [],
  temperatureMin:
      (json['temperature_2m_min'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList() ??
      const [],
  sunrise:
      (json['sunrise'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toInt())
          .toList() ??
      const [],
  sunset:
      (json['sunset'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toInt())
          .toList() ??
      const [],
  precipitationProbabilityMax:
      (json['precipitation_probability_max'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList() ??
      const [],
  precipitationSum:
      (json['precipitation_sum'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList() ??
      const [],
  uvIndexMax:
      (json['uv_index_max'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList() ??
      const [],
);

Map<String, dynamic> _$DailyBlockToJson(_DailyBlock instance) =>
    <String, dynamic>{
      'time': instance.time,
      'weather_code': instance.weatherCode,
      'temperature_2m_max': instance.temperatureMax,
      'temperature_2m_min': instance.temperatureMin,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'precipitation_probability_max': instance.precipitationProbabilityMax,
      'precipitation_sum': instance.precipitationSum,
      'uv_index_max': instance.uvIndexMax,
    };

_AirQualityResponse _$AirQualityResponseFromJson(Map<String, dynamic> json) =>
    _AirQualityResponse(
      current: json['current'] == null
          ? null
          : AirQualityCurrent.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AirQualityResponseToJson(_AirQualityResponse instance) =>
    <String, dynamic>{'current': instance.current};

_AirQualityCurrent _$AirQualityCurrentFromJson(Map<String, dynamic> json) =>
    _AirQualityCurrent(
      europeanAqi: (json['european_aqi'] as num?)?.toDouble(),
      pm25: (json['pm2_5'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AirQualityCurrentToJson(_AirQualityCurrent instance) =>
    <String, dynamic>{
      'european_aqi': instance.europeanAqi,
      'pm2_5': instance.pm25,
    };

_GeocodingResponse _$GeocodingResponseFromJson(Map<String, dynamic> json) =>
    _GeocodingResponse(
      results:
          (json['results'] as List<dynamic>?)
              ?.map((e) => GeocodingResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GeocodingResponseToJson(_GeocodingResponse instance) =>
    <String, dynamic>{'results': instance.results};

_GeocodingResult _$GeocodingResultFromJson(Map<String, dynamic> json) =>
    _GeocodingResult(
      name: json['name'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      countryCode: json['country_code'] as String?,
      admin1: json['admin1'] as String?,
    );

Map<String, dynamic> _$GeocodingResultToJson(_GeocodingResult instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'country_code': instance.countryCode,
      'admin1': instance.admin1,
    };
