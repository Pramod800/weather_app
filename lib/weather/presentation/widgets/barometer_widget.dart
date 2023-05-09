import 'package:flutter/material.dart';

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
