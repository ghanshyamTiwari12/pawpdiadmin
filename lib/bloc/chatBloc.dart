//
//
// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:petfindernetwork/repository/chatFirebaseProvider.dart';
// import 'package:rxdart/rxdart.dart';
// import 'dart:developer';
//
// class ChatBloc {
//   late ChatFireBaseRepository _chatFireBaseRepository;
//   bool showIndicator = false;
//   late BehaviorSubject<List<DocumentSnapshot>?> chatMessageController;
//   late BehaviorSubject<bool> showIndicatorController;
//   List<DocumentSnapshot>? documentList;
//   ChatBloc() {
//     _chatFireBaseRepository = ChatFireBaseRepository();
//     showIndicatorController = BehaviorSubject<bool>();
//     chatMessageController = BehaviorSubject<List<DocumentSnapshot>?>();
//   }
//
//   Stream get getShowIndicatorStream => showIndicatorController.stream;
//   Stream<List<DocumentSnapshot>?> get chattream => chatMessageController.stream;
//
//   Future fetchInitialChatList(docId) async {
//     try {
//       documentList = await _chatFireBaseRepository.fetchInitialChatList(docId);
//       //  print(documentList);
//       chatMessageController.sink.add(documentList);
//       try {
//         if (documentList!.isEmpty) {
//           chatMessageController.sink.addError("No Data Available");
//         }
//       } catch (e) {
//         debugPrint(e.toString());
//       }
//     } on SocketException {
//       chatMessageController.sink
//           .addError(const SocketException("No Internet Connection"));
//     } catch (e) {
//       debugPrint(e.toString());
//       chatMessageController.sink.addError(e);
//     }
//   }
//
//   fetchPreviousChatList(docId) async {
//     try {
//       updateIndicator(true);
//       List<DocumentSnapshot> newDocumentList = await _chatFireBaseRepository
//           .fetchPreviousChatList(documentList!, docId);
//       documentList!.addAll(newDocumentList);
//       chatMessageController.sink.add(documentList);
//       try {
//         if (documentList!.isEmpty) {
//           chatMessageController.sink.addError("No Data Available");
//           updateIndicator(false);
//         }
//       } catch (e) {
//         updateIndicator(false);
//       }
//     } on SocketException {
//       chatMessageController.sink
//           .addError(const SocketException("No Internet Connection"));
//       updateIndicator(false);
//     } catch (e) {
//       updateIndicator(false);
//       debugPrint(e.toString());
//       chatMessageController.sink.addError(e);
//     }
//   }
//
//   listentChangeofData(docId) {
//     _chatFireBaseRepository
//         .getChatMessageStream(docId)!
//         .listen((event) => onChangeData(event.docChanges));
//   }
//
//   void onChangeData(
//     List<DocumentChange<Object?>> documentChanges,
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
//           try {
//             // documentList!..insert(productChange.newIndex, productChange.doc);
//             documentList = [productChange.doc, ...documentList!];
//           } catch (e) {
//             log(e.toString());
//           }
//           // _products[productChange.newIndex]=productChange.document;
//
//         }
//         isChange = true;
//       } else {
//         if (productChange.type == DocumentChangeType.modified) {
//           int indexWhere = documentList!.indexWhere((product) {
//             return productChange.doc.id == product.id;
//           });
//           if (indexWhere >= 0) {
//             documentList![indexWhere] = productChange.doc;
//           }
//           isChange = true;
//         }
//       }
//     }
//
//     if (isChange) {
//       chatMessageController.sink.add(documentList);
//     }
//   }
//
//   updateIndicator(bool value) async {
//     showIndicator = value;
//     showIndicatorController.sink.add(value);
//   }
//
//   void dispose() {
//     chatMessageController.close();
//     showIndicatorController.close();
//   }
// }