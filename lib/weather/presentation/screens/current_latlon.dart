// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// @routePage
// class LocationScreen extends StatefulWidget {
//   const LocationScreen({Key? key}) : super(key: key);

//   @override
//   _LocationScreenState createState() => _LocationScreenState();
// }

// class _LocationScreenState extends State<LocationScreen> {
//   // Position? position;

//   // fetchPosition() async {
//   //   bool serviceEnabled;
//   //   LocationPermission permission;

//   //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   //   if (!serviceEnabled) {
//   //     return Future.error('Location services are disabled.');
//   //   }

//   //   permission = await Geolocator.checkPermission();
//   //   if (permission == LocationPermission.denied) {
//   //     permission = await Geolocator.requestPermission();
//   //     if (permission == LocationPermission.denied) {
//   //       return Future.error('Location permissions are denied');
//   //     }
//   //   }

//   //   if (permission == LocationPermission.deniedForever) {
//   //     return Future.error(
//   //         'Location permissions are permanently denied, we cannot request permissions.');
//   //   }
//   //   return await Geolocator.getCurrentPosition();

//   // }

//   Future<void> _getCurrentWeather() async {
//     try {
//       final position = await _locationService.getCurrentLocation();
//       final weatherData = await _weatherService.getCurrentWeather(
//           position.latitude, position.longitude);
//       setState(() {
//         _weatherDescription = weatherData['weather'][0]['description'];
//         _temperature = weatherData['main']['temp'];
//       });
//     } on PlatformException catch (e) {
//       // handle location service errors
//     } on DioError catch (e) {
//       // handle weather service errors
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Location')),
//       body: Center(
//           child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//         Text(position == null ? 'Location' : position.toString()),
//         ElevatedButton(
//             onPressed: () => fetchPosition(), child: Text('Find Location'))
//       ])),
//     );
//   }
// }

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:geolocator/geolocator.dart';

// class WeatherScreen extends StatefulWidget {
//   const WeatherScreen({super.key});

//   @override
//   State<WeatherScreen> createState() => _WeatherScreenState();
// }

// class _WeatherScreenState extends State<WeatherScreen> {
//   Future<Position> _getCurrentLocation() async {
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     return position;
//   }

//   Future<Map<String, dynamic>> _getWeatherData(
//       double latitude, double longitude) async {
//     String url =
//         "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=d1620a273527c62af41fc964f16ccb46&units=metric";
//     Dio dio = Dio();
//     Response response = await dio.get(url);
//     Map<String, dynamic> data = response.data;
//     return data;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _getCurrentLocation(),
//       builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
//         if (snapshot.hasData) {
//           double latitude = snapshot.data!.latitude;
//           double longitude = snapshot.data!.longitude;
//           return FutureBuilder(
//             future: _getWeatherData(latitude, longitude),
//             builder: (BuildContext context,
//                 AsyncSnapshot<Map<String, dynamic>> snapshot) {
//               if (snapshot.hasData) {
//                 Map<String, dynamic>? data = snapshot.data;
//                 String cityName = data!['name'];
//                 String temperature = data['main']['temp'].toString();
//                 return Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "City: $cityName",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         "Temperature: $temperature°C",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ],
//                   ),
//                 );
//               } else if (snapshot.hasError) {
//                 return Text("${snapshot.error}");
//               }
//               return CircularProgressIndicator();
//             },
//           );
//         } else if (snapshot.hasError) {
//           return Text("${snapshot.error}");
//         }
//         return CircularProgressIndicator();
//       },
//     );
//   }
// }


// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:weather_app/weather/data/models/weather_model.dart';

// class Prac extends StatefulWidget {
//   const Prac({super.key});

//   @override
//   State<Prac> createState() => _PracState();
// }

// class _PracState extends State<Prac> {
//   late final WeatherModel _weatherModel;
//   // @override
//   // void initState() {
//   //   // getCurrentLocation();
//   //   _getCurrentLocation();
//   //   super.initState();
//   // }

//   // @override
//   // void dispose() {
//   //   _searchController.dispose();
//   //   super.dispose();
//   // }

//   Future<Position> _getCurrentLocation() async {
//     final position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     return position;
//   }

//   Future<WeatherModel> _getWeatherData(
//       double latitude, double longitude) async {
//     final url =
//         'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=d1620a273527c62af41fc964f16ccb46&units=metric';
//     final response = await Dio().get(url);
//     final data = WeatherModel.fromJson(response.data);
//     return data;
//   }

//   void initState() {
//     super.initState();
//     _getCurrentLocation().then((position) {
//       _getWeatherData(position.latitude, position.longitude).then((data) {
//         setState(() {
//           _weatherModel = data;
//         });
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // ignore: unnecessary_null_comparison
//     if (_weatherModel == null) {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     } else {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             _weatherModel.main!.temp.toString(),
//             style: const TextStyle(
//               fontSize: 32,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           // Image.network(_weatherData.iconUrl),
//           Text(
//             _weatherModel.name.toString(),
//             style: const TextStyle(
//               fontSize: 24,
//             ),
//           ),
//           const Text('helllooo')
//           // Text(
//           //   '${_weatherData.temperature}°C',
//           //   style: TextStyle(
//           //     fontSize: 64,
//           //     fontWeight: FontWeight.bold,
//           //   ),
//           // ),
//         ],
//       );
//     }
//   }
// }
