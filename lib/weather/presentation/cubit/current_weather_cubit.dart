import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/base/base_bloc.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';
import 'package:weather_app/weather/data/repository/weather_repo_impl.dart';
part 'current_weather_state.dart';
part 'current_weather_cubit.freezed.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState>
    with BaseBlocMixin {
  CurrentWeatherCubit(this._weatherRepo)
      : super(const CurrentWeatherState.initial());
  late final WeatherRepoImpl _weatherRepo;

  void getWeatherFromLatLng() {
    emit(const CurrentWeatherState.loading());
    _weatherRepo.getCurrentLocation().then((userLocation) async {
      // print(userLocation);
      return handleBlocData(
          response: await _weatherRepo.getWeatherFromLatLng(
              lat: userLocation.latitude, long: userLocation.longitude),
          onData: (data) {
            emit(CurrentWeatherState.fetched(weatherModel: data));
          },
          onFailure: (error) {
          
            emit(CurrentWeatherState.error(error.toString()));
          });
    });
  }
}
