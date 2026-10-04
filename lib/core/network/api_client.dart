import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weather_app/core/error/failure.dart';

Dio createWeatherDio() {
  return Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
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
        404 => FailureType.notFound,
        429 => FailureType.rateLimited,
        >= 500 => FailureType.server,
        _ => FailureType.unknown,
      },
      _ => error is SocketException ? FailureType.network : FailureType.unknown,
    });
  }
}
