// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherModel {

 Coord? get coord; List<Weather>? get weather; Main? get main; int? get visibility; Wind? get wind; Clouds? get clouds; int? get dt; Sys? get sys; int? get timezone; String? get name;
/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherModelCopyWith<WeatherModel> get copyWith => _$WeatherModelCopyWithImpl<WeatherModel>(this as WeatherModel, _$identity);

  /// Serializes this WeatherModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WeatherModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherModel&&(identical(other.coord, _this.coord) || other.coord == _this.coord)&&const DeepCollectionEquality().equals(other.weather, _this.weather)&&(identical(other.main, _this.main) || other.main == _this.main)&&(identical(other.visibility, _this.visibility) || other.visibility == _this.visibility)&&(identical(other.wind, _this.wind) || other.wind == _this.wind)&&(identical(other.clouds, _this.clouds) || other.clouds == _this.clouds)&&(identical(other.dt, _this.dt) || other.dt == _this.dt)&&(identical(other.sys, _this.sys) || other.sys == _this.sys)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WeatherModel;
  return Object.hash(runtimeType,_this.coord,const DeepCollectionEquality().hash(_this.weather),_this.main,_this.visibility,_this.wind,_this.clouds,_this.dt,_this.sys,_this.timezone,_this.name);
}

@override
String toString() {
  final _this = this as WeatherModel;
  return 'WeatherModel(coord: ${_this.coord}, weather: ${_this.weather}, main: ${_this.main}, visibility: ${_this.visibility}, wind: ${_this.wind}, clouds: ${_this.clouds}, dt: ${_this.dt}, sys: ${_this.sys}, timezone: ${_this.timezone}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $WeatherModelCopyWith<$Res>  {
  factory $WeatherModelCopyWith(WeatherModel value, $Res Function(WeatherModel) _then) = _$WeatherModelCopyWithImpl;
@useResult
$Res call({
 Coord? coord, List<Weather>? weather, Main? main, int? visibility, Wind? wind, Clouds? clouds, int? dt, Sys? sys, int? timezone, String? name
});


$CoordCopyWith<$Res>? get coord;$MainCopyWith<$Res>? get main;$WindCopyWith<$Res>? get wind;$CloudsCopyWith<$Res>? get clouds;$SysCopyWith<$Res>? get sys;

}
/// @nodoc
class _$WeatherModelCopyWithImpl<$Res>
    implements $WeatherModelCopyWith<$Res> {
  _$WeatherModelCopyWithImpl(this._self, this._then);

  final WeatherModel _self;
  final $Res Function(WeatherModel) _then;

/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? coord = freezed,Object? weather = freezed,Object? main = freezed,Object? visibility = freezed,Object? wind = freezed,Object? clouds = freezed,Object? dt = freezed,Object? sys = freezed,Object? timezone = freezed,Object? name = freezed,}) {
  return _then(WeatherModel(
coord: freezed == coord ? _self.coord : coord // ignore: cast_nullable_to_non_nullable
as Coord?,weather: freezed == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as List<Weather>?,main: freezed == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as Main?,visibility: freezed == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as int?,wind: freezed == wind ? _self.wind : wind // ignore: cast_nullable_to_non_nullable
as Wind?,clouds: freezed == clouds ? _self.clouds : clouds // ignore: cast_nullable_to_non_nullable
as Clouds?,dt: freezed == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as int?,sys: freezed == sys ? _self.sys : sys // ignore: cast_nullable_to_non_nullable
as Sys?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoordCopyWith<$Res>? get coord {
    if (_self.coord == null) {
    return null;
  }

  return $CoordCopyWith<$Res>(_self.coord!, (value) {
    return _then(_self.copyWith(coord: value));
  });
}/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MainCopyWith<$Res>? get main {
    if (_self.main == null) {
    return null;
  }

  return $MainCopyWith<$Res>(_self.main!, (value) {
    return _then(_self.copyWith(main: value));
  });
}/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WindCopyWith<$Res>? get wind {
    if (_self.wind == null) {
    return null;
  }

  return $WindCopyWith<$Res>(_self.wind!, (value) {
    return _then(_self.copyWith(wind: value));
  });
}/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloudsCopyWith<$Res>? get clouds {
    if (_self.clouds == null) {
    return null;
  }

  return $CloudsCopyWith<$Res>(_self.clouds!, (value) {
    return _then(_self.copyWith(clouds: value));
  });
}/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SysCopyWith<$Res>? get sys {
    if (_self.sys == null) {
    return null;
  }

  return $SysCopyWith<$Res>(_self.sys!, (value) {
    return _then(_self.copyWith(sys: value));
  });
}
}


/// Adds pattern-matching-related methods to [WeatherModel].
extension WeatherModelPatterns on WeatherModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherModel value)  $default,){
final _that = this;
switch (_that) {
case _WeatherModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherModel value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Coord? coord,  List<Weather>? weather,  Main? main,  int? visibility,  Wind? wind,  Clouds? clouds,  int? dt,  Sys? sys,  int? timezone,  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that.coord,_that.weather,_that.main,_that.visibility,_that.wind,_that.clouds,_that.dt,_that.sys,_that.timezone,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Coord? coord,  List<Weather>? weather,  Main? main,  int? visibility,  Wind? wind,  Clouds? clouds,  int? dt,  Sys? sys,  int? timezone,  String? name)  $default,) {final _that = this;
switch (_that) {
case _WeatherModel():
return $default(_that.coord,_that.weather,_that.main,_that.visibility,_that.wind,_that.clouds,_that.dt,_that.sys,_that.timezone,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Coord? coord,  List<Weather>? weather,  Main? main,  int? visibility,  Wind? wind,  Clouds? clouds,  int? dt,  Sys? sys,  int? timezone,  String? name)?  $default,) {final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that.coord,_that.weather,_that.main,_that.visibility,_that.wind,_that.clouds,_that.dt,_that.sys,_that.timezone,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeatherModel implements WeatherModel {
  const _WeatherModel({this.coord,  List<Weather>? weather, this.main, this.visibility, this.wind, this.clouds, this.dt, this.sys, this.timezone, this.name}): _weather = weather;
  factory _WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);

@override final  Coord? coord;
 final  List<Weather>? _weather;
@override List<Weather>? get weather {
  final value = _weather;
  if (value == null) return null;
  if (_weather is EqualUnmodifiableListView) return _weather;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  Main? main;
@override final  int? visibility;
@override final  Wind? wind;
@override final  Clouds? clouds;
@override final  int? dt;
@override final  Sys? sys;
@override final  int? timezone;
@override final  String? name;

/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherModelCopyWith<_WeatherModel> get copyWith => __$WeatherModelCopyWithImpl<_WeatherModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherModel&&(identical(other.coord, coord) || other.coord == coord)&&const DeepCollectionEquality().equals(other.weather, _weather)&&(identical(other.main, main) || other.main == main)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.wind, wind) || other.wind == wind)&&(identical(other.clouds, clouds) || other.clouds == clouds)&&(identical(other.dt, dt) || other.dt == dt)&&(identical(other.sys, sys) || other.sys == sys)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,coord,const DeepCollectionEquality().hash(_weather),main,visibility,wind,clouds,dt,sys,timezone,name);
}

