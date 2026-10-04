import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/core/di/bootstrap.dart';
import 'package:weather_app/weather/data/data_source/local_storage.dart';
import 'package:weather_app/weather/domain/entities/place.dart';
import 'package:weather_app/weather/domain/entities/weather_condition.dart';
import 'package:weather_app/weather/domain/entities/weather_report.dart';
import 'package:weather_app/weather/domain/location_service.dart';
import 'package:weather_app/weather/domain/weather_repo.dart';
import 'package:weather_app/weather/domain/world_cities.dart';
import 'package:weather_app/weather/presentation/cubit/saved_places_cubit.dart';
import 'package:weather_app/weather/presentation/cubit/settings_cubit.dart';
import 'package:weather_app/weather/presentation/cubit/weather_cubit.dart';
import 'package:weather_app/weather/presentation/screens/weather_home_screen.dart';
import 'package:weather_app/weather/presentation/screens/search_screen.dart';
import 'package:weather_app/weather/presentation/widgets/page_dots.dart';

class _MockWeatherRepo extends Mock implements WeatherRepo {}

class _MockLocationService extends Mock implements LocationService {}

const _kathmandu = Place(name: 'Kathmandu', latitude: 27.7, longitude: 85.32);
const _pokhara = Place(name: 'Pokhara', latitude: 28.21, longitude: 83.99);
const _lalitpur = Place(name: 'Lalitpur', latitude: 27.66, longitude: 85.31);

final _now = DateTime.utc(2026, 10, 4, 6);

WeatherReport _report(Place place) => WeatherReport(
  place: place,
  current: CurrentWeather(
    temperature: 24,
    feelsLike: 25,
    condition: WeatherCondition.clear,
    description: 'Clear sky',
    isDay: true,
    humidity: 60,
    pressure: 1016,
    visibility: 10000,
    windSpeed: 2,
    windDegrees: 200,
    cloudiness: 0,
    sunrise: DateTime.utc(2026, 10, 4),
    sunset: DateTime.utc(2026, 10, 4, 12),
    observedAt: _now,
  ),
  hourly: [
    for (var i = 0; i < 4; i++)
      HourlyForecast(
        time: _now.add(Duration(hours: i)),
        temperature: 24.0 - i,
        condition: WeatherCondition.clear,
        isDay: true,
        precipitationChance: 0,
      ),
  ],
  daily: [
    for (var i = 0; i < 3; i++)
      DailyForecast(
        date: DateTime.utc(2026, 10, 4 + i),
        low: 15,
        high: 25,
        condition: WeatherCondition.clear,
        precipitationChance: 0,
      ),
  ],
  utcOffset: Duration.zero,
  fetchedAt: DateTime.now(),
);

