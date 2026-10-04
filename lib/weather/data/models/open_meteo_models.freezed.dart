// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_meteo_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForecastResponse {

@JsonKey(name: 'utc_offset_seconds') int? get utcOffsetSeconds; CurrentBlock? get current; HourlyBlock? get hourly; DailyBlock? get daily;
/// Create a copy of ForecastResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForecastResponseCopyWith<ForecastResponse> get copyWith => _$ForecastResponseCopyWithImpl<ForecastResponse>(this as ForecastResponse, _$identity);

  /// Serializes this ForecastResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ForecastResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForecastResponse&&(identical(other.utcOffsetSeconds, _this.utcOffsetSeconds) || other.utcOffsetSeconds == _this.utcOffsetSeconds)&&(identical(other.current, _this.current) || other.current == _this.current)&&(identical(other.hourly, _this.hourly) || other.hourly == _this.hourly)&&(identical(other.daily, _this.daily) || other.daily == _this.daily));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ForecastResponse;
  return Object.hash(runtimeType,_this.utcOffsetSeconds,_this.current,_this.hourly,_this.daily);
}

@override
String toString() {
  final _this = this as ForecastResponse;
  return 'ForecastResponse(utcOffsetSeconds: ${_this.utcOffsetSeconds}, current: ${_this.current}, hourly: ${_this.hourly}, daily: ${_this.daily})';
}


}

/// @nodoc
abstract mixin class $ForecastResponseCopyWith<$Res>  {
  factory $ForecastResponseCopyWith(ForecastResponse value, $Res Function(ForecastResponse) _then) = _$ForecastResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'utc_offset_seconds') int? utcOffsetSeconds, CurrentBlock? current, HourlyBlock? hourly, DailyBlock? daily
});


$CurrentBlockCopyWith<$Res>? get current;$HourlyBlockCopyWith<$Res>? get hourly;$DailyBlockCopyWith<$Res>? get daily;

}
/// @nodoc
class _$ForecastResponseCopyWithImpl<$Res>
    implements $ForecastResponseCopyWith<$Res> {
  _$ForecastResponseCopyWithImpl(this._self, this._then);

  final ForecastResponse _self;
  final $Res Function(ForecastResponse) _then;

/// Create a copy of ForecastResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? utcOffsetSeconds = freezed,Object? current = freezed,Object? hourly = freezed,Object? daily = freezed,}) {
  return _then(ForecastResponse(
utcOffsetSeconds: freezed == utcOffsetSeconds ? _self.utcOffsetSeconds : utcOffsetSeconds // ignore: cast_nullable_to_non_nullable
as int?,current: freezed == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as CurrentBlock?,hourly: freezed == hourly ? _self.hourly : hourly // ignore: cast_nullable_to_non_nullable
as HourlyBlock?,daily: freezed == daily ? _self.daily : daily // ignore: cast_nullable_to_non_nullable
as DailyBlock?,
  ));
}
/// Create a copy of ForecastResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentBlockCopyWith<$Res>? get current {
    if (_self.current == null) {
    return null;
  }

  return $CurrentBlockCopyWith<$Res>(_self.current!, (value) {
    return _then(_self.copyWith(current: value));
  });
}/// Create a copy of ForecastResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HourlyBlockCopyWith<$Res>? get hourly {
    if (_self.hourly == null) {
    return null;
  }

  return $HourlyBlockCopyWith<$Res>(_self.hourly!, (value) {
    return _then(_self.copyWith(hourly: value));
  });
}/// Create a copy of ForecastResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyBlockCopyWith<$Res>? get daily {
    if (_self.daily == null) {
    return null;
  }

  return $DailyBlockCopyWith<$Res>(_self.daily!, (value) {
    return _then(_self.copyWith(daily: value));
  });
}
}


/// Adds pattern-matching-related methods to [ForecastResponse].
extension ForecastResponsePatterns on ForecastResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForecastResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForecastResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForecastResponse value)  $default,){
final _that = this;
switch (_that) {
case _ForecastResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForecastResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ForecastResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'utc_offset_seconds')  int? utcOffsetSeconds,  CurrentBlock? current,  HourlyBlock? hourly,  DailyBlock? daily)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForecastResponse() when $default != null:
return $default(_that.utcOffsetSeconds,_that.current,_that.hourly,_that.daily);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'utc_offset_seconds')  int? utcOffsetSeconds,  CurrentBlock? current,  HourlyBlock? hourly,  DailyBlock? daily)  $default,) {final _that = this;
switch (_that) {
case _ForecastResponse():
return $default(_that.utcOffsetSeconds,_that.current,_that.hourly,_that.daily);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'utc_offset_seconds')  int? utcOffsetSeconds,  CurrentBlock? current,  HourlyBlock? hourly,  DailyBlock? daily)?  $default,) {final _that = this;
switch (_that) {
case _ForecastResponse() when $default != null:
return $default(_that.utcOffsetSeconds,_that.current,_that.hourly,_that.daily);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForecastResponse implements ForecastResponse {
  const _ForecastResponse({@JsonKey(name: 'utc_offset_seconds') this.utcOffsetSeconds, this.current, this.hourly, this.daily});
  factory _ForecastResponse.fromJson(Map<String, dynamic> json) => _$ForecastResponseFromJson(json);

@override@JsonKey(name: 'utc_offset_seconds') final  int? utcOffsetSeconds;
@override final  CurrentBlock? current;
@override final  HourlyBlock? hourly;
@override final  DailyBlock? daily;

/// Create a copy of ForecastResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForecastResponseCopyWith<_ForecastResponse> get copyWith => __$ForecastResponseCopyWithImpl<_ForecastResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForecastResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForecastResponse&&(identical(other.utcOffsetSeconds, utcOffsetSeconds) || other.utcOffsetSeconds == utcOffsetSeconds)&&(identical(other.current, current) || other.current == current)&&(identical(other.hourly, hourly) || other.hourly == hourly)&&(identical(other.daily, daily) || other.daily == daily));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,utcOffsetSeconds,current,hourly,daily);
}

@override
String toString() {
    return 'ForecastResponse(utcOffsetSeconds: $utcOffsetSeconds, current: $current, hourly: $hourly, daily: $daily)';
}


}

/// @nodoc
abstract mixin class _$ForecastResponseCopyWith<$Res> implements $ForecastResponseCopyWith<$Res> {
  factory _$ForecastResponseCopyWith(_ForecastResponse value, $Res Function(_ForecastResponse) _then) = __$ForecastResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'utc_offset_seconds') int? utcOffsetSeconds, CurrentBlock? current, HourlyBlock? hourly, DailyBlock? daily
});


@override $CurrentBlockCopyWith<$Res>? get current;@override $HourlyBlockCopyWith<$Res>? get hourly;@override $DailyBlockCopyWith<$Res>? get daily;

}
/// @nodoc
class __$ForecastResponseCopyWithImpl<$Res>
    implements _$ForecastResponseCopyWith<$Res> {
  __$ForecastResponseCopyWithImpl(this._self, this._then);

  final _ForecastResponse _self;
  final $Res Function(_ForecastResponse) _then;

/// Create a copy of ForecastResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? utcOffsetSeconds = freezed,Object? current = freezed,Object? hourly = freezed,Object? daily = freezed,}) {
  return _then(_ForecastResponse(
utcOffsetSeconds: freezed == utcOffsetSeconds ? _self.utcOffsetSeconds : utcOffsetSeconds // ignore: cast_nullable_to_non_nullable
as int?,current: freezed == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as CurrentBlock?,hourly: freezed == hourly ? _self.hourly : hourly // ignore: cast_nullable_to_non_nullable
as HourlyBlock?,daily: freezed == daily ? _self.daily : daily // ignore: cast_nullable_to_non_nullable
as DailyBlock?,
  ));
}

