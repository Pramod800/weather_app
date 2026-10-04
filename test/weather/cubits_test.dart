import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/weather/data/data_source/local_storage.dart';
import 'package:weather_app/weather/domain/entities/place.dart';
import 'package:weather_app/weather/domain/entities/weather_condition.dart';
import 'package:weather_app/weather/domain/entities/weather_report.dart';
import 'package:weather_app/weather/domain/weather_repo.dart';
import 'package:weather_app/weather/presentation/cubit/saved_places_cubit.dart';
import 'package:weather_app/weather/presentation/cubit/search_cubit.dart';
import 'package:weather_app/weather/presentation/cubit/weather_cubit.dart';

class _MockWeatherRepo extends Mock implements WeatherRepo {}

const _kathmandu = Place(
  name: 'Kathmandu',
  latitude: 27.7,
  longitude: 85.32,
  country: 'NP',
);
const _pokhara = Place(name: 'Pokhara', latitude: 28.21, longitude: 83.99);
const _unnamed = Place(name: '', latitude: 27.7, longitude: 85.32);

WeatherReport _report(Place place, {bool isFromCache = false}) {
  final now = DateTime.utc(2026, 10, 4, 6);
  return WeatherReport(
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
      observedAt: now,
    ),
    hourly: const [],
    daily: const [],
    utcOffset: Duration.zero,
    fetchedAt: now,
    isFromCache: isFromCache,
  );
}

