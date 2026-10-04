import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/weather/domain/entities/place.dart';
import 'package:weather_app/weather/domain/weather_repo.dart';

part 'search_cubit.freezed.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._repo) : super(const SearchState.idle());

  static const debounce = Duration(milliseconds: 350);
  static const minQueryLength = 2;

  final WeatherRepo _repo;
  Timer? _timer;
  String _query = '';

  /// Searches once typing pauses, so each keystroke is not a request.
  void queryChanged(String text) {
    final query = text.trim();
    if (query == _query) return;
    _query = query;
    _timer?.cancel();

    if (query.length < minQueryLength) {
      emit(const SearchState.idle());
      return;
    }
    emit(const SearchState.loading());
    _timer = Timer(debounce, () => _search(query));
  }

  Future<void> retry() {
    emit(const SearchState.loading());
    return _search(_query);
  }

  Future<void> _search(String query) async {
    final result = await _repo.searchPlaces(query);
    // The user kept typing; a newer search owns the state now.
    if (isClosed || query != _query) return;
    emit(
      result.fold(
        SearchState.failure,
        (places) => places.isEmpty
            ? SearchState.empty(query)
            : SearchState.results(places),
      ),
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
