//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:async';
// import '../model/deleted_user_model.dart';
//
// class DeleteUsrRepo  {
//   static late var db;
//   DeleteUsrRepo(){
//     db = FirebaseFirestore.instance;
//   }
//   Future setDeletUser(docID, DeletedUser deletedUser) async {
//     return await db.collection('deletedUser').doc(docID).set(deletedUser.toJson());
//   }
//
// }
//
//
