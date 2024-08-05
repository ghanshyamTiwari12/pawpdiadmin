// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class SearchPetRepo{
//
//     Future<QuerySnapshot> searchByProductName(String searchdata) {
//     return FirebaseFirestore.instance
//         .collection('lfPets')
//         .where('filter_text',
//             isEqualTo: searchdata.substring(0, 1).toUpperCase()).limit(50)
//         .get();
//   }
// }