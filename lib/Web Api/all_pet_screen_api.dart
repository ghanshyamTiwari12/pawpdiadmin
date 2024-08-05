
import 'package:cloud_firestore/cloud_firestore.dart';

class AllPetScreenApi{
  static FirebaseFirestore userFirestore = FirebaseFirestore.instance;

  // final fireStore =  FirebaseFirestore.instance.collection('lfPets').snapshots();

  static Stream<QuerySnapshot> unVerifiedLostPet(){
    return userFirestore.collection('lfPets').where('pet_status', isEqualTo: 'lost').
    where('review', isEqualTo: false).snapshots();
  }

  static Stream<QuerySnapshot> verifiedLostPet(){
    return userFirestore.collection('lfPets').where('pet_status', isEqualTo: 'lost').
    where('review', isEqualTo: true).snapshots();
  }

  static Stream<QuerySnapshot> unVerifiedFoundPet(){
    return userFirestore.collection('lfPets').where('pet_status', isEqualTo: 'found').
    where('review', isEqualTo: false).snapshots();
  }

  static Stream<QuerySnapshot> verifiedFoundPet(){
    return userFirestore.collection('lfPets').where('pet_status', isEqualTo: 'found').
    where('review', isEqualTo: true).snapshots();
  }

  static Stream<QuerySnapshot> userLostPet(String userId){
    return userFirestore.collection('lfPets').where('pet_status', isEqualTo: 'lost').
    where('posted_id', isEqualTo: userId).snapshots();
  }

  static Stream<QuerySnapshot> userFoundPet(String userId){
    return userFirestore.collection('lfPets').where('pet_status', isEqualTo: 'found').
    where('posted_id', isEqualTo: userId).snapshots();
  }
}