@override
String toString() {
    return 'WeatherModel(coord: $coord, weather: $weather, main: $main, visibility: $visibility, wind: $wind, clouds: $clouds, dt: $dt, sys: $sys, timezone: $timezone, name: $name)';
}


}

/// @nodoc
abstract mixin class _$WeatherModelCopyWith<$Res> implements $WeatherModelCopyWith<$Res> {
  factory _$WeatherModelCopyWith(_WeatherModel value, $Res Function(_WeatherModel) _then) = __$WeatherModelCopyWithImpl;
@override @useResult
$Res call({
 Coord? coord, List<Weather>? weather, Main? main, int? visibility, Wind? wind, Clouds? clouds, int? dt, Sys? sys, int? timezone, String? name
});


@override $CoordCopyWith<$Res>? get coord;@override $MainCopyWith<$Res>? get main;@override $WindCopyWith<$Res>? get wind;@override $CloudsCopyWith<$Res>? get clouds;@override $SysCopyWith<$Res>? get sys;

}
/// @nodoc
class __$WeatherModelCopyWithImpl<$Res>
    implements _$WeatherModelCopyWith<$Res> {
  __$WeatherModelCopyWithImpl(this._self, this._then);

  final _WeatherModel _self;
  final $Res Function(_WeatherModel) _then;

/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? coord = freezed,Object? weather = freezed,Object? main = freezed,Object? visibility = freezed,Object? wind = freezed,Object? clouds = freezed,Object? dt = freezed,Object? sys = freezed,Object? timezone = freezed,Object? name = freezed,}) {
  return _then(_WeatherModel(
coord: freezed == coord ? _self.coord : coord // ignore: cast_nullable_to_non_nullable
as Coord?,weather: freezed == weather ? _self._weather : weather // ignore: cast_nullable_to_non_nullable
as List<Weather>?,main: freezed == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as Main?,visibility: freezed == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as int?,wind: freezed == wind ? _self.wind : wind // ignore: cast_nullable_to_non_nullable
as Wind?,clouds: freezed == clouds ? _self.clouds : clouds // ignore: cast_nullable_to_non_nullable
as Clouds?,dt: freezed == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as int?,sys: freezed == sys ? _self.sys : sys // ignore: cast_nullable_to_non_nullable
as Sys?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoordCopyWith<$Res>? get coord {
    if (_self.coord == null) {
    return null;
  }

  return $CoordCopyWith<$Res>(_self.coord!, (value) {
    return _then(_self.copyWith(coord: value));
  });
}/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MainCopyWith<$Res>? get main {
    if (_self.main == null) {
    return null;
  }

  return $MainCopyWith<$Res>(_self.main!, (value) {
    return _then(_self.copyWith(main: value));
  });
}/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WindCopyWith<$Res>? get wind {
    if (_self.wind == null) {
    return null;
  }

  return $WindCopyWith<$Res>(_self.wind!, (value) {
    return _then(_self.copyWith(wind: value));
  });
}/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloudsCopyWith<$Res>? get clouds {
    if (_self.clouds == null) {
    return null;
  }

  return $CloudsCopyWith<$Res>(_self.clouds!, (value) {
    return _then(_self.copyWith(clouds: value));
  });
}/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SysCopyWith<$Res>? get sys {
    if (_self.sys == null) {
    return null;
  }

  return $SysCopyWith<$Res>(_self.sys!, (value) {
    return _then(_self.copyWith(sys: value));
  });
}
}


/// @nodoc
mixin _$Clouds {

 int? get all;
/// Create a copy of Clouds
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudsCopyWith<Clouds> get copyWith => _$CloudsCopyWithImpl<Clouds>(this as Clouds, _$identity);

  /// Serializes this Clouds to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Clouds;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Clouds&&(identical(other.all, _this.all) || other.all == _this.all));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Clouds;
  return Object.hash(runtimeType,_this.all);
}

@override
String toString() {
  final _this = this as Clouds;
  return 'Clouds(all: ${_this.all})';
}


}

/// @nodoc
abstract mixin class $CloudsCopyWith<$Res>  {
  factory $CloudsCopyWith(Clouds value, $Res Function(Clouds) _then) = _$CloudsCopyWithImpl;
@useResult
$Res call({
 int? all
});




}
/// @nodoc
class _$CloudsCopyWithImpl<$Res>
    implements $CloudsCopyWith<$Res> {
  _$CloudsCopyWithImpl(this._self, this._then);

  final Clouds _self;
  final $Res Function(Clouds) _then;

/// Create a copy of Clouds
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? all = freezed,}) {
  return _then(Clouds(
all: freezed == all ? _self.all : all // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Clouds].
extension CloudsPatterns on Clouds {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Clouds value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Clouds() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Clouds value)  $default,){
final _that = this;
switch (_that) {
case _Clouds():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Clouds value)?  $default,){
final _that = this;
switch (_that) {
case _Clouds() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? all)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Clouds() when $default != null:
return $default(_that.all);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? all)  $default,) {final _that = this;
switch (_that) {
case _Clouds():
return $default(_that.all);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? all)?  $default,) {final _that = this;
switch (_that) {
case _Clouds() when $default != null:
return $default(_that.all);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Clouds implements Clouds {
  const _Clouds({this.all});
  factory _Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);

@override final  int? all;

/// Create a copy of Clouds
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudsCopyWith<_Clouds> get copyWith => __$CloudsCopyWithImpl<_Clouds>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloudsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Clouds&&(identical(other.all, all) || other.all == all));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,all);
}

