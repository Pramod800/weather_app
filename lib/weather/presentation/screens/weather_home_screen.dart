import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/presentation/bloc/cubit/weather_cubit.dart';
import 'package:weather_app/weather/presentation/screens/searched_screen.dart';

class WeatherHomeScreen extends StatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  State<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
  @override
  void initState() {
    // context.read<WeatherCubit>()
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 65,
                    width: 220,
                    scale: 1.3,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(height: 5),
              const HeaderWidget(),
              const SizedBox(height: 20),
              const CityInfoWidget(),
              const SizedBox(height: 20),
              const WeatherForecastList(),
              const SizedBox(height: 10),
              const WindWidget(),
              const SizedBox(height: 10),
              const BarometerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _searchController,
              onFieldSubmitted: (value) {
                // print(value.toString());
                // context.read<WeatherCubit>().getWeatherDetails(city: value);

                if (value.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchedScreen(
                              searchTerm: value,
                            )),
                  );
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.blue),
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search, color: Colors.blue),
                  onPressed: () {},
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: IconButton(
              padding: const EdgeInsets.all(12),
              iconSize: 26,
              onPressed: () {},
              icon: const Icon(Icons.location_on_outlined, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}

class CityInfoWidget extends StatelessWidget {
  const CityInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
          children: const [
            Text('32°C',
                style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w500,
                    color: Colors.green)),
            SizedBox(width: 10),
            Text('Feels Like 30°C',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}

class WeatherForecastList extends StatelessWidget {
  const WeatherForecastList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 23,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, index) {
          return Container(
            margin: index == 0 ? const EdgeInsets.only(left: 20) : null,
            // margin: const EdgeInsets.only(left: 15),
            child: Card(
              // color: Colors.white60,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: const [
                    Text(
                      '7 March',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
    );
  }
}

class WindWidget extends StatelessWidget {
  const WindWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Column(
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}

class BarometerWidget extends StatelessWidget {
  const BarometerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Column(
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    title: Text('Air Quality Index 200 AQI'),
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
    );
  }
}
