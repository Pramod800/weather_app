import 'package:flutter/material.dart';

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
