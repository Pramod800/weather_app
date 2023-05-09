// import 'package:flutter/material.dart';
// import 'package:weather_app/weather/presentation/screens/searched_screen.dart';

// class HeaderWidget extends StatelessWidget {
//   const HeaderWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController _searchController = TextEditingController();
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextFormField(
//               controller: _searchController,
//               // onFieldSubmitted: (userInput) {},
//               onFieldSubmitted: (value) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => SearchedScreen(
//                             searchTerm: _searchController,
//                           )),
//                 );
//               },
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 hintText: 'Search',
//                 hintStyle: const TextStyle(color: Colors.blue),
//                 prefixIcon: IconButton(
//                   icon: const Icon(Icons.search, color: Colors.blue),
//                   onPressed: () {},
//                 ),
//                 border: const OutlineInputBorder(
//                   borderSide: BorderSide.none,
//                   borderRadius: BorderRadius.all(Radius.circular(15)),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 10),
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.white,
//             ),
//             child: IconButton(
//               padding: const EdgeInsets.all(12),
//               iconSize: 26,
//               onPressed: () {},
//               icon: const Icon(Icons.location_on_outlined, color: Colors.green),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
