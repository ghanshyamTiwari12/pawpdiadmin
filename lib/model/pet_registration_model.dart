
import 'package:cloud_firestore/cloud_firestore.dart';

class PetRegistrationModel {
  String? id;
  String? userUid;
  String? petCategory;
  String? petGender;
  String? petSize;
  String? dob;
  String? petName;
  String? petBreed;
  String? profilephotoImageUrl;

  PetRegistrationModel(  {
    this.id,
    this.userUid,
    this.petCategory,
    this.petGender,
    this.petSize,
    this.dob,
    this.petName,
    this.petBreed,
    this.profilephotoImageUrl
  });
  PetRegistrationModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>?>? snapshot)
      : id = snapshot?.data()?['id'] ?? "",
        userUid = snapshot?.data()?['userUid'] ?? "",
        petCategory = snapshot?.data()?['pet_category'] ?? "",
        petGender = snapshot?.data()?['pet_gender'] ?? "",
        petSize = snapshot?.data()?['pet_size'] ?? "",
        dob = snapshot?.data()?['dob'] ?? "",
        petName = snapshot?.data()?['pet_name'] ?? "",
        petBreed = snapshot?.data()?['pet_breed'] ?? "",
        profilephotoImageUrl = snapshot?.data()?['profile_image_url'] ?? "";

        PetRegistrationModel.fromMap(Map<String, dynamic>? snapshot)
      :       id = snapshot?['id'] ?? "",
              userUid = snapshot?['userUid'] ?? "",
              petCategory = snapshot?['pet_category'] ?? "",
              petGender = snapshot?['pet_gender'] ?? "",
              petSize = snapshot?['pet_size'] ?? "",
              dob = snapshot?['dob'] ?? "",
              petName = snapshot?['pet_name'] ?? "",
              petBreed = snapshot?['pet_breed'] ?? "",
              profilephotoImageUrl = snapshot?['profile_image_url'] ?? "";

  toJson() {
    return {
      'id': id,
      'userUid': userUid,
      'pet_category': petCategory,
      'pet_gender': petGender,
      'pet_size': petSize,
      'dob': dob,
      'pet_name': petName,
      'pet_breed': petBreed,
      'profile_image_url': profilephotoImageUrl,
    };
  }
}
