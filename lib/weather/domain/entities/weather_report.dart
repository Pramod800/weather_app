import 'package:weather_app/weather/domain/entities/place.dart';
import 'package:weather_app/weather/domain/entities/weather_condition.dart';

/// Everything the home screen shows for one place. Temperatures are Celsius,
/// wind is metres per second, and all times are UTC; use [localTime] to get
/// the wall-clock time at the place.
class WeatherReport {
  const WeatherReport({
    required this.place,
    required this.current,
    required this.hourly,
    required this.daily,
    required this.utcOffset,
    required this.fetchedAt,
    this.yesterday,
    this.airQuality,
    this.isFromCache = false,
  });

  final Place place;
  final CurrentWeather current;

  /// The current reading followed by the next 24 hours, hour by hour.
  final List<HourlyForecast> hourly;

  /// Today first, then the days ahead.
  final List<DailyForecast> daily;

  /// What yesterday was like, for comparing with today.
  final DailyForecast? yesterday;
  final AirQuality? airQuality;
  final Duration utcOffset;
  final DateTime fetchedAt;

  /// True when this report was read from disk rather than the network.
  final bool isFromCache;

  /// Shifts a UTC instant to the place's wall clock. The result keeps
  /// `isUtc`, so formatting it never applies the device's own time zone.
  DateTime localTime(DateTime utc) => utc.toUtc().add(utcOffset);

  bool isDaylight(DateTime utc) =>
      utc.isAfter(current.sunrise) && utc.isBefore(current.sunset);
}

class CurrentWeather {
  const CurrentWeather({
    required this.temperature,
    required this.feelsLike,
    required this.condition,
    required this.description,
    required this.isDay,
    required this.humidity,
    required this.pressure,
    required this.visibility,
    required this.windSpeed,
    required this.windDegrees,
    required this.cloudiness,
    required this.sunrise,
    required this.sunset,
    required this.observedAt,
  });

  final double temperature;
  final double feelsLike;
  final WeatherCondition condition;
  final String description;
  final bool isDay;

  /// Percent.
  final int humidity;

  /// Hectopascals.
  final int pressure;

  /// Metres.
  final int visibility;
  final double windSpeed;
  final int windDegrees;

  /// Percent of sky covered.
  final int cloudiness;
  final DateTime sunrise;
  final DateTime sunset;
  final DateTime observedAt;
}

class HourlyForecast {
  const HourlyForecast({
    required this.time,
    required this.temperature,
    required this.condition,
    required this.isDay,
    required this.precipitationChance,
  });

  final DateTime time;
  final double temperature;
  final WeatherCondition condition;
  final bool isDay;

  /// 0 to 1.
  final double precipitationChance;
}

class DailyForecast {
  const DailyForecast({
    required this.date,
    required this.low,
    required this.high,
    required this.condition,
    required this.precipitationChance,
    this.precipitationSum = 0,
    this.uvIndexMax,
  });

  /// Midnight of the day on the place's wall clock.
  final DateTime date;
  final double low;
  final double high;
  final WeatherCondition condition;

  /// Highest chance across the day, 0 to 1.
  final double precipitationChance;

  /// Rain and melted snow over the day, in millimetres.
  final double precipitationSum;

  /// Null when the forecast does not reach this day.
  final double? uvIndexMax;
}

class AirQuality {
  const AirQuality({required this.index, required this.pm25});

  /// Five bands of the European Air Quality Index, 1 (good) to
  /// 5 (very poor).
  final int index;

  /// Fine particulate matter, µg/m³.
  final double pm25;

  String get label => switch (index) {
    1 => 'Good',
    2 => 'Fair',
    3 => 'Moderate',
    4 => 'Poor',
    _ => 'Very poor',
  };
}

/// The weather at a place right now, for lists of many places.
class PlaceSnapshot {
  const PlaceSnapshot({
    required this.place,
    required this.temperature,
    required this.condition,
    required this.isDay,
  });

  final Place place;
  final double temperature;
  final WeatherCondition condition;
  final bool isDay;
}
