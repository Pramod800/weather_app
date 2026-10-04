enum DayPhase { night, dawn, day, dusk }

/// Where the sun is in its daily cycle at a place.
///
/// Only the time of day matters, so a sunrise from a cached report still
/// gives a sensible answer the next day.
class SunClock {
  factory SunClock({
    required DateTime now,
    required DateTime sunrise,
    required DateTime sunset,
  }) {
    final sinceSunrise = now.difference(sunrise).inSeconds % _day.inSeconds;
    return SunClock._(
      Duration(seconds: sinceSunrise),
      sunset.difference(sunrise),
    );
  }

  const SunClock._(this.sinceSunrise, this.dayLength);

  static const _day = Duration(days: 1);
  static const _twilight = Duration(minutes: 40);

  /// Time since the most recent sunrise, always under 24 hours.
  final Duration sinceSunrise;
  final Duration dayLength;

  /// False during polar day and night, when there is no sunrise or sunset.
  bool get hasSunrise => dayLength > Duration.zero;

  bool get isDaylight => hasSunrise && sinceSunrise < dayLength;

  /// 0 at sunrise to 1 at sunset.
  double get progress => hasSunrise
      ? (sinceSunrise.inSeconds / dayLength.inSeconds).clamp(0, 1).toDouble()
      : 0;

  Duration get untilSunset => dayLength - sinceSunrise;

  Duration get untilSunrise => _day - sinceSunrise;

  DayPhase get phase {
    if (!hasSunrise) return DayPhase.day;
    if (sinceSunrise <= _twilight || untilSunrise <= _twilight) {
      return DayPhase.dawn;
    }
    if ((sinceSunrise - dayLength).abs() <= _twilight) return DayPhase.dusk;
    return isDaylight ? DayPhase.day : DayPhase.night;
  }
}