/// Create a copy of ForecastResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentBlockCopyWith<$Res>? get current {
    if (_self.current == null) {
    return null;
  }

  return $CurrentBlockCopyWith<$Res>(_self.current!, (value) {
    return _then(_self.copyWith(current: value));
  });
}/// Create a copy of ForecastResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HourlyBlockCopyWith<$Res>? get hourly {
    if (_self.hourly == null) {
    return null;
  }

  return $HourlyBlockCopyWith<$Res>(_self.hourly!, (value) {
    return _then(_self.copyWith(hourly: value));
  });
}/// Create a copy of ForecastResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyBlockCopyWith<$Res>? get daily {
    if (_self.daily == null) {
    return null;
  }

  return $DailyBlockCopyWith<$Res>(_self.daily!, (value) {
    return _then(_self.copyWith(daily: value));
  });
}
}


/// @nodoc
mixin _$CurrentBlock {

 int? get time;@JsonKey(name: 'temperature_2m') double? get temperature;@JsonKey(name: 'apparent_temperature') double? get apparentTemperature;@JsonKey(name: 'relative_humidity_2m') double? get humidity;@JsonKey(name: 'is_day') int? get isDay;@JsonKey(name: 'weather_code') int? get weatherCode;@JsonKey(name: 'cloud_cover') double? get cloudCover;@JsonKey(name: 'pressure_msl') double? get pressure;@JsonKey(name: 'wind_speed_10m') double? get windSpeed;@JsonKey(name: 'wind_direction_10m') double? get windDirection; double? get visibility;
/// Create a copy of CurrentBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentBlockCopyWith<CurrentBlock> get copyWith => _$CurrentBlockCopyWithImpl<CurrentBlock>(this as CurrentBlock, _$identity);

  /// Serializes this CurrentBlock to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CurrentBlock;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentBlock&&(identical(other.time, _this.time) || other.time == _this.time)&&(identical(other.temperature, _this.temperature) || other.temperature == _this.temperature)&&(identical(other.apparentTemperature, _this.apparentTemperature) || other.apparentTemperature == _this.apparentTemperature)&&(identical(other.humidity, _this.humidity) || other.humidity == _this.humidity)&&(identical(other.isDay, _this.isDay) || other.isDay == _this.isDay)&&(identical(other.weatherCode, _this.weatherCode) || other.weatherCode == _this.weatherCode)&&(identical(other.cloudCover, _this.cloudCover) || other.cloudCover == _this.cloudCover)&&(identical(other.pressure, _this.pressure) || other.pressure == _this.pressure)&&(identical(other.windSpeed, _this.windSpeed) || other.windSpeed == _this.windSpeed)&&(identical(other.windDirection, _this.windDirection) || other.windDirection == _this.windDirection)&&(identical(other.visibility, _this.visibility) || other.visibility == _this.visibility));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CurrentBlock;
  return Object.hash(runtimeType,_this.time,_this.temperature,_this.apparentTemperature,_this.humidity,_this.isDay,_this.weatherCode,_this.cloudCover,_this.pressure,_this.windSpeed,_this.windDirection,_this.visibility);
}

@override
String toString() {
  final _this = this as CurrentBlock;
  return 'CurrentBlock(time: ${_this.time}, temperature: ${_this.temperature}, apparentTemperature: ${_this.apparentTemperature}, humidity: ${_this.humidity}, isDay: ${_this.isDay}, weatherCode: ${_this.weatherCode}, cloudCover: ${_this.cloudCover}, pressure: ${_this.pressure}, windSpeed: ${_this.windSpeed}, windDirection: ${_this.windDirection}, visibility: ${_this.visibility})';
}


}

