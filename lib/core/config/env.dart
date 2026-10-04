/// Build-time configuration, supplied with
/// `--dart-define-from-file=env.json` (see `env.example.json`).
abstract final class Env {
  static const openWeatherApiKey = String.fromEnvironment(
    'OPENWEATHER_API_KEY',
  );

  static bool get hasApiKey => openWeatherApiKey.isNotEmpty;
}
