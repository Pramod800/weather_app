import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

/// Response of OpenWeather `/data/2.5/weather`.
@freezed
abstract class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    Coord? coord,
    List<Weather>? weather,
    Main? main,
    int? visibility,
    Wind? wind,
    Clouds? clouds,
    int? dt,
    Sys? sys,
    int? timezone,
    String? name,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

@freezed
abstract class Clouds with _$Clouds {
  const factory Clouds({int? all}) = _Clouds;

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@freezed
abstract class Coord with _$Coord {
  const factory Coord({double? lon, double? lat}) = _Coord;

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}

@freezed
abstract class Main with _$Main {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Main({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
  }) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@freezed
abstract class Sys with _$Sys {
  const factory Sys({String? country, int? sunrise, int? sunset}) = _Sys;

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}

@freezed
abstract class Weather with _$Weather {
  const factory Weather({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@freezed
abstract class Wind with _$Wind {
  const factory Wind({double? speed, int? deg, double? gust}) = _Wind;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}
