import 'package:flutter/material.dart';
import 'package:weather_app/weather/presentation/screens/weather_home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WeatherHomeScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.red])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // floatingActionButton: FloatingActionButton(onPressed: () {}),
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 150),
                const Text(
                  'Welcome\n to weather App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/1779/1779940.png',
                  scale: 0.8,
                  height: 280,
                  width: 280,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
