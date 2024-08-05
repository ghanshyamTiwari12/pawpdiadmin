
import 'package:cloud_firestore/cloud_firestore.dart';
class RegisteredPetApi{
  static FirebaseFirestore userFirestore = FirebaseFirestore.instance;

  static Stream<QuerySnapshot> registeredPet(String userId){
    return   userFirestore.collection('registeredPet').where("userUid", isEqualTo:userId ).snapshots();
  }
  
}