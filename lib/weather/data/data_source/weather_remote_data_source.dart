import 'package:dio/dio.dart';
import 'package:weather_app/core/config/env.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/network/api_client.dart';

/// Talks to OpenWeather and returns the raw JSON, so the repository can
/// cache exactly what the service sent. Every method throws a [Failure].
class WeatherRemoteDataSource {
  WeatherRemoteDataSource(this._dio);

  final Dio _dio;

  Future<Map<String, dynamic>> fetchCurrentWeather({
    required double latitude,
    required double longitude,
  }) {
    return _get('/data/2.5/weather', {
      'lat': latitude,
      'lon': longitude,
      'units': 'metric',
    });
  }

  Future<Map<String, dynamic>> fetchForecast({
    required double latitude,
    required double longitude,
  }) {
    return _get('/data/2.5/forecast', {
      'lat': latitude,
      'lon': longitude,
      'units': 'metric',
    });
  }

  Future<Map<String, dynamic>> fetchAirQuality({
    required double latitude,
    required double longitude,
  }) {
    return _get('/data/2.5/air_pollution', {'lat': latitude, 'lon': longitude});
  }

  Future<List<dynamic>> searchPlaces(String query) {
    return _get('/geo/1.0/direct', {'q': query, 'limit': 5});
  }

  Future<T> _get<T>(String path, Map<String, dynamic> query) async {
    if (!Env.hasApiKey) throw const Failure(FailureType.missingApiKey);
    try {
      final response = await _dio.get<T>(path, queryParameters: query);
      final data = response.data;
      if (data == null) throw const Failure(FailureType.server);
      return data;
    } on DioException catch (error) {
      throw error.toFailure();
    }
  }
}
