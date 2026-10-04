import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/domain/entities/place.dart';
import 'package:weather_app/weather/domain/entities/weather_report.dart';
import 'package:weather_app/weather/domain/weather_repo.dart';
import 'package:weather_app/weather/domain/world_cities.dart';

class ExploreState {
  const ExploreState({this.places = const [], this.snapshots = const {}});

  final List<Place> places;

  /// Current weather by place; a place is missing until it has loaded, or
  /// when loading failed.
  final Map<Place, PlaceSnapshot> snapshots;
}

/// Picks a handful of cities from around the world and loads the weather
/// there right now.
class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit(
    this._repo, {
    Random? random,
    this.cities = worldCities,
    this.count = 12,
  }) : _random = random ?? Random(),
       super(const ExploreState());

  final WeatherRepo _repo;
  final Random _random;
  final List<Place> cities;
  final int count;

  /// Draws a new set of places, avoiding the ones on screen where the list
  /// is long enough to allow it.
  Future<void> shuffle() async {
    final unseen = cities.where((c) => !state.places.contains(c)).toList();
    final pool = unseen.length >= count ? unseen : [...cities];
    final places = (pool..shuffle(_random)).take(count).toList();
    emit(ExploreState(places: places));

    final result = await _repo.fetchSnapshots(places);
    // A newer shuffle may have replaced this set while it loaded.
    if (isClosed || !identical(state.places, places)) return;
    result.fold((_) {}, (snapshots) {
      emit(
        ExploreState(
          places: places,
          snapshots: {for (final s in snapshots) s.place: s},
        ),
      );
    });
  }
}
