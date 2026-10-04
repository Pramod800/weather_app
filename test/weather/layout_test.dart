import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/core/utils/unit_system.dart';
import 'package:weather_app/weather/domain/entities/place.dart';
import 'package:weather_app/weather/domain/entities/sun_clock.dart';
import 'package:weather_app/weather/domain/entities/weather_condition.dart';
import 'package:weather_app/weather/domain/entities/weather_report.dart';
import 'package:weather_app/weather/presentation/widgets/current_summary.dart';
import 'package:weather_app/weather/presentation/widgets/daily_forecast_list.dart';
import 'package:weather_app/weather/presentation/widgets/home_header.dart';
import 'package:weather_app/weather/presentation/widgets/hourly_forecast_chart.dart';
import 'package:weather_app/weather/presentation/widgets/sun_arc.dart';
import 'package:weather_app/weather/presentation/widgets/weather_details.dart';

final _now = DateTime.utc(2026, 10, 4, 6);

WeatherReport _report() => WeatherReport(
  place: const Place(
    name: 'Kathmandu Metropolitan City',
    latitude: 27.7,
    longitude: 85.32,
  ),
  current: CurrentWeather(
    temperature: -12.4,
    feelsLike: -18,
    condition: WeatherCondition.thunderstorm,
    description: 'Thunderstorm with heavy drizzle',
    isDay: true,
    humidity: 100,
    pressure: 1016,
    visibility: 10000,
    windSpeed: 31,
    windDegrees: 217,
    cloudiness: 100,
    sunrise: DateTime.utc(2026, 10, 4),
    sunset: DateTime.utc(2026, 10, 4, 12),
    observedAt: _now,
  ),
  hourly: [
    for (var i = 0; i < 9; i++)
      HourlyForecast(
        time: _now.add(Duration(hours: 3 * i)),
        temperature: -12.0 + i,
        condition: WeatherCondition.values[i % WeatherCondition.values.length],
        isDay: i.isEven,
        precipitationChance: i / 8,
      ),
  ],
  daily: [
    for (var i = 0; i < 5; i++)
      DailyForecast(
        date: DateTime.utc(2026, 10, 4 + i),
        low: -15.0 + i,
        high: -2.0 + i,
        condition: WeatherCondition.snow,
        precipitationChance: 1,
      ),
  ],
  airQuality: const AirQuality(index: 5, pm25: 128),
  utcOffset: const Duration(hours: 5, minutes: 45),
  fetchedAt: _now,
);

/// Every section of the weather screen, stacked the way a phone shows them.
Widget _screen(UnitSystem units) {
  final report = _report();
  final clock = SunClock(
    now: _now,
    sunrise: report.current.sunrise,
    sunset: report.current.sunset,
  );
  return MaterialApp(
    // The real theme's display size, so the big temperature is exercised.
    theme: ThemeData.dark().copyWith(
      textTheme: ThemeData.dark().textTheme.copyWith(
        displayLarge: const TextStyle(fontSize: 124, height: 1),
        headlineMedium: const TextStyle(fontSize: 28),
      ),
    ),
    home: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeader(
              title: report.place.name,
              followsLocation: true,
              onSearch: () {},
              onSettings: () {},
              isSaved: false,
              onToggleSaved: () {},
              onUseLocation: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CurrentSummary(report: report, units: units, now: _now),
                  SunArc(report: report, clock: clock),
                  DailyForecastList(days: report.daily, units: units),
                  WeatherDetails(report: report, units: units),
                ],
              ),
            ),
            HourlyForecastChart(report: report, units: units),
          ],
        ),
      ),
    ),
  );
}

void main() {
  // A layout overflow throws during pump, which fails the test.
  for (final (name, width, textScale) in [
    ('a small phone', 320.0, 1.0),
    ('a small phone with large text', 320.0, 1.6),
    ('a regular phone', 400.0, 1.0),
    ('a tablet', 800.0, 1.3),
  ]) {
    for (final units in UnitSystem.values) {
      testWidgets('weather sections fit $name in ${units.name}', (
        tester,
      ) async {
        tester.view.physicalSize = Size(width, 800);
        tester.view.devicePixelRatio = 1;
        tester.platformDispatcher.textScaleFactorTestValue = textScale;
        addTearDown(tester.view.reset);
        addTearDown(tester.platformDispatcher.clearAllTestValues);

        await tester.pumpWidget(_screen(units));
        await tester.pumpAndSettle();

        expect(tester.takeException(), isNull);
        expect(find.text('Thunderstorm with heavy drizzle'), findsOneWidget);
      });
    }
  }
}
