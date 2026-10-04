// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeoLocationModel {

 String? get name; double? get lat; double? get lon; String? get country; String? get state;
/// Create a copy of GeoLocationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeoLocationModelCopyWith<GeoLocationModel> get copyWith => _$GeoLocationModelCopyWithImpl<GeoLocationModel>(this as GeoLocationModel, _$identity);

  /// Serializes this GeoLocationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GeoLocationModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeoLocationModel&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.lat, _this.lat) || other.lat == _this.lat)&&(identical(other.lon, _this.lon) || other.lon == _this.lon)&&(identical(other.country, _this.country) || other.country == _this.country)&&(identical(other.state, _this.state) || other.state == _this.state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GeoLocationModel;
  return Object.hash(runtimeType,_this.name,_this.lat,_this.lon,_this.country,_this.state);
}

@override
String toString() {
  final _this = this as GeoLocationModel;
  return 'GeoLocationModel(name: ${_this.name}, lat: ${_this.lat}, lon: ${_this.lon}, country: ${_this.country}, state: ${_this.state})';
}


}

/// @nodoc
abstract mixin class $GeoLocationModelCopyWith<$Res>  {
  factory $GeoLocationModelCopyWith(GeoLocationModel value, $Res Function(GeoLocationModel) _then) = _$GeoLocationModelCopyWithImpl;
@useResult
$Res call({
 String? name, double? lat, double? lon, String? country, String? state
});




}
/// @nodoc
class _$GeoLocationModelCopyWithImpl<$Res>
    implements $GeoLocationModelCopyWith<$Res> {
  _$GeoLocationModelCopyWithImpl(this._self, this._then);

  final GeoLocationModel _self;
  final $Res Function(GeoLocationModel) _then;

/// Create a copy of GeoLocationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? lat = freezed,Object? lon = freezed,Object? country = freezed,Object? state = freezed,}) {
  return _then(GeoLocationModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GeoLocationModel].
extension GeoLocationModelPatterns on GeoLocationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeoLocationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeoLocationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeoLocationModel value)  $default,){
final _that = this;
switch (_that) {
case _GeoLocationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeoLocationModel value)?  $default,){
final _that = this;
switch (_that) {
case _GeoLocationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  double? lat,  double? lon,  String? country,  String? state)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeoLocationModel() when $default != null:
return $default(_that.name,_that.lat,_that.lon,_that.country,_that.state);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  double? lat,  double? lon,  String? country,  String? state)  $default,) {final _that = this;
switch (_that) {
case _GeoLocationModel():
return $default(_that.name,_that.lat,_that.lon,_that.country,_that.state);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  double? lat,  double? lon,  String? country,  String? state)?  $default,) {final _that = this;
switch (_that) {
case _GeoLocationModel() when $default != null:
return $default(_that.name,_that.lat,_that.lon,_that.country,_that.state);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeoLocationModel implements GeoLocationModel {
  const _GeoLocationModel({this.name, this.lat, this.lon, this.country, this.state});
  factory _GeoLocationModel.fromJson(Map<String, dynamic> json) => _$GeoLocationModelFromJson(json);

@override final  String? name;
@override final  double? lat;
@override final  double? lon;
@override final  String? country;
@override final  String? state;

/// Create a copy of GeoLocationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeoLocationModelCopyWith<_GeoLocationModel> get copyWith => __$GeoLocationModelCopyWithImpl<_GeoLocationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeoLocationModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeoLocationModel&&(identical(other.name, name) || other.name == name)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.country, country) || other.country == country)&&(identical(other.state, state) || other.state == state));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,lat,lon,country,state);
}

@override
String toString() {
    return 'GeoLocationModel(name: $name, lat: $lat, lon: $lon, country: $country, state: $state)';
}


}

/// @nodoc
abstract mixin class _$GeoLocationModelCopyWith<$Res> implements $GeoLocationModelCopyWith<$Res> {
  factory _$GeoLocationModelCopyWith(_GeoLocationModel value, $Res Function(_GeoLocationModel) _then) = __$GeoLocationModelCopyWithImpl;
@override @useResult
$Res call({
 String? name, double? lat, double? lon, String? country, String? state
});




}
/// @nodoc
class __$GeoLocationModelCopyWithImpl<$Res>
    implements _$GeoLocationModelCopyWith<$Res> {
  __$GeoLocationModelCopyWithImpl(this._self, this._then);

  final _GeoLocationModel _self;
  final $Res Function(_GeoLocationModel) _then;

/// Create a copy of GeoLocationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? lat = freezed,Object? lon = freezed,Object? country = freezed,Object? state = freezed,}) {
  return _then(_GeoLocationModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
