// // ignore_for_file: prefer_typing_uninitialized_variables
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:petfindernetwork/model/lost_found_item_info_model.dart';
// import 'dart:async';
//
// class LostFoundRepo  {
//     static late var db;
//     LostFoundRepo(){
//      db = FirebaseFirestore.instance;
//     }
//     Future setLostFoundPetInfo(docID, LostFoundPetInfoModel petInfoModel) async {
//       return await db.collection('lfPets').doc(docID).set(petInfoModel.toJson());
//     }
//   }
//
//
