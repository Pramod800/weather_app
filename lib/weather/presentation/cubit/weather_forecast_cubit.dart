// import 'package:bloc/bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:weather_app/weather/data/repository/weather_repo_impl.dart';
// import 'package:weather_app/weather/data/weather_forecast/weather_forecast_model.dart';

// part 'weather_forecast_state.dart';
// part 'weather_forecast_cubit.freezed.dart';

// class WeatherForecastCubit extends Cubit<WeatherForecastState> {
//   WeatherForecastCubit(this._weatherRepo)
//       : super(const WeatherForecastState.initial());

//   late final WeatherRepoImpl _weatherRepo;

//   void getWeatherDetails({required String place}) async {
//     emit(const WeatherForecastState.loading());

//     final data = await _weatherRepo.getForecastDetails(place: place);

//     data.fold(
//       (error) => emit(WeatherForecastState.error(error.toString())),
//       (fetchedData) => emit(
//         WeatherForecastState.fetched(weatherForecastModel: fetchedData),
//       ),
//     );
//   }
// }
