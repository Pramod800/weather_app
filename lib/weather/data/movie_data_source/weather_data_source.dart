import 'package:dio/dio.dart';
import 'package:weather_app/weather/data/models/weather_data_source.dart';

class WeatherApi {
  WeatherApi(this._dioClient);

  late final Dio _dioClient;

  Future<WeatherForecastModel> getWeather(
   
      {required double lat, required double lon}) async {
         try{
           final response = await _dioClient.get(
        "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=d1620a273527c62af41fc964f16ccb");

    if (response.statusCode == 200) {
      return WeatherForecastModel.fromJson(response.data);
    }

    } on DioError catch (dioError) {
      print("DioError catch: ${dioError.message}");
    } catch (e) {
      print("Other exception catch: ${e.toString()}");
    }

    throw Exception('Server Error');
   
  }
}
