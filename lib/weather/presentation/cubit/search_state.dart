part of 'search_cubit.dart';

@freezed
sealed class SearchState with _$SearchState {
  /// Nothing typed yet (or too little to search for).
  const factory SearchState.idle() = SearchIdle;
  const factory SearchState.loading() = SearchLoading;
  const factory SearchState.results(List<Place> places) = SearchResults;
  const factory SearchState.empty(String query) = SearchEmpty;
  const factory SearchState.failure(Failure failure) = SearchFailure;
}
