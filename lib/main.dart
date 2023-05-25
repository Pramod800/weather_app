import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/router/router.dart';
import 'package:weather_app/weather/data/movie_data_source/weather_data_source.dart';
import 'package:weather_app/weather/data/repository/weather_repo_impl.dart';
import 'package:weather_app/weather/presentation/bloc/user_location_cubit/current_weather_cubit.dart';
import 'package:weather_app/weather/presentation/bloc/weathet_cubit/weather_cubit.dart';

void main() async {
  // configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  // final location = await UserLocationService.determinePosition();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              WeatherCubit(WeatherRepoImpl(WeatherDataSource(Dio()))),
        ),
        BlocProvider(
          create: (context) =>
              CurrentWeatherCubit(WeatherRepoImpl(WeatherDataSource(Dio()))),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            routerConfig: _appRouter.config(),
            theme: ThemeData(
                primarySwatch: Colors.blue, primaryColor: Colors.transparent),
            // home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
