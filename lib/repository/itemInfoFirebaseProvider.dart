// import 'dart:async';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class PetInfoFirebaseProvider {
//   final String petstatus;
//
//   PetInfoFirebaseProvider(this.petstatus);
//
//   Future<List<DocumentSnapshot<Map<String, dynamic>?>>> fetchFirstList() async {
//     return (await FirebaseFirestore.instance
//         .collection("lfPets")
//         .where('pet_status', isEqualTo: petstatus)
//         .orderBy("timestamp", descending: true)
//         .limit(20)
//         .get())
//         .docs;
//   }
//
//   Future<List<DocumentSnapshot<Map<String, dynamic>?>>> fetchNextList(
//       List<DocumentSnapshot> documentList) async {
//     return (await FirebaseFirestore.instance
//         .collection("lfPets")
//         .where('pet_status', isEqualTo: petstatus)
//         .orderBy("timestamp", descending: true)
//         .startAfterDocument(documentList[documentList.length - 1])
//         .limit(20)
//         .get())
//         .docs;
//   }
//
//   Stream<QuerySnapshot<Map<String, dynamic>?>> petListStream() {
//     return FirebaseFirestore.instance
//         .collection("lfPets")
//         .where('pet_status', isEqualTo: petstatus)
//         .orderBy("timestamp", descending: true)
//         .snapshots();
//   }
//
// }