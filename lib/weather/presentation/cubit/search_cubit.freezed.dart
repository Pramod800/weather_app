// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SearchState()';
}


}

/// @nodoc
class $SearchStateCopyWith<$Res>  {
$SearchStateCopyWith(SearchState _, $Res Function(SearchState) __);
}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchIdle value)?  idle,TResult Function( SearchLoading value)?  loading,TResult Function( SearchResults value)?  results,TResult Function( SearchEmpty value)?  empty,TResult Function( SearchFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchIdle() when idle != null:
return idle(_that);case SearchLoading() when loading != null:
return loading(_that);case SearchResults() when results != null:
return results(_that);case SearchEmpty() when empty != null:
return empty(_that);case SearchFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchIdle value)  idle,required TResult Function( SearchLoading value)  loading,required TResult Function( SearchResults value)  results,required TResult Function( SearchEmpty value)  empty,required TResult Function( SearchFailure value)  failure,}){
final _that = this;
switch (_that) {
case SearchIdle():
return idle(_that);case SearchLoading():
return loading(_that);case SearchResults():
return results(_that);case SearchEmpty():
return empty(_that);case SearchFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchIdle value)?  idle,TResult? Function( SearchLoading value)?  loading,TResult? Function( SearchResults value)?  results,TResult? Function( SearchEmpty value)?  empty,TResult? Function( SearchFailure value)?  failure,}){
final _that = this;
switch (_that) {
case SearchIdle() when idle != null:
return idle(_that);case SearchLoading() when loading != null:
return loading(_that);case SearchResults() when results != null:
return results(_that);case SearchEmpty() when empty != null:
return empty(_that);case SearchFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  loading,TResult Function( List<Place> places)?  results,TResult Function( String query)?  empty,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SearchIdle() when idle != null:
return idle();case SearchLoading() when loading != null:
return loading();case SearchResults() when results != null:
return results(_that.places);case SearchEmpty() when empty != null:
return empty(_that.query);case SearchFailure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  loading,required TResult Function( List<Place> places)  results,required TResult Function( String query)  empty,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case SearchIdle():
return idle();case SearchLoading():
return loading();case SearchResults():
return results(_that.places);case SearchEmpty():
return empty(_that.query);case SearchFailure():
return failure(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  loading,TResult? Function( List<Place> places)?  results,TResult? Function( String query)?  empty,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case SearchIdle() when idle != null:
return idle();case SearchLoading() when loading != null:
return loading();case SearchResults() when results != null:
return results(_that.places);case SearchEmpty() when empty != null:
return empty(_that.query);case SearchFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class SearchIdle implements SearchState {
  const SearchIdle();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SearchState.idle()';
}


}




/// @nodoc


class SearchLoading implements SearchState {
  const SearchLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SearchState.loading()';
}


}




/// @nodoc


class SearchResults implements SearchState {
  const SearchResults( List<Place> places): _places = places;
  

 final  List<Place> _places;
 List<Place> get places {
  if (_places is EqualUnmodifiableListView) return _places;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_places);
}


/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResultsCopyWith<SearchResults> get copyWith => _$SearchResultsCopyWithImpl<SearchResults>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResults&&const DeepCollectionEquality().equals(other.places, _places));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_places));
}

@override
String toString() {
    return 'SearchState.results(places: $places)';
}


}

/// @nodoc
abstract mixin class $SearchResultsCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $SearchResultsCopyWith(SearchResults value, $Res Function(SearchResults) _then) = _$SearchResultsCopyWithImpl;
@useResult
$Res call({
 List<Place> places
});




}
/// @nodoc
class _$SearchResultsCopyWithImpl<$Res>
    implements $SearchResultsCopyWith<$Res> {
  _$SearchResultsCopyWithImpl(this._self, this._then);

  final SearchResults _self;
  final $Res Function(SearchResults) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? places = null,}) {
  return _then(SearchResults(
null == places ? _self._places : places // ignore: cast_nullable_to_non_nullable
as List<Place>,
  ));
}


}

/// @nodoc


class SearchEmpty implements SearchState {
  const SearchEmpty(this.query);
  

 final  String query;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchEmptyCopyWith<SearchEmpty> get copyWith => _$SearchEmptyCopyWithImpl<SearchEmpty>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEmpty&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode {
    return Object.hash(runtimeType,query);
}

@override
String toString() {
    return 'SearchState.empty(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchEmptyCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $SearchEmptyCopyWith(SearchEmpty value, $Res Function(SearchEmpty) _then) = _$SearchEmptyCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchEmptyCopyWithImpl<$Res>
    implements $SearchEmptyCopyWith<$Res> {
  _$SearchEmptyCopyWithImpl(this._self, this._then);

  final SearchEmpty _self;
  final $Res Function(SearchEmpty) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchEmpty(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SearchFailure implements SearchState {
  const SearchFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchFailureCopyWith<SearchFailure> get copyWith => _$SearchFailureCopyWithImpl<SearchFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,failure);
}

@override
String toString() {
    return 'SearchState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $SearchFailureCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $SearchFailureCopyWith(SearchFailure value, $Res Function(SearchFailure) _then) = _$SearchFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$SearchFailureCopyWithImpl<$Res>
    implements $SearchFailureCopyWith<$Res> {
  _$SearchFailureCopyWithImpl(this._self, this._then);

  final SearchFailure _self;
  final $Res Function(SearchFailure) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(SearchFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
