import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/weather/data/data_source/local_storage.dart';
import 'package:weather_app/weather/domain/entities/place.dart';
import 'package:weather_app/weather/domain/entities/weather_report.dart';
import 'package:weather_app/weather/domain/weather_repo.dart';

part 'weather_cubit.freezed.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({
    required WeatherRepo repo,
    required LocalStorage storage,
    bool remembersSelection = true,
    DateTime Function() now = DateTime.now,
  }) : _repo = repo,
       _storage = storage,
       _remembersSelection = remembersSelection,
       _now = now,
       super(const WeatherState());

  /// A report older than this is refreshed when the app comes back.
  static const staleAfter = Duration(minutes: 10);

  final WeatherRepo _repo;
  final LocalStorage _storage;

  /// False for the pages of saved places, which must not replace what the
  /// app reopens on.
  final bool _remembersSelection;
  final DateTime Function() _now;

  /// Bumped on every load so a slow, superseded response is dropped.
  int _request = 0;

  /// Restores what the app showed last time, or locates the device.
  Future<void> start() {
    final selection = _storage.readSelection();
    if (selection != null && !selection.followsLocation) {
      return selectPlace(selection.place);
    }
    return useCurrentLocation();
  }

  Future<void> useCurrentLocation() async {
    final request = ++_request;
    final selection = _storage.readSelection();
    final cached = selection != null && selection.followsLocation
        ? _repo.cachedReport(selection.place)
        : null;

    if (cached != null) {
      // Show where the device was last time while the new fix comes in.
      emit(
        WeatherState(
          status: WeatherStatus.success,
          place: cached.place,
          report: cached,
          isRefreshing: true,
        ),
      );
    } else if (state.report != null) {
      emit(state.copyWith(isRefreshing: true, failure: null));
    } else {
      emit(const WeatherState(status: WeatherStatus.loading));
    }

    final located = await _repo.locate();
    if (_isSuperseded(request)) return;
    await located.fold(
      (failure) async => _fail(failure),
      (place) => _load(place, request, followsLocation: true),
    );
  }

  /// Shows [place]. With [refetchFresh] off, a cached report that is still
  /// fresh is shown as is, without going to the network.
  Future<void> selectPlace(Place place, {bool refetchFresh = true}) async {
    final request = ++_request;
    final cached = _repo.cachedReport(place);
    if (!refetchFresh && cached != null && !_isStale(cached)) {
      emit(
        WeatherState(
          status: WeatherStatus.success,
          place: cached.place,
          report: cached,
          followsLocation: false,
        ),
      );
      return;
    }
    emit(
      WeatherState(
        status: cached == null ? WeatherStatus.loading : WeatherStatus.success,
        place: cached?.place ?? place,
        report: cached,
        isRefreshing: true,
        followsLocation: false,
      ),
    );
    if (_remembersSelection) {
      await _storage.writeSelection(place, followsLocation: false);
    }
    await _load(place, request, followsLocation: false);
  }

  Future<void> refresh() {
    final place = state.place;
    if (state.followsLocation || place == null) return useCurrentLocation();
    return selectPlace(place);
  }

  Future<void> refreshIfStale() async {
    final report = state.report;
    if (report == null || state.isRefreshing) return;
    if (_isStale(report)) await refresh();
  }

  bool _isStale(WeatherReport report) =>
      _now().difference(report.fetchedAt) > staleAfter;

  Future<void> _load(
    Place place,
    int request, {
    required bool followsLocation,
  }) async {
    final result = await _repo.fetchReport(place);
    if (_isSuperseded(request)) return;
    await result.fold((failure) async => _fail(failure), (report) async {
      emit(
        WeatherState(
          status: WeatherStatus.success,
          place: report.place,
          report: report,
          followsLocation: followsLocation,
        ),
      );
      if (_remembersSelection) {
        await _storage.writeSelection(
          report.place,
          followsLocation: followsLocation,
        );
      }
    });
  }

  /// Keeps whatever report is on screen and attaches the failure to it;
  /// only an empty screen turns into a full failure state.
  void _fail(Failure failure) {
    if (state.report != null) {
      emit(state.copyWith(isRefreshing: false, failure: failure));
    } else {
      emit(
        WeatherState(
          status: WeatherStatus.failure,
          place: state.place,
          failure: failure,
          followsLocation: state.followsLocation,
        ),
      );
    }
  }

  bool _isSuperseded(int request) => isClosed || request != _request;
}
