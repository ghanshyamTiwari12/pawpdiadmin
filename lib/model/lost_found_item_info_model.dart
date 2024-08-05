import 'package:cloud_firestore/cloud_firestore.dart';

class LostFoundPetInfoModel {
  String? petName;
  String? petCategory;
  String? petGender;
  String? petColor;
  String? location;
  String? description;
  String? longitude;
  String? latitude;
  List<dynamic>? petImageUrl;
  String? postedId;
  String? petStatus;
  String? docID;
  bool? success;
  bool? review;
  Timestamp? timestamp;
  String? filterText;
  DocumentReference? documentReference;
  LostFoundPetInfoModel({
    this.petName,
    this.petImageUrl,
    this.petCategory,
    this.petGender,
    this.petColor,
    this.description,
    this.latitude,
    this.longitude,
    this.location,
    this.petStatus,
    this.postedId,
    this.success,
    this.review,
    this.timestamp,
    this.filterText,
    this.docID
  });
  LostFoundPetInfoModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>?>? snapshot)
      : petName = snapshot?.data()?['pet_name'] ?? "",
        petCategory = snapshot?.data()?['pet_category'] ?? "",
        petGender = snapshot?.data()?['pet_gender'] ?? "",
        petColor = snapshot?.data()?['pet_color'] ?? "",
        location = snapshot?.data()?['found_location'] ?? "",
        description = snapshot?.data()?['description'] ?? "",
        longitude = snapshot?.data()?['longitude'] ?? "",
        latitude = snapshot?.data()?['latitude'] ?? "",
        postedId = snapshot?.data()?['posted_id'] ?? "",
        petStatus = snapshot?.data()?['pet_status'] ?? "",
        success = snapshot?.data()?['success'] ?? false,
        review = snapshot?.data()?['review'] ?? false,
        docID = snapshot?.data()?['docID'] ?? "",
        timestamp = snapshot?.data()?['timestamp'] ?? Timestamp.now(),
        documentReference = snapshot?.reference,
        petImageUrl = snapshot?.data()?['image_url'] ?? [];

  LostFoundPetInfoModel.fromMap(Map<String, dynamic>? snapshot)
      : petName = snapshot?['pet_name'] ?? "",
        petCategory = snapshot?['pet_category'] ?? "",
        petGender = snapshot?['pet_gender'] ?? "",
        petColor = snapshot?['pet_color'] ?? "" ,
        location = snapshot?['found_location'] ?? "",
        description = snapshot?['description'] ?? "",
        latitude = snapshot?['latitude'] ?? "",
        longitude = snapshot?['longitude'] ?? "",
        postedId = snapshot?['posted_id'] ?? "",
        petStatus = snapshot?['pet_status'] ?? "",
        success = snapshot?['success'] ?? false,
        review = snapshot?['review'] ?? false,
        docID = snapshot?['docID'] ?? [],
        timestamp = snapshot?['timestamp'] ?? Timestamp.now(),
        petImageUrl = snapshot?['image_url'] ?? [];
  toJson() {
    return {
      'pet_name': petName,
      'pet_category': petCategory,
      'pet_gender': petGender,
      'pet_color' : petColor,
      'found_location': location,
      'latitude': latitude,
      'longitude': longitude,
      'description': description,
      'image_url': petImageUrl,
      'success': success,
      'posted_id': postedId,
      'review' : review,
      'pet_status': petStatus,
      'filter_text': filterText,
      'docID': docID,
      'timestamp': FieldValue.serverTimestamp(),
    };
  }
}
