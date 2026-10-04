import 'package:weather_app/weather/data/mappers/wmo_weather_code.dart';
import 'package:weather_app/weather/data/models/open_meteo_models.dart';
import 'package:weather_app/weather/domain/entities/place.dart';
import 'package:weather_app/weather/domain/entities/weather_report.dart';

const _hourlySteps = 24;

/// Turns the forecast and air quality responses into the report the UI
/// renders.
///
/// Throws a [FormatException] when the forecast lacks the fields the app
/// cannot do without.
WeatherReport mapWeatherReport({
  required Place place,
  required ForecastResponse forecast,
  required DateTime fetchedAt,
  AirQualityResponse? airQuality,
  bool isFromCache = false,
}) {
  final now = forecast.current;
  final observedSeconds = now?.time;
  final temperature = now?.temperature;
  if (now == null || observedSeconds == null || temperature == null) {
    throw const FormatException('Incomplete current weather response');
  }

  final observedAt = _utc(observedSeconds);
  final utcOffset = Duration(seconds: forecast.utcOffsetSeconds ?? 0);
  final days = _toDaily(forecast.daily ?? const DailyBlock(), utcOffset);

  // The response starts a day early so today can be compared with it.
  final localNow = observedAt.add(utcOffset);
  final todayDate = DateTime.utc(localNow.year, localNow.month, localNow.day);
  final todayIndex = days.indexWhere((day) => day.forecast.date == todayDate);
  final today = todayIndex < 0 ? null : days[todayIndex];

  final code = now.weatherCode ?? 0;
  final current = CurrentWeather(
    temperature: temperature,
    feelsLike: now.apparentTemperature ?? temperature,
    condition: conditionForWmoCode(code),
    description: describeWmoCode(code),
    isDay: now.isDay != 0,
    humidity: (now.humidity ?? 0).round(),
    pressure: (now.pressure ?? 0).round(),
    visibility: (now.visibility ?? 0).round(),
    windSpeed: now.windSpeed ?? 0,
    windDegrees: (now.windDirection ?? 0).round(),
    cloudiness: (now.cloudCover ?? 0).round(),
    // Polar day and night have no sunrise or sunset; both collapse onto the
    // observation time and the UI hides the sun path.
    sunrise: today?.sunrise ?? observedAt,
    sunset: today?.sunset ?? observedAt,
    observedAt: observedAt,
  );

  final upcoming = _toHourly(
    forecast.hourly ?? const HourlyBlock(),
  ).where((hour) => hour.time.isAfter(observedAt)).take(_hourlySteps);

  return WeatherReport(
    place: place,
    current: current,
    hourly: [
      HourlyForecast(
        time: observedAt,
        temperature: current.temperature,
        condition: current.condition,
        isDay: current.isDay,
        precipitationChance: 0,
      ),
      ...upcoming,
    ],
    daily: [
      for (final day in days.skip(todayIndex < 0 ? 0 : todayIndex))
        day.forecast,
    ],
    yesterday: todayIndex > 0 ? days[todayIndex - 1].forecast : null,
    airQuality: _toAirQuality(airQuality),
    utcOffset: utcOffset,
    fetchedAt: fetchedAt,
    isFromCache: isFromCache,
  );
}

/// The single day in an archive response, or null when the archive has no
/// data for it.
DailyForecast? mapArchiveDay(ForecastResponse response) {
  final utcOffset = Duration(seconds: response.utcOffsetSeconds ?? 0);
  final days = _toDaily(response.daily ?? const DailyBlock(), utcOffset);
  return days.firstOrNull?.forecast;
}

PlaceSnapshot? mapPlaceSnapshot(Place place, ForecastResponse response) {
  final current = response.current;
  final temperature = current?.temperature;
  if (current == null || temperature == null) return null;
  return PlaceSnapshot(
    place: place,
    temperature: temperature,
    condition: conditionForWmoCode(current.weatherCode ?? 0),
    isDay: current.isDay != 0,
  );
}

List<HourlyForecast> _toHourly(HourlyBlock block) {
  return [
    for (final (i, seconds) in block.time.indexed)
      if (_at(block.temperature, i) case final temperature?)
        HourlyForecast(
          time: _utc(seconds),
          temperature: temperature,
          condition: conditionForWmoCode(_at(block.weatherCode, i) ?? 0),
          isDay: _at(block.isDay, i) != 0,
          precipitationChance: _fraction(
            _at(block.precipitationProbability, i),
          ),
        ),
  ];
}

typedef _Day = ({DailyForecast forecast, DateTime? sunrise, DateTime? sunset});

List<_Day> _toDaily(DailyBlock block, Duration utcOffset) {
  final days = <_Day>[];
  for (final (i, seconds) in block.time.indexed) {
    final low = _at(block.temperatureMin, i);
    final high = _at(block.temperatureMax, i);
    if (low == null || high == null) continue;

    // The timestamp is local midnight expressed in UTC; shifting it by the
    // offset lands on midnight of the calendar day.
    final local = _utc(seconds).add(utcOffset);
    final sunrise = _at(block.sunrise, i);
    final sunset = _at(block.sunset, i);
    days.add((
      forecast: DailyForecast(
        date: DateTime.utc(local.year, local.month, local.day),
        low: low,
        high: high,
        condition: conditionForWmoCode(_at(block.weatherCode, i) ?? 0),
        precipitationChance: _fraction(
          _at(block.precipitationProbabilityMax, i),
        ),
        precipitationSum: _at(block.precipitationSum, i) ?? 0,
        uvIndexMax: _at(block.uvIndexMax, i),
      ),
      // Open-Meteo sends 0 for days without a sunrise or sunset.
      sunrise: sunrise == null || sunrise == 0 ? null : _utc(sunrise),
      sunset: sunset == null || sunset == 0 ? null : _utc(sunset),
    ));
  }
  return days;
}

AirQuality? _toAirQuality(AirQualityResponse? response) {
  final current = response?.current;
  final aqi = current?.europeanAqi;
  if (current == null || aqi == null) return null;
  // The European index moves to the next band every 20 points.
  final index = (aqi ~/ 20 + 1).clamp(1, 5);
  return AirQuality(index: index, pm25: current.pm25 ?? 0);
}

/// The lists are parallel but a short one must not break the whole report.
T? _at<T>(List<T?> values, int index) =>
    index < values.length ? values[index] : null;

double _fraction(double? percent) =>
    ((percent ?? 0) / 100).clamp(0, 1).toDouble();

DateTime _utc(int seconds) =>
    DateTime.fromMillisecondsSinceEpoch(seconds * 1000, isUtc: true);
