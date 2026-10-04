import 'package:flutter/material.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/core/di/bootstrap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const WeatherApp());
}
