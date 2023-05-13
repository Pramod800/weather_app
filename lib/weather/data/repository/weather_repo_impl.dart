import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/base/base_repo.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';
import 'package:weather_app/weather/data/movie_data_source/weather_data_source.dart';
import 'package:dartz/dartz.dart';

@lazySingleton
// implements WeatherRepo
class WeatherRepoImpl extends BaseRepository {
  WeatherRepoImpl(this._weatherApi);

  late final WeatherApi _weatherApi;

  Future<Either<String?, WeatherModel>> getWeatherDetails(
      {required String city}) {
    return handleNetworkCall(
      call: _weatherApi.getWeather(city: city),
      onSuccess: (data) => data,
    );
  }

  Future<Position> getPosition() {
    throw '';
    // return _locationService.determinePosition();
  }
}
