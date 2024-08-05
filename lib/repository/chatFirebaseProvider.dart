// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:petfindernetwork/model/chatModelMessage.dart';
//
// class ChatFireBaseRepository {
//   late FirebaseFirestore db;
//   ChatFireBaseRepository() {
//     db = FirebaseFirestore.instance;
//   }
//
//   String chatMessageEndPoint(String userId, String clientId) {
//     if (userId.compareTo(clientId) == 1) {
//       return userId + clientId;
//     }
//     if (userId.compareTo(clientId) == 0) {
//       return '';
//     }
//     if (userId.compareTo(clientId) == -1) {
//       return clientId + userId;
//     }
//     // else{
//     //   return clientId+userId;
//     // }
//     return "";
//   }
//
//   Stream<QuerySnapshot>? getChatMessageStream(docId) {
//     //qbaWZzR5lYX2YMiDEjutZUtBl4m2
//     //4OiF6nqFH7c8tfWJxmVvXOP8n9S2
//     return db
//         .collection('chat')
//         .doc(docId)
//         .collection('messages')
//         .orderBy('timestamp', descending: true)
//         .snapshots();
//   }
//
//   Future<List<DocumentSnapshot>> fetchInitialChatList(docId) async {
//     return (await FirebaseFirestore.instance
//             .collection("chat")
//             .doc(docId)
//             .collection('messages')
//             .orderBy('timestamp', descending: true)
//             .limit(100)
//             .get())
//         .docs;
//   }
//
//   Future<List<DocumentSnapshot>> fetchPreviousChatList(
//       List<DocumentSnapshot> documentList, docId) async {
//     return (await FirebaseFirestore.instance
//             .collection("chat")
//             .doc(docId)
//             .collection('messages')
//             .orderBy('timestamp', descending: true)
//             .startAfterDocument(documentList[documentList.length - 1])
//             .limit(100)
//             .get())
//         .docs;
//   }
//
//   Stream<DocumentSnapshot>? getchatRoomCreatedOrnotStream(docId) {
//     return db.collection('chat').doc(docId).snapshots();
//   }
//
//   Future<void>? createChatRoomOfTwoUser(documentId, userId, clientId) {
//     return db.collection('chat').doc(documentId).set({
//       // userId.toString():true,
//       // clientId.toString():true,
//       'chatting_user':
//           FieldValue.arrayUnion([userId.toString(), clientId.toString()])
//     });
//   }
//
//   Future<void>? setLastMessage(documentId, lastMessage) {
//     return db.collection('chat').doc(documentId).set({
//       'timestamp': FieldValue.serverTimestamp(),
//       'last_message': lastMessage ?? ""
//     }, SetOptions(merge: true));
//   }
//
//   Future<DocumentReference>? sendChatMessage(
//       {required ChatModelMessage modelMessage, documentId}) {
//     return db
//         .collection('chat')
//         .doc(documentId)
//         .collection('messages')
//         .add(modelMessage.toJson());
//   }
//
//   Stream<QuerySnapshot>? getMychat(userId) {
//     //return db.collection('chat').where(userId,isEqualTo: true).orderBy('timestamp',descending: true).snapshots();
//     return db
//         .collection('chat')
//         .where('chatting_user', arrayContains: userId)
//         .orderBy('timestamp', descending: true)
//         .snapshots();
//   }
// }