/// @nodoc
abstract mixin class $CurrentBlockCopyWith<$Res>  {
  factory $CurrentBlockCopyWith(CurrentBlock value, $Res Function(CurrentBlock) _then) = _$CurrentBlockCopyWithImpl;
@useResult
$Res call({
 int? time,@JsonKey(name: 'temperature_2m') double? temperature,@JsonKey(name: 'apparent_temperature') double? apparentTemperature,@JsonKey(name: 'relative_humidity_2m') double? humidity,@JsonKey(name: 'is_day') int? isDay,@JsonKey(name: 'weather_code') int? weatherCode,@JsonKey(name: 'cloud_cover') double? cloudCover,@JsonKey(name: 'pressure_msl') double? pressure,@JsonKey(name: 'wind_speed_10m') double? windSpeed,@JsonKey(name: 'wind_direction_10m') double? windDirection, double? visibility
});




}
/// @nodoc
class _$CurrentBlockCopyWithImpl<$Res>
    implements $CurrentBlockCopyWith<$Res> {
  _$CurrentBlockCopyWithImpl(this._self, this._then);

  final CurrentBlock _self;
  final $Res Function(CurrentBlock) _then;

/// Create a copy of CurrentBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = freezed,Object? temperature = freezed,Object? apparentTemperature = freezed,Object? humidity = freezed,Object? isDay = freezed,Object? weatherCode = freezed,Object? cloudCover = freezed,Object? pressure = freezed,Object? windSpeed = freezed,Object? windDirection = freezed,Object? visibility = freezed,}) {
  return _then(CurrentBlock(
time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as int?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,apparentTemperature: freezed == apparentTemperature ? _self.apparentTemperature : apparentTemperature // ignore: cast_nullable_to_non_nullable
as double?,humidity: freezed == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double?,isDay: freezed == isDay ? _self.isDay : isDay // ignore: cast_nullable_to_non_nullable
as int?,weatherCode: freezed == weatherCode ? _self.weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as int?,cloudCover: freezed == cloudCover ? _self.cloudCover : cloudCover // ignore: cast_nullable_to_non_nullable
as double?,pressure: freezed == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as double?,windSpeed: freezed == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as double?,windDirection: freezed == windDirection ? _self.windDirection : windDirection // ignore: cast_nullable_to_non_nullable
as double?,visibility: freezed == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrentBlock].
extension CurrentBlockPatterns on CurrentBlock {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentBlock value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentBlock() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentBlock value)  $default,){
final _that = this;
switch (_that) {
case _CurrentBlock():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentBlock value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentBlock() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? time, @JsonKey(name: 'temperature_2m')  double? temperature, @JsonKey(name: 'apparent_temperature')  double? apparentTemperature, @JsonKey(name: 'relative_humidity_2m')  double? humidity, @JsonKey(name: 'is_day')  int? isDay, @JsonKey(name: 'weather_code')  int? weatherCode, @JsonKey(name: 'cloud_cover')  double? cloudCover, @JsonKey(name: 'pressure_msl')  double? pressure, @JsonKey(name: 'wind_speed_10m')  double? windSpeed, @JsonKey(name: 'wind_direction_10m')  double? windDirection,  double? visibility)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentBlock() when $default != null:
return $default(_that.time,_that.temperature,_that.apparentTemperature,_that.humidity,_that.isDay,_that.weatherCode,_that.cloudCover,_that.pressure,_that.windSpeed,_that.windDirection,_that.visibility);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? time, @JsonKey(name: 'temperature_2m')  double? temperature, @JsonKey(name: 'apparent_temperature')  double? apparentTemperature, @JsonKey(name: 'relative_humidity_2m')  double? humidity, @JsonKey(name: 'is_day')  int? isDay, @JsonKey(name: 'weather_code')  int? weatherCode, @JsonKey(name: 'cloud_cover')  double? cloudCover, @JsonKey(name: 'pressure_msl')  double? pressure, @JsonKey(name: 'wind_speed_10m')  double? windSpeed, @JsonKey(name: 'wind_direction_10m')  double? windDirection,  double? visibility)  $default,) {final _that = this;
switch (_that) {
case _CurrentBlock():
return $default(_that.time,_that.temperature,_that.apparentTemperature,_that.humidity,_that.isDay,_that.weatherCode,_that.cloudCover,_that.pressure,_that.windSpeed,_that.windDirection,_that.visibility);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? time, @JsonKey(name: 'temperature_2m')  double? temperature, @JsonKey(name: 'apparent_temperature')  double? apparentTemperature, @JsonKey(name: 'relative_humidity_2m')  double? humidity, @JsonKey(name: 'is_day')  int? isDay, @JsonKey(name: 'weather_code')  int? weatherCode, @JsonKey(name: 'cloud_cover')  double? cloudCover, @JsonKey(name: 'pressure_msl')  double? pressure, @JsonKey(name: 'wind_speed_10m')  double? windSpeed, @JsonKey(name: 'wind_direction_10m')  double? windDirection,  double? visibility)?  $default,) {final _that = this;
switch (_that) {
case _CurrentBlock() when $default != null:
return $default(_that.time,_that.temperature,_that.apparentTemperature,_that.humidity,_that.isDay,_that.weatherCode,_that.cloudCover,_that.pressure,_that.windSpeed,_that.windDirection,_that.visibility);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurrentBlock implements CurrentBlock {
  const _CurrentBlock({this.time, @JsonKey(name: 'temperature_2m') this.temperature, @JsonKey(name: 'apparent_temperature') this.apparentTemperature, @JsonKey(name: 'relative_humidity_2m') this.humidity, @JsonKey(name: 'is_day') this.isDay, @JsonKey(name: 'weather_code') this.weatherCode, @JsonKey(name: 'cloud_cover') this.cloudCover, @JsonKey(name: 'pressure_msl') this.pressure, @JsonKey(name: 'wind_speed_10m') this.windSpeed, @JsonKey(name: 'wind_direction_10m') this.windDirection, this.visibility});
  factory _CurrentBlock.fromJson(Map<String, dynamic> json) => _$CurrentBlockFromJson(json);

@override final  int? time;
@override@JsonKey(name: 'temperature_2m') final  double? temperature;
@override@JsonKey(name: 'apparent_temperature') final  double? apparentTemperature;
@override@JsonKey(name: 'relative_humidity_2m') final  double? humidity;
@override@JsonKey(name: 'is_day') final  int? isDay;
@override@JsonKey(name: 'weather_code') final  int? weatherCode;
@override@JsonKey(name: 'cloud_cover') final  double? cloudCover;
@override@JsonKey(name: 'pressure_msl') final  double? pressure;
@override@JsonKey(name: 'wind_speed_10m') final  double? windSpeed;
@override@JsonKey(name: 'wind_direction_10m') final  double? windDirection;
@override final  double? visibility;

/// Create a copy of CurrentBlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentBlockCopyWith<_CurrentBlock> get copyWith => __$CurrentBlockCopyWithImpl<_CurrentBlock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentBlockToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentBlock&&(identical(other.time, time) || other.time == time)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.apparentTemperature, apparentTemperature) || other.apparentTemperature == apparentTemperature)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.isDay, isDay) || other.isDay == isDay)&&(identical(other.weatherCode, weatherCode) || other.weatherCode == weatherCode)&&(identical(other.cloudCover, cloudCover) || other.cloudCover == cloudCover)&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.windDirection, windDirection) || other.windDirection == windDirection)&&(identical(other.visibility, visibility) || other.visibility == visibility));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,time,temperature,apparentTemperature,humidity,isDay,weatherCode,cloudCover,pressure,windSpeed,windDirection,visibility);
}

@override
String toString() {
    return 'CurrentBlock(time: $time, temperature: $temperature, apparentTemperature: $apparentTemperature, humidity: $humidity, isDay: $isDay, weatherCode: $weatherCode, cloudCover: $cloudCover, pressure: $pressure, windSpeed: $windSpeed, windDirection: $windDirection, visibility: $visibility)';
}


}

/// @nodoc
abstract mixin class _$CurrentBlockCopyWith<$Res> implements $CurrentBlockCopyWith<$Res> {
  factory _$CurrentBlockCopyWith(_CurrentBlock value, $Res Function(_CurrentBlock) _then) = __$CurrentBlockCopyWithImpl;
@override @useResult
$Res call({
 int? time,@JsonKey(name: 'temperature_2m') double? temperature,@JsonKey(name: 'apparent_temperature') double? apparentTemperature,@JsonKey(name: 'relative_humidity_2m') double? humidity,@JsonKey(name: 'is_day') int? isDay,@JsonKey(name: 'weather_code') int? weatherCode,@JsonKey(name: 'cloud_cover') double? cloudCover,@JsonKey(name: 'pressure_msl') double? pressure,@JsonKey(name: 'wind_speed_10m') double? windSpeed,@JsonKey(name: 'wind_direction_10m') double? windDirection, double? visibility
});




}
/// @nodoc
class __$CurrentBlockCopyWithImpl<$Res>
    implements _$CurrentBlockCopyWith<$Res> {
  __$CurrentBlockCopyWithImpl(this._self, this._then);

  final _CurrentBlock _self;
  final $Res Function(_CurrentBlock) _then;

/// Create a copy of CurrentBlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = freezed,Object? temperature = freezed,Object? apparentTemperature = freezed,Object? humidity = freezed,Object? isDay = freezed,Object? weatherCode = freezed,Object? cloudCover = freezed,Object? pressure = freezed,Object? windSpeed = freezed,Object? windDirection = freezed,Object? visibility = freezed,}) {
  return _then(_CurrentBlock(
time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as int?,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double?,apparentTemperature: freezed == apparentTemperature ? _self.apparentTemperature : apparentTemperature // ignore: cast_nullable_to_non_nullable
as double?,humidity: freezed == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double?,isDay: freezed == isDay ? _self.isDay : isDay // ignore: cast_nullable_to_non_nullable
as int?,weatherCode: freezed == weatherCode ? _self.weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as int?,cloudCover: freezed == cloudCover ? _self.cloudCover : cloudCover // ignore: cast_nullable_to_non_nullable
as double?,pressure: freezed == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as double?,windSpeed: freezed == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as double?,windDirection: freezed == windDirection ? _self.windDirection : windDirection // ignore: cast_nullable_to_non_nullable
as double?,visibility: freezed == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$HourlyBlock {

 List<int> get time;@JsonKey(name: 'temperature_2m') List<double?> get temperature;@JsonKey(name: 'weather_code') List<int?> get weatherCode;@JsonKey(name: 'precipitation_probability') List<double?> get precipitationProbability;@JsonKey(name: 'is_day') List<int?> get isDay;
/// Create a copy of HourlyBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HourlyBlockCopyWith<HourlyBlock> get copyWith => _$HourlyBlockCopyWithImpl<HourlyBlock>(this as HourlyBlock, _$identity);

  /// Serializes this HourlyBlock to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HourlyBlock;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HourlyBlock&&const DeepCollectionEquality().equals(other.time, _this.time)&&const DeepCollectionEquality().equals(other.temperature, _this.temperature)&&const DeepCollectionEquality().equals(other.weatherCode, _this.weatherCode)&&const DeepCollectionEquality().equals(other.precipitationProbability, _this.precipitationProbability)&&const DeepCollectionEquality().equals(other.isDay, _this.isDay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HourlyBlock;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.time),const DeepCollectionEquality().hash(_this.temperature),const DeepCollectionEquality().hash(_this.weatherCode),const DeepCollectionEquality().hash(_this.precipitationProbability),const DeepCollectionEquality().hash(_this.isDay));
}

@override
String toString() {
  final _this = this as HourlyBlock;
  return 'HourlyBlock(time: ${_this.time}, temperature: ${_this.temperature}, weatherCode: ${_this.weatherCode}, precipitationProbability: ${_this.precipitationProbability}, isDay: ${_this.isDay})';
}


}

/// @nodoc
abstract mixin class $HourlyBlockCopyWith<$Res>  {
  factory $HourlyBlockCopyWith(HourlyBlock value, $Res Function(HourlyBlock) _then) = _$HourlyBlockCopyWithImpl;
@useResult
$Res call({
 List<int> time,@JsonKey(name: 'temperature_2m') List<double?> temperature,@JsonKey(name: 'weather_code') List<int?> weatherCode,@JsonKey(name: 'precipitation_probability') List<double?> precipitationProbability,@JsonKey(name: 'is_day') List<int?> isDay
});




}
/// @nodoc
class _$HourlyBlockCopyWithImpl<$Res>
    implements $HourlyBlockCopyWith<$Res> {
  _$HourlyBlockCopyWithImpl(this._self, this._then);

  final HourlyBlock _self;
  final $Res Function(HourlyBlock) _then;

/// Create a copy of HourlyBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? temperature = null,Object? weatherCode = null,Object? precipitationProbability = null,Object? isDay = null,}) {
  return _then(HourlyBlock(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as List<int>,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as List<double?>,weatherCode: null == weatherCode ? _self.weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as List<int?>,precipitationProbability: null == precipitationProbability ? _self.precipitationProbability : precipitationProbability // ignore: cast_nullable_to_non_nullable
as List<double?>,isDay: null == isDay ? _self.isDay : isDay // ignore: cast_nullable_to_non_nullable
as List<int?>,
  ));
}

}


/// Adds pattern-matching-related methods to [HourlyBlock].
extension HourlyBlockPatterns on HourlyBlock {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HourlyBlock value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HourlyBlock() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HourlyBlock value)  $default,){
final _that = this;
switch (_that) {
case _HourlyBlock():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HourlyBlock value)?  $default,){
final _that = this;
switch (_that) {
case _HourlyBlock() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int> time, @JsonKey(name: 'temperature_2m')  List<double?> temperature, @JsonKey(name: 'weather_code')  List<int?> weatherCode, @JsonKey(name: 'precipitation_probability')  List<double?> precipitationProbability, @JsonKey(name: 'is_day')  List<int?> isDay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HourlyBlock() when $default != null:
return $default(_that.time,_that.temperature,_that.weatherCode,_that.precipitationProbability,_that.isDay);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int> time, @JsonKey(name: 'temperature_2m')  List<double?> temperature, @JsonKey(name: 'weather_code')  List<int?> weatherCode, @JsonKey(name: 'precipitation_probability')  List<double?> precipitationProbability, @JsonKey(name: 'is_day')  List<int?> isDay)  $default,) {final _that = this;
switch (_that) {
case _HourlyBlock():
return $default(_that.time,_that.temperature,_that.weatherCode,_that.precipitationProbability,_that.isDay);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int> time, @JsonKey(name: 'temperature_2m')  List<double?> temperature, @JsonKey(name: 'weather_code')  List<int?> weatherCode, @JsonKey(name: 'precipitation_probability')  List<double?> precipitationProbability, @JsonKey(name: 'is_day')  List<int?> isDay)?  $default,) {final _that = this;
switch (_that) {
case _HourlyBlock() when $default != null:
return $default(_that.time,_that.temperature,_that.weatherCode,_that.precipitationProbability,_that.isDay);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HourlyBlock implements HourlyBlock {
  const _HourlyBlock({ List<int> time = const [], @JsonKey(name: 'temperature_2m')  List<double?> temperature = const [], @JsonKey(name: 'weather_code')  List<int?> weatherCode = const [], @JsonKey(name: 'precipitation_probability')  List<double?> precipitationProbability = const [], @JsonKey(name: 'is_day')  List<int?> isDay = const []}): _time = time,_temperature = temperature,_weatherCode = weatherCode,_precipitationProbability = precipitationProbability,_isDay = isDay;
  factory _HourlyBlock.fromJson(Map<String, dynamic> json) => _$HourlyBlockFromJson(json);

 final  List<int> _time;
@override@JsonKey() List<int> get time {
  if (_time is EqualUnmodifiableListView) return _time;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_time);
}

 final  List<double?> _temperature;
@override@JsonKey(name: 'temperature_2m') List<double?> get temperature {
  if (_temperature is EqualUnmodifiableListView) return _temperature;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_temperature);
}

 final  List<int?> _weatherCode;
@override@JsonKey(name: 'weather_code') List<int?> get weatherCode {
  if (_weatherCode is EqualUnmodifiableListView) return _weatherCode;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weatherCode);
}

 final  List<double?> _precipitationProbability;
@override@JsonKey(name: 'precipitation_probability') List<double?> get precipitationProbability {
  if (_precipitationProbability is EqualUnmodifiableListView) return _precipitationProbability;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_precipitationProbability);
}

 final  List<int?> _isDay;
