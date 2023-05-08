part of 'weather_cubit.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _InitialState;
  const factory WeatherState.loading() = _LoadingState;
  const factory WeatherState.fetched({required WeatherModel weatherModel}) =
      _FetchedState;
  const factory WeatherState.error( String error) = _ErrorState;
}
