//
// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/model/pending_block_model.dart';
// import 'package:petfindernetwork/model/user_profile.dart';
//
// import '../Web_helper/loginsignupRepo.dart';
//
// class  UserRepo {
//   static var db = FirebaseFirestore.instance;
//
//   Future setUserProfileData(uid, UserProfileModel userProfile) {
//     return db.collection('users').doc(uid).set(userProfile.toJson());
//   }
//
//   getUserProfileStream(uid) {
//     return db.collection('users').doc(uid).snapshots();
//   }
//
//
//   getUserPostedPetsStream(uid) {
//     return db
//         .collection('lfPets')
//         .where('posted_id', isEqualTo: uid)
//         .orderBy("timestamp", descending: true)
//         .snapshots();
//   }
//
//   Future<List<DocumentSnapshot<Map<String, dynamic>?>>>
//       fetchUserPostedPetsFirstList(uid) async {
//     return (await FirebaseFirestore.instance
//             .collection("lfPets")
//             .where('posted_id', isEqualTo: uid)
//             .orderBy("timestamp", descending: true)
//             .limit(20)
//             .get())
//         .docs;
//   }
//
//   Future<List<DocumentSnapshot<Map<String, dynamic>?>>>
//       fetchUserPostedPetsNextList(uid,
//           List<DocumentSnapshot<Map<String, dynamic>?>> documentList) async {
//     return (await FirebaseFirestore.instance
//             .collection("lfPets")
//             .where('posted_id', isEqualTo: uid)
//             .orderBy("timestamp", descending: true)
//             .startAfterDocument(documentList[documentList.length - 1])
//             .limit(20)
//             .get())
//         .docs;
//   }
//
//   deletePetImage(images) {
//     return Future.forEach(images, (dynamic image) {
//       if (image != null) {
//         Reference reference = FirebaseStorage.instance.refFromURL(image);
//         reference.delete();
//       }
//     });
//   }
//
//   Future deleteSiglePetImage(image) async {
//     Reference reference = FirebaseStorage.instance.refFromURL(image);
//     return reference.delete();
//   }
//
//   Future deletePostedPet(reference) {
//     return db.runTransaction((Transaction myTransaction) async {
//       myTransaction.delete(reference);
//     });
//   }
//
//   Future addNewImageIntoMyPet(docId, imageUrl) {
//     return db.collection('lfPets').doc(docId).update({
//       'image_url': FieldValue.arrayUnion([imageUrl])
//     });
//   }
//
//   Future removeAnImageFromMyPet(docId, imageUrl) {
//     return db.collection('lfPets').doc(docId).update({
//       'image_url': FieldValue.arrayRemove([imageUrl])
//     });
//   }
//
//   static Future<DocumentSnapshot<Map<String, dynamic>?>> getUserProfileDocument(
//       uid) {
//     return db.collection('users').doc(uid).get();
//   }
//
//   static Future<UserProfileModel> getUserProfileData(uid) async {
//     var data = await db.collection('users').doc(uid).get();
//     return UserProfileModel.fromDocumentSnap(data);
//   }
//
//   static Future updateUserProfileData(uid, Map<String, dynamic> data) {
//     return db.collection('users').doc(uid).update(data);
//   }
//
//   static Future deleteProfileImage(imageUrl) async {
//     Reference ref = FirebaseStorage.instance.refFromURL(imageUrl);
//     return ref.delete();
//   }
//
//   void updateName(String uid, context, TextEditingController controllerName) async {
//     Map<String, dynamic> value = {};
//     value['name'] = controllerName.text;
//     await UserRepo.updateUserProfileData(uid, value);
//     controllerName.clear();
//     Navigator.of(context).pop();
//   }
//
//   void updateaddress(uid, context, controllerAddress) async {
//     Map<String, dynamic> value = {};
//     value['address'] = controllerAddress.text;
//     await UserRepo.updateUserProfileData(uid, value);
//     controllerAddress.clear();
//     Navigator.of(context).pop();
//   }
//
//   updateIsIdPending(uid, context, String iDType, bool isIdPending, File? idImage) async {
//     Map<String, dynamic> value = {};
//     value['isIdPending'] = !isIdPending;
//     value['idImageUrl'] = idImage;
//     value['idType']  = iDType;
//    await UserRepo.updateUserProfileData(uid, value);
//     Navigator.of(context).pop();
//   }
//
//   void updatephoneNumber(
//       uid, context, controllerPhone, String? dialCode) async {
//     Map<String, dynamic> value = {};
//     value['phone'] = "$dialCode${controllerPhone.text}";
//     await UserRepo.updateUserProfileData(uid, value);
//     controllerPhone.clear();
//     Navigator.of(context).pop();
//   }
//
//   void iDSubmit(uid, context, File? image, String iDType, ) async {
//
//    if (kDebugMode) {
//       print("user id on submit button: $uid");
//     }
//     String imageUrl = await LoginSignupRepo()
//         .uploadImage(image!, uid!);
//     Map<String, dynamic> value = {};
//     value['idImageUrl'] = imageUrl.toString();
//     value['isIdPending'] = true;
//     value['idType'] = iDType;
//     await UserRepo.updateUserProfileData(uid, value);
//     // notifyListeners();
//
//     if (kDebugMode) {
//       print("After submit image url: $imageUrl");
//     }
//   }
//
//
//   Future updateUserPetInfoData(docid, Map<String, dynamic> data) {
//     return db.collection('lfPets').doc(docid).update(data);
//   }
//
//   void updatePetTextInfo({
//     uid,
//     required context,
//     required controller,
//     required maptitle,
//   }) async {
//     Map<String, dynamic> value = {};
//     value[maptitle] = controller.text;
//     await updateUserPetInfoData(uid, value);
//     controller.clear();
//     Navigator.of(context).pop();
//   }
//
//   Stream<QuerySnapshot> isAlreadyblockedThisUser(uid, blocID) {
//     return db
//         .collection('pendingBlockList')
//         .where('claim_id', isEqualTo: uid)
//         .where('block_id', isEqualTo: blocID)
//         .snapshots();
//   }
//
//   setBlockDataByUser(PendingBlockList pendingBlockList, context) async {
//     await db.collection('pendingBlockList').add(pendingBlockList.toJson());
//     Navigator.of(context).pop();
//   }
//
//   static Future<bool> checkUserInfoAvailableOrnot(uid) async {
//     DocumentSnapshot<Map<String, dynamic>?> doc =
//         await db.collection('users').doc(uid).get();
//     return doc.exists ? true : false;
//   }
//
// }