@override@JsonKey(name: 'is_day') List<int?> get isDay {
  if (_isDay is EqualUnmodifiableListView) return _isDay;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_isDay);
}


/// Create a copy of HourlyBlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HourlyBlockCopyWith<_HourlyBlock> get copyWith => __$HourlyBlockCopyWithImpl<_HourlyBlock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HourlyBlockToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HourlyBlock&&const DeepCollectionEquality().equals(other.time, _time)&&const DeepCollectionEquality().equals(other.temperature, _temperature)&&const DeepCollectionEquality().equals(other.weatherCode, _weatherCode)&&const DeepCollectionEquality().equals(other.precipitationProbability, _precipitationProbability)&&const DeepCollectionEquality().equals(other.isDay, _isDay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_time),const DeepCollectionEquality().hash(_temperature),const DeepCollectionEquality().hash(_weatherCode),const DeepCollectionEquality().hash(_precipitationProbability),const DeepCollectionEquality().hash(_isDay));
}

@override
String toString() {
    return 'HourlyBlock(time: $time, temperature: $temperature, weatherCode: $weatherCode, precipitationProbability: $precipitationProbability, isDay: $isDay)';
}


}

/// @nodoc
abstract mixin class _$HourlyBlockCopyWith<$Res> implements $HourlyBlockCopyWith<$Res> {
  factory _$HourlyBlockCopyWith(_HourlyBlock value, $Res Function(_HourlyBlock) _then) = __$HourlyBlockCopyWithImpl;
@override @useResult
$Res call({
 List<int> time,@JsonKey(name: 'temperature_2m') List<double?> temperature,@JsonKey(name: 'weather_code') List<int?> weatherCode,@JsonKey(name: 'precipitation_probability') List<double?> precipitationProbability,@JsonKey(name: 'is_day') List<int?> isDay
});




}
/// @nodoc
class __$HourlyBlockCopyWithImpl<$Res>
    implements _$HourlyBlockCopyWith<$Res> {
  __$HourlyBlockCopyWithImpl(this._self, this._then);

  final _HourlyBlock _self;
  final $Res Function(_HourlyBlock) _then;

/// Create a copy of HourlyBlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? temperature = null,Object? weatherCode = null,Object? precipitationProbability = null,Object? isDay = null,}) {
  return _then(_HourlyBlock(
time: null == time ? _self._time : time // ignore: cast_nullable_to_non_nullable
as List<int>,temperature: null == temperature ? _self._temperature : temperature // ignore: cast_nullable_to_non_nullable
as List<double?>,weatherCode: null == weatherCode ? _self._weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as List<int?>,precipitationProbability: null == precipitationProbability ? _self._precipitationProbability : precipitationProbability // ignore: cast_nullable_to_non_nullable
as List<double?>,isDay: null == isDay ? _self._isDay : isDay // ignore: cast_nullable_to_non_nullable
as List<int?>,
  ));
}


}


/// @nodoc
mixin _$DailyBlock {

/// Midnight of each day on the place's wall clock, as a UTC timestamp.
 List<int> get time;@JsonKey(name: 'weather_code') List<int?> get weatherCode;@JsonKey(name: 'temperature_2m_max') List<double?> get temperatureMax;@JsonKey(name: 'temperature_2m_min') List<double?> get temperatureMin; List<int?> get sunrise; List<int?> get sunset;@JsonKey(name: 'precipitation_probability_max') List<double?> get precipitationProbabilityMax;@JsonKey(name: 'precipitation_sum') List<double?> get precipitationSum;@JsonKey(name: 'uv_index_max') List<double?> get uvIndexMax;
/// Create a copy of DailyBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyBlockCopyWith<DailyBlock> get copyWith => _$DailyBlockCopyWithImpl<DailyBlock>(this as DailyBlock, _$identity);

  /// Serializes this DailyBlock to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DailyBlock;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyBlock&&const DeepCollectionEquality().equals(other.time, _this.time)&&const DeepCollectionEquality().equals(other.weatherCode, _this.weatherCode)&&const DeepCollectionEquality().equals(other.temperatureMax, _this.temperatureMax)&&const DeepCollectionEquality().equals(other.temperatureMin, _this.temperatureMin)&&const DeepCollectionEquality().equals(other.sunrise, _this.sunrise)&&const DeepCollectionEquality().equals(other.sunset, _this.sunset)&&const DeepCollectionEquality().equals(other.precipitationProbabilityMax, _this.precipitationProbabilityMax)&&const DeepCollectionEquality().equals(other.precipitationSum, _this.precipitationSum)&&const DeepCollectionEquality().equals(other.uvIndexMax, _this.uvIndexMax));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DailyBlock;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.time),const DeepCollectionEquality().hash(_this.weatherCode),const DeepCollectionEquality().hash(_this.temperatureMax),const DeepCollectionEquality().hash(_this.temperatureMin),const DeepCollectionEquality().hash(_this.sunrise),const DeepCollectionEquality().hash(_this.sunset),const DeepCollectionEquality().hash(_this.precipitationProbabilityMax),const DeepCollectionEquality().hash(_this.precipitationSum),const DeepCollectionEquality().hash(_this.uvIndexMax));
}

