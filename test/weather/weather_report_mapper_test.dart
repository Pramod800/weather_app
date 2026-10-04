import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/weather/data/mappers/weather_report_mapper.dart';
import 'package:weather_app/weather/data/models/air_quality_model.dart';
import 'package:weather_app/weather/data/models/forecast_model.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';
import 'package:weather_app/weather/domain/entities/place.dart';
import 'package:weather_app/weather/domain/entities/weather_condition.dart';

/// 2026-10-04 04:43:35 UTC, which is 10:28 in Kathmandu (UTC+5:45).
const _observedAt = 1791089015;

/// 2026-10-04 06:00:00 UTC, the first forecast step.
const _firstStep = 1791093600;

Map<String, dynamic> _weatherJson() => {
  'weather': [
    {'id': 500, 'main': 'Rain', 'description': 'light rain', 'icon': '10d'},
  ],
  'main': {
    'temp': 24.79,
    'feels_like': 25,
    'temp_min': 24.79,
    'temp_max': 24.79,
    'pressure': 1016,
    'humidity': 64,
  },
  'visibility': 10000,
  'wind': {'speed': 1.28, 'deg': 217, 'gust': 1.34},
  'clouds': {'all': 14},
  'dt': _observedAt,
  'sys': {'country': 'NP', 'sunrise': 1791072756, 'sunset': 1791115341},
  'timezone': 20700,
  'name': 'Kathmandu',
};

/// 40 steps, three hours apart, warming by one degree per step from 20.
Map<String, dynamic> _forecastJson() => {
  'list': [
    for (var i = 0; i < 40; i++)
      {
        'dt': _firstStep + i * 3 * 3600,
        'main': {'temp': 20 + i, 'feels_like': 20 + i},
        'weather': [
          {'id': 800, 'description': 'clear sky', 'icon': '01d'},
        ],
        'pop': i == 1 ? 0.6 : 0,
      },
  ],
};

void main() {
  const kathmandu = Place(name: 'Kathmandu', latitude: 27.7, longitude: 85.32);
  final fetchedAt = DateTime.utc(2026, 10, 4, 4, 45);

  test('maps the current reading, including snake_case fields', () {
    final report = mapWeatherReport(
      place: kathmandu,
      weather: WeatherModel.fromJson(_weatherJson()),
      forecast: ForecastModel.fromJson(_forecastJson()),
      fetchedAt: fetchedAt,
    );

    final current = report.current;
    expect(current.temperature, 24.79);
    expect(current.feelsLike, 25);
    expect(current.condition, WeatherCondition.rain);
    expect(current.description, 'Light rain');
    expect(current.isDay, isTrue);
    expect(current.humidity, 64);
    expect(current.windDegrees, 217);
    expect(report.utcOffset, const Duration(hours: 5, minutes: 45));
    expect(report.localTime(current.observedAt).hour, 10);
  });

  test('hourly starts with now and covers the next eight steps', () {
    final report = mapWeatherReport(
      place: kathmandu,
      weather: WeatherModel.fromJson(_weatherJson()),
      forecast: ForecastModel.fromJson(_forecastJson()),
      fetchedAt: fetchedAt,
    );

    expect(report.hourly, hasLength(9));
    expect(report.hourly.first.time, report.current.observedAt);
    expect(report.hourly[1].temperature, 20);
    expect(report.hourly[2].precipitationChance, 0.6);
  });

  test('daily groups steps by the calendar day at the place', () {
    final report = mapWeatherReport(
      place: kathmandu,
      weather: WeatherModel.fromJson(_weatherJson()),
      forecast: ForecastModel.fromJson(_forecastJson()),
      fetchedAt: fetchedAt,
    );

    expect(report.daily, hasLength(5));
    final today = report.daily.first;
    expect(today.date, DateTime.utc(2026, 10, 4));
    // Steps at 06, 09, 12, 15 and 18 UTC all fall on 4 October local time;
    // the current reading is the warmest of the day.
    expect(today.low, 20);
    expect(today.high, 24.79);
    expect(today.precipitationChance, 0.6);
    expect(report.daily[1].date, DateTime.utc(2026, 10, 5));
    expect(report.daily[1].low, 25);
  });

  test('names a located place from the response', () {
    final report = mapWeatherReport(
      place: const Place(name: '', latitude: 27.7, longitude: 85.32),
      weather: WeatherModel.fromJson(_weatherJson()),
      forecast: ForecastModel.fromJson(_forecastJson()),
      fetchedAt: fetchedAt,
    );

    expect(report.place.name, 'Kathmandu');
    expect(report.place.country, 'NP');
  });

  test('maps air quality and tolerates its absence', () {
    final air = AirQualityModel.fromJson({
      'list': [
        {
          'main': {'aqi': 4},
          'components': {'pm2_5': 128.15, 'pm10': 175},
        },
      ],
    });

    final withAir = mapWeatherReport(
      place: kathmandu,
      weather: WeatherModel.fromJson(_weatherJson()),
      forecast: ForecastModel.fromJson(_forecastJson()),
      airQuality: air,
      fetchedAt: fetchedAt,
    );
    final withoutAir = mapWeatherReport(
      place: kathmandu,
      weather: WeatherModel.fromJson(_weatherJson()),
      forecast: ForecastModel.fromJson(_forecastJson()),
      fetchedAt: fetchedAt,
    );

    expect(withAir.airQuality?.index, 4);
    expect(withAir.airQuality?.label, 'Poor');
    expect(withAir.airQuality?.pm25, 128.15);
    expect(withoutAir.airQuality, isNull);
  });

  test('rejects a response without a temperature', () {
    final json = _weatherJson()..remove('main');

    expect(
      () => mapWeatherReport(
        place: kathmandu,
        weather: WeatherModel.fromJson(json),
        forecast: ForecastModel.fromJson(_forecastJson()),
        fetchedAt: fetchedAt,
      ),
      throwsFormatException,
    );
  });
}
