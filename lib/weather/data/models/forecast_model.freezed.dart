// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForecastModel {

 List<ForecastEntry>? get list;
/// Create a copy of ForecastModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForecastModelCopyWith<ForecastModel> get copyWith => _$ForecastModelCopyWithImpl<ForecastModel>(this as ForecastModel, _$identity);

  /// Serializes this ForecastModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ForecastModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForecastModel&&const DeepCollectionEquality().equals(other.list, _this.list));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ForecastModel;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.list));
}

@override
String toString() {
  final _this = this as ForecastModel;
  return 'ForecastModel(list: ${_this.list})';
}


}

/// @nodoc
abstract mixin class $ForecastModelCopyWith<$Res>  {
  factory $ForecastModelCopyWith(ForecastModel value, $Res Function(ForecastModel) _then) = _$ForecastModelCopyWithImpl;
@useResult
$Res call({
 List<ForecastEntry>? list
});




}
/// @nodoc
class _$ForecastModelCopyWithImpl<$Res>
    implements $ForecastModelCopyWith<$Res> {
  _$ForecastModelCopyWithImpl(this._self, this._then);

  final ForecastModel _self;
  final $Res Function(ForecastModel) _then;

/// Create a copy of ForecastModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = freezed,}) {
  return _then(ForecastModel(
list: freezed == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<ForecastEntry>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ForecastModel].
extension ForecastModelPatterns on ForecastModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForecastModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForecastModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForecastModel value)  $default,){
final _that = this;
switch (_that) {
case _ForecastModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForecastModel value)?  $default,){
final _that = this;
switch (_that) {
case _ForecastModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ForecastEntry>? list)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForecastModel() when $default != null:
return $default(_that.list);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ForecastEntry>? list)  $default,) {final _that = this;
switch (_that) {
case _ForecastModel():
return $default(_that.list);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ForecastEntry>? list)?  $default,) {final _that = this;
switch (_that) {
case _ForecastModel() when $default != null:
return $default(_that.list);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForecastModel implements ForecastModel {
  const _ForecastModel({ List<ForecastEntry>? list}): _list = list;
  factory _ForecastModel.fromJson(Map<String, dynamic> json) => _$ForecastModelFromJson(json);

 final  List<ForecastEntry>? _list;
@override List<ForecastEntry>? get list {
  final value = _list;
  if (value == null) return null;
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ForecastModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForecastModelCopyWith<_ForecastModel> get copyWith => __$ForecastModelCopyWithImpl<_ForecastModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForecastModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForecastModel&&const DeepCollectionEquality().equals(other.list, _list));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_list));
}

@override
String toString() {
    return 'ForecastModel(list: $list)';
}


}

/// @nodoc
abstract mixin class _$ForecastModelCopyWith<$Res> implements $ForecastModelCopyWith<$Res> {
  factory _$ForecastModelCopyWith(_ForecastModel value, $Res Function(_ForecastModel) _then) = __$ForecastModelCopyWithImpl;
@override @useResult
$Res call({
 List<ForecastEntry>? list
});




}
/// @nodoc
class __$ForecastModelCopyWithImpl<$Res>
    implements _$ForecastModelCopyWith<$Res> {
  __$ForecastModelCopyWithImpl(this._self, this._then);

  final _ForecastModel _self;
  final $Res Function(_ForecastModel) _then;

/// Create a copy of ForecastModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = freezed,}) {
  return _then(_ForecastModel(
list: freezed == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<ForecastEntry>?,
  ));
}


}


/// @nodoc
mixin _$ForecastEntry {

 int? get dt; Main? get main; List<Weather>? get weather;/// Probability of precipitation, 0 to 1.
 double? get pop;
/// Create a copy of ForecastEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForecastEntryCopyWith<ForecastEntry> get copyWith => _$ForecastEntryCopyWithImpl<ForecastEntry>(this as ForecastEntry, _$identity);

  /// Serializes this ForecastEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ForecastEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForecastEntry&&(identical(other.dt, _this.dt) || other.dt == _this.dt)&&(identical(other.main, _this.main) || other.main == _this.main)&&const DeepCollectionEquality().equals(other.weather, _this.weather)&&(identical(other.pop, _this.pop) || other.pop == _this.pop));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ForecastEntry;
  return Object.hash(runtimeType,_this.dt,_this.main,const DeepCollectionEquality().hash(_this.weather),_this.pop);
}

@override
String toString() {
  final _this = this as ForecastEntry;
  return 'ForecastEntry(dt: ${_this.dt}, main: ${_this.main}, weather: ${_this.weather}, pop: ${_this.pop})';
}


}

