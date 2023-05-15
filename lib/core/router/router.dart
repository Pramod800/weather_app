import 'package:auto_route/auto_route.dart';
import 'package:weather_app/core/router/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: WeatherHomeRoute.page, path: '/home'),
    AutoRoute(page: SearchedRoute.page, path: '/search'),
  ];
}
