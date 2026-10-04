import 'package:auto_route/auto_route.dart';
import 'package:weather_app/core/router/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: WeatherHomeRoute.page, path: '/', initial: true),
    AutoRoute(page: SearchRoute.page, path: '/search'),
  ];
}
