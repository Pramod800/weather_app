# Mausam

A weather app built with Flutter. It shows live conditions, an hour-by-hour
and 10-day forecast, and air quality for your location or any city, and
keeps working from saved data when you are offline. No API key needed.

Runs on Android, iOS and the web.

## Features

- **Current weather** for the device's location or any searched place
- **Next 24 hours**, hour by hour, as a temperature curve with rain chances
- **10-day forecast** with each day's range on a shared scale
- **How today compares with yesterday**, plus UV index and rain total
- **This day in past years**: the same date over the last five years, from
  the historical archive, with today set against the average
- **Swipe between places**: your saved places are full pages next to the
  main one, each under its own sky
- **Around the world**: the search screen shows the weather right now in a
  random set of cities, to open with a tap
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

```sh
flutter pub get
flutter run
```

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

- **State**: `flutter_bloc` cubits. Each page has its own `WeatherCubit`
  and `HistoryCubit`; `SearchCubit` debounces place search, `ExploreCubit`
  draws the world cities, and `SavedPlacesCubit` and `SettingsCubit`
  persist user choices.
- **Data**: `dio` talks to Open-Meteo; raw responses are cached with
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

Covers the response mapping, unit conversion, sun position, the cubits,
swiping through the pager, the search screen's world places, and layout checks that fail if any
section overflows on a small phone or with large text.

## Data

- Weather, air quality and place search by
  [Open-Meteo](https://open-meteo.com/) (CC BY 4.0, free for
  non-commercial use).
- The name of your current location comes from
  [OpenStreetMap Nominatim](https://nominatim.org/)
  (© OpenStreetMap contributors).
