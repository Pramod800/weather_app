import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/network/api_client.dart';
import 'package:weather_app/weather/data/data_source/local_storage.dart';
import 'package:weather_app/weather/data/data_source/weather_remote_data_source.dart';
import 'package:weather_app/weather/data/repository/weather_repo_impl.dart';
import 'package:weather_app/weather/data/services/geolocator_location_service.dart';
import 'package:weather_app/weather/domain/location_service.dart';
import 'package:weather_app/weather/domain/weather_repo.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  final prefs = await SharedPreferences.getInstance();

  getIt
    ..registerSingleton(LocalStorage(prefs))
    ..registerLazySingleton<LocationService>(GeolocatorLocationService.new)
    ..registerLazySingleton(() => WeatherRemoteDataSource(createWeatherDio()))
    ..registerLazySingleton<WeatherRepo>(
      () =>
          WeatherRepoImpl(remote: getIt(), storage: getIt(), location: getIt()),
    );
}
