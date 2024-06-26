import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';
import 'package:weather_app/weather/data/repository/weather_repo_impl.dart';
part 'current_weather_state.dart';
part 'current_weather_cubit.freezed.dart';

// class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
//   CurrentWeatherCubit(this._weatherRepo)
//       : super(const CurrentWeatherState.initial());
//   late final WeatherRepoImpl _weatherRepo;

//   // void getWeatherFromLatLng() {
//   //   emit(const CurrentWeatherState.loading());

//   //   _weatherRepo.getCurrentLocation().then(
//   //     (userLocation) async {
//   //       return handleBlocData(
//   //           response: await _weatherRepo.getWeatherFromLatLng(
//   //               lat: userLocation.latitude, long: userLocation.longitude),
//   //           onData: (data) {
//   //             emit(CurrentWeatherState.fetched(weatherModel: data));
//   //           },
//   //           onFailure: (error) {
//   //             emit(CurrentWeatherState.error(error.toString()));
//   //           });
//   //     },
//   //   );
//   // }

//   void getWeatherFromLatLng() {
//     _weatherRepo.getCurrentLocation().then((userLocation) async {
//       final data = await _weatherRepo.getWeatherFromLatLng(
//           lat: userLocation.latitude, long: userLocation.longitude);
//       data.fold(
//         (error) => emit(CurrentWeatherState.error(error.toString())),
//         (fetchedData) => emit(
//           CurrentWeatherState.fetched(weatherModel: fetchedData),
//         ),
//       );
//     });
//   }

//   StreamSubscription<WeatherModel>? _locationSubscription;

//   void stopFetchingWeather() {
//     _locationSubscription?.cancel(); // Cancel the subscription when not needed
//   }

// void getWeatherDetails({required String city}) async {
//   final data = await _weatherRepo.getWeatherDetails(city: city);
//   data.fold(
//     (error) => emit(WeatherState.error(error.toString())),
//     (fetchedData) => emit(
//       WeatherState.fetched(weatherModel: fetchedData),
//     ),
//   );
// }
// }

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  final WeatherRepoImpl _weatherRepo;
  late Timer _locationTimer;

  CurrentWeatherCubit(this._weatherRepo) : super(const CurrentWeatherState.initial()) {
    _locationTimer = Timer(Duration.zero, () {});
  }

  void startFetchingLocation() {
    _locationTimer.cancel();

    fetchLocationAndUpdateWeather();
    _locationTimer = Timer.periodic(
      const Duration(minutes: 15),
      (_) {
        fetchLocationAndUpdateWeather();
      },
    );
  }

  void fetchLocationAndUpdateWeather() async {
    try {
      final userLocation = await _weatherRepo.getCurrentLocation();
      final data = await _weatherRepo.getWeatherFromLatLng(lat: userLocation.latitude, long: userLocation.longitude);
      data.fold(
        (error) => emit(CurrentWeatherState.error(error.toString())),
        (fetchedData) => emit(
          CurrentWeatherState.fetched(weatherModel: fetchedData),
        ),
      );
    } catch (error) {
      emit(CurrentWeatherState.error(error.toString()));
    }
  }

  void stopFetchingLocation() {
    _locationTimer.cancel();
  }
}
