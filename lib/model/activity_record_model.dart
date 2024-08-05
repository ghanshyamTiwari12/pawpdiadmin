import 'package:cloud_firestore/cloud_firestore.dart';

class ActivityRecord {
  List<dynamic>? activityRecord;
  String? activityType;
  String? date;
  String? time;
  List<dynamic>? milestoneRecord;
  List<dynamic>? images;


  DocumentReference? documentReference;
  ActivityRecord({
    this.activityType,
    this.date,
    this.time,
    this.activityRecord,
    this.documentReference,
    this.milestoneRecord,
    this.images

  });
  ActivityRecord.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>?>? snapshot)
      : activityType = snapshot?.data()?["activityType"] ?? "",
        date = snapshot?.data()?["date"] ?? "",
        documentReference = snapshot?.reference,
        time = snapshot?.data()?["time"] ?? "",
        activityRecord = snapshot?.data()?["activityRecord"] ?? [],
        milestoneRecord = snapshot?.data()?["milestoneRecord"] ?? [],
        images = snapshot?.data()?["images"] ?? [];


  ActivityRecord.fromMap(Map<String, dynamic>? snapshot)
      : activityType = snapshot?['activityType'] ?? "",
        date = snapshot?['date'] ?? "",
        time = snapshot?['time'] ?? "",
        activityRecord = snapshot?["activityRecord"] ?? [],
        milestoneRecord = snapshot?["milestoneRecord"] ?? [],
        images = snapshot?["images"] ?? [];


  toJson() {
    return {
      'activityType': activityType,
      'date': date,
      'time': time,
      'activityRecord': activityRecord,
      'milestoneRecord':milestoneRecord,
      'images': images,
      'timestamp': FieldValue.serverTimestamp(),
    };
  }
}

