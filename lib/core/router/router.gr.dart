// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:weather_app/weather/presentation/screens/search_screen.dart'
    as _i1;
import 'package:weather_app/weather/presentation/screens/weather_home_screen.dart'
    as _i2;

/// generated route for
/// [_i1.SearchScreen]
class SearchRoute extends _i3.PageRouteInfo<void> {
  const SearchRoute({List<_i3.PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.SearchScreen();
    },
  );
}

/// generated route for
/// [_i2.WeatherHomeScreen]
class WeatherHomeRoute extends _i3.PageRouteInfo<void> {
  const WeatherHomeRoute({List<_i3.PageRouteInfo>? children})
    : super(WeatherHomeRoute.name, initialChildren: children);

  static const String name = 'WeatherHomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.WeatherHomeScreen();
    },
  );
}
