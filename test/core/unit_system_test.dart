import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/core/utils/unit_system.dart';
import 'package:weather_app/weather/domain/entities/sun_clock.dart';

void main() {
  group('UnitSystem', () {
    test('formats metric values', () {
      expect(UnitSystem.metric.temperature(24.79), '25°');
      expect(UnitSystem.metric.windSpeed(10), '36 km/h');
      expect(UnitSystem.metric.distance(10000), '10 km');
      expect(UnitSystem.metric.distance(4294), '4.3 km');
      expect(UnitSystem.metric.pressure(1016), '1016 hPa');
    });

    test('converts to imperial', () {
      expect(UnitSystem.imperial.temperature(0), '32°');
      expect(UnitSystem.imperial.temperature(100), '212°');
      expect(UnitSystem.imperial.windSpeed(10), '22 mph');
      expect(UnitSystem.imperial.distance(16093), '10 mi');
      expect(UnitSystem.imperial.pressure(1016), '30.00 inHg');
    });

    test('formats precipitation, with a bare zero for a dry day', () {
      expect(UnitSystem.metric.precipitation(7.34), '7.3 mm');
      expect(UnitSystem.metric.precipitation(0), '0 mm');
      expect(UnitSystem.imperial.precipitation(25.4), '1.00 in');
    });

    test('does not print a negative zero', () {
      expect(UnitSystem.metric.temperature(-0.2), '0°');
    });
  });

  test('compassPoint names the direction the wind comes from', () {
    expect(compassPoint(0), 'N');
    expect(compassPoint(217), 'SW');
    expect(compassPoint(350), 'N');
    expect(compassPoint(90), 'E');
  });

  group('SunClock', () {
    final sunrise = DateTime.utc(2026, 10, 4, 6);
    final sunset = DateTime.utc(2026, 10, 4, 18);

    SunClock at(DateTime now) =>
        SunClock(now: now, sunrise: sunrise, sunset: sunset);

    test('tracks the sun through the day', () {
      final noon = at(DateTime.utc(2026, 10, 4, 12));

      expect(noon.isDaylight, isTrue);
      expect(noon.progress, 0.5);
      expect(noon.untilSunset, const Duration(hours: 6));
      expect(noon.phase, DayPhase.day);
    });

    test('counts down to the next sunrise at night', () {
      final lateEvening = at(DateTime.utc(2026, 10, 4, 22));

      expect(lateEvening.isDaylight, isFalse);
      expect(lateEvening.untilSunrise, const Duration(hours: 8));
      expect(lateEvening.phase, DayPhase.night);
    });

    test('recognises twilight on both sides of sunrise and sunset', () {
      expect(at(DateTime.utc(2026, 10, 4, 5, 40)).phase, DayPhase.dawn);
      expect(at(DateTime.utc(2026, 10, 4, 6, 20)).phase, DayPhase.dawn);
      expect(at(DateTime.utc(2026, 10, 4, 17, 45)).phase, DayPhase.dusk);
      expect(at(DateTime.utc(2026, 10, 4, 18, 30)).phase, DayPhase.dusk);
    });

    test('works with a sunrise from an earlier day', () {
      final nextNoon = at(DateTime.utc(2026, 10, 6, 12));

      expect(nextNoon.isDaylight, isTrue);
      expect(nextNoon.progress, 0.5);
    });

    test('reports no sunrise during polar day or night', () {
      final clock = SunClock(now: sunrise, sunrise: sunrise, sunset: sunrise);

      expect(clock.hasSunrise, isFalse);
      expect(clock.isDaylight, isFalse);
    });
  });
}
