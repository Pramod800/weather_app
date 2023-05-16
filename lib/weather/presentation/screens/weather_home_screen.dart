import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:line_icons/line_icons.dart';
import 'package:weather_app/core/constants/constants.dart';
import 'package:weather_app/core/router/router.gr.dart';
import 'package:weather_app/weather/presentation/bloc/user_location_cubit/current_weather_cubit.dart';

@RoutePage()
class WeatherHomeScreen extends StatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  State<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    context.read<CurrentWeatherCubit>().getWeatherFromLatLng();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [ColorConstants.firstGradientColor, Colors.red])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
                  builder: (context, state) {
                    return state.maybeWhen(orElse: () {
                      return const Center(
                          child: SpinKitDoubleBounce(
                        color: Colors.blue,
                      ));
                    }, fetched: (weatherModel) {
                      /// convert default Fahrenheit temperature value to celsius [Fahrenheit to celsius]
                      final tempData =
                          weatherModel.main!.temp!.round() - 273.15.round();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/weee.png',
                                height: 65,
                                width: 100,
                                scale: 1.3,
                                fit: BoxFit.fill,
                              ),
                              const Text(
                                'Weather App',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),

                          /// topheader [search bar/header ]
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _searchController,
                                  onFieldSubmitted: (value) {
                                    if (value.isNotEmpty) {
                                      context.router.push(
                                          SearchedRoute(searchTerm: value));
                                    }
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white70,
                                    hintText: 'Search',
                                    hintStyle:
                                        const TextStyle(color: Colors.blue),
                                    prefixIcon: IconButton(
                                      icon: const Icon(Icons.search,
                                          color: Colors.blue),
                                      onPressed: () {},
                                    ),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Container(
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(15),
                              //     color: Colors.white,
                              //   ),
                              //   child: IconButton(
                              //     padding: const EdgeInsets.all(12),
                              //     iconSize: 26,
                              //     onPressed: () {},
                              //     icon: const Icon(Icons.location_on_outlined,
                              //         color: Colors.green),
                              //   ),
                              // ),
                            ],
                          ),
                          const SizedBox(height: 20),
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
                          const SizedBox(height: 15),

                          /// city info part [city info]
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(weatherModel.name.toString(),
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.orange)),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${tempData.toString()} °C',
                                  style: const TextStyle(
                                      fontSize: 42,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.green)),
                              const SizedBox(width: 10),
                              Text(
                                  'Feels Like:${weatherModel.main!.tempMax ?? "N/A"}°C ',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey)),
                            ],
                          ),

                          const SizedBox(height: 20),

                          ///werather forecastlistview [weather forecast]
                          // SizedBox(
                          //   height: 70,
                          //   child: ListView.builder(
                          //     physics: const BouncingScrollPhysics(),
                          //     itemCount: 15,
                          //     scrollDirection: Axis.horizontal,
                          //     itemBuilder: (BuildContext context, index) {
                          //       return Container(
                          //         margin: index == 0
                          //             ? const EdgeInsets.only(left: 0)
                          //             : null,
                          //         child: Card(
                          //           color: Colors.white70,
                          //           child: Container(
                          //             padding: const EdgeInsets.symmetric(
                          //                 horizontal: 15, vertical: 10),
                          //             child: Column(
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.center,
                          //               children: const [
                          //                 Text(
                          //                   '7 March',
                          //                   style: TextStyle(
                          //                       fontSize: 14,
                          //                       fontWeight: FontWeight.bold),
                          //                 ),
                          //                 SizedBox(height: 10),
                          //                 Text('20°C'),
                          //               ],
                          //             ),
                          //           ),
                          //         ),
                          //       );
                          //     },
                          //   ),
                          // ),
                          // const SizedBox(height: 10),

                          /// wind part [wind part]
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        leading: const Icon(
                                          Icons.air,
                                          color: Colors.blue,
                                        ),
                                        title: Text(
                                            '${weatherModel.wind!.speed.toString()} Speed Km/hr'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          /// barometer last section [barometer]
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        leading: const Icon(
                                          LineIcons.highTemperature,
                                          color: Colors.blue,
                                        ),
                                        title: Text(
                                            'Temperature: ${tempData.toString()} °C'),
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
                                          Icons.push_pin,
                                          color: Colors.blue,
                                        ),
                                        title: Text(
                                            'Pressure: ${weatherModel.main!.pressure} hpa'),
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
                          ),
                        ],
                      );
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
