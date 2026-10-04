import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/weather/data/mappers/weather_report_mapper.dart';
import 'package:weather_app/weather/data/mappers/wmo_weather_code.dart';
import 'package:weather_app/weather/data/models/open_meteo_models.dart';
import 'package:weather_app/weather/domain/entities/place.dart';
import 'package:weather_app/weather/domain/entities/weather_condition.dart';

/// Kathmandu is UTC+5:45.
const _offset = 20700;

/// Local midnight on 3 October 2026, as Open-Meteo sends it: a UTC
/// timestamp, so 18:15 UTC the evening before.
final _firstMidnight =
    DateTime.utc(2026, 10, 2, 18, 15).millisecondsSinceEpoch ~/ 1000;

/// 10:30 on 4 October local time.
final _observedAt = _firstMidnight + 24 * 3600 + 10 * 3600 + 30 * 60;

const _day = 24 * 3600;

/// Three days starting with yesterday, hour by hour. Each hour is 0.1°
/// warmer than the one before, starting from 10°.
Map<String, dynamic> _forecastJson() => {
  'utc_offset_seconds': _offset,
  'current': {
    'time': _observedAt,
    'temperature_2m': 23.1,
    'apparent_temperature': 26.3,
    'relative_humidity_2m': 75,
    'is_day': 1,
    'weather_code': 95,
    'cloud_cover': 62,
    'pressure_msl': 1014.6,
    'wind_speed_10m': 0.73,
    'wind_direction_10m': 16,
    'visibility': 2840.0,
  },
  'hourly': {
    'time': [for (var i = 0; i < 72; i++) _firstMidnight + i * 3600],
    'temperature_2m': [for (var i = 0; i < 72; i++) 10 + i / 10],
    'weather_code': [for (var i = 0; i < 72; i++) 61],
    // The model has no rain probability for the final hours.
    'precipitation_probability': [
      for (var i = 0; i < 72; i++) i < 50 ? 40 : null,
    ],
    'is_day': [for (var i = 0; i < 72; i++) i % 24 >= 6 && i % 24 < 18 ? 1 : 0],
  },
  'daily': {
    'time': [for (var i = 0; i < 3; i++) _firstMidnight + i * _day],
    'weather_code': [95, 95, 53],
    'temperature_2m_max': [25.1, 28.4, 24.1],
    'temperature_2m_min': [19.0, 17.1, 16.3],
    'sunrise': [for (var i = 0; i < 3; i++) _firstMidnight + i * _day + 21600],
    'sunset': [for (var i = 0; i < 3; i++) _firstMidnight + i * _day + 64800],
    'precipitation_probability_max': [100, 80, 30],
    'precipitation_sum': [1.3, 7.3, 0],
    'uv_index_max': [7.2, 7.4, null],
  },
};

void main() {
  const kathmandu = Place(name: 'Kathmandu', latitude: 27.7, longitude: 85.32);
  final fetchedAt = DateTime.utc(2026, 10, 4, 4, 50);

  final report = mapWeatherReport(
    place: kathmandu,
    forecast: ForecastResponse.fromJson(_forecastJson()),
    fetchedAt: fetchedAt,
  );

  test('maps the current reading', () {
    final current = report.current;

    expect(current.temperature, 23.1);
    expect(current.feelsLike, 26.3);
    expect(current.condition, WeatherCondition.thunderstorm);
    expect(current.description, 'Thunderstorm');
    expect(current.isDay, isTrue);
    expect(current.humidity, 75);
    expect(current.pressure, 1015);
    expect(current.visibility, 2840);
    expect(current.windDegrees, 16);
    expect(report.utcOffset, const Duration(hours: 5, minutes: 45));
    expect(report.localTime(current.observedAt).hour, 10);
  });

  test('hourly starts with now, then the next 24 hours', () {
    expect(report.hourly, hasLength(25));
    expect(report.hourly.first.time, report.current.observedAt);
    expect(report.hourly.first.temperature, 23.1);

    // The first step after 10:30 is 11:00 on the second day: hour 35.
    final next = report.hourly[1];
    expect(report.localTime(next.time).hour, 11);
    expect(next.temperature, 13.5);
    expect(next.condition, WeatherCondition.rain);
    expect(next.precipitationChance, 0.4);
    expect(next.isDay, isTrue);
  });

  test('treats a missing rain probability as no chance', () {
    expect(report.hourly.last.precipitationChance, 0);
  });

  test('daily starts today and keeps yesterday aside for comparison', () {
    expect(report.daily, hasLength(2));

    final today = report.daily.first;
    expect(today.date, DateTime.utc(2026, 10, 4));
    expect(today.low, 17.1);
    expect(today.high, 28.4);
    expect(today.precipitationChance, 0.8);
    expect(today.precipitationSum, 7.3);
    expect(today.uvIndexMax, 7.4);

    expect(report.daily[1].date, DateTime.utc(2026, 10, 5));
    expect(report.daily[1].uvIndexMax, isNull);

    expect(report.yesterday?.date, DateTime.utc(2026, 10, 3));
    expect(report.yesterday?.high, 25.1);
  });

  test("takes sunrise and sunset from today's entry", () {
    final sunrise = report.localTime(report.current.sunrise);
    final sunset = report.localTime(report.current.sunset);

    expect((sunrise.day, sunrise.hour), (4, 6));
    expect((sunset.day, sunset.hour), (4, 18));
  });

  test('maps the European air quality index onto five bands', () {
    AirQualityResponse air(double aqi) => AirQualityResponse.fromJson({
      'current': {'european_aqi': aqi, 'pm2_5': 17.4},
    });
    int? bandFor(double aqi) => mapWeatherReport(
      place: kathmandu,
      forecast: ForecastResponse.fromJson(_forecastJson()),
      airQuality: air(aqi),
      fetchedAt: fetchedAt,
    ).airQuality?.index;

    expect(bandFor(5), 1);
    expect(bandFor(20), 2);
    expect(bandFor(71), 4);
    expect(bandFor(140), 5);
    expect(report.airQuality, isNull);
  });

  test('rejects a response without a current temperature', () {
    final json = _forecastJson()..remove('current');

    expect(
      () => mapWeatherReport(
        place: kathmandu,
        forecast: ForecastResponse.fromJson(json),
        fetchedAt: fetchedAt,
      ),
      throwsFormatException,
    );
  });

  test('survives a response with no hourly or daily data', () {
    final json = _forecastJson()
      ..remove('hourly')
      ..remove('daily');

    final bare = mapWeatherReport(
      place: kathmandu,
      forecast: ForecastResponse.fromJson(json),
      fetchedAt: fetchedAt,
    );

    expect(bare.hourly, hasLength(1));
    expect(bare.daily, isEmpty);
    expect(bare.yesterday, isNull);
    expect(bare.current.sunrise, bare.current.observedAt);
  });

  test('reads WMO weather codes', () {
    expect(conditionForWmoCode(0), WeatherCondition.clear);
    expect(conditionForWmoCode(2), WeatherCondition.partlyCloudy);
    expect(conditionForWmoCode(48), WeatherCondition.fog);
    expect(conditionForWmoCode(55), WeatherCondition.drizzle);
    expect(conditionForWmoCode(81), WeatherCondition.rain);
    expect(conditionForWmoCode(86), WeatherCondition.snow);
    expect(conditionForWmoCode(99), WeatherCondition.thunderstorm);
    expect(describeWmoCode(63), 'Rain');
    expect(describeWmoCode(3), 'Overcast');
  });
}
