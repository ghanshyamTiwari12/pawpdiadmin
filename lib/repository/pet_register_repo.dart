//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:async';
//
// import '../model/pet_registration_model.dart';
//
// class PetRegisterRepo  {
//   static late var db;
//   PetRegisterRepo(){
//     db = FirebaseFirestore.instance;
//   }
//   Future setRegisteredPet(docID, PetRegistrationModel petRegistrationModel) async {
//     return await db.collection('registeredPet').doc(docID).set(petRegistrationModel.toJson());
//   }
//
// }
//
//