void main() {
  late _MockWeatherRepo repo;
  late LocalStorage storage;

  setUpAll(() => registerFallbackValue(_kathmandu));

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    storage = LocalStorage(await SharedPreferences.getInstance());
    // The app last showed Kathmandu, and two more places are saved.
    await storage.writeSelection(_kathmandu, followsLocation: false);
    await storage.writeSavedPlaces([_pokhara, _lalitpur]);

    repo = _MockWeatherRepo();
    when(() => repo.cachedReport(any())).thenReturn(null);
    when(() => repo.fetchReport(any())).thenAnswer(
      (call) async => right(_report(call.positionalArguments.first as Place)),
    );
    when(() => repo.fetchPastYears(any(), any())).thenAnswer(
      (_) async => right([
        DailyForecast(
          date: DateTime.utc(2025, 10, 4),
          low: 14,
          high: 21,
          condition: WeatherCondition.rain,
          precipitationChance: 0,
        ),
      ]),
    );
    when(() => repo.fetchSnapshots(any())).thenAnswer(
      (call) async => right([
        for (final place in call.positionalArguments.first as List<Place>)
          PlaceSnapshot(
            place: place,
            temperature: 18,
            condition: WeatherCondition.cloudy,
            isDay: true,
          ),
      ]),
    );

    await getIt.reset();
    getIt
      ..registerSingleton<WeatherRepo>(repo)
      ..registerSingleton(storage)
      ..registerSingleton<LocationService>(_MockLocationService());
  });

  Future<void> pumpHome(WidgetTester tester) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => WeatherCubit(repo: repo, storage: storage)..start(),
          ),
          BlocProvider(create: (_) => SavedPlacesCubit(storage)),
          BlocProvider(create: (_) => SettingsCubit(storage)),
        ],
        child: MaterialApp(
          theme: ThemeData.dark(),
          scrollBehavior: const AppScrollBehavior(),
          home: const WeatherHomeScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  /// Swipes from the top of the page, clear of the sideways hourly chart.
  Future<void> swipeLeft(WidgetTester tester) async {
    await tester.dragFrom(const Offset(360, 130), const Offset(-320, 0));
    await tester.pumpAndSettle();
  }

  testWidgets('swiping moves through the saved places and stops at the last', (
    tester,
  ) async {
    await pumpHome(tester);
    expect(find.text('Kathmandu'), findsOneWidget);
    expect(find.text('This day in past years'), findsOneWidget);
    expect(find.text('2025'), findsOneWidget);
    expect(find.byType(PageDots), findsOneWidget);

    await swipeLeft(tester);
    expect(find.text('Pokhara'), findsOneWidget);
    expect(find.text('Kathmandu'), findsNothing);

    await swipeLeft(tester);
    expect(find.text('Lalitpur'), findsOneWidget);

    await swipeLeft(tester);
    expect(find.text('Lalitpur'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('a saved place does not replace what the app reopens on', (
    tester,
  ) async {
    await pumpHome(tester);
    await swipeLeft(tester);

    expect(find.text('Pokhara'), findsOneWidget);
    expect(storage.readSelection()?.place, _kathmandu);
  });

  testWidgets('shows no page indicator when there is only one page', (
    tester,
  ) async {
    await storage.writeSavedPlaces([]);

    await pumpHome(tester);

    expect(find.text('Kathmandu'), findsOneWidget);
    expect(find.byType(PageDots), findsNothing);
  });

  group('search screen', () {
    Future<void> pumpSearch(WidgetTester tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => WeatherCubit(repo: repo, storage: storage),
            ),
            BlocProvider(create: (_) => SavedPlacesCubit(storage)),
            BlocProvider(create: (_) => SettingsCubit(storage)),
          ],
          child: MaterialApp(
            theme: ThemeData.dark(),
            home: const SearchScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();
    }

    Set<Place> visibleWorldCities() => worldCities
        .where((city) => find.text(city.name).evaluate().isNotEmpty)
        .toSet();

    testWidgets('lists saved places, then cities around the world', (
      tester,
    ) async {
      await pumpSearch(tester);

      expect(find.text('Saved places'), findsOneWidget);
      expect(find.text('Pokhara'), findsOneWidget);
      expect(find.text('Around the world'), findsOneWidget);
      // The list builds lazily, so the last rows may still be off screen.
      expect(visibleWorldCities().length, greaterThanOrEqualTo(6));
      expect(find.text('18°'), findsAtLeastNWidgets(6));

      final requested =
          verify(() => repo.fetchSnapshots(captureAny())).captured.single
              as List<Place>;
      expect(requested, hasLength(12));
      expect(requested.toSet(), hasLength(12));
    });

    testWidgets('can draw a different set of cities', (tester) async {
      await pumpSearch(tester);
      final before = visibleWorldCities();

      await tester.tap(find.byTooltip('Show other places'));
      await tester.pumpAndSettle();
      final after = visibleWorldCities();

      expect(before, isNotEmpty);
      expect(after, isNotEmpty);
      expect(after.intersection(before), isEmpty);
    });
  });
}
