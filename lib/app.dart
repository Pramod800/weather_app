import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/di/bootstrap.dart';
import 'package:weather_app/core/router/router.dart';
import 'package:weather_app/weather/presentation/cubit/saved_places_cubit.dart';
import 'package:weather_app/weather/presentation/cubit/settings_cubit.dart';
import 'package:weather_app/weather/presentation/cubit/weather_cubit.dart';
import 'package:weather_app/weather/presentation/theme/app_theme.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  static const name = 'Mausam';

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final _router = AppRouter();
  late final _theme = AppTheme.build();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WeatherCubit(repo: getIt(), storage: getIt())..start(),
        ),
        BlocProvider(create: (_) => SavedPlacesCubit(getIt())),
        BlocProvider(create: (_) => SettingsCubit(getIt())),
      ],
      child: MaterialApp.router(
        title: WeatherApp.name,
        debugShowCheckedModeBanner: false,
        theme: _theme,
        scrollBehavior: const AppScrollBehavior(),
        routerConfig: _router.config(),
      ),
    );
  }
}

/// Lets a mouse or trackpad drag scrollables, as touch does. Without this
/// the sideways hourly forecast cannot be moved on web and desktop, where
/// the wheel only scrolls the page up and down.
class AppScrollBehavior extends MaterialScrollBehavior {
  const AppScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
    ...super.dragDevices,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}
