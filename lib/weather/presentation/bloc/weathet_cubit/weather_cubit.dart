import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';
import 'package:weather_app/weather/data/repository/weather_repo_impl.dart';
part 'weather_state.dart';
part 'weather_cubit.freezed.dart';

@injectable
class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._weatherRepo) : super(const WeatherState.initial());

  late final WeatherRepoImpl _weatherRepo;

  void getWeatherDetails({required String city}) async {
    emit(const WeatherState.loading());

    final data = await _weatherRepo.getWeatherDetails(city: city);
    data.fold(
      (error) => emit(WeatherState.error(error.toString())),
      (fetchedData) => emit(
        WeatherState.fetched(weatherModel: fetchedData),
      ),
    );
  }
}
