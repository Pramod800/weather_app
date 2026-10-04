import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/domain/entities/place.dart';
import 'package:weather_app/weather/domain/entities/weather_report.dart';
import 'package:weather_app/weather/domain/weather_repo.dart';

/// The same calendar day in previous years, most recent first. Empty while
/// loading and when the archive could not be reached; the section that
/// shows it simply stays hidden then.
class HistoryCubit extends Cubit<List<DailyForecast>> {
  HistoryCubit(this._repo) : super(const []);

  final WeatherRepo _repo;
  String? _loadedKey;

  Future<void> load(Place place, DateTime date) async {
    final key = '${place.id}@${date.toIso8601String()}';
    if (key == _loadedKey) return;
    _loadedKey = key;
    emit(const []);

    final result = await _repo.fetchPastYears(place, date);
    if (isClosed || key != _loadedKey) return;
    result.fold(
      // Forget the key so the next refresh tries again.
      (_) => _loadedKey = null,
      emit,
    );
  }
}
