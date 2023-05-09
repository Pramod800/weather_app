import 'package:flutter/material.dart';

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
