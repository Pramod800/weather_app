// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'air_quality_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AirQualityModel {

 List<AirQualityEntry>? get list;
/// Create a copy of AirQualityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AirQualityModelCopyWith<AirQualityModel> get copyWith => _$AirQualityModelCopyWithImpl<AirQualityModel>(this as AirQualityModel, _$identity);

  /// Serializes this AirQualityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AirQualityModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AirQualityModel&&const DeepCollectionEquality().equals(other.list, _this.list));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AirQualityModel;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.list));
}

@override
String toString() {
  final _this = this as AirQualityModel;
  return 'AirQualityModel(list: ${_this.list})';
}


}

/// @nodoc
abstract mixin class $AirQualityModelCopyWith<$Res>  {
  factory $AirQualityModelCopyWith(AirQualityModel value, $Res Function(AirQualityModel) _then) = _$AirQualityModelCopyWithImpl;
@useResult
$Res call({
 List<AirQualityEntry>? list
});




}
/// @nodoc
class _$AirQualityModelCopyWithImpl<$Res>
    implements $AirQualityModelCopyWith<$Res> {
  _$AirQualityModelCopyWithImpl(this._self, this._then);

  final AirQualityModel _self;
  final $Res Function(AirQualityModel) _then;

/// Create a copy of AirQualityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? list = freezed,}) {
  return _then(AirQualityModel(
list: freezed == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<AirQualityEntry>?,
  ));
}

}


/// Adds pattern-matching-related methods to [AirQualityModel].
extension AirQualityModelPatterns on AirQualityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AirQualityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AirQualityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AirQualityModel value)  $default,){
final _that = this;
switch (_that) {
case _AirQualityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AirQualityModel value)?  $default,){
final _that = this;
switch (_that) {
case _AirQualityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AirQualityEntry>? list)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AirQualityModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AirQualityEntry>? list)  $default,) {final _that = this;
switch (_that) {
case _AirQualityModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AirQualityEntry>? list)?  $default,) {final _that = this;
switch (_that) {
case _AirQualityModel() when $default != null:
return $default(_that.list);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AirQualityModel implements AirQualityModel {
  const _AirQualityModel({ List<AirQualityEntry>? list}): _list = list;
  factory _AirQualityModel.fromJson(Map<String, dynamic> json) => _$AirQualityModelFromJson(json);

 final  List<AirQualityEntry>? _list;
@override List<AirQualityEntry>? get list {
  final value = _list;
  if (value == null) return null;
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AirQualityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AirQualityModelCopyWith<_AirQualityModel> get copyWith => __$AirQualityModelCopyWithImpl<_AirQualityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AirQualityModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AirQualityModel&&const DeepCollectionEquality().equals(other.list, _list));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_list));
}

@override
String toString() {
    return 'AirQualityModel(list: $list)';
}


}

/// @nodoc
abstract mixin class _$AirQualityModelCopyWith<$Res> implements $AirQualityModelCopyWith<$Res> {
  factory _$AirQualityModelCopyWith(_AirQualityModel value, $Res Function(_AirQualityModel) _then) = __$AirQualityModelCopyWithImpl;
@override @useResult
$Res call({
 List<AirQualityEntry>? list
});




}
/// @nodoc
class __$AirQualityModelCopyWithImpl<$Res>
    implements _$AirQualityModelCopyWith<$Res> {
  __$AirQualityModelCopyWithImpl(this._self, this._then);

  final _AirQualityModel _self;
  final $Res Function(_AirQualityModel) _then;

/// Create a copy of AirQualityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? list = freezed,}) {
  return _then(_AirQualityModel(
list: freezed == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<AirQualityEntry>?,
  ));
}


}


/// @nodoc
mixin _$AirQualityEntry {

 AirQualityIndex? get main;/// Pollutant concentrations in µg/m³, keyed like `pm2_5`, `pm10`, `o3`.
 Map<String, double>? get components;
/// Create a copy of AirQualityEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AirQualityEntryCopyWith<AirQualityEntry> get copyWith => _$AirQualityEntryCopyWithImpl<AirQualityEntry>(this as AirQualityEntry, _$identity);

  /// Serializes this AirQualityEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AirQualityEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AirQualityEntry&&(identical(other.main, _this.main) || other.main == _this.main)&&const DeepCollectionEquality().equals(other.components, _this.components));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AirQualityEntry;
  return Object.hash(runtimeType,_this.main,const DeepCollectionEquality().hash(_this.components));
}

