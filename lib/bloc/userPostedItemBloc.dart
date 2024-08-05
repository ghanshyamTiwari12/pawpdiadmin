// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/widgets.dart';
// import 'package:petfindernetwork/repository/userRepo.dart';
// import 'package:rxdart/rxdart.dart';
//
// class UserPostedPetBloc {
//   bool showIndicator = false;
//   late BehaviorSubject<List<DocumentSnapshot<Map<String, dynamic>?>>?> userPosteduserPostedPetController;
//   late BehaviorSubject<bool> showIndicatorController;
//   List<DocumentSnapshot<Map<String, dynamic>?>>? documentList;
//   late UserRepo _userRepo;
//   Stream get getShowIndicatorStream => showIndicatorController.stream;
//   Stream<List<DocumentSnapshot<Map<String, dynamic>?>>?> get petStream => userPosteduserPostedPetController.stream;
//
//   UserPostedPetBloc() {
//     _userRepo = UserRepo();
//     showIndicatorController = BehaviorSubject<bool>();
//     userPosteduserPostedPetController = BehaviorSubject<List<DocumentSnapshot<Map<String, dynamic>?>>?>();
//   }
//
//   Future fetchFirstList(uid) async {
//     try {
//       documentList = await _userRepo.fetchUserPostedPetsFirstList(uid);
//       //  print(documentList);
//       userPosteduserPostedPetController.sink.add(documentList);
//       try {
//         if (documentList!.isEmpty) {
//           userPosteduserPostedPetController.sink.addError("No Data Available");
//         }
//       } catch (e) {
//         debugPrint(e.toString());
//       }
//     } on SocketException {
//       userPosteduserPostedPetController.sink.addError(const SocketException("No Internet Connection"));
//     } catch (e) {
//       debugPrint(e.toString());
//       userPosteduserPostedPetController.sink.addError(e);
//     }
//   }
//
//   fetchNextMovies(uid) async {
//     try {
//       updateIndicator(true);
//       List<DocumentSnapshot<Map<String, dynamic>?>> newDocumentList = await _userRepo.fetchUserPostedPetsNextList(uid, documentList!);
//       documentList!.addAll(newDocumentList);
//       userPosteduserPostedPetController.sink.add(documentList);
//       try {
//         if (documentList!.isEmpty) {
//           userPosteduserPostedPetController.sink.addError("No Data Available");
//           updateIndicator(false);
//         }
//       } catch (e) {
//         updateIndicator(false);
//       }
//     } on SocketException {
//       userPosteduserPostedPetController.sink
//           .addError(const SocketException("No Internet Connection"));
//       updateIndicator(false);
//     } catch (e) {
//       updateIndicator(false);
//       debugPrint(e.toString());
//       userPosteduserPostedPetController.sink.addError(e);
//     }
//   }
//
//   listentChangeofData(uid) {
//     _userRepo
//         .getUserPostedPetsStream(uid)
//         .listen((event) => onChangeData(event.documentChanges));
//   }
//
//   void onChangeData(
//     List<DocumentChange<Map<String, dynamic>?>> documentChanges,
//   ) {
//     var isChange = false;
//     for (var productChange in documentChanges) {
//       if (productChange.type == DocumentChangeType.removed) {
//         documentList!.removeWhere((product) {
//           return productChange.doc.id == product.id;
//         });
//         isChange = true;
//       } else if (productChange.type == DocumentChangeType.added) {
//         if (documentList != null) {
//           documentList!.insert(productChange.newIndex, productChange.doc);
//           // _products[productChange.newIndex]=productChange.document;
//         }
//         isChange = true;
//       } else {
//         if (productChange.type == DocumentChangeType.modified) {
//           int indexWhere = documentList!.indexWhere((product) {
//             return productChange.doc.id == product.id;
//           });
//
//           if (indexWhere >= 0) {
//             documentList![indexWhere] = productChange.doc;
//           }
//           isChange = true;
//         }
//       }
//     }
//
//     if (isChange) {
//       userPosteduserPostedPetController.sink.add(documentList);
//     }
//   }
//
//   Stream<DocumentSnapshot> getSinglePetStream(docid) {
//     return FirebaseFirestore.instance
//         .collection("lfPets")
//         .doc(docid)
//         .snapshots();
//   }
//
//   updateIndicator(bool value) async {
//     showIndicator = value;
//     showIndicatorController.sink.add(value);
//   }
//
//   void dispose() {
//     userPosteduserPostedPetController.close();
//     showIndicatorController.close();
//   }
// }
