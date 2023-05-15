
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/base/base_data_source.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';

@lazySingleton
class WeatherDataSource extends BaseRemoteSource {
  WeatherDataSource(this._dioClient);

  late final Dio _dioClient;

  Future<WeatherModel> getWeather({required String city}) async {
    return networkHandler(
        onResponse: (data) => WeatherModel.fromJson(data),
        request: (Dio dio) => _dioClient.get(
            'https://api.openweathermap.org/data/2.5/weather?APPID=d1620a273527c62af41fc964f16ccb46&units=metric&q=$city&lang=en'));
  }

  Future<WeatherModel> getCurrentWeather(double lat, double lon) async {

    print("LAT LONG ${lat} ${lon}");
    return networkHandler(
        onResponse: (data) => WeatherModel.fromJson(data),
        request: (Dio dio) => _dioClient.get(
            'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=d1620a273527c62af41fc964f16ccb46'));
  }

  // Future<WeatherModel> getCurrentWeather(Position position) async {
  //   return networkHandler(
  //       onResponse: (data) => WeatherModel.fromJson(data),
  //       request: (Dio dio) => _dioClient.get(
  //           'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=d1620a273527c62af41fc964f16ccb46'));
  // }
}