@override
String toString() {
  final _this = this as DailyBlock;
  return 'DailyBlock(time: ${_this.time}, weatherCode: ${_this.weatherCode}, temperatureMax: ${_this.temperatureMax}, temperatureMin: ${_this.temperatureMin}, sunrise: ${_this.sunrise}, sunset: ${_this.sunset}, precipitationProbabilityMax: ${_this.precipitationProbabilityMax}, precipitationSum: ${_this.precipitationSum}, uvIndexMax: ${_this.uvIndexMax})';
}


}

/// @nodoc
abstract mixin class $DailyBlockCopyWith<$Res>  {
  factory $DailyBlockCopyWith(DailyBlock value, $Res Function(DailyBlock) _then) = _$DailyBlockCopyWithImpl;
@useResult
$Res call({
 List<int> time,@JsonKey(name: 'weather_code') List<int?> weatherCode,@JsonKey(name: 'temperature_2m_max') List<double?> temperatureMax,@JsonKey(name: 'temperature_2m_min') List<double?> temperatureMin, List<int?> sunrise, List<int?> sunset,@JsonKey(name: 'precipitation_probability_max') List<double?> precipitationProbabilityMax,@JsonKey(name: 'precipitation_sum') List<double?> precipitationSum,@JsonKey(name: 'uv_index_max') List<double?> uvIndexMax
});




}
/// @nodoc
class _$DailyBlockCopyWithImpl<$Res>
    implements $DailyBlockCopyWith<$Res> {
  _$DailyBlockCopyWithImpl(this._self, this._then);

  final DailyBlock _self;
  final $Res Function(DailyBlock) _then;

/// Create a copy of DailyBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? weatherCode = null,Object? temperatureMax = null,Object? temperatureMin = null,Object? sunrise = null,Object? sunset = null,Object? precipitationProbabilityMax = null,Object? precipitationSum = null,Object? uvIndexMax = null,}) {
  return _then(DailyBlock(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as List<int>,weatherCode: null == weatherCode ? _self.weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as List<int?>,temperatureMax: null == temperatureMax ? _self.temperatureMax : temperatureMax // ignore: cast_nullable_to_non_nullable
as List<double?>,temperatureMin: null == temperatureMin ? _self.temperatureMin : temperatureMin // ignore: cast_nullable_to_non_nullable
as List<double?>,sunrise: null == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as List<int?>,sunset: null == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as List<int?>,precipitationProbabilityMax: null == precipitationProbabilityMax ? _self.precipitationProbabilityMax : precipitationProbabilityMax // ignore: cast_nullable_to_non_nullable
as List<double?>,precipitationSum: null == precipitationSum ? _self.precipitationSum : precipitationSum // ignore: cast_nullable_to_non_nullable
as List<double?>,uvIndexMax: null == uvIndexMax ? _self.uvIndexMax : uvIndexMax // ignore: cast_nullable_to_non_nullable
as List<double?>,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyBlock].
extension DailyBlockPatterns on DailyBlock {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyBlock value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyBlock() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyBlock value)  $default,){
final _that = this;
switch (_that) {
case _DailyBlock():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyBlock value)?  $default,){
final _that = this;
switch (_that) {
case _DailyBlock() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int> time, @JsonKey(name: 'weather_code')  List<int?> weatherCode, @JsonKey(name: 'temperature_2m_max')  List<double?> temperatureMax, @JsonKey(name: 'temperature_2m_min')  List<double?> temperatureMin,  List<int?> sunrise,  List<int?> sunset, @JsonKey(name: 'precipitation_probability_max')  List<double?> precipitationProbabilityMax, @JsonKey(name: 'precipitation_sum')  List<double?> precipitationSum, @JsonKey(name: 'uv_index_max')  List<double?> uvIndexMax)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyBlock() when $default != null:
return $default(_that.time,_that.weatherCode,_that.temperatureMax,_that.temperatureMin,_that.sunrise,_that.sunset,_that.precipitationProbabilityMax,_that.precipitationSum,_that.uvIndexMax);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int> time, @JsonKey(name: 'weather_code')  List<int?> weatherCode, @JsonKey(name: 'temperature_2m_max')  List<double?> temperatureMax, @JsonKey(name: 'temperature_2m_min')  List<double?> temperatureMin,  List<int?> sunrise,  List<int?> sunset, @JsonKey(name: 'precipitation_probability_max')  List<double?> precipitationProbabilityMax, @JsonKey(name: 'precipitation_sum')  List<double?> precipitationSum, @JsonKey(name: 'uv_index_max')  List<double?> uvIndexMax)  $default,) {final _that = this;
switch (_that) {
case _DailyBlock():
return $default(_that.time,_that.weatherCode,_that.temperatureMax,_that.temperatureMin,_that.sunrise,_that.sunset,_that.precipitationProbabilityMax,_that.precipitationSum,_that.uvIndexMax);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int> time, @JsonKey(name: 'weather_code')  List<int?> weatherCode, @JsonKey(name: 'temperature_2m_max')  List<double?> temperatureMax, @JsonKey(name: 'temperature_2m_min')  List<double?> temperatureMin,  List<int?> sunrise,  List<int?> sunset, @JsonKey(name: 'precipitation_probability_max')  List<double?> precipitationProbabilityMax, @JsonKey(name: 'precipitation_sum')  List<double?> precipitationSum, @JsonKey(name: 'uv_index_max')  List<double?> uvIndexMax)?  $default,) {final _that = this;
switch (_that) {
case _DailyBlock() when $default != null:
return $default(_that.time,_that.weatherCode,_that.temperatureMax,_that.temperatureMin,_that.sunrise,_that.sunset,_that.precipitationProbabilityMax,_that.precipitationSum,_that.uvIndexMax);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyBlock implements DailyBlock {
  const _DailyBlock({ List<int> time = const [], @JsonKey(name: 'weather_code')  List<int?> weatherCode = const [], @JsonKey(name: 'temperature_2m_max')  List<double?> temperatureMax = const [], @JsonKey(name: 'temperature_2m_min')  List<double?> temperatureMin = const [],  List<int?> sunrise = const [],  List<int?> sunset = const [], @JsonKey(name: 'precipitation_probability_max')  List<double?> precipitationProbabilityMax = const [], @JsonKey(name: 'precipitation_sum')  List<double?> precipitationSum = const [], @JsonKey(name: 'uv_index_max')  List<double?> uvIndexMax = const []}): _time = time,_weatherCode = weatherCode,_temperatureMax = temperatureMax,_temperatureMin = temperatureMin,_sunrise = sunrise,_sunset = sunset,_precipitationProbabilityMax = precipitationProbabilityMax,_precipitationSum = precipitationSum,_uvIndexMax = uvIndexMax;
  factory _DailyBlock.fromJson(Map<String, dynamic> json) => _$DailyBlockFromJson(json);

/// Midnight of each day on the place's wall clock, as a UTC timestamp.
 final  List<int> _time;
/// Midnight of each day on the place's wall clock, as a UTC timestamp.
@override@JsonKey() List<int> get time {
  if (_time is EqualUnmodifiableListView) return _time;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_time);
}

 final  List<int?> _weatherCode;
@override@JsonKey(name: 'weather_code') List<int?> get weatherCode {
  if (_weatherCode is EqualUnmodifiableListView) return _weatherCode;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weatherCode);
}

 final  List<double?> _temperatureMax;
@override@JsonKey(name: 'temperature_2m_max') List<double?> get temperatureMax {
  if (_temperatureMax is EqualUnmodifiableListView) return _temperatureMax;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_temperatureMax);
}

 final  List<double?> _temperatureMin;
