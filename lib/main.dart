import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/di/bootstrap.dart';
import 'package:weather_app/router/router.dart';
import 'package:weather_app/weather/data/movie_data_source/weather_data_source.dart';
import 'package:weather_app/weather/data/repository/weather_repo_impl.dart';
import 'package:weather_app/weather/presentation/bloc/cubit/weather_cubit.dart';

void main() {
  // configureDependencies();
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
          create: (context) => WeatherCubit(WeatherRepoImpl(WeatherApi(Dio()))),
        ),
        // BlocProvider(
        //   create: (context) =>
        //       WeatherForecastCubit(WeatherRepoImpl(WeatherApi(Dio()))),
        // ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),

        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const SplashScreen(),
      ),
    );
  }
}
