import 'package:dio/dio.dart';
import 'package:weather_app/core/base/base_data_source.dart';
import 'package:weather_app/weather/data/models/weather_model.dart';

class WeatherApi extends BaseRemoteSource {
  WeatherApi(this._dioClient);

  late final Dio _dioClient;

  Future<WeatherModel> getWeather({required String city}) async {
    return networkHandler(
        onResponse: (data) => WeatherModel.fromJson(data),
        request: (Dio dio) => _dioClient.get(
            'https://api.openweathermap.org/data/2.5/weather?APPID=d1620a273527c62af41fc964f16ccb46&units=metric&q=$city&lang=en'));
  }
}
