import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/constants/constants.dart';
import 'package:weather_app/core/router/router.gr.dart';
import 'package:weather_app/weather/presentation/cubit/current_weather_cubit.dart';

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

  // getCurrentLocation() async {
  //   var p = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.low,
  //     forceAndroidLocationManager: true,
  //   );
  //   if (p != null) {
  //     print('Lat:${p.latitude}, Long:${p.longitude}');
  //   } else {
  //     print('Data unavailable');
  //   }
  // }

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
                      print(weatherModel);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),
                          // Padding(
                          //   padding:  EdgeInsets.only(left: 22),
                          //   child: Image.asset(
                          //     'assets/images/bannerr.png',
                          //     height: 65,
                          //     width: 220,
                          //     scale: 1.3,
                          //     fit: BoxFit.cover,
                          //   ),
                          // ),
                          const SizedBox(height: 5),

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
                          Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEwR73lnZrAZJ1L6DcFLICg-I9HcNHzrG0dp9IZfE&s',
                            scale: 1.2,
                            height: 80,
                            width: 80,
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
                              Text(weatherModel.main!.temp.toString(),
                                  style: const TextStyle(
                                      fontSize: 42,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.green)),
                              const SizedBox(width: 10),
                              const Text('Feels Like 30°C',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey)),
                            ],
                          ),

                          const SizedBox(height: 20),

                          ///werather forecastlistview [weather forecast]
                          SizedBox(
                            height: 70,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: 15,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, index) {
                                return Container(
                                  margin: index == 0
                                      ? const EdgeInsets.only(left: 0)
                                      : null,
                                  child: Card(
                                    color: Colors.white70,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            '7 March',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 10),
                                          Text('20°C'),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 10),

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
                                    children: const [
                                      ListTile(
                                        leading: Icon(
                                          Icons.air,
                                          color: Colors.blue,
                                        ),
                                        title: Text('40 Speed Km/h'),
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
                                    children: const [
                                      ListTile(
                                        leading: Icon(
                                          Icons.air,
                                          color: Colors.blue,
                                        ),
                                        title: Text('Temperature 20°C 🔥'),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.air,
                                          color: Colors.blue,
                                        ),
                                        title:
                                            Text('Air Quality Index 200 AQI'),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.air,
                                          color: Colors.blue,
                                        ),
                                        title: Text('Pressure 1000.ohpa'),
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
