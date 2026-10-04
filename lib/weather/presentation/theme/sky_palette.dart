import 'package:flutter/material.dart';
import 'package:weather_app/weather/domain/entities/sun_clock.dart';
import 'package:weather_app/weather/domain/entities/weather_condition.dart';

/// The two colours of the sky behind the screen, chosen from what the sky
/// at the place actually looks like. Every bottom colour is dark enough for
/// white text to keep a 4.5:1 contrast.
class SkyPalette {
  const SkyPalette(this.top, this.bottom);

  factory SkyPalette.of(WeatherCondition condition, DayPhase phase) {
    final isNight = phase == DayPhase.night;
    return switch (condition) {
      WeatherCondition.clear ||
      WeatherCondition.partlyCloudy => switch (phase) {
        DayPhase.night => night,
        DayPhase.dawn => const SkyPalette(Color(0xFF2A2F6E), Color(0xFFB0564A)),
        DayPhase.day => const SkyPalette(Color(0xFF164CB5), Color(0xFF3373D6)),
        DayPhase.dusk => const SkyPalette(Color(0xFF2C2459), Color(0xFFA84E48)),
      },
      WeatherCondition.cloudy =>
        isNight
            ? const SkyPalette(Color(0xFF0D1220), Color(0xFF27324A))
            : const SkyPalette(Color(0xFF3A4D6B), Color(0xFF5F7391)),
      WeatherCondition.fog =>
        isNight
            ? const SkyPalette(Color(0xFF14181F), Color(0xFF343C47))
            : const SkyPalette(Color(0xFF46515C), Color(0xFF66727E)),
      WeatherCondition.drizzle || WeatherCondition.rain =>
        isNight
            ? const SkyPalette(Color(0xFF0A101C), Color(0xFF22304A))
            : const SkyPalette(Color(0xFF27364B), Color(0xFF4B6079)),
      WeatherCondition.snow =>
        isNight
            ? const SkyPalette(Color(0xFF101A2E), Color(0xFF34466A))
            : const SkyPalette(Color(0xFF41567A), Color(0xFF5F7596)),
      WeatherCondition.thunderstorm =>
        isNight
            ? const SkyPalette(Color(0xFF0C0A1C), Color(0xFF2A2548))
            : const SkyPalette(Color(0xFF231F3D), Color(0xFF473F6B)),
    };
  }

  /// Clear night sky; also the backdrop before any weather has loaded.
  static const night = SkyPalette(Color(0xFF070B1F), Color(0xFF1A2550));

  final Color top;
  final Color bottom;

  LinearGradient get gradient => LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [top, bottom],
  );
}
