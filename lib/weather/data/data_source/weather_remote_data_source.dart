import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/network/api_client.dart';

/// Talks to Open-Meteo (weather, air quality, place search) and to
/// OpenStreetMap Nominatim (naming the device's position). Returns the raw
/// JSON, so the repository can cache exactly what the service sent. Every
/// method throws a [Failure].
class WeatherRemoteDataSource {
  WeatherRemoteDataSource(this._dio);

  final Dio _dio;

  static const _forecastUrl = 'https://api.open-meteo.com/v1/forecast';
  static const _archiveUrl = 'https://archive-api.open-meteo.com/v1/archive';
  static const _airQualityUrl =
      'https://air-quality-api.open-meteo.com/v1/air-quality';
  static const _searchUrl = 'https://geocoding-api.open-meteo.com/v1/search';
  static const _reverseUrl = 'https://nominatim.openstreetmap.org/reverse';

  /// How many days ahead to ask for, counting today.
  static const forecastDays = 10;

  /// Current conditions, hourly steps and daily summaries in one call.
  /// Starts one day back so today can be compared with yesterday.
  Future<Map<String, dynamic>> fetchForecast({
    required double latitude,
    required double longitude,
  }) {
    return _get(_forecastUrl, {
      'latitude': latitude,
      'longitude': longitude,
      'current':
          'temperature_2m,apparent_temperature,relative_humidity_2m,'
          'is_day,weather_code,cloud_cover,pressure_msl,wind_speed_10m,'
          'wind_direction_10m,visibility',
      'hourly': 'temperature_2m,weather_code,precipitation_probability,is_day',
      'daily':
          'weather_code,temperature_2m_max,temperature_2m_min,sunrise,'
          'sunset,precipitation_probability_max,precipitation_sum,'
          'uv_index_max',
      'timezone': 'auto',
      'timeformat': 'unixtime',
      'wind_speed_unit': 'ms',
      'past_days': 1,
      'forecast_days': forecastDays,
    });
  }

  /// The daily summary of one past day, from the historical archive.
  Future<Map<String, dynamic>> fetchArchiveDay({
    required double latitude,
    required double longitude,
    required DateTime date,
  }) {
    final day = date.toIso8601String().substring(0, 10);
    return _get(_archiveUrl, {
      'latitude': latitude,
      'longitude': longitude,
      'start_date': day,
      'end_date': day,
      'daily':
          'weather_code,temperature_2m_max,temperature_2m_min,'
          'precipitation_sum',
      'timezone': 'auto',
      'timeformat': 'unixtime',
    });
  }

  /// Current conditions for several positions at once. The service answers
  /// with one object per position, in the order given.
  Future<List<dynamic>> fetchCurrentForMany({
    required List<double> latitudes,
    required List<double> longitudes,
  }) {
    return _get(_forecastUrl, {
      'latitude': latitudes.join(','),
      'longitude': longitudes.join(','),
      'current': 'temperature_2m,weather_code,is_day',
      'timeformat': 'unixtime',
    });
  }

  Future<Map<String, dynamic>> fetchAirQuality({
    required double latitude,
    required double longitude,
  }) {
    return _get(_airQualityUrl, {
      'latitude': latitude,
      'longitude': longitude,
      'current': 'european_aqi,pm2_5',
    });
  }

  Future<Map<String, dynamic>> searchPlaces(String query) {
    return _get(_searchUrl, {
      'name': query,
      'count': 6,
      'language': 'en',
      'format': 'json',
    });
  }

  /// Nominatim's usage policy asks apps to identify themselves; it turns
  /// away the default Dart client.
  static const _userAgent =
      'NimbusWeather/2.0 (https://github.com/Pramod800/weather_app)';

  /// The city-level address of a position.
  Future<Map<String, dynamic>> reverseGeocode({
    required double latitude,
    required double longitude,
  }) {
    return _get(
      _reverseUrl,
      {
        'lat': latitude,
        'lon': longitude,
        'format': 'jsonv2',
        'zoom': 10,
        'accept-language': 'en',
      },
      // Browsers send their own User-Agent and do not let pages replace it.
      headers: kIsWeb ? null : {'User-Agent': _userAgent},
    );
  }

  Future<T> _get<T>(
    String url,
    Map<String, dynamic> query, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.get<T>(
        url,
        queryParameters: query,
        options: Options(headers: headers),
      );
      final data = response.data;
      if (data == null) throw const Failure(FailureType.server);
      return data;
    } on DioException catch (error) {
      throw error.toFailure();
    }
  }
}
