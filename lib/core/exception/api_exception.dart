import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_exception.freezed.dart';

@freezed
class ApiException with _$ApiException {
  factory ApiException.networkError(
          {@Default('Please check your internet connection') String message}) =
      _NetworkError;

  factory ApiException.serverException({required String message}) =
      _ServerException;
  factory ApiException.errorFromBacked({required String message}) =
      _BackendException;
}
