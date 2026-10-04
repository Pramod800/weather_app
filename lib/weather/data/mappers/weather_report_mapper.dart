import 'package:weather_app/weather/data/models/air_quality_model.dart';
import 'package:weather_app/weather/data/models/forecast_model.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';
import 'package:weather_app/weather/domain/entities/place.dart';
import 'package:weather_app/weather/domain/entities/weather_condition.dart';
import 'package:weather_app/weather/domain/entities/weather_report.dart';

const _hourlySteps = 8;
const _dailyCount = 5;

/// Turns the three API responses into the report the UI renders.
///
/// Throws a [FormatException] when the current-weather response lacks the
/// fields the app cannot do without.
WeatherReport mapWeatherReport({
  required Place place,
  required WeatherModel weather,
  required ForecastModel forecast,
  required DateTime fetchedAt,
  AirQualityModel? airQuality,
  bool isFromCache = false,
}) {
  final main = weather.main;
  final temperature = main?.temp;
  final observedSeconds = weather.dt;
  if (main == null || temperature == null || observedSeconds == null) {
    throw const FormatException('Incomplete current weather response');
  }

  final observedAt = _utc(observedSeconds);
  final utcOffset = Duration(seconds: weather.timezone ?? 0);
  final sky = weather.weather?.firstOrNull;
  final sunrise = weather.sys?.sunrise;
  final sunset = weather.sys?.sunset;

  final current = CurrentWeather(
    temperature: temperature,
    feelsLike: main.feelsLike ?? temperature,
    condition: WeatherCondition.fromCode(sky?.id ?? 800),
    description: _sentenceCase(sky?.description ?? ''),
    isDay: _isDayIcon(sky?.icon),
    humidity: main.humidity ?? 0,
    pressure: main.pressure ?? 0,
    visibility: weather.visibility ?? 0,
    windSpeed: weather.wind?.speed ?? 0,
    windDegrees: weather.wind?.deg ?? 0,
    cloudiness: weather.clouds?.all ?? 0,
    // Polar day and night have no sunrise or sunset; both collapse onto the
    // observation time and the UI hides the sun path.
    sunrise: sunrise == null ? observedAt : _utc(sunrise),
    sunset: sunset == null ? observedAt : _utc(sunset),
    observedAt: observedAt,
  );

  final now = HourlyForecast(
    time: observedAt,
    temperature: current.temperature,
    condition: current.condition,
    isDay: current.isDay,
    precipitationChance: 0,
  );
  final upcoming = [
    for (final entry in forecast.list ?? const <ForecastEntry>[])
      if (_toHourly(entry) case final hour? when hour.time.isAfter(observedAt))
        hour,
  ];

  final resolvedPlace = place.name.isNotEmpty
      ? place
      : place.copyWith(name: weather.name ?? '', country: weather.sys?.country);

  return WeatherReport(
    place: resolvedPlace,
    current: current,
    hourly: [now, ...upcoming.take(_hourlySteps)],
    daily: _toDaily([now, ...upcoming], utcOffset),
    airQuality: _toAirQuality(airQuality),
    utcOffset: utcOffset,
    fetchedAt: fetchedAt,
    isFromCache: isFromCache,
  );
}

HourlyForecast? _toHourly(ForecastEntry entry) {
  final seconds = entry.dt;
  final temperature = entry.main?.temp;
  if (seconds == null || temperature == null) return null;
  final sky = entry.weather?.firstOrNull;
  return HourlyForecast(
    time: _utc(seconds),
    temperature: temperature,
    condition: WeatherCondition.fromCode(sky?.id ?? 800),
    isDay: _isDayIcon(sky?.icon),
    precipitationChance: (entry.pop ?? 0).clamp(0, 1).toDouble(),
  );
}

/// Groups the 3-hour steps by calendar day at the place.
List<DailyForecast> _toDaily(List<HourlyForecast> hours, Duration utcOffset) {
  final byDay = <DateTime, List<HourlyForecast>>{};
  for (final hour in hours) {
    final local = hour.time.add(utcOffset);
    final day = DateTime.utc(local.year, local.month, local.day);
    byDay.putIfAbsent(day, () => []).add(hour);
  }

  final days = byDay.keys.toList()..sort();
  return [
    for (final day in days.take(_dailyCount))
      DailyForecast(
        date: day,
        low: byDay[day]!
            .map((h) => h.temperature)
            .reduce((a, b) => a < b ? a : b),
        high: byDay[day]!
            .map((h) => h.temperature)
            .reduce((a, b) => a > b ? a : b),
        condition: _dominantCondition(byDay[day]!),
        precipitationChance: byDay[day]!
            .map((h) => h.precipitationChance)
            .reduce((a, b) => a > b ? a : b),
      ),
  ];
}

/// The most frequent daytime condition; ties go to the more severe one.
WeatherCondition _dominantCondition(List<HourlyForecast> hours) {
  final daytime = hours.where((h) => h.isDay).toList();
  final counts = <WeatherCondition, int>{};
  for (final hour in daytime.isEmpty ? hours : daytime) {
    counts.update(hour.condition, (n) => n + 1, ifAbsent: () => 1);
  }
  return counts.entries.reduce((a, b) {
    if (a.value != b.value) return a.value > b.value ? a : b;
    return a.key.index > b.key.index ? a : b;
  }).key;
}

AirQuality? _toAirQuality(AirQualityModel? model) {
  final entry = model?.list?.firstOrNull;
  final index = entry?.main?.aqi;
  if (entry == null || index == null) return null;
  return AirQuality(index: index, pm25: entry.components?['pm2_5'] ?? 0);
}

DateTime _utc(int seconds) =>
    DateTime.fromMillisecondsSinceEpoch(seconds * 1000, isUtc: true);

/// OpenWeather icon ids end in `d` or `n` for day and night.
bool _isDayIcon(String? icon) => icon == null || !icon.endsWith('n');

String _sentenceCase(String text) =>
    text.isEmpty ? text : text[0].toUpperCase() + text.substring(1);
