/// Coarse sky condition, ordered from calmest to most severe.
enum WeatherCondition {
  clear,
  partlyCloudy,
  cloudy,
  fog,
  drizzle,
  rain,
  snow,
  thunderstorm;

  /// Maps an OpenWeather condition code
  /// (https://openweathermap.org/weather-conditions).
  factory WeatherCondition.fromCode(int code) => switch (code) {
    >= 200 && < 300 => thunderstorm,
    >= 300 && < 400 => drizzle,
    >= 500 && < 600 => rain,
    >= 600 && < 700 => snow,
    >= 700 && < 800 => fog,
    800 => clear,
    801 || 802 => partlyCloudy,
    _ => cloudy,
  };

  bool get isWet => switch (this) {
    drizzle || rain || snow || thunderstorm => true,
    _ => false,
  };
}
