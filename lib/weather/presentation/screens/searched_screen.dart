import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:weather_app/core/constants/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/weather/presentation/bloc/weathet_cubit/weather_cubit.dart';

@RoutePage()
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
    return BlocListener<WeatherCubit, WeatherState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            error: (error) => ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(error))));
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [ColorConstants.firstGradientColor, Colors.red])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            // title: Text(widget.searchTerm.toUpperCase()),
            backgroundColor: Colors.transparent,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<WeatherCubit, WeatherState>(
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(widget.searchTerm.toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 35, color: Colors.orange)),
                                ],
                              ),
                              // const SizedBox(height: 15),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: weatherModel.weather!.length,
                                itemBuilder: (context, index) {
                                  final data = weatherModel.weather![index];
                                  return Column(
                                    children: [
                                      Image.network(
                                          "http://openweathermap.org/img/w/${data.icon}.png"
                                              .toString(),
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.fill

                                          // scale: 0.5,
                                          ),
                                      Text(
                                        data.description.toString(),
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                    ],
                                  );
                                },
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
                                    "Max Temp ${weatherModel.main!.tempMin ?? 'N/A'}°C",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),

                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text('Wind',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue)),
                              ),
                              Card(
                                color: Colors.white70,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11)),
                                child: SizedBox(
                                  width: double.maxFinite,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        leading: const Icon(
                                          Icons.air,
                                          color: Colors.blue,
                                        ),
                                        title: Text(
                                            '${weatherModel.wind!.speed} Speed Km/h'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text('Barometer',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue)),
                              ),
                              Card(
                                color: Colors.white70,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11)),
                                child: SizedBox(
                                  width: double.maxFinite,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        leading: const Icon(
                                          LineIcons.highTemperature,
                                          color: Colors.blue,
                                        ),
                                        title: Text(
                                            'Temperature: ${weatherModel.main!.temp!.round()} °C'),
                                      ),
                                      ListTile(
                                        leading: const Icon(
                                          LineIcons.draftingCompass,
                                          color: Colors.blue,
                                        ),
                                        title: Text(
                                            'Humidity: ${weatherModel.main!.humidity}%'),
                                      ),
                                      ListTile(
                                        leading: const Icon(
                                          LineIcons.lowVision,
                                          color: Colors.blue,
                                        ),
                                        title: Text(
                                            'Visibility: ${weatherModel.visibility}'),
                                      ),
                                      ListTile(
                                        leading: const Icon(
                                          LineIcons.prescriptionBottle,
                                          color: Colors.blue,
                                        ),
                                        title: Text(
                                            'Pressure: ${weatherModel.main!.pressure}hpa'),
                                      ),
                                      ListTile(
                                        leading: const Icon(
                                          LineIcons.cloud,
                                          color: Colors.blue,
                                        ),
                                        title: Text(
                                            'Clouds Covered: ${weatherModel.clouds!.all}%'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        error: (error) {
                          return Center(
                              child: Text(
                            "No place Found for ${widget.searchTerm}",
                            style: const TextStyle(fontSize: 18),
                          ));
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
