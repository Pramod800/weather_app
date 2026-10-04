# Nimbus

A weather app built with Flutter. It shows live conditions, a 24-hour and
5-day forecast, and air quality for your location or any city, and keeps
working from saved data when you are offline.

Runs on Android, iOS and the web.

## Features

- **Current weather** for the device's location or any searched place
- **Next 24 hours** as a temperature curve with rain chances
- **5-day forecast** with each day's range on a shared scale
- **Sun path** showing sunrise, sunset and where the sun is now
- **Air quality** index and fine-particle (PM2.5) level
- **Place search** with suggestions as you type, saved places and recents
- **Metric or imperial** units, switched instantly without refetching
- **Offline support**: the last report for each place is cached and shown
  first, then refreshed in the background
- **A sky that matches the weather**: the background follows the conditions
  and time of day at the place you are viewing
- Clear recovery when something fails: location denied, no connection,
  place not found

## Getting started

1. Get a free API key from [OpenWeather](https://openweathermap.org/api).
2. Copy `env.example.json` to `env.json` and put your key in it.
   `env.json` is git-ignored.
3. Run the app:

   ```sh
   flutter pub get
   flutter run --dart-define-from-file=env.json
   ```

   The VS Code launch configurations already pass the env file.

After changing a model, cubit state or route, regenerate code:

```sh
dart run build_runner build
```

## Architecture

The code is split by layer inside the `weather` feature:

```
lib/
  core/            config, DI, networking, failures, routing, units
  weather/
    data/          API models, remote + local data sources, repository
    domain/        entities, repository and location-service contracts
    presentation/  cubits, screens, widgets, theme
```

- **State**: `flutter_bloc` cubits. `WeatherCubit` owns the report on
  screen, `SearchCubit` debounces place search, `SavedPlacesCubit` and
  `SettingsCubit` persist user choices.
- **Data**: `dio` talks to OpenWeather; raw responses are cached with
  `shared_preferences` and mapped to UI-ready entities in one place
  (`weather_report_mapper.dart`).
- **Errors**: every failure is a typed `Failure` returned through
  `Either`, with copy the UI shows as is.
- **Models and state**: `freezed` + `json_serializable`.
- **Routing**: `auto_route`. **DI**: `get_it`.

## Tests

```sh
flutter test
```

Covers the response mapping, unit conversion, sun position, all cubits,
and layout checks that fail if any section overflows on a small phone or
with large text.

## Data

Weather, forecast, air quality and geocoding data come from
[OpenWeather](https://openweathermap.org/).
