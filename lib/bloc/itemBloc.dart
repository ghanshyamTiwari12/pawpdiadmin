// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/widgets.dart';
// import 'package:petfindernetwork/repository/itemInfoFirebaseProvider.dart';
// import 'package:rxdart/rxdart.dart';
//
// class PetBloc {
//   final String petstatus;
//   PetBloc(this.petstatus) {
//     petInfoFirebaseProvider = PetInfoFirebaseProvider(petstatus);
//     showIndicatorController = BehaviorSubject<bool>();
//     petController = BehaviorSubject<List<DocumentSnapshot>?>();
//   }
//
//   late PetInfoFirebaseProvider petInfoFirebaseProvider;
//   bool showIndicator = false;
//   List<DocumentSnapshot>? documentList;
//   late BehaviorSubject<List<DocumentSnapshot>?> petController;
//   late BehaviorSubject<bool> showIndicatorController;
//   Stream get getShowIndicatorStream => showIndicatorController.stream;
//   Stream<List<DocumentSnapshot>?> get petStream => petController.stream;
//
//   Future fetchFirstList() async {
//     try {
//       documentList = await petInfoFirebaseProvider.fetchFirstList();
//       if(!petController.isClosed){
//         petController.sink.add(documentList);
//         try {
//           if (documentList!.isEmpty) {
//             petController.sink.addError("No Data Available");
//           }
//         } catch (e) {
//           debugPrint(e.toString());
//         }
//       }
//       } on SocketException {
//       petController.sink.addError(const SocketException("No Internet Connection"));
//     } catch (e) {
//       debugPrint(e.toString());
//       petController.sink.addError(e);
//     }
//     //Comment After internal testing, these were the earlier code, I added the if(!petController.isClosed)
//
//     //   petController.sink.add(documentList);
//     //   try {
//     //     if (documentList!.isEmpty) {
//     //       petController.sink.addError("No Data Available");
//     //     }
//     //   } catch (e) {
//     //     debugPrint(e.toString());
//     //   }
//     // } on SocketException {
//     //   petController.sink.addError(const SocketException("No Internet Connection"));
//     // } catch (e) {
//     //   debugPrint(e.toString());
//     //   petController.sink.addError(e);
//     // }
//   }
//
//   fetchNextMovies() async {
//     try {
//       updateIndicator(true);
//       final newDocumentList =
//           await petInfoFirebaseProvider.fetchNextList(documentList!);
//       documentList!.addAll(newDocumentList);
//       petController.sink.add(documentList);
//       try {
//         if (documentList!.isEmpty) {
//           petController.sink.addError("No Data Available");
//           updateIndicator(false);
//         }
//       } catch (e) {
//         updateIndicator(false);
//       }
//     } on SocketException {
//       petController.sink.addError(const SocketException("No Internet Connection"));
//       updateIndicator(false);
//     } catch (e) {
//       updateIndicator(false);
//       debugPrint(e.toString());
//       petController.sink.addError(e);
//     }
//   }
//
//   listentChangeofData() {
//     petInfoFirebaseProvider
//         .petListStream()
//         .listen((event) => onChangeData(event.docChanges));
//   }
//
//   void onChangeData(
//     List<DocumentChange> documentChanges,
//   ) {
//     var isChange = false;
//
//     for (var productChange in documentChanges) {
//       if (productChange.type == DocumentChangeType.removed) {
//         documentList?.removeWhere((product) {
//           return productChange.doc.id == product.id;
//         });
//         isChange = true;
//       }
//       else if (productChange.type == DocumentChangeType.added) {
//         if (documentList != null && !productChange.doc.metadata.isFromCache) {
//           // documentList!..insert(productChange.newIndex, productChange.doc);
//           documentList = [productChange.doc, ...documentList!];
//           // _products[productChange.newIndex]=productChange.document;
//         }
//         isChange = true;
//       }
//       else {
//         if (productChange.type == DocumentChangeType.modified) {
//           int indexWhere = documentList?.indexWhere((product) {
//             return productChange.doc.id == product.id;
//           }) ?? 0;
//           if (indexWhere >= 0) {
//             // documentList![indexWhere] = productChange.doc;
//             List<DocumentSnapshot<Map<String, dynamic>?>> newDocList = [];
//             var doclength = documentList?.length;
//
//             if(doclength != null){
//               for (int i = 0; i < doclength; i++) {
//                 if (i == indexWhere) {
//                   newDocList.add(productChange.doc
//                   as DocumentSnapshot<Map<String, dynamic>?>);
//                   continue;
//                 }
//                 newDocList.add(
//                     documentList![i] as DocumentSnapshot<Map<String, dynamic>?>);
//               }
//
//             }
//
//             documentList = newDocList;
//             isChange = true;
//           }
//         }
//       }
//     }
//
//     if (isChange) {
//       petController.sink.add(documentList);
//     }
//     //After internal testing
//     else
//     {
//
//     }
//     //After internal testing
//   }
//
//   Stream<DocumentSnapshot<Map<String, dynamic>?>?> getSinglePetStream(docid) {
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
//     // documentList?.clear();
//     // petController.close();
//     showIndicatorController.close();
//   }
// }
