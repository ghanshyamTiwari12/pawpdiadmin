import 'package:cloud_firestore/cloud_firestore.dart';

class LastMessageChatModel {
  String? lastMessage;
  Timestamp? timeStamp;
  List<dynamic>? connectedUserIds;
  LastMessageChatModel(
      {this.lastMessage, this.timeStamp, this.connectedUserIds});
  LastMessageChatModel.fromDocumentSnap(DocumentSnapshot snapshot)
      : lastMessage =
            (snapshot.data() as Map<String, dynamic>)['last_message'] ?? "",
        timeStamp = (snapshot.data() as Map<String, dynamic>)['timestamp'] ??
            Timestamp.now(),
        connectedUserIds =
            (snapshot.data() as Map<String, dynamic>)['chatting_user'] ?? [];
}