@override@JsonKey(name: 'temperature_2m_min') List<double?> get temperatureMin {
  if (_temperatureMin is EqualUnmodifiableListView) return _temperatureMin;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_temperatureMin);
}

 final  List<int?> _sunrise;
@override@JsonKey() List<int?> get sunrise {
  if (_sunrise is EqualUnmodifiableListView) return _sunrise;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sunrise);
}

 final  List<int?> _sunset;
@override@JsonKey() List<int?> get sunset {
  if (_sunset is EqualUnmodifiableListView) return _sunset;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sunset);
}

 final  List<double?> _precipitationProbabilityMax;
@override@JsonKey(name: 'precipitation_probability_max') List<double?> get precipitationProbabilityMax {
  if (_precipitationProbabilityMax is EqualUnmodifiableListView) return _precipitationProbabilityMax;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_precipitationProbabilityMax);
}

 final  List<double?> _precipitationSum;
@override@JsonKey(name: 'precipitation_sum') List<double?> get precipitationSum {
  if (_precipitationSum is EqualUnmodifiableListView) return _precipitationSum;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_precipitationSum);
}

 final  List<double?> _uvIndexMax;
@override@JsonKey(name: 'uv_index_max') List<double?> get uvIndexMax {
  if (_uvIndexMax is EqualUnmodifiableListView) return _uvIndexMax;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_uvIndexMax);
}


/// Create a copy of DailyBlock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyBlockCopyWith<_DailyBlock> get copyWith => __$DailyBlockCopyWithImpl<_DailyBlock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyBlockToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyBlock&&const DeepCollectionEquality().equals(other.time, _time)&&const DeepCollectionEquality().equals(other.weatherCode, _weatherCode)&&const DeepCollectionEquality().equals(other.temperatureMax, _temperatureMax)&&const DeepCollectionEquality().equals(other.temperatureMin, _temperatureMin)&&const DeepCollectionEquality().equals(other.sunrise, _sunrise)&&const DeepCollectionEquality().equals(other.sunset, _sunset)&&const DeepCollectionEquality().equals(other.precipitationProbabilityMax, _precipitationProbabilityMax)&&const DeepCollectionEquality().equals(other.precipitationSum, _precipitationSum)&&const DeepCollectionEquality().equals(other.uvIndexMax, _uvIndexMax));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_time),const DeepCollectionEquality().hash(_weatherCode),const DeepCollectionEquality().hash(_temperatureMax),const DeepCollectionEquality().hash(_temperatureMin),const DeepCollectionEquality().hash(_sunrise),const DeepCollectionEquality().hash(_sunset),const DeepCollectionEquality().hash(_precipitationProbabilityMax),const DeepCollectionEquality().hash(_precipitationSum),const DeepCollectionEquality().hash(_uvIndexMax));
}

@override
String toString() {
    return 'DailyBlock(time: $time, weatherCode: $weatherCode, temperatureMax: $temperatureMax, temperatureMin: $temperatureMin, sunrise: $sunrise, sunset: $sunset, precipitationProbabilityMax: $precipitationProbabilityMax, precipitationSum: $precipitationSum, uvIndexMax: $uvIndexMax)';
}


}

/// @nodoc
abstract mixin class _$DailyBlockCopyWith<$Res> implements $DailyBlockCopyWith<$Res> {
  factory _$DailyBlockCopyWith(_DailyBlock value, $Res Function(_DailyBlock) _then) = __$DailyBlockCopyWithImpl;
@override @useResult
$Res call({
 List<int> time,@JsonKey(name: 'weather_code') List<int?> weatherCode,@JsonKey(name: 'temperature_2m_max') List<double?> temperatureMax,@JsonKey(name: 'temperature_2m_min') List<double?> temperatureMin, List<int?> sunrise, List<int?> sunset,@JsonKey(name: 'precipitation_probability_max') List<double?> precipitationProbabilityMax,@JsonKey(name: 'precipitation_sum') List<double?> precipitationSum,@JsonKey(name: 'uv_index_max') List<double?> uvIndexMax
});




}
/// @nodoc
class __$DailyBlockCopyWithImpl<$Res>
    implements _$DailyBlockCopyWith<$Res> {
  __$DailyBlockCopyWithImpl(this._self, this._then);

  final _DailyBlock _self;
  final $Res Function(_DailyBlock) _then;

/// Create a copy of DailyBlock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? weatherCode = null,Object? temperatureMax = null,Object? temperatureMin = null,Object? sunrise = null,Object? sunset = null,Object? precipitationProbabilityMax = null,Object? precipitationSum = null,Object? uvIndexMax = null,}) {
  return _then(_DailyBlock(
time: null == time ? _self._time : time // ignore: cast_nullable_to_non_nullable
as List<int>,weatherCode: null == weatherCode ? _self._weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as List<int?>,temperatureMax: null == temperatureMax ? _self._temperatureMax : temperatureMax // ignore: cast_nullable_to_non_nullable
as List<double?>,temperatureMin: null == temperatureMin ? _self._temperatureMin : temperatureMin // ignore: cast_nullable_to_non_nullable
as List<double?>,sunrise: null == sunrise ? _self._sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as List<int?>,sunset: null == sunset ? _self._sunset : sunset // ignore: cast_nullable_to_non_nullable
as List<int?>,precipitationProbabilityMax: null == precipitationProbabilityMax ? _self._precipitationProbabilityMax : precipitationProbabilityMax // ignore: cast_nullable_to_non_nullable
as List<double?>,precipitationSum: null == precipitationSum ? _self._precipitationSum : precipitationSum // ignore: cast_nullable_to_non_nullable
as List<double?>,uvIndexMax: null == uvIndexMax ? _self._uvIndexMax : uvIndexMax // ignore: cast_nullable_to_non_nullable
as List<double?>,
  ));
}


}


/// @nodoc
mixin _$AirQualityResponse {

 AirQualityCurrent? get current;
/// Create a copy of AirQualityResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AirQualityResponseCopyWith<AirQualityResponse> get copyWith => _$AirQualityResponseCopyWithImpl<AirQualityResponse>(this as AirQualityResponse, _$identity);

  /// Serializes this AirQualityResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AirQualityResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AirQualityResponse&&(identical(other.current, _this.current) || other.current == _this.current));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AirQualityResponse;
  return Object.hash(runtimeType,_this.current);
}

@override
String toString() {
  final _this = this as AirQualityResponse;
  return 'AirQualityResponse(current: ${_this.current})';
}


}

/// @nodoc
abstract mixin class $AirQualityResponseCopyWith<$Res>  {
  factory $AirQualityResponseCopyWith(AirQualityResponse value, $Res Function(AirQualityResponse) _then) = _$AirQualityResponseCopyWithImpl;
@useResult
$Res call({
 AirQualityCurrent? current
});


$AirQualityCurrentCopyWith<$Res>? get current;

}
/// @nodoc
class _$AirQualityResponseCopyWithImpl<$Res>
    implements $AirQualityResponseCopyWith<$Res> {
  _$AirQualityResponseCopyWithImpl(this._self, this._then);

  final AirQualityResponse _self;
  final $Res Function(AirQualityResponse) _then;

/// Create a copy of AirQualityResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? current = freezed,}) {
  return _then(AirQualityResponse(
current: freezed == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as AirQualityCurrent?,
  ));
}
/// Create a copy of AirQualityResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AirQualityCurrentCopyWith<$Res>? get current {
    if (_self.current == null) {
    return null;
  }

  return $AirQualityCurrentCopyWith<$Res>(_self.current!, (value) {
    return _then(_self.copyWith(current: value));
  });
}
}


