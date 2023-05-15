// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:weather_app/weather/presentation/screens/searched_screen.dart'
    as _i1;
import 'package:weather_app/weather/presentation/screens/splash_screen.dart'
    as _i2;
import 'package:weather_app/weather/presentation/screens/weather_home_screen.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SearchedRoute.name: (routeData) {
      final args = routeData.argsAs<SearchedRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.SearchedScreen(
          key: args.key,
          searchTerm: args.searchTerm,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreen(),
      );
    },
    WeatherHomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.WeatherHomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.SearchedScreen]
class SearchedRoute extends _i4.PageRouteInfo<SearchedRouteArgs> {
  SearchedRoute({
    _i5.Key? key,
    required String searchTerm,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          SearchedRoute.name,
          args: SearchedRouteArgs(
            key: key,
            searchTerm: searchTerm,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchedRoute';

  static const _i4.PageInfo<SearchedRouteArgs> page =
      _i4.PageInfo<SearchedRouteArgs>(name);
}

class SearchedRouteArgs {
  const SearchedRouteArgs({
    this.key,
    required this.searchTerm,
  });

  final _i5.Key? key;

  final String searchTerm;

  @override
  String toString() {
    return 'SearchedRouteArgs{key: $key, searchTerm: $searchTerm}';
  }
}

/// generated route for
/// [_i2.SplashScreen]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.WeatherHomeScreen]
class WeatherHomeRoute extends _i4.PageRouteInfo<void> {
  const WeatherHomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          WeatherHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeatherHomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
