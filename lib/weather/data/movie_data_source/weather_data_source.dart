import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/base/base_data_source.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';

@lazySingleton
class WeatherApi extends BaseRemoteSource {
  WeatherApi(this._dioClient);

  late final Dio _dioClient;

  Future<WeatherModel> getWeather({required String city}) async {
    return networkHandler(
        onResponse: (data) => WeatherModel.fromJson(data),
        request: (Dio dio) => _dioClient.get(
            'https://api.openweathermap.org/data/2.5/weather?APPID=d1620a273527c62af41fc964f16ccb46&units=metric&q=$city&lang=en'));
  }

  // Future<dynamic> fetCurrentWeatherData(double lat, double lon) async{
  //   return networkHandler(request: (data)=>response.data, onResponse: (Dio dio)=>_dioClient.get(''))
  // }

  // Future<WeatherForecastModel> forecastWeather({required String place}) async {
  //   return networkHandler(
  //       onResponse: (data) => WeatherForecastModel.fromJson(data),
  //       request: (Dio dio) => _dioClient.get(
  //           'https://api.weatherapi.com/v1/forecast.json?key=66eb35a4c0134ef3a23153944222403&q=$place&days=1&aqi=yes&alerts=no'));
  // }
}
