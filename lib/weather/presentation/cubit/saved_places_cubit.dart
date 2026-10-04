import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/data/data_source/local_storage.dart';
import 'package:weather_app/weather/domain/entities/place.dart';

class SavedPlacesState {
  const SavedPlacesState({this.saved = const [], this.recent = const []});

  final List<Place> saved;

  /// Places picked from search, newest first. Saved places are left out.
  final List<Place> recent;

  bool isSaved(Place place) => saved.contains(place);
}

class SavedPlacesCubit extends Cubit<SavedPlacesState> {
  SavedPlacesCubit(this._storage)
    : super(
        SavedPlacesState(
          saved: _storage.readSavedPlaces(),
          recent: _storage.readRecentPlaces(),
        ),
      );

  final LocalStorage _storage;

  /// Saves [place], or removes it when it is already saved.
  Future<void> toggleSaved(Place place) async {
    final saved = state.isSaved(place)
        ? state.saved.where((p) => p != place).toList()
        : [...state.saved, place];
    final recent = state.recent.where((p) => p != place).toList();
    emit(SavedPlacesState(saved: saved, recent: recent));
    await _storage.writeSavedPlaces(saved);
    await _storage.writeRecentPlaces(recent);
  }

  Future<void> addRecent(Place place) async {
    if (state.isSaved(place)) return;
    final recent = [
      place,
      ...state.recent.where((p) => p != place),
    ].take(LocalStorage.maxRecentPlaces).toList();
    emit(SavedPlacesState(saved: state.saved, recent: recent));
    await _storage.writeRecentPlaces(recent);
  }

  Future<void> removeRecent(Place place) async {
    final recent = state.recent.where((p) => p != place).toList();
    emit(SavedPlacesState(saved: state.saved, recent: recent));
    await _storage.writeRecentPlaces(recent);
  }
}
