import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/base/base_repo.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';
import 'package:weather_app/weather/data/movie_data_source/weather_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/weather/domain/location_service.dart';

@lazySingleton
// implements WeatherRepo
class WeatherRepoImpl extends BaseRepository {
  WeatherRepoImpl(this._weatherDataSource);

  late final WeatherDataSource _weatherDataSource;

  Future<Either<String?, WeatherModel>> getWeatherDetails(
      {required String city}) {
    return handleNetworkCall(
      call: _weatherDataSource.getWeather(city: city),
      onSuccess: (data) => data,
    );
  }

   Future<Either<String?, WeatherModel>> getWeatherFromLatLng({required double lat, required double long}) {

     return handleNetworkCall(
      call: _weatherDataSource.getCurrentWeather(lat, long),
      onSuccess: (data) => data,
    );
    
  }

  Future<Position> getCurrentLocation()async{
    return UserLocationService.determinePosition();
  }
}
