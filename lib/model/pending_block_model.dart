import 'package:cloud_firestore/cloud_firestore.dart';

class PendingBlockList{
  String? claimId;
  String? blockId;
  var timestamp;
  String? text;
  PendingBlockList({this.claimId,this.blockId,this.timestamp,this.text});
  PendingBlockList.fromDocumentSnapshot(DocumentSnapshot<Map<String,dynamic>> snapshot):
  claimId=snapshot.data()!['claim_id']??"",
  blockId=snapshot.data()!['block_id']??"",
  text=snapshot.data()!['text']??"",
  timestamp=snapshot.data()!['timestamp'];
  
 toJson(){
    return {
      'claim_id':claimId,
      'block_id':blockId,
      'text':text,
      'timestamp':timestamp
    };
  }
}