/// @nodoc
abstract mixin class $ForecastEntryCopyWith<$Res>  {
  factory $ForecastEntryCopyWith(ForecastEntry value, $Res Function(ForecastEntry) _then) = _$ForecastEntryCopyWithImpl;
@useResult
$Res call({
 int? dt, Main? main, List<Weather>? weather, double? pop
});


$MainCopyWith<$Res>? get main;

}
/// @nodoc
class _$ForecastEntryCopyWithImpl<$Res>
    implements $ForecastEntryCopyWith<$Res> {
  _$ForecastEntryCopyWithImpl(this._self, this._then);

  final ForecastEntry _self;
  final $Res Function(ForecastEntry) _then;

/// Create a copy of ForecastEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dt = freezed,Object? main = freezed,Object? weather = freezed,Object? pop = freezed,}) {
  return _then(ForecastEntry(
dt: freezed == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as int?,main: freezed == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as Main?,weather: freezed == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as List<Weather>?,pop: freezed == pop ? _self.pop : pop // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of ForecastEntry
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
}
}


/// Adds pattern-matching-related methods to [ForecastEntry].
extension ForecastEntryPatterns on ForecastEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForecastEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForecastEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForecastEntry value)  $default,){
final _that = this;
switch (_that) {
case _ForecastEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForecastEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ForecastEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? dt,  Main? main,  List<Weather>? weather,  double? pop)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForecastEntry() when $default != null:
return $default(_that.dt,_that.main,_that.weather,_that.pop);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? dt,  Main? main,  List<Weather>? weather,  double? pop)  $default,) {final _that = this;
switch (_that) {
case _ForecastEntry():
return $default(_that.dt,_that.main,_that.weather,_that.pop);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? dt,  Main? main,  List<Weather>? weather,  double? pop)?  $default,) {final _that = this;
switch (_that) {
case _ForecastEntry() when $default != null:
return $default(_that.dt,_that.main,_that.weather,_that.pop);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForecastEntry implements ForecastEntry {
  const _ForecastEntry({this.dt, this.main,  List<Weather>? weather, this.pop}): _weather = weather;
  factory _ForecastEntry.fromJson(Map<String, dynamic> json) => _$ForecastEntryFromJson(json);

@override final  int? dt;
@override final  Main? main;
 final  List<Weather>? _weather;
@override List<Weather>? get weather {
  final value = _weather;
  if (value == null) return null;
  if (_weather is EqualUnmodifiableListView) return _weather;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Probability of precipitation, 0 to 1.
@override final  double? pop;

/// Create a copy of ForecastEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForecastEntryCopyWith<_ForecastEntry> get copyWith => __$ForecastEntryCopyWithImpl<_ForecastEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForecastEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForecastEntry&&(identical(other.dt, dt) || other.dt == dt)&&(identical(other.main, main) || other.main == main)&&const DeepCollectionEquality().equals(other.weather, _weather)&&(identical(other.pop, pop) || other.pop == pop));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,dt,main,const DeepCollectionEquality().hash(_weather),pop);
}

@override
String toString() {
    return 'ForecastEntry(dt: $dt, main: $main, weather: $weather, pop: $pop)';
}


}

/// @nodoc
abstract mixin class _$ForecastEntryCopyWith<$Res> implements $ForecastEntryCopyWith<$Res> {
  factory _$ForecastEntryCopyWith(_ForecastEntry value, $Res Function(_ForecastEntry) _then) = __$ForecastEntryCopyWithImpl;
@override @useResult
$Res call({
 int? dt, Main? main, List<Weather>? weather, double? pop
});


@override $MainCopyWith<$Res>? get main;

}
/// @nodoc
class __$ForecastEntryCopyWithImpl<$Res>
    implements _$ForecastEntryCopyWith<$Res> {
  __$ForecastEntryCopyWithImpl(this._self, this._then);

  final _ForecastEntry _self;
  final $Res Function(_ForecastEntry) _then;

/// Create a copy of ForecastEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dt = freezed,Object? main = freezed,Object? weather = freezed,Object? pop = freezed,}) {
  return _then(_ForecastEntry(
dt: freezed == dt ? _self.dt : dt // ignore: cast_nullable_to_non_nullable
as int?,main: freezed == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as Main?,weather: freezed == weather ? _self._weather : weather // ignore: cast_nullable_to_non_nullable
as List<Weather>?,pop: freezed == pop ? _self.pop : pop // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of ForecastEntry
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
}
}

// dart format on