@override
String toString() {
  final _this = this as AirQualityEntry;
  return 'AirQualityEntry(main: ${_this.main}, components: ${_this.components})';
}


}

/// @nodoc
abstract mixin class $AirQualityEntryCopyWith<$Res>  {
  factory $AirQualityEntryCopyWith(AirQualityEntry value, $Res Function(AirQualityEntry) _then) = _$AirQualityEntryCopyWithImpl;
@useResult
$Res call({
 AirQualityIndex? main, Map<String, double>? components
});


$AirQualityIndexCopyWith<$Res>? get main;

}
/// @nodoc
class _$AirQualityEntryCopyWithImpl<$Res>
    implements $AirQualityEntryCopyWith<$Res> {
  _$AirQualityEntryCopyWithImpl(this._self, this._then);

  final AirQualityEntry _self;
  final $Res Function(AirQualityEntry) _then;

/// Create a copy of AirQualityEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? main = freezed,Object? components = freezed,}) {
  return _then(AirQualityEntry(
main: freezed == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as AirQualityIndex?,components: freezed == components ? _self.components : components // ignore: cast_nullable_to_non_nullable
as Map<String, double>?,
  ));
}
/// Create a copy of AirQualityEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AirQualityIndexCopyWith<$Res>? get main {
    if (_self.main == null) {
    return null;
  }

  return $AirQualityIndexCopyWith<$Res>(_self.main!, (value) {
    return _then(_self.copyWith(main: value));
  });
}
}


/// Adds pattern-matching-related methods to [AirQualityEntry].
extension AirQualityEntryPatterns on AirQualityEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AirQualityEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AirQualityEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AirQualityEntry value)  $default,){
final _that = this;
switch (_that) {
case _AirQualityEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AirQualityEntry value)?  $default,){
final _that = this;
switch (_that) {
case _AirQualityEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AirQualityIndex? main,  Map<String, double>? components)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AirQualityEntry() when $default != null:
return $default(_that.main,_that.components);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AirQualityIndex? main,  Map<String, double>? components)  $default,) {final _that = this;
switch (_that) {
case _AirQualityEntry():
return $default(_that.main,_that.components);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AirQualityIndex? main,  Map<String, double>? components)?  $default,) {final _that = this;
switch (_that) {
case _AirQualityEntry() when $default != null:
return $default(_that.main,_that.components);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AirQualityEntry implements AirQualityEntry {
  const _AirQualityEntry({this.main,  Map<String, double>? components}): _components = components;
  factory _AirQualityEntry.fromJson(Map<String, dynamic> json) => _$AirQualityEntryFromJson(json);

@override final  AirQualityIndex? main;
/// Pollutant concentrations in µg/m³, keyed like `pm2_5`, `pm10`, `o3`.
 final  Map<String, double>? _components;
/// Pollutant concentrations in µg/m³, keyed like `pm2_5`, `pm10`, `o3`.
@override Map<String, double>? get components {
  final value = _components;
  if (value == null) return null;
  if (_components is EqualUnmodifiableMapView) return _components;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of AirQualityEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AirQualityEntryCopyWith<_AirQualityEntry> get copyWith => __$AirQualityEntryCopyWithImpl<_AirQualityEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AirQualityEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AirQualityEntry&&(identical(other.main, main) || other.main == main)&&const DeepCollectionEquality().equals(other.components, _components));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,main,const DeepCollectionEquality().hash(_components));
}

@override
String toString() {
    return 'AirQualityEntry(main: $main, components: $components)';
}


}

/// @nodoc
abstract mixin class _$AirQualityEntryCopyWith<$Res> implements $AirQualityEntryCopyWith<$Res> {
  factory _$AirQualityEntryCopyWith(_AirQualityEntry value, $Res Function(_AirQualityEntry) _then) = __$AirQualityEntryCopyWithImpl;
@override @useResult
$Res call({
 AirQualityIndex? main, Map<String, double>? components
});


@override $AirQualityIndexCopyWith<$Res>? get main;

}
/// @nodoc
class __$AirQualityEntryCopyWithImpl<$Res>
    implements _$AirQualityEntryCopyWith<$Res> {
  __$AirQualityEntryCopyWithImpl(this._self, this._then);

  final _AirQualityEntry _self;
  final $Res Function(_AirQualityEntry) _then;

/// Create a copy of AirQualityEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? main = freezed,Object? components = freezed,}) {
  return _then(_AirQualityEntry(
main: freezed == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as AirQualityIndex?,components: freezed == components ? _self._components : components // ignore: cast_nullable_to_non_nullable
as Map<String, double>?,
  ));
}

