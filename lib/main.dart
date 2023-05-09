import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/data/movie_data_source/weather_data_source.dart';
import 'package:weather_app/weather/data/weather_repo_impl.dart';
import 'package:weather_app/weather/presentation/bloc/cubit/weather_cubit.dart';
import 'package:weather_app/weather/presentation/screens/weather_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(WeatherRepoImpl(WeatherApi(Dio()))),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WeatherHomeScreen(),
      ),
    );
  }
}