void main() {
  late _MockWeatherRepo repo;
  late LocalStorage storage;

  setUpAll(() => registerFallbackValue(_kathmandu));

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    storage = LocalStorage(await SharedPreferences.getInstance());
    repo = _MockWeatherRepo();
    when(() => repo.cachedReport(any())).thenReturn(null);
  });

  group('WeatherCubit', () {
    WeatherCubit build() => WeatherCubit(repo: repo, storage: storage);

    blocTest<WeatherCubit, WeatherState>(
      'locates the device on a first start and remembers the result',
      setUp: () {
        when(() => repo.locate()).thenAnswer((_) async => right(_unnamed));
        when(
          () => repo.fetchReport(_unnamed),
        ).thenAnswer((_) async => right(_report(_kathmandu)));
      },
      build: build,
      act: (cubit) => cubit.start(),
      expect: () => [
        const WeatherState(status: WeatherStatus.loading),
        isA<WeatherState>()
            .having((s) => s.status, 'status', WeatherStatus.success)
            .having((s) => s.report?.place.name, 'place', 'Kathmandu')
            .having((s) => s.followsLocation, 'followsLocation', isTrue)
            .having((s) => s.isRefreshing, 'isRefreshing', isFalse),
      ],
      verify: (_) {
        final selection = storage.readSelection();
        expect(selection?.place, _kathmandu);
        expect(selection?.followsLocation, isTrue);
      },
    );

    blocTest<WeatherCubit, WeatherState>(
      'reopens the place chosen last time without asking for location',
      setUp: () async {
        await storage.writeSelection(_pokhara, followsLocation: false);
        when(
          () => repo.fetchReport(_pokhara),
        ).thenAnswer((_) async => right(_report(_pokhara)));
      },
      build: build,
      act: (cubit) => cubit.start(),
      skip: 1,
      expect: () => [
        isA<WeatherState>()
            .having((s) => s.report?.place, 'place', _pokhara)
            .having((s) => s.followsLocation, 'followsLocation', isFalse),
      ],
      verify: (_) => verifyNever(() => repo.locate()),
    );

    blocTest<WeatherCubit, WeatherState>(
      'shows a failure screen when location is denied and nothing is cached',
      setUp: () {
        when(() => repo.locate()).thenAnswer(
          (_) async => left(const Failure(FailureType.locationDenied)),
        );
      },
      build: build,
      act: (cubit) => cubit.useCurrentLocation(),
      expect: () => [
        const WeatherState(status: WeatherStatus.loading),
        const WeatherState(
          status: WeatherStatus.failure,
          failure: Failure(FailureType.locationDenied),
        ),
      ],
    );

    blocTest<WeatherCubit, WeatherState>(
      'shows the cached report first, then keeps it when the refresh fails',
      setUp: () {
        when(
          () => repo.cachedReport(_kathmandu),
        ).thenReturn(_report(_kathmandu, isFromCache: true));
        when(
          () => repo.fetchReport(_kathmandu),
        ).thenAnswer((_) async => left(const Failure(FailureType.network)));
      },
      build: build,
      act: (cubit) => cubit.selectPlace(_kathmandu),
      expect: () => [
        isA<WeatherState>()
            .having((s) => s.status, 'status', WeatherStatus.success)
            .having((s) => s.report?.isFromCache, 'isFromCache', isTrue)
            .having((s) => s.isRefreshing, 'isRefreshing', isTrue),
        isA<WeatherState>()
            .having((s) => s.report?.isFromCache, 'isFromCache', isTrue)
            .having((s) => s.isRefreshing, 'isRefreshing', isFalse)
            .having((s) => s.failure?.type, 'failure', FailureType.network),
      ],
    );

    blocTest<WeatherCubit, WeatherState>(
      'stays on the current place when switching to location fails',
      setUp: () {
        when(
          () => repo.fetchReport(_pokhara),
        ).thenAnswer((_) async => right(_report(_pokhara)));
        when(() => repo.locate()).thenAnswer(
          (_) async => left(const Failure(FailureType.locationDenied)),
        );
      },
      build: build,
      act: (cubit) async {
        await cubit.selectPlace(_pokhara);
        await cubit.useCurrentLocation();
      },
      skip: 3,
      expect: () => [
        isA<WeatherState>()
            .having((s) => s.report?.place, 'place', _pokhara)
            .having((s) => s.followsLocation, 'followsLocation', isFalse)
            .having(
              (s) => s.failure?.type,
              'failure',
              FailureType.locationDenied,
            ),
      ],
    );
  });

  group('SearchCubit', () {
    blocTest<SearchCubit, SearchState>(
      'searches once after typing pauses',
      setUp: () {
        when(
          () => repo.searchPlaces('Pokhara'),
        ).thenAnswer((_) async => right([_pokhara]));
      },
      build: () => SearchCubit(repo),
      act: (cubit) => cubit
        ..queryChanged('Po')
        ..queryChanged('Pokh')
        ..queryChanged('Pokhara'),
      wait: SearchCubit.debounce + const Duration(milliseconds: 50),
      expect: () => [
        const SearchState.loading(),
        const SearchState.results([_pokhara]),
      ],
      verify: (_) {
        verify(() => repo.searchPlaces('Pokhara')).called(1);
        verifyNever(() => repo.searchPlaces('Po'));
      },
    );

    blocTest<SearchCubit, SearchState>(
      'reports when nothing matches',
      setUp: () {
        when(
          () => repo.searchPlaces('zzzz'),
        ).thenAnswer((_) async => right([]));
      },
      build: () => SearchCubit(repo),
      act: (cubit) => cubit.queryChanged('zzzz'),
      wait: SearchCubit.debounce + const Duration(milliseconds: 50),
      expect: () => [
        const SearchState.loading(),
        const SearchState.empty('zzzz'),
      ],
    );

    blocTest<SearchCubit, SearchState>(
      'goes back to idle for a query that is too short',
      build: () => SearchCubit(repo),
      seed: () => const SearchState.loading(),
      act: (cubit) => cubit.queryChanged('P'),
      expect: () => [const SearchState.idle()],
    );
  });

  group('SavedPlacesCubit', () {
    test('saving a place persists it and drops it from recents', () async {
      final cubit = SavedPlacesCubit(storage);

      await cubit.addRecent(_pokhara);
      await cubit.toggleSaved(_pokhara);

      expect(cubit.state.saved, [_pokhara]);
      expect(cubit.state.recent, isEmpty);
      expect(SavedPlacesCubit(storage).state.saved, [_pokhara]);

      await cubit.toggleSaved(_pokhara);
      expect(cubit.state.saved, isEmpty);
    });

    test('keeps recents newest first without duplicates', () async {
      final cubit = SavedPlacesCubit(storage);

      await cubit.addRecent(_pokhara);
      await cubit.addRecent(_kathmandu);
      await cubit.addRecent(_pokhara);

      expect(cubit.state.recent, [_pokhara, _kathmandu]);
    });
  });
}
