import 'package:cloud_firestore/cloud_firestore.dart';


class CarouselRecord {
  List<dynamic>? carousel;


  DocumentReference? documentReference;
  CarouselRecord({
    this.carousel

  });
  CarouselRecord.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>?>? snapshot)
      : carousel = snapshot?.data()?["carousel"] ?? [];

  CarouselRecord.fromMap(Map<String, dynamic>? snapshot)
      : carousel = snapshot?["carousel"] ?? [];


  toJson() {
    return {
     'carousel': carousel,
      'timestamp': FieldValue.serverTimestamp(),
    };
  }
}
