import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';
abstract class WeatherRepo{
 Future<Either<String?, WeatherModel>> getWeatherDetails({required String city});
  Future<Position> getPosition();

}