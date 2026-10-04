part of 'weather_cubit.dart';

enum WeatherStatus { initial, loading, success, failure }

@freezed
abstract class WeatherState with _$WeatherState {
  const factory WeatherState({
    @Default(WeatherStatus.initial) WeatherStatus status,

    /// The place being shown or loaded; null until the device is located.
    Place? place,
    WeatherReport? report,

    /// With a [report] present this is a failed refresh, shown as a notice;
    /// without one it is the whole screen.
    Failure? failure,
    @Default(false) bool isRefreshing,

    /// True when the app tracks the device instead of a chosen place.
    @Default(true) bool followsLocation,
  }) = _WeatherState;
}
