import 'package:weather_app/weather/domain/entities/weather_condition.dart';

/// Open-Meteo reports the sky as a WMO weather interpretation code
/// (https://open-meteo.com/en/docs#weathervariables).
WeatherCondition conditionForWmoCode(int code) => switch (code) {
  0 || 1 => WeatherCondition.clear,
  2 => WeatherCondition.partlyCloudy,
  3 => WeatherCondition.cloudy,
  45 || 48 => WeatherCondition.fog,
  >= 51 && <= 57 => WeatherCondition.drizzle,
  >= 61 && <= 67 || >= 80 && <= 82 => WeatherCondition.rain,
  >= 71 && <= 77 || 85 || 86 => WeatherCondition.snow,
  >= 95 => WeatherCondition.thunderstorm,
  _ => WeatherCondition.cloudy,
};

String describeWmoCode(int code) => switch (code) {
  0 => 'Clear sky',
  1 => 'Mostly clear',
  2 => 'Partly cloudy',
  3 => 'Overcast',
  45 => 'Fog',
  48 => 'Freezing fog',
  51 => 'Light drizzle',
  53 => 'Drizzle',
  55 => 'Heavy drizzle',
  56 || 57 => 'Freezing drizzle',
  61 => 'Light rain',
  63 => 'Rain',
  65 => 'Heavy rain',
  66 || 67 => 'Freezing rain',
  71 => 'Light snow',
  73 => 'Snow',
  75 => 'Heavy snow',
  77 => 'Snow grains',
  80 => 'Light showers',
  81 => 'Showers',
  82 => 'Heavy showers',
  85 => 'Light snow showers',
  86 => 'Heavy snow showers',
  95 => 'Thunderstorm',
  96 || 99 => 'Thunderstorm with hail',
  _ => 'Cloudy',
};