@override
String toString() {
    return 'Clouds(all: $all)';
}


}

/// @nodoc
abstract mixin class _$CloudsCopyWith<$Res> implements $CloudsCopyWith<$Res> {
  factory _$CloudsCopyWith(_Clouds value, $Res Function(_Clouds) _then) = __$CloudsCopyWithImpl;
@override @useResult
$Res call({
 int? all
});




}
/// @nodoc
class __$CloudsCopyWithImpl<$Res>
    implements _$CloudsCopyWith<$Res> {
  __$CloudsCopyWithImpl(this._self, this._then);

  final _Clouds _self;
  final $Res Function(_Clouds) _then;

/// Create a copy of Clouds
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? all = freezed,}) {
  return _then(_Clouds(
all: freezed == all ? _self.all : all // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Coord {

 double? get lon; double? get lat;
/// Create a copy of Coord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoordCopyWith<Coord> get copyWith => _$CoordCopyWithImpl<Coord>(this as Coord, _$identity);

  /// Serializes this Coord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Coord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Coord&&(identical(other.lon, _this.lon) || other.lon == _this.lon)&&(identical(other.lat, _this.lat) || other.lat == _this.lat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Coord;
  return Object.hash(runtimeType,_this.lon,_this.lat);
}

@override
String toString() {
  final _this = this as Coord;
  return 'Coord(lon: ${_this.lon}, lat: ${_this.lat})';
}


}

/// @nodoc
abstract mixin class $CoordCopyWith<$Res>  {
  factory $CoordCopyWith(Coord value, $Res Function(Coord) _then) = _$CoordCopyWithImpl;
@useResult
$Res call({
 double? lon, double? lat
});




}
/// @nodoc
class _$CoordCopyWithImpl<$Res>
    implements $CoordCopyWith<$Res> {
  _$CoordCopyWithImpl(this._self, this._then);

  final Coord _self;
  final $Res Function(Coord) _then;

/// Create a copy of Coord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lon = freezed,Object? lat = freezed,}) {
  return _then(Coord(
lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [Coord].
extension CoordPatterns on Coord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Coord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Coord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Coord value)  $default,){
final _that = this;
switch (_that) {
case _Coord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Coord value)?  $default,){
final _that = this;
switch (_that) {
case _Coord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? lon,  double? lat)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Coord() when $default != null:
return $default(_that.lon,_that.lat);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? lon,  double? lat)  $default,) {final _that = this;
switch (_that) {
case _Coord():
return $default(_that.lon,_that.lat);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? lon,  double? lat)?  $default,) {final _that = this;
switch (_that) {
case _Coord() when $default != null:
return $default(_that.lon,_that.lat);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Coord implements Coord {
  const _Coord({this.lon, this.lat});
  factory _Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

@override final  double? lon;
@override final  double? lat;

/// Create a copy of Coord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoordCopyWith<_Coord> get copyWith => __$CoordCopyWithImpl<_Coord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoordToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Coord&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.lat, lat) || other.lat == lat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,lon,lat);
}

@override
String toString() {
    return 'Coord(lon: $lon, lat: $lat)';
}


}

/// @nodoc
abstract mixin class _$CoordCopyWith<$Res> implements $CoordCopyWith<$Res> {
  factory _$CoordCopyWith(_Coord value, $Res Function(_Coord) _then) = __$CoordCopyWithImpl;
@override @useResult
$Res call({
 double? lon, double? lat
});




}
/// @nodoc
class __$CoordCopyWithImpl<$Res>
    implements _$CoordCopyWith<$Res> {
  __$CoordCopyWithImpl(this._self, this._then);

  final _Coord _self;
  final $Res Function(_Coord) _then;

/// Create a copy of Coord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lon = freezed,Object? lat = freezed,}) {
  return _then(_Coord(
lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$Main {

 double? get temp; double? get feelsLike; double? get tempMin; double? get tempMax; int? get pressure; int? get humidity;
/// Create a copy of Main
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainCopyWith<Main> get copyWith => _$MainCopyWithImpl<Main>(this as Main, _$identity);

  /// Serializes this Main to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Main;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Main&&(identical(other.temp, _this.temp) || other.temp == _this.temp)&&(identical(other.feelsLike, _this.feelsLike) || other.feelsLike == _this.feelsLike)&&(identical(other.tempMin, _this.tempMin) || other.tempMin == _this.tempMin)&&(identical(other.tempMax, _this.tempMax) || other.tempMax == _this.tempMax)&&(identical(other.pressure, _this.pressure) || other.pressure == _this.pressure)&&(identical(other.humidity, _this.humidity) || other.humidity == _this.humidity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Main;
  return Object.hash(runtimeType,_this.temp,_this.feelsLike,_this.tempMin,_this.tempMax,_this.pressure,_this.humidity);
}

@override
String toString() {
  final _this = this as Main;
  return 'Main(temp: ${_this.temp}, feelsLike: ${_this.feelsLike}, tempMin: ${_this.tempMin}, tempMax: ${_this.tempMax}, pressure: ${_this.pressure}, humidity: ${_this.humidity})';
}


}

/// @nodoc
abstract mixin class $MainCopyWith<$Res>  {
  factory $MainCopyWith(Main value, $Res Function(Main) _then) = _$MainCopyWithImpl;
@useResult
$Res call({
 double? temp, double? feelsLike, double? tempMin, double? tempMax, int? pressure, int? humidity
});




}
/// @nodoc
class _$MainCopyWithImpl<$Res>
    implements $MainCopyWith<$Res> {
  _$MainCopyWithImpl(this._self, this._then);

  final Main _self;
  final $Res Function(Main) _then;

/// Create a copy of Main
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? temp = freezed,Object? feelsLike = freezed,Object? tempMin = freezed,Object? tempMax = freezed,Object? pressure = freezed,Object? humidity = freezed,}) {
  return _then(Main(
temp: freezed == temp ? _self.temp : temp // ignore: cast_nullable_to_non_nullable
as double?,feelsLike: freezed == feelsLike ? _self.feelsLike : feelsLike // ignore: cast_nullable_to_non_nullable
as double?,tempMin: freezed == tempMin ? _self.tempMin : tempMin // ignore: cast_nullable_to_non_nullable
as double?,tempMax: freezed == tempMax ? _self.tempMax : tempMax // ignore: cast_nullable_to_non_nullable
as double?,pressure: freezed == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as int?,humidity: freezed == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Main].
extension MainPatterns on Main {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Main value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Main() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Main value)  $default,){
final _that = this;
switch (_that) {
case _Main():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Main value)?  $default,){
final _that = this;
switch (_that) {
case _Main() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? temp,  double? feelsLike,  double? tempMin,  double? tempMax,  int? pressure,  int? humidity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Main() when $default != null:
return $default(_that.temp,_that.feelsLike,_that.tempMin,_that.tempMax,_that.pressure,_that.humidity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? temp,  double? feelsLike,  double? tempMin,  double? tempMax,  int? pressure,  int? humidity)  $default,) {final _that = this;
switch (_that) {
case _Main():
return $default(_that.temp,_that.feelsLike,_that.tempMin,_that.tempMax,_that.pressure,_that.humidity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? temp,  double? feelsLike,  double? tempMin,  double? tempMax,  int? pressure,  int? humidity)?  $default,) {final _that = this;
switch (_that) {
case _Main() when $default != null:
return $default(_that.temp,_that.feelsLike,_that.tempMin,_that.tempMax,_that.pressure,_that.humidity);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _Main implements Main {
  const _Main({this.temp, this.feelsLike, this.tempMin, this.tempMax, this.pressure, this.humidity});
  factory _Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

@override final  double? temp;
@override final  double? feelsLike;
@override final  double? tempMin;
@override final  double? tempMax;
@override final  int? pressure;
@override final  int? humidity;

/// Create a copy of Main
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MainCopyWith<_Main> get copyWith => __$MainCopyWithImpl<_Main>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MainToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Main&&(identical(other.temp, temp) || other.temp == temp)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.tempMin, tempMin) || other.tempMin == tempMin)&&(identical(other.tempMax, tempMax) || other.tempMax == tempMax)&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.humidity, humidity) || other.humidity == humidity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,temp,feelsLike,tempMin,tempMax,pressure,humidity);
}

@override
String toString() {
    return 'Main(temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, pressure: $pressure, humidity: $humidity)';
}


}

/// @nodoc
abstract mixin class _$MainCopyWith<$Res> implements $MainCopyWith<$Res> {
  factory _$MainCopyWith(_Main value, $Res Function(_Main) _then) = __$MainCopyWithImpl;
@override @useResult
$Res call({
 double? temp, double? feelsLike, double? tempMin, double? tempMax, int? pressure, int? humidity
});




}
/// @nodoc
class __$MainCopyWithImpl<$Res>
    implements _$MainCopyWith<$Res> {
  __$MainCopyWithImpl(this._self, this._then);

  final _Main _self;
  final $Res Function(_Main) _then;

/// Create a copy of Main
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? temp = freezed,Object? feelsLike = freezed,Object? tempMin = freezed,Object? tempMax = freezed,Object? pressure = freezed,Object? humidity = freezed,}) {
  return _then(_Main(
temp: freezed == temp ? _self.temp : temp // ignore: cast_nullable_to_non_nullable
as double?,feelsLike: freezed == feelsLike ? _self.feelsLike : feelsLike // ignore: cast_nullable_to_non_nullable
as double?,tempMin: freezed == tempMin ? _self.tempMin : tempMin // ignore: cast_nullable_to_non_nullable
as double?,tempMax: freezed == tempMax ? _self.tempMax : tempMax // ignore: cast_nullable_to_non_nullable
as double?,pressure: freezed == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as int?,humidity: freezed == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Sys {

 String? get country; int? get sunrise; int? get sunset;
/// Create a copy of Sys
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SysCopyWith<Sys> get copyWith => _$SysCopyWithImpl<Sys>(this as Sys, _$identity);

  /// Serializes this Sys to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Sys;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sys&&(identical(other.country, _this.country) || other.country == _this.country)&&(identical(other.sunrise, _this.sunrise) || other.sunrise == _this.sunrise)&&(identical(other.sunset, _this.sunset) || other.sunset == _this.sunset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Sys;
  return Object.hash(runtimeType,_this.country,_this.sunrise,_this.sunset);
}

@override
String toString() {
  final _this = this as Sys;
  return 'Sys(country: ${_this.country}, sunrise: ${_this.sunrise}, sunset: ${_this.sunset})';
}


}

/// @nodoc
abstract mixin class $SysCopyWith<$Res>  {
  factory $SysCopyWith(Sys value, $Res Function(Sys) _then) = _$SysCopyWithImpl;
@useResult
$Res call({
 String? country, int? sunrise, int? sunset
});




}
/// @nodoc
class _$SysCopyWithImpl<$Res>
    implements $SysCopyWith<$Res> {
  _$SysCopyWithImpl(this._self, this._then);

  final Sys _self;
  final $Res Function(Sys) _then;

/// Create a copy of Sys
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? country = freezed,Object? sunrise = freezed,Object? sunset = freezed,}) {
  return _then(Sys(
country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,sunrise: freezed == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as int?,sunset: freezed == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sys].
extension SysPatterns on Sys {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sys value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sys() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sys value)  $default,){
final _that = this;
switch (_that) {
case _Sys():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sys value)?  $default,){
final _that = this;
switch (_that) {
case _Sys() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? country,  int? sunrise,  int? sunset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sys() when $default != null:
return $default(_that.country,_that.sunrise,_that.sunset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? country,  int? sunrise,  int? sunset)  $default,) {final _that = this;
switch (_that) {
case _Sys():
return $default(_that.country,_that.sunrise,_that.sunset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? country,  int? sunrise,  int? sunset)?  $default,) {final _that = this;
switch (_that) {
case _Sys() when $default != null:
return $default(_that.country,_that.sunrise,_that.sunset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Sys implements Sys {
  const _Sys({this.country, this.sunrise, this.sunset});
  factory _Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

@override final  String? country;
@override final  int? sunrise;
@override final  int? sunset;

/// Create a copy of Sys
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SysCopyWith<_Sys> get copyWith => __$SysCopyWithImpl<_Sys>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SysToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sys&&(identical(other.country, country) || other.country == country)&&(identical(other.sunrise, sunrise) || other.sunrise == sunrise)&&(identical(other.sunset, sunset) || other.sunset == sunset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,country,sunrise,sunset);
}

@override
String toString() {
    return 'Sys(country: $country, sunrise: $sunrise, sunset: $sunset)';
}


}

/// @nodoc
abstract mixin class _$SysCopyWith<$Res> implements $SysCopyWith<$Res> {
  factory _$SysCopyWith(_Sys value, $Res Function(_Sys) _then) = __$SysCopyWithImpl;
@override @useResult
$Res call({
 String? country, int? sunrise, int? sunset
});




}
/// @nodoc
class __$SysCopyWithImpl<$Res>
    implements _$SysCopyWith<$Res> {
  __$SysCopyWithImpl(this._self, this._then);

  final _Sys _self;
  final $Res Function(_Sys) _then;

/// Create a copy of Sys
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? country = freezed,Object? sunrise = freezed,Object? sunset = freezed,}) {
  return _then(_Sys(
country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,sunrise: freezed == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as int?,sunset: freezed == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Weather {

 int? get id; String? get main; String? get description; String? get icon;
/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherCopyWith<Weather> get copyWith => _$WeatherCopyWithImpl<Weather>(this as Weather, _$identity);

  /// Serializes this Weather to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Weather;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Weather&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.main, _this.main) || other.main == _this.main)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.icon, _this.icon) || other.icon == _this.icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Weather;
  return Object.hash(runtimeType,_this.id,_this.main,_this.description,_this.icon);
}

@override
String toString() {
  final _this = this as Weather;
  return 'Weather(id: ${_this.id}, main: ${_this.main}, description: ${_this.description}, icon: ${_this.icon})';
}


}

/// @nodoc
abstract mixin class $WeatherCopyWith<$Res>  {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) _then) = _$WeatherCopyWithImpl;
@useResult
$Res call({
 int? id, String? main, String? description, String? icon
});




}
/// @nodoc
class _$WeatherCopyWithImpl<$Res>
    implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._self, this._then);

  final Weather _self;
  final $Res Function(Weather) _then;

/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? main = freezed,Object? description = freezed,Object? icon = freezed,}) {
  return _then(Weather(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,main: freezed == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Weather].
extension WeatherPatterns on Weather {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Weather value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Weather() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Weather value)  $default,){
final _that = this;
switch (_that) {
case _Weather():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Weather value)?  $default,){
final _that = this;
switch (_that) {
case _Weather() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? main,  String? description,  String? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Weather() when $default != null:
return $default(_that.id,_that.main,_that.description,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? main,  String? description,  String? icon)  $default,) {final _that = this;
switch (_that) {
case _Weather():
return $default(_that.id,_that.main,_that.description,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? main,  String? description,  String? icon)?  $default,) {final _that = this;
switch (_that) {
case _Weather() when $default != null:
return $default(_that.id,_that.main,_that.description,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Weather implements Weather {
  const _Weather({this.id, this.main, this.description, this.icon});
  factory _Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

@override final  int? id;
@override final  String? main;
@override final  String? description;
@override final  String? icon;

/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherCopyWith<_Weather> get copyWith => __$WeatherCopyWithImpl<_Weather>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Weather&&(identical(other.id, id) || other.id == id)&&(identical(other.main, main) || other.main == main)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,main,description,icon);
}

@override
String toString() {
    return 'Weather(id: $id, main: $main, description: $description, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$WeatherCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$WeatherCopyWith(_Weather value, $Res Function(_Weather) _then) = __$WeatherCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? main, String? description, String? icon
});




}
/// @nodoc
class __$WeatherCopyWithImpl<$Res>
    implements _$WeatherCopyWith<$Res> {
  __$WeatherCopyWithImpl(this._self, this._then);

  final _Weather _self;
  final $Res Function(_Weather) _then;

/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? main = freezed,Object? description = freezed,Object? icon = freezed,}) {
  return _then(_Weather(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,main: freezed == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Wind {

 double? get speed; int? get deg; double? get gust;
/// Create a copy of Wind
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WindCopyWith<Wind> get copyWith => _$WindCopyWithImpl<Wind>(this as Wind, _$identity);

  /// Serializes this Wind to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Wind;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Wind&&(identical(other.speed, _this.speed) || other.speed == _this.speed)&&(identical(other.deg, _this.deg) || other.deg == _this.deg)&&(identical(other.gust, _this.gust) || other.gust == _this.gust));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Wind;
  return Object.hash(runtimeType,_this.speed,_this.deg,_this.gust);
}

@override
String toString() {
  final _this = this as Wind;
  return 'Wind(speed: ${_this.speed}, deg: ${_this.deg}, gust: ${_this.gust})';
}


}

/// @nodoc
abstract mixin class $WindCopyWith<$Res>  {
  factory $WindCopyWith(Wind value, $Res Function(Wind) _then) = _$WindCopyWithImpl;
@useResult
$Res call({
 double? speed, int? deg, double? gust
});




}
/// @nodoc
class _$WindCopyWithImpl<$Res>
    implements $WindCopyWith<$Res> {
  _$WindCopyWithImpl(this._self, this._then);

  final Wind _self;
  final $Res Function(Wind) _then;

/// Create a copy of Wind
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? speed = freezed,Object? deg = freezed,Object? gust = freezed,}) {
  return _then(Wind(
speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double?,deg: freezed == deg ? _self.deg : deg // ignore: cast_nullable_to_non_nullable
as int?,gust: freezed == gust ? _self.gust : gust // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [Wind].
extension WindPatterns on Wind {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Wind value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Wind() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Wind value)  $default,){
final _that = this;
switch (_that) {
case _Wind():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Wind value)?  $default,){
final _that = this;
switch (_that) {
case _Wind() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? speed,  int? deg,  double? gust)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Wind() when $default != null:
return $default(_that.speed,_that.deg,_that.gust);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? speed,  int? deg,  double? gust)  $default,) {final _that = this;
switch (_that) {
case _Wind():
return $default(_that.speed,_that.deg,_that.gust);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? speed,  int? deg,  double? gust)?  $default,) {final _that = this;
switch (_that) {
case _Wind() when $default != null:
return $default(_that.speed,_that.deg,_that.gust);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Wind implements Wind {
  const _Wind({this.speed, this.deg, this.gust});
  factory _Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

@override final  double? speed;
@override final  int? deg;
@override final  double? gust;

/// Create a copy of Wind
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WindCopyWith<_Wind> get copyWith => __$WindCopyWithImpl<_Wind>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WindToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Wind&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.deg, deg) || other.deg == deg)&&(identical(other.gust, gust) || other.gust == gust));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,speed,deg,gust);
}

@override
String toString() {
    return 'Wind(speed: $speed, deg: $deg, gust: $gust)';
}


}

/// @nodoc
abstract mixin class _$WindCopyWith<$Res> implements $WindCopyWith<$Res> {
  factory _$WindCopyWith(_Wind value, $Res Function(_Wind) _then) = __$WindCopyWithImpl;
@override @useResult
$Res call({
 double? speed, int? deg, double? gust
});




}
/// @nodoc
class __$WindCopyWithImpl<$Res>
    implements _$WindCopyWith<$Res> {
  __$WindCopyWithImpl(this._self, this._then);

  final _Wind _self;
  final $Res Function(_Wind) _then;

/// Create a copy of Wind
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? speed = freezed,Object? deg = freezed,Object? gust = freezed,}) {
  return _then(_Wind(
speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double?,deg: freezed == deg ? _self.deg : deg // ignore: cast_nullable_to_non_nullable
as int?,gust: freezed == gust ? _self.gust : gust // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
