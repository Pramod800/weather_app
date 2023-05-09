import 'package:flutter/material.dart';

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
