part of 'current_weather_cubit.dart';

@freezed
class CurrentWeatherState with _$CurrentWeatherState {
  const factory CurrentWeatherState.initial() = _Initial;
  const factory CurrentWeatherState.loading() = _LoadingState;
  const factory CurrentWeatherState.fetched(
      {required WeatherModel weatherModel}) = _FetchedState;
  const factory CurrentWeatherState.error(String error) = _ErrorState;
}
