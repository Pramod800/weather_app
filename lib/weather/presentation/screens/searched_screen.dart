import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/presentation/bloc/cubit/weather_cubit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchedScreen extends StatefulWidget {
  final String searchTerm;
  const SearchedScreen({super.key, required this.searchTerm});

  @override
  State<SearchedScreen> createState() => _SearchedScreenState();
}

class _SearchedScreenState extends State<SearchedScreen> {
  @override
  void initState() {
    context
        .read<WeatherCubit>()
        .getWeatherDetails(city: widget.searchTerm.trim());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.red])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                      child: SpinKitDoubleBounce(
                    color: Colors.blue,
                  ));
                },
                fetched: (weatherModel) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEwR73lnZrAZJ1L6DcFLICg-I9HcNHzrG0dp9IZfE&s',
                        scale: 1.2,
                        height: 80,
                        width: 80,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.searchTerm.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.lightBlue)),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${weatherModel.main!.temp!.round()}°C",
                              style: const TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green)),
                          const SizedBox(width: 10),
                          Text(
                            "Feels Like ${weatherModel.main!.feelsLike ?? 'N/A'}",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Wind',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.lightBlue)),
                      ),
                      Card(
                        color: Colors.white70,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11)),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: const Icon(
                                  Icons.air,
                                  color: Colors.blue,
                                ),
                                title: Text(
                                    '${weatherModel.wind!.speed}  Speed Km/h'),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Barometer',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.lightBlue)),
                      ),
                      Card(
                        color: Colors.white70,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11)),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: const Icon(
                                  Icons.air,
                                  color: Colors.blue,
                                ),
                                title: Text('${weatherModel.main!.temp} °C'),
                              ),
                              const ListTile(
                                leading: Icon(
                                  Icons.air,
                                  color: Colors.blue,
                                ),
                                title: Text('Air Quality Index  AQI'),
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.air,
                                  color: Colors.blue,
                                ),
                                title: Text(
                                    'Pressure ${weatherModel.main!.pressure}hpa'),
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.air,
                                  color: Colors.blue,
                                ),
                                title: Text(
                                    'Chance of Rain ${weatherModel.clouds!.all}%'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