/// Create a copy of AirQualityEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AirQualityIndexCopyWith<$Res>? get main {
    if (_self.main == null) {
    return null;
  }

  return $AirQualityIndexCopyWith<$Res>(_self.main!, (value) {
    return _then(_self.copyWith(main: value));
  });
}
}


/// @nodoc
mixin _$AirQualityIndex {

 int? get aqi;
/// Create a copy of AirQualityIndex
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AirQualityIndexCopyWith<AirQualityIndex> get copyWith => _$AirQualityIndexCopyWithImpl<AirQualityIndex>(this as AirQualityIndex, _$identity);

  /// Serializes this AirQualityIndex to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AirQualityIndex;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AirQualityIndex&&(identical(other.aqi, _this.aqi) || other.aqi == _this.aqi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AirQualityIndex;
  return Object.hash(runtimeType,_this.aqi);
}

@override
String toString() {
  final _this = this as AirQualityIndex;
  return 'AirQualityIndex(aqi: ${_this.aqi})';
}


}

/// @nodoc
abstract mixin class $AirQualityIndexCopyWith<$Res>  {
  factory $AirQualityIndexCopyWith(AirQualityIndex value, $Res Function(AirQualityIndex) _then) = _$AirQualityIndexCopyWithImpl;
@useResult
$Res call({
 int? aqi
});




}
/// @nodoc
class _$AirQualityIndexCopyWithImpl<$Res>
    implements $AirQualityIndexCopyWith<$Res> {
  _$AirQualityIndexCopyWithImpl(this._self, this._then);

  final AirQualityIndex _self;
  final $Res Function(AirQualityIndex) _then;

/// Create a copy of AirQualityIndex
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? aqi = freezed,}) {
  return _then(AirQualityIndex(
aqi: freezed == aqi ? _self.aqi : aqi // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AirQualityIndex].
extension AirQualityIndexPatterns on AirQualityIndex {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AirQualityIndex value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AirQualityIndex() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AirQualityIndex value)  $default,){
final _that = this;
switch (_that) {
case _AirQualityIndex():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AirQualityIndex value)?  $default,){
final _that = this;
switch (_that) {
case _AirQualityIndex() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? aqi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AirQualityIndex() when $default != null:
return $default(_that.aqi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? aqi)  $default,) {final _that = this;
switch (_that) {
case _AirQualityIndex():
return $default(_that.aqi);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? aqi)?  $default,) {final _that = this;
switch (_that) {
case _AirQualityIndex() when $default != null:
return $default(_that.aqi);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AirQualityIndex implements AirQualityIndex {
  const _AirQualityIndex({this.aqi});
  factory _AirQualityIndex.fromJson(Map<String, dynamic> json) => _$AirQualityIndexFromJson(json);

@override final  int? aqi;

/// Create a copy of AirQualityIndex
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AirQualityIndexCopyWith<_AirQualityIndex> get copyWith => __$AirQualityIndexCopyWithImpl<_AirQualityIndex>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AirQualityIndexToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AirQualityIndex&&(identical(other.aqi, aqi) || other.aqi == aqi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,aqi);
}

@override
String toString() {
    return 'AirQualityIndex(aqi: $aqi)';
}


}

/// @nodoc
abstract mixin class _$AirQualityIndexCopyWith<$Res> implements $AirQualityIndexCopyWith<$Res> {
  factory _$AirQualityIndexCopyWith(_AirQualityIndex value, $Res Function(_AirQualityIndex) _then) = __$AirQualityIndexCopyWithImpl;
@override @useResult
$Res call({
 int? aqi
});




}
/// @nodoc
class __$AirQualityIndexCopyWithImpl<$Res>
    implements _$AirQualityIndexCopyWith<$Res> {
  __$AirQualityIndexCopyWithImpl(this._self, this._then);

  final _AirQualityIndex _self;
  final $Res Function(_AirQualityIndex) _then;

/// Create a copy of AirQualityIndex
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? aqi = freezed,}) {
  return _then(_AirQualityIndex(
aqi: freezed == aqi ? _self.aqi : aqi // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