/// Adds pattern-matching-related methods to [AirQualityResponse].
extension AirQualityResponsePatterns on AirQualityResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AirQualityResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AirQualityResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AirQualityResponse value)  $default,){
final _that = this;
switch (_that) {
case _AirQualityResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AirQualityResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AirQualityResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AirQualityCurrent? current)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AirQualityResponse() when $default != null:
return $default(_that.current);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AirQualityCurrent? current)  $default,) {final _that = this;
switch (_that) {
case _AirQualityResponse():
return $default(_that.current);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AirQualityCurrent? current)?  $default,) {final _that = this;
switch (_that) {
case _AirQualityResponse() when $default != null:
return $default(_that.current);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AirQualityResponse implements AirQualityResponse {
  const _AirQualityResponse({this.current});
  factory _AirQualityResponse.fromJson(Map<String, dynamic> json) => _$AirQualityResponseFromJson(json);

@override final  AirQualityCurrent? current;

/// Create a copy of AirQualityResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AirQualityResponseCopyWith<_AirQualityResponse> get copyWith => __$AirQualityResponseCopyWithImpl<_AirQualityResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AirQualityResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AirQualityResponse&&(identical(other.current, current) || other.current == current));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,current);
}

@override
String toString() {
    return 'AirQualityResponse(current: $current)';
}


}

/// @nodoc
abstract mixin class _$AirQualityResponseCopyWith<$Res> implements $AirQualityResponseCopyWith<$Res> {
  factory _$AirQualityResponseCopyWith(_AirQualityResponse value, $Res Function(_AirQualityResponse) _then) = __$AirQualityResponseCopyWithImpl;
@override @useResult
$Res call({
 AirQualityCurrent? current
});


@override $AirQualityCurrentCopyWith<$Res>? get current;

}
/// @nodoc
class __$AirQualityResponseCopyWithImpl<$Res>
    implements _$AirQualityResponseCopyWith<$Res> {
  __$AirQualityResponseCopyWithImpl(this._self, this._then);

  final _AirQualityResponse _self;
  final $Res Function(_AirQualityResponse) _then;

/// Create a copy of AirQualityResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? current = freezed,}) {
  return _then(_AirQualityResponse(
current: freezed == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as AirQualityCurrent?,
  ));
}

/// Create a copy of AirQualityResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AirQualityCurrentCopyWith<$Res>? get current {
    if (_self.current == null) {
    return null;
  }

  return $AirQualityCurrentCopyWith<$Res>(_self.current!, (value) {
    return _then(_self.copyWith(current: value));
  });
}
}


/// @nodoc
mixin _$AirQualityCurrent {

/// European Air Quality Index; 0 is cleanest, above 100 is extreme.
@JsonKey(name: 'european_aqi') double? get europeanAqi;@JsonKey(name: 'pm2_5') double? get pm25;
/// Create a copy of AirQualityCurrent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AirQualityCurrentCopyWith<AirQualityCurrent> get copyWith => _$AirQualityCurrentCopyWithImpl<AirQualityCurrent>(this as AirQualityCurrent, _$identity);

  /// Serializes this AirQualityCurrent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AirQualityCurrent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AirQualityCurrent&&(identical(other.europeanAqi, _this.europeanAqi) || other.europeanAqi == _this.europeanAqi)&&(identical(other.pm25, _this.pm25) || other.pm25 == _this.pm25));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AirQualityCurrent;
  return Object.hash(runtimeType,_this.europeanAqi,_this.pm25);
}

@override
String toString() {
  final _this = this as AirQualityCurrent;
  return 'AirQualityCurrent(europeanAqi: ${_this.europeanAqi}, pm25: ${_this.pm25})';
}


}

/// @nodoc
abstract mixin class $AirQualityCurrentCopyWith<$Res>  {
  factory $AirQualityCurrentCopyWith(AirQualityCurrent value, $Res Function(AirQualityCurrent) _then) = _$AirQualityCurrentCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'european_aqi') double? europeanAqi,@JsonKey(name: 'pm2_5') double? pm25
});




}
/// @nodoc
class _$AirQualityCurrentCopyWithImpl<$Res>
    implements $AirQualityCurrentCopyWith<$Res> {
  _$AirQualityCurrentCopyWithImpl(this._self, this._then);

  final AirQualityCurrent _self;
  final $Res Function(AirQualityCurrent) _then;

/// Create a copy of AirQualityCurrent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? europeanAqi = freezed,Object? pm25 = freezed,}) {
  return _then(AirQualityCurrent(
europeanAqi: freezed == europeanAqi ? _self.europeanAqi : europeanAqi // ignore: cast_nullable_to_non_nullable
as double?,pm25: freezed == pm25 ? _self.pm25 : pm25 // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [AirQualityCurrent].
extension AirQualityCurrentPatterns on AirQualityCurrent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AirQualityCurrent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AirQualityCurrent() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AirQualityCurrent value)  $default,){
final _that = this;
switch (_that) {
case _AirQualityCurrent():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AirQualityCurrent value)?  $default,){
final _that = this;
switch (_that) {
case _AirQualityCurrent() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'european_aqi')  double? europeanAqi, @JsonKey(name: 'pm2_5')  double? pm25)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AirQualityCurrent() when $default != null:
return $default(_that.europeanAqi,_that.pm25);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'european_aqi')  double? europeanAqi, @JsonKey(name: 'pm2_5')  double? pm25)  $default,) {final _that = this;
switch (_that) {
case _AirQualityCurrent():
return $default(_that.europeanAqi,_that.pm25);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'european_aqi')  double? europeanAqi, @JsonKey(name: 'pm2_5')  double? pm25)?  $default,) {final _that = this;
switch (_that) {
case _AirQualityCurrent() when $default != null:
return $default(_that.europeanAqi,_that.pm25);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AirQualityCurrent implements AirQualityCurrent {
  const _AirQualityCurrent({@JsonKey(name: 'european_aqi') this.europeanAqi, @JsonKey(name: 'pm2_5') this.pm25});
  factory _AirQualityCurrent.fromJson(Map<String, dynamic> json) => _$AirQualityCurrentFromJson(json);

/// European Air Quality Index; 0 is cleanest, above 100 is extreme.
@override@JsonKey(name: 'european_aqi') final  double? europeanAqi;
@override@JsonKey(name: 'pm2_5') final  double? pm25;

/// Create a copy of AirQualityCurrent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AirQualityCurrentCopyWith<_AirQualityCurrent> get copyWith => __$AirQualityCurrentCopyWithImpl<_AirQualityCurrent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AirQualityCurrentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AirQualityCurrent&&(identical(other.europeanAqi, europeanAqi) || other.europeanAqi == europeanAqi)&&(identical(other.pm25, pm25) || other.pm25 == pm25));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,europeanAqi,pm25);
}

@override
String toString() {
    return 'AirQualityCurrent(europeanAqi: $europeanAqi, pm25: $pm25)';
}


}

/// @nodoc
abstract mixin class _$AirQualityCurrentCopyWith<$Res> implements $AirQualityCurrentCopyWith<$Res> {
  factory _$AirQualityCurrentCopyWith(_AirQualityCurrent value, $Res Function(_AirQualityCurrent) _then) = __$AirQualityCurrentCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'european_aqi') double? europeanAqi,@JsonKey(name: 'pm2_5') double? pm25
});




}
/// @nodoc
class __$AirQualityCurrentCopyWithImpl<$Res>
    implements _$AirQualityCurrentCopyWith<$Res> {
  __$AirQualityCurrentCopyWithImpl(this._self, this._then);

  final _AirQualityCurrent _self;
  final $Res Function(_AirQualityCurrent) _then;

/// Create a copy of AirQualityCurrent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? europeanAqi = freezed,Object? pm25 = freezed,}) {
  return _then(_AirQualityCurrent(
europeanAqi: freezed == europeanAqi ? _self.europeanAqi : europeanAqi // ignore: cast_nullable_to_non_nullable
as double?,pm25: freezed == pm25 ? _self.pm25 : pm25 // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$GeocodingResponse {

 List<GeocodingResult> get results;
/// Create a copy of GeocodingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeocodingResponseCopyWith<GeocodingResponse> get copyWith => _$GeocodingResponseCopyWithImpl<GeocodingResponse>(this as GeocodingResponse, _$identity);

  /// Serializes this GeocodingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GeocodingResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeocodingResponse&&const DeepCollectionEquality().equals(other.results, _this.results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GeocodingResponse;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.results));
}

@override
String toString() {
  final _this = this as GeocodingResponse;
  return 'GeocodingResponse(results: ${_this.results})';
}


}

/// @nodoc
abstract mixin class $GeocodingResponseCopyWith<$Res>  {
  factory $GeocodingResponseCopyWith(GeocodingResponse value, $Res Function(GeocodingResponse) _then) = _$GeocodingResponseCopyWithImpl;
@useResult
$Res call({
 List<GeocodingResult> results
});




}
/// @nodoc
class _$GeocodingResponseCopyWithImpl<$Res>
    implements $GeocodingResponseCopyWith<$Res> {
  _$GeocodingResponseCopyWithImpl(this._self, this._then);

  final GeocodingResponse _self;
  final $Res Function(GeocodingResponse) _then;

/// Create a copy of GeocodingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? results = null,}) {
  return _then(GeocodingResponse(
results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<GeocodingResult>,
  ));
}

}


