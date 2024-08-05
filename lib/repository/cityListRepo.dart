// import 'dart:developer';
// import 'dart:async' show Future;
// import 'package:flutter/services.dart' show rootBundle;
// import '../gen/assets.gen.dart';
// import '../model/city.dart';
//
// class CityListRepo {
//   Future<List<City>> fetchCityListFromCSV() async {
//     try {
//       final input = await rootBundle.loadString(Assets.csv.worldcities);
//
//       final List<List<String>> fields = input
//           .split('\n')
//           .map(
//             (e) => e.split(',').map((e) => e.toString()).toList(),
//           )
//           .toList();
//
//       log(fields[0][1]);
//
//       return [
//         for (final field in fields) City.fromCsvList(field),
//       ];
//     } catch (err) {
//       log(err.toString());
//       return [];
//     }
//   }
// }
