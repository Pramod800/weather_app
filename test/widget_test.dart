import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/utils/unit_system.dart';
import 'package:weather_app/weather/domain/entities/weather_condition.dart';
import 'package:weather_app/weather/domain/entities/weather_report.dart';
import 'package:weather_app/weather/presentation/widgets/daily_forecast_list.dart';
import 'package:weather_app/weather/presentation/widgets/failure_view.dart';

Widget _host(Widget child) => MaterialApp(
  theme: ThemeData.dark(),
  home: Scaffold(body: child),
);

void main() {
  group('FailureView', () {
    testWidgets('offers to allow location and to search instead', (
      tester,
    ) async {
      var retried = false;
      var searched = false;

      await tester.pumpWidget(
        _host(
          FailureView(
            failure: const Failure(FailureType.locationDenied),
            onRetry: () => retried = true,
            onSearch: () => searched = true,
            onOpenSettings: () {},
          ),
        ),
      );

      expect(find.text('Location access needed'), findsOneWidget);
      await tester.tap(find.text('Allow location'));
      await tester.tap(find.text('Search for a place'));
      expect(retried, isTrue);
      expect(searched, isTrue);
    });

    testWidgets('sends a blocked permission to settings', (tester) async {
      var opened = false;

      await tester.pumpWidget(
        _host(
          FailureView(
            failure: const Failure(FailureType.locationDeniedForever),
            onRetry: () {},
            onSearch: () {},
            onOpenSettings: () => opened = true,
          ),
        ),
      );

      await tester.tap(find.text('Open settings'));
      expect(opened, isTrue);
      expect(find.text('Try again'), findsNothing);
    });

    testWidgets('does not suggest searching when the API key is the problem', (
      tester,
    ) async {
      await tester.pumpWidget(
        _host(
          FailureView(
            failure: const Failure(FailureType.missingApiKey),
            onRetry: () {},
            onSearch: () {},
            onOpenSettings: () {},
          ),
        ),
      );

      expect(find.text('Try again'), findsOneWidget);
      expect(find.text('Search for a place'), findsNothing);
    });
  });

  group('DailyForecastList', () {
    final days = [
      DailyForecast(
        date: DateTime.utc(2026, 10, 4),
        low: 10,
        high: 20,
        condition: WeatherCondition.rain,
        precipitationChance: 0.6,
      ),
      DailyForecast(
        date: DateTime.utc(2026, 10, 5),
        low: 12,
        high: 25,
        condition: WeatherCondition.clear,
        precipitationChance: 0.1,
      ),
    ];

    testWidgets('labels days and shows only meaningful rain chances', (
      tester,
    ) async {
      await tester.pumpWidget(
        _host(DailyForecastList(days: days, units: UnitSystem.metric)),
      );

      expect(find.text('Today'), findsOneWidget);
      expect(find.text('Mon'), findsOneWidget);
      expect(find.text('60%'), findsOneWidget);
      expect(find.text('10%'), findsNothing);
      expect(find.text('20°'), findsOneWidget);
    });

    testWidgets('converts temperatures to the chosen units', (tester) async {
      await tester.pumpWidget(
        _host(DailyForecastList(days: days, units: UnitSystem.imperial)),
      );

      expect(find.text('50°'), findsOneWidget);
      expect(find.text('77°'), findsOneWidget);
    });
  });
}
