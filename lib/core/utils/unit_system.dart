/// The API is always queried in metric; values are converted for display,
/// so switching units never needs a refetch.
enum UnitSystem {
  metric,
  imperial;

  String get label => switch (this) {
    metric => 'Metric',
    imperial => 'Imperial',
  };

  String get summary => switch (this) {
    metric => '°C, km/h, km, hPa',
    imperial => '°F, mph, mi, inHg',
  };

  String get temperatureSymbol => switch (this) {
    metric => '°C',
    imperial => '°F',
  };

  int temperatureValue(double celsius) {
    final value = this == metric ? celsius : celsius * 9 / 5 + 32;
    return value.round();
  }

  /// "24°". The unit symbol is shown once, next to the main reading.
  String temperature(double celsius) => '${temperatureValue(celsius)}°';

  String windSpeed(double metersPerSecond) => switch (this) {
    metric => '${(metersPerSecond * 3.6).round()} km/h',
    imperial => '${(metersPerSecond * 2.23694).round()} mph',
  };

  String distance(int meters) {
    final value = this == metric ? meters / 1000 : meters / 1609.344;
    final unit = this == metric ? 'km' : 'mi';
    // One decimal below ten; 9.96 rounds up to "10", not "10.0".
    final text = value >= 9.95
        ? value.round().toString()
        : value.toStringAsFixed(1);
    return '$text $unit';
  }

  String pressure(int hectopascals) => switch (this) {
    metric => '$hectopascals hPa',
    imperial => '${(hectopascals * 0.02953).toStringAsFixed(2)} inHg',
  };
}

const _compassPoints = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'];

/// Compass point the wind blows from, e.g. 217° is "SW".
String compassPoint(int degrees) =>
    _compassPoints[((degrees % 360) / 45).round() % 8];
