import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/base/base_repo.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';
import 'package:weather_app/weather/data/movie_data_source/weather_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/weather/domain/weather_repo.dart';

@lazySingleton
class WeatherRepoImpl extends BaseRepository implements WeatherRepo {
  WeatherRepoImpl(this._weatherApi);

  late final WeatherApi _weatherApi;
  //late final LocationService _locationService;

  @override
  Future<Either<String?, WeatherModel>> getWeatherDetails(
      {required String city}) {
    return handleNetworkCall(
      call: _weatherApi.getWeather(city: city),
      onSuccess: (data) => data,
    );
  }

  // @override
  // Future<Either<String?, WeatherForecastModel>> getForecastDetails(
  //     {required String place}) {
  //   return handleNetworkCall(
  //     call: _weatherApi.forecastWeather(place: place),
  //     onSuccess: (data) => data,
  //   );
  // }

  @override
  Future<Position> getPosition() {
    throw '';
    // return _locationService.determinePosition();
  }
}
