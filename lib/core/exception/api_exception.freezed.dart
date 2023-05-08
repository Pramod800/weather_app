// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApiException {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) networkError,
    required TResult Function(String message) serverException,
    required TResult Function(String message) errorFromBacked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? serverException,
    TResult? Function(String message)? errorFromBacked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? networkError,
    TResult Function(String message)? serverException,
    TResult Function(String message)? errorFromBacked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_ServerException value) serverException,
    required TResult Function(_BackendException value) errorFromBacked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_ServerException value)? serverException,
    TResult? Function(_BackendException value)? errorFromBacked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_ServerException value)? serverException,
    TResult Function(_BackendException value)? errorFromBacked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApiExceptionCopyWith<ApiException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiExceptionCopyWith<$Res> {
  factory $ApiExceptionCopyWith(
          ApiException value, $Res Function(ApiException) then) =
      _$ApiExceptionCopyWithImpl<$Res, ApiException>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ApiExceptionCopyWithImpl<$Res, $Val extends ApiException>
    implements $ApiExceptionCopyWith<$Res> {
  _$ApiExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NetworkErrorCopyWith<$Res>
    implements $ApiExceptionCopyWith<$Res> {
  factory _$$_NetworkErrorCopyWith(
          _$_NetworkError value, $Res Function(_$_NetworkError) then) =
      __$$_NetworkErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_NetworkErrorCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res, _$_NetworkError>
    implements _$$_NetworkErrorCopyWith<$Res> {
  __$$_NetworkErrorCopyWithImpl(
      _$_NetworkError _value, $Res Function(_$_NetworkError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_NetworkError(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NetworkError implements _NetworkError {
  _$_NetworkError({this.message = 'Please check your internet connection'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'ApiException.networkError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NetworkErrorCopyWith<_$_NetworkError> get copyWith =>
      __$$_NetworkErrorCopyWithImpl<_$_NetworkError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) networkError,
    required TResult Function(String message) serverException,
    required TResult Function(String message) errorFromBacked,
  }) {
    return networkError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? serverException,
    TResult? Function(String message)? errorFromBacked,
  }) {
    return networkError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? networkError,
    TResult Function(String message)? serverException,
    TResult Function(String message)? errorFromBacked,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_ServerException value) serverException,
    required TResult Function(_BackendException value) errorFromBacked,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_ServerException value)? serverException,
    TResult? Function(_BackendException value)? errorFromBacked,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_ServerException value)? serverException,
    TResult Function(_BackendException value)? errorFromBacked,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class _NetworkError implements ApiException {
  factory _NetworkError({final String message}) = _$_NetworkError;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkErrorCopyWith<_$_NetworkError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ServerExceptionCopyWith<$Res>
    implements $ApiExceptionCopyWith<$Res> {
  factory _$$_ServerExceptionCopyWith(
          _$_ServerException value, $Res Function(_$_ServerException) then) =
      __$$_ServerExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_ServerExceptionCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res, _$_ServerException>
    implements _$$_ServerExceptionCopyWith<$Res> {
  __$$_ServerExceptionCopyWithImpl(
      _$_ServerException _value, $Res Function(_$_ServerException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_ServerException(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ServerException implements _ServerException {
  _$_ServerException({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ApiException.serverException(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServerException &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServerExceptionCopyWith<_$_ServerException> get copyWith =>
      __$$_ServerExceptionCopyWithImpl<_$_ServerException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) networkError,
    required TResult Function(String message) serverException,
    required TResult Function(String message) errorFromBacked,
  }) {
    return serverException(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? serverException,
    TResult? Function(String message)? errorFromBacked,
  }) {
    return serverException?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? networkError,
    TResult Function(String message)? serverException,
    TResult Function(String message)? errorFromBacked,
    required TResult orElse(),
  }) {
    if (serverException != null) {
      return serverException(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_ServerException value) serverException,
    required TResult Function(_BackendException value) errorFromBacked,
  }) {
    return serverException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_ServerException value)? serverException,
    TResult? Function(_BackendException value)? errorFromBacked,
  }) {
    return serverException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_ServerException value)? serverException,
    TResult Function(_BackendException value)? errorFromBacked,
    required TResult orElse(),
  }) {
    if (serverException != null) {
      return serverException(this);
    }
    return orElse();
  }
}

abstract class _ServerException implements ApiException {
  factory _ServerException({required final String message}) =
      _$_ServerException;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_ServerExceptionCopyWith<_$_ServerException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BackendExceptionCopyWith<$Res>
    implements $ApiExceptionCopyWith<$Res> {
  factory _$$_BackendExceptionCopyWith(
          _$_BackendException value, $Res Function(_$_BackendException) then) =
      __$$_BackendExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_BackendExceptionCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res, _$_BackendException>
    implements _$$_BackendExceptionCopyWith<$Res> {
  __$$_BackendExceptionCopyWithImpl(
      _$_BackendException _value, $Res Function(_$_BackendException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_BackendException(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BackendException implements _BackendException {
  _$_BackendException({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ApiException.errorFromBacked(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BackendException &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BackendExceptionCopyWith<_$_BackendException> get copyWith =>
      __$$_BackendExceptionCopyWithImpl<_$_BackendException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) networkError,
    required TResult Function(String message) serverException,
    required TResult Function(String message) errorFromBacked,
  }) {
    return errorFromBacked(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? serverException,
    TResult? Function(String message)? errorFromBacked,
  }) {
    return errorFromBacked?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? networkError,
    TResult Function(String message)? serverException,
    TResult Function(String message)? errorFromBacked,
    required TResult orElse(),
  }) {
    if (errorFromBacked != null) {
      return errorFromBacked(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_ServerException value) serverException,
    required TResult Function(_BackendException value) errorFromBacked,
  }) {
    return errorFromBacked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_ServerException value)? serverException,
    TResult? Function(_BackendException value)? errorFromBacked,
  }) {
    return errorFromBacked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_ServerException value)? serverException,
    TResult Function(_BackendException value)? errorFromBacked,
    required TResult orElse(),
  }) {
    if (errorFromBacked != null) {
      return errorFromBacked(this);
    }
    return orElse();
  }
}

abstract class _BackendException implements ApiException {
  factory _BackendException({required final String message}) =
      _$_BackendException;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_BackendExceptionCopyWith<_$_BackendException> get copyWith =>
      throw _privateConstructorUsedError;
}
