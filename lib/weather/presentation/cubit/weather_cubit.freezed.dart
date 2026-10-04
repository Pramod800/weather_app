// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeatherState {

 WeatherStatus get status;/// The place being shown or loaded; null until the device is located.
 Place? get place; WeatherReport? get report;/// With a [report] present this is a failed refresh, shown as a notice;
/// without one it is the whole screen.
 Failure? get failure; bool get isRefreshing;/// True when the app tracks the device instead of a chosen place.
 bool get followsLocation;
/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherStateCopyWith<WeatherState> get copyWith => _$WeatherStateCopyWithImpl<WeatherState>(this as WeatherState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as WeatherState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.place, _this.place) || other.place == _this.place)&&(identical(other.report, _this.report) || other.report == _this.report)&&(identical(other.failure, _this.failure) || other.failure == _this.failure)&&(identical(other.isRefreshing, _this.isRefreshing) || other.isRefreshing == _this.isRefreshing)&&(identical(other.followsLocation, _this.followsLocation) || other.followsLocation == _this.followsLocation));
}


@override
int get hashCode {
  final _this = this as WeatherState;
  return Object.hash(runtimeType,_this.status,_this.place,_this.report,_this.failure,_this.isRefreshing,_this.followsLocation);
}

@override
String toString() {
  final _this = this as WeatherState;
  return 'WeatherState(status: ${_this.status}, place: ${_this.place}, report: ${_this.report}, failure: ${_this.failure}, isRefreshing: ${_this.isRefreshing}, followsLocation: ${_this.followsLocation})';
}


}

/// @nodoc
abstract mixin class $WeatherStateCopyWith<$Res>  {
  factory $WeatherStateCopyWith(WeatherState value, $Res Function(WeatherState) _then) = _$WeatherStateCopyWithImpl;
@useResult
$Res call({
 WeatherStatus status, Place? place, WeatherReport? report, Failure? failure, bool isRefreshing, bool followsLocation
});




}
/// @nodoc
class _$WeatherStateCopyWithImpl<$Res>
    implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._self, this._then);

  final WeatherState _self;
  final $Res Function(WeatherState) _then;

/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? place = freezed,Object? report = freezed,Object? failure = freezed,Object? isRefreshing = null,Object? followsLocation = null,}) {
  return _then(WeatherState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WeatherStatus,place: freezed == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as Place?,report: freezed == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as WeatherReport?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,followsLocation: null == followsLocation ? _self.followsLocation : followsLocation // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherState].
extension WeatherStatePatterns on WeatherState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherState value)  $default,){
final _that = this;
switch (_that) {
case _WeatherState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherState value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WeatherStatus status,  Place? place,  WeatherReport? report,  Failure? failure,  bool isRefreshing,  bool followsLocation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherState() when $default != null:
return $default(_that.status,_that.place,_that.report,_that.failure,_that.isRefreshing,_that.followsLocation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WeatherStatus status,  Place? place,  WeatherReport? report,  Failure? failure,  bool isRefreshing,  bool followsLocation)  $default,) {final _that = this;
switch (_that) {
case _WeatherState():
return $default(_that.status,_that.place,_that.report,_that.failure,_that.isRefreshing,_that.followsLocation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WeatherStatus status,  Place? place,  WeatherReport? report,  Failure? failure,  bool isRefreshing,  bool followsLocation)?  $default,) {final _that = this;
switch (_that) {
case _WeatherState() when $default != null:
return $default(_that.status,_that.place,_that.report,_that.failure,_that.isRefreshing,_that.followsLocation);case _:
  return null;

}
}

}

/// @nodoc


class _WeatherState implements WeatherState {
  const _WeatherState({this.status = WeatherStatus.initial, this.place, this.report, this.failure, this.isRefreshing = false, this.followsLocation = true});
  

@override@JsonKey() final  WeatherStatus status;
/// The place being shown or loaded; null until the device is located.
@override final  Place? place;
@override final  WeatherReport? report;
/// With a [report] present this is a failed refresh, shown as a notice;
/// without one it is the whole screen.
@override final  Failure? failure;
@override@JsonKey() final  bool isRefreshing;
/// True when the app tracks the device instead of a chosen place.
@override@JsonKey() final  bool followsLocation;

/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherStateCopyWith<_WeatherState> get copyWith => __$WeatherStateCopyWithImpl<_WeatherState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherState&&(identical(other.status, status) || other.status == status)&&(identical(other.place, place) || other.place == place)&&(identical(other.report, report) || other.report == report)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.followsLocation, followsLocation) || other.followsLocation == followsLocation));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,place,report,failure,isRefreshing,followsLocation);
}

@override
String toString() {
    return 'WeatherState(status: $status, place: $place, report: $report, failure: $failure, isRefreshing: $isRefreshing, followsLocation: $followsLocation)';
}


}

/// @nodoc
abstract mixin class _$WeatherStateCopyWith<$Res> implements $WeatherStateCopyWith<$Res> {
  factory _$WeatherStateCopyWith(_WeatherState value, $Res Function(_WeatherState) _then) = __$WeatherStateCopyWithImpl;
@override @useResult
$Res call({
 WeatherStatus status, Place? place, WeatherReport? report, Failure? failure, bool isRefreshing, bool followsLocation
});




}
/// @nodoc
class __$WeatherStateCopyWithImpl<$Res>
    implements _$WeatherStateCopyWith<$Res> {
  __$WeatherStateCopyWithImpl(this._self, this._then);

  final _WeatherState _self;
  final $Res Function(_WeatherState) _then;

/// Create a copy of WeatherState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? place = freezed,Object? report = freezed,Object? failure = freezed,Object? isRefreshing = null,Object? followsLocation = null,}) {
  return _then(_WeatherState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WeatherStatus,place: freezed == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as Place?,report: freezed == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as WeatherReport?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,followsLocation: null == followsLocation ? _self.followsLocation : followsLocation // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
