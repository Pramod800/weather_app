import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weather_app/core/error/failure.dart';

Dio createWeatherDio({required String apiKey}) {
  return Dio(
    BaseOptions(
      baseUrl: 'https://api.openweathermap.org',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      queryParameters: {'appid': apiKey},
    ),
  );
}

extension DioExceptionX on DioException {
  Failure toFailure() {
    return Failure(switch (type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout => FailureType.timeout,
      DioExceptionType.connectionError => FailureType.network,
      DioExceptionType.badResponse => switch (response?.statusCode ?? 0) {
        401 => FailureType.unauthorized,
        404 => FailureType.notFound,
        429 => FailureType.rateLimited,
        >= 500 => FailureType.server,
        _ => FailureType.unknown,
      },
      _ => error is SocketException ? FailureType.network : FailureType.unknown,
    });
  }
}