/// Adds pattern-matching-related methods to [GeocodingResponse].
extension GeocodingResponsePatterns on GeocodingResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeocodingResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeocodingResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeocodingResponse value)  $default,){
final _that = this;
switch (_that) {
case _GeocodingResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeocodingResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GeocodingResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<GeocodingResult> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeocodingResponse() when $default != null:
return $default(_that.results);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<GeocodingResult> results)  $default,) {final _that = this;
switch (_that) {
case _GeocodingResponse():
return $default(_that.results);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<GeocodingResult> results)?  $default,) {final _that = this;
switch (_that) {
case _GeocodingResponse() when $default != null:
return $default(_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeocodingResponse implements GeocodingResponse {
  const _GeocodingResponse({ List<GeocodingResult> results = const []}): _results = results;
  factory _GeocodingResponse.fromJson(Map<String, dynamic> json) => _$GeocodingResponseFromJson(json);

 final  List<GeocodingResult> _results;
@override@JsonKey() List<GeocodingResult> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of GeocodingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeocodingResponseCopyWith<_GeocodingResponse> get copyWith => __$GeocodingResponseCopyWithImpl<_GeocodingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeocodingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeocodingResponse&&const DeepCollectionEquality().equals(other.results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_results));
}

@override
String toString() {
    return 'GeocodingResponse(results: $results)';
}


}

/// @nodoc
abstract mixin class _$GeocodingResponseCopyWith<$Res> implements $GeocodingResponseCopyWith<$Res> {
  factory _$GeocodingResponseCopyWith(_GeocodingResponse value, $Res Function(_GeocodingResponse) _then) = __$GeocodingResponseCopyWithImpl;
@override @useResult
$Res call({
 List<GeocodingResult> results
});




}
/// @nodoc
class __$GeocodingResponseCopyWithImpl<$Res>
    implements _$GeocodingResponseCopyWith<$Res> {
  __$GeocodingResponseCopyWithImpl(this._self, this._then);

  final _GeocodingResponse _self;
  final $Res Function(_GeocodingResponse) _then;

/// Create a copy of GeocodingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? results = null,}) {
  return _then(_GeocodingResponse(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<GeocodingResult>,
  ));
}


}


/// @nodoc
mixin _$GeocodingResult {

 String? get name; double? get latitude; double? get longitude;@JsonKey(name: 'country_code') String? get countryCode;/// First-level region, such as a state or province.
 String? get admin1;
/// Create a copy of GeocodingResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeocodingResultCopyWith<GeocodingResult> get copyWith => _$GeocodingResultCopyWithImpl<GeocodingResult>(this as GeocodingResult, _$identity);

  /// Serializes this GeocodingResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GeocodingResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeocodingResult&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.countryCode, _this.countryCode) || other.countryCode == _this.countryCode)&&(identical(other.admin1, _this.admin1) || other.admin1 == _this.admin1));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GeocodingResult;
  return Object.hash(runtimeType,_this.name,_this.latitude,_this.longitude,_this.countryCode,_this.admin1);
}

@override
String toString() {
  final _this = this as GeocodingResult;
  return 'GeocodingResult(name: ${_this.name}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, countryCode: ${_this.countryCode}, admin1: ${_this.admin1})';
}


}

/// @nodoc
abstract mixin class $GeocodingResultCopyWith<$Res>  {
  factory $GeocodingResultCopyWith(GeocodingResult value, $Res Function(GeocodingResult) _then) = _$GeocodingResultCopyWithImpl;
@useResult
$Res call({
 String? name, double? latitude, double? longitude,@JsonKey(name: 'country_code') String? countryCode, String? admin1
});




}
/// @nodoc
class _$GeocodingResultCopyWithImpl<$Res>
    implements $GeocodingResultCopyWith<$Res> {
  _$GeocodingResultCopyWithImpl(this._self, this._then);

  final GeocodingResult _self;
  final $Res Function(GeocodingResult) _then;

/// Create a copy of GeocodingResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? countryCode = freezed,Object? admin1 = freezed,}) {
  return _then(GeocodingResult(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,admin1: freezed == admin1 ? _self.admin1 : admin1 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GeocodingResult].
extension GeocodingResultPatterns on GeocodingResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeocodingResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeocodingResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeocodingResult value)  $default,){
final _that = this;
switch (_that) {
case _GeocodingResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeocodingResult value)?  $default,){
final _that = this;
switch (_that) {
case _GeocodingResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  double? latitude,  double? longitude, @JsonKey(name: 'country_code')  String? countryCode,  String? admin1)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeocodingResult() when $default != null:
return $default(_that.name,_that.latitude,_that.longitude,_that.countryCode,_that.admin1);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  double? latitude,  double? longitude, @JsonKey(name: 'country_code')  String? countryCode,  String? admin1)  $default,) {final _that = this;
switch (_that) {
case _GeocodingResult():
return $default(_that.name,_that.latitude,_that.longitude,_that.countryCode,_that.admin1);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  double? latitude,  double? longitude, @JsonKey(name: 'country_code')  String? countryCode,  String? admin1)?  $default,) {final _that = this;
switch (_that) {
case _GeocodingResult() when $default != null:
return $default(_that.name,_that.latitude,_that.longitude,_that.countryCode,_that.admin1);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeocodingResult implements GeocodingResult {
  const _GeocodingResult({this.name, this.latitude, this.longitude, @JsonKey(name: 'country_code') this.countryCode, this.admin1});
  factory _GeocodingResult.fromJson(Map<String, dynamic> json) => _$GeocodingResultFromJson(json);

@override final  String? name;
@override final  double? latitude;
@override final  double? longitude;
@override@JsonKey(name: 'country_code') final  String? countryCode;
/// First-level region, such as a state or province.
@override final  String? admin1;

/// Create a copy of GeocodingResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeocodingResultCopyWith<_GeocodingResult> get copyWith => __$GeocodingResultCopyWithImpl<_GeocodingResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeocodingResultToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeocodingResult&&(identical(other.name, name) || other.name == name)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.admin1, admin1) || other.admin1 == admin1));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,latitude,longitude,countryCode,admin1);
}

@override
String toString() {
    return 'GeocodingResult(name: $name, latitude: $latitude, longitude: $longitude, countryCode: $countryCode, admin1: $admin1)';
}


}

/// @nodoc
abstract mixin class _$GeocodingResultCopyWith<$Res> implements $GeocodingResultCopyWith<$Res> {
  factory _$GeocodingResultCopyWith(_GeocodingResult value, $Res Function(_GeocodingResult) _then) = __$GeocodingResultCopyWithImpl;
@override @useResult
$Res call({
 String? name, double? latitude, double? longitude,@JsonKey(name: 'country_code') String? countryCode, String? admin1
});




}
/// @nodoc
class __$GeocodingResultCopyWithImpl<$Res>
    implements _$GeocodingResultCopyWith<$Res> {
  __$GeocodingResultCopyWithImpl(this._self, this._then);

  final _GeocodingResult _self;
  final $Res Function(_GeocodingResult) _then;

/// Create a copy of GeocodingResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? countryCode = freezed,Object? admin1 = freezed,}) {
  return _then(_GeocodingResult(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,admin1: freezed == admin1 ? _self.admin1 : admin1 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
