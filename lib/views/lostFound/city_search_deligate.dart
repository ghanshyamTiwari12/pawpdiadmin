// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/constant/colors.dart';
// import 'package:petfindernetwork/model/city.dart';
//
// class CitySearchDeligate extends SearchDelegate<String?> {
//   CitySearchDeligate(this.cityList);
//
//   final List<City> cityList;
//
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: const Icon(
//           Icons.clear,
//           color: Colors.black,
//         ),
//       )
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () => close(context, null),
//       icon: const Icon(
//         Icons.arrow_back_ios,
//         color: Colors.black,
//       ),
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return const SizedBox();
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     if (query.isEmpty) return const SizedBox();
//
//     List<City> citySearchList = [];
//     citySearchList = cityList.where(
//       (city) {
//         bool ifCityNameContains =
//             city.cityName.toLowerCase().contains(query.toLowerCase());
//         bool ifCountryNameContains =
//             city.countryName.toLowerCase().contains(query.toLowerCase());
//         return ifCityNameContains || ifCountryNameContains;
//       },
//     ).toList();
//     return ListView.builder(
//       itemCount: citySearchList.length,
//       itemBuilder: (context, index) {
//         final city = citySearchList[index];
//         return ListTile(
//           title: Text(city.cityName),
//           subtitle: Text(city.countryName,
//             style: TextStyle(
//                 color: AppColor.orange,
//                 fontWeight: FontWeight.bold
//             ),
//           ),
//           onTap: () {
//             close(context, city.toString());
//           },
//         );
//       },
//     );
//   }
// }
