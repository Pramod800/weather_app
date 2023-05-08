import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/core/base/base_bloc.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';
import 'package:weather_app/weather/data/weather_repo.dart';
part 'weather_state.dart';
part 'weather_cubit.freezed.dart';

class WeatherCubit extends Cubit<WeatherState> with BaseBlocMixin {
  WeatherCubit(this._weatherRepo) : super(WeatherState.initial());

  late final WeatherRepo _weatherRepo;

  void getWeatherDetails({required String city}) async {
    emit(const WeatherState.loading());

    handleBlocData(
        response: await _weatherRepo.getWeatherDetails(city: city),
        onData: (data) {
          if (data != null) {
            emit( WeatherState.fetched(weatherModel: data));
          }
        },
        onFailure: (error) {
          emit(WeatherState.error(error!));
        }
        ) ;
  }
}
