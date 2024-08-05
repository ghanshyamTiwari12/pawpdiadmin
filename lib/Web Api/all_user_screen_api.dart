
import 'package:cloud_firestore/cloud_firestore.dart';

class AllUserScreenApi{

  static FirebaseFirestore userFirestore = FirebaseFirestore.instance;



  static Stream<QuerySnapshot>  getUser() {
    return userFirestore.collection('users').where('isProfessional', isEqualTo: false)
                .snapshots();
  }

  static Stream<QuerySnapshot> verifiedProfessional(){
    return userFirestore.collection('users').where('isProfessional', isEqualTo: true).
         where("isProfessionalVerified", isEqualTo: true).snapshots();
  }

 static Stream<QuerySnapshot> unVerifiedProfessional(){
    return userFirestore.collection('users').
    where('isProfessional', isEqualTo: true).
    where("isProfessionalVerified", isEqualTo: false ).snapshots();
  }


  static Stream<QuerySnapshot> unVerifiedVet(){
    return userFirestore.collection('users').
    where('isProfessional', isEqualTo: true).where('professionalType', isEqualTo: "Veterinarian").
    where("isProfessionalVerified", isEqualTo: false ).snapshots();
  }

  static Stream<QuerySnapshot> verifiedVet(){
    return userFirestore.collection('users').
    where('isProfessional', isEqualTo: true).where('professionalType', isEqualTo: "Veterinarian").
    where("isProfessionalVerified", isEqualTo: true ).snapshots();
  }

  static Stream<QuerySnapshot> unVerifiedTrainer(){
    return userFirestore.collection('users').
    where('isProfessional', isEqualTo: true).where('professionalType', isEqualTo: "Trainer").
    where("isProfessionalVerified", isEqualTo: false ).snapshots();
  }

  static Stream<QuerySnapshot> verifiedTrainer(){
    return userFirestore.collection('users').
    where('isProfessional', isEqualTo: true).where('professionalType', isEqualTo: "Trainer").
    where("isProfessionalVerified", isEqualTo: true ).snapshots();
  }

  static Stream<QuerySnapshot> deletedUser(){
    return userFirestore.collection("deletedUser").snapshots();
  }

  static Stream<QuerySnapshot> unVerifiedPetWalker(String professionalType){
    return userFirestore.collection('users').
    where('isProfessional', isEqualTo: true).where('professionalType', isEqualTo: professionalType.toString()).
    where("isProfessionalVerified", isEqualTo: false ).snapshots();
  }

  static Stream<QuerySnapshot> unVerifiedGroomer(){
    return userFirestore.collection('users').
    where('isProfessional', isEqualTo: true).where('professionalType', isEqualTo: "Groomer").
    where("isProfessionalVerified", isEqualTo: false ).snapshots();
  }

  static Stream<QuerySnapshot> verifiedPetWalker(String professionalType){
    return userFirestore.collection('users').
    where('isProfessional', isEqualTo: true).where('professionalType', isEqualTo: professionalType).
    where("isProfessionalVerified", isEqualTo: true ).snapshots();
  }

  static Stream<QuerySnapshot> verifiedGroomer(){
    return userFirestore.collection('users').
    where('isProfessional', isEqualTo: true).where('professionalType', isEqualTo: "Groomer").
    where("isProfessionalVerified", isEqualTo: true ).snapshots();
  }

}