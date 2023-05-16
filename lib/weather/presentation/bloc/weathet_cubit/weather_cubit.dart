import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/base/base_bloc.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';
import 'package:weather_app/weather/data/repository/weather_repo_impl.dart';
part 'weather_state.dart';
part 'weather_cubit.freezed.dart';

@injectable
class WeatherCubit extends Cubit<WeatherState> with BaseBlocMixin {
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

    // handleBlocData(
    //   response: await _weatherRepo.getWeatherDetails(city: city),
    //   onData: (data) {
    //     emit(WeatherState.fetched(weatherModel: data));
    //   },
    //   onFailure: (error) {
    //       print("ERROR==> $error");
    //     emit(WeatherState.error(error.toString()));
    //   });
  }
//  void getWeatherFromLatLng()async{

// final Position userLocation = await _weatherRepo.getCurrentLocation();
// emit(const WeatherState.loading());
//       handleBlocData(
//         response: await _weatherRepo.getWeatherFromLatLng(lat: userLocation.latitude,long: userLocation.longitude),
//         onData: (data) {
//          emit(WeatherState.fetched(weatherModel: data));
//         },
//         onFailure: (error) {
//           emit(WeatherState.error(error.toString()));
//         });
//  }
}
