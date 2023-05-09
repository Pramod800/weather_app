import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/presentation/bloc/cubit/weather_cubit.dart';
import 'package:weather_app/weather/presentation/widgets/city_info.dart';

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
    print(widget.searchTerm.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
          state.maybeWhen(
            orElse: () {},
            fetched: (weatherModel) {
              print(weatherModel.main!.temp.toString());
              return Column(
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
                    children: const [
                      Text('Kathmandu',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              color: Colors.lightBlue)),
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
                  )
                ],
              );
            },
            error: (error) => 'error fetchind data$error',
          );
          // state.when(
          //     initial: () => const FlutterLogo(),
          //     loading: () {
          //       return const CircularProgressIndicator();
          //     },
          //     fetched: (weatherModel) {
          //       print(weatherModel.wind!.speed.toString());
          //       return Column(
          //         children: [
          //           Image.network(
          //             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEwR73lnZrAZJ1L6DcFLICg-I9HcNHzrG0dp9IZfE&s',
          //             scale: 1.2,
          //             height: 80,
          //             width: 80,
          //           ),
          //           const SizedBox(height: 15),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Text(widget.searchTerm.toString(),
          //                   style: const TextStyle(
          //                       fontSize: 30,
          //                       fontWeight: FontWeight.w400,
          //                       color: Colors.lightBlue)),
          //             ],
          //           ),
          //           Row(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Text(weatherModel.main!.temp.toString(),
          //                   style: const TextStyle(
          //                       fontSize: 42,
          //                       fontWeight: FontWeight.w500,
          //                       color: Colors.green)),
          //               const SizedBox(width: 10),
          //               const Text('Feels Like 30°C',
          //                   style: TextStyle(
          //                       fontSize: 20,
          //                       fontWeight: FontWeight.w400,
          //                       color: Colors.grey)),
          //             ],
          //           )
          //         ],
          //       );
          //     },
          //     error: (erroe) => const Text('error is occured'));
          return Container(
            child: Text(widget.searchTerm),
          );
        }),
      ),
    );
  }
}
