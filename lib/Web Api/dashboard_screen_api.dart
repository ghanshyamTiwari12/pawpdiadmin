
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DashboardScreenApi extends ChangeNotifier{

  // CollectionReference collectionInstance = FirebaseFirestore.instance.collection("users");
  static FirebaseFirestore userFirestore = FirebaseFirestore.instance;

  var _totalUsers = 0;
  get totalUsers => _totalUsers;

  var _users = 0;
  get users => _users;

  var _totalProfessional = 0;
  get totalProfessional => _totalProfessional;

  var _deletedUsers = 0;
  get deletedUsers => _deletedUsers;

  var _totalLostPet = 0;
  get totalLostPet => _totalLostPet;

  var _totalFoundtPet = 0;
  get totalFoundtPet => _totalFoundtPet;

  var _verifiedProfessional = 0;
  get verifiedProfessional => _verifiedProfessional;

  var _unVerifiedProfessional = 0;
  get unVerifiedProfessional => _unVerifiedProfessional;

  var _totalVet = 0;
  get totalVet => _totalVet;

  var _totalTrainer = 0;
  get totalTrainer => _totalTrainer;

  var _totalPetWalker = 0;
  get totalPetWalker => _totalPetWalker;

  var _totalGroomer = 0;
  get totalGroomer => _totalGroomer;

  var _verifiedVet = 0;
  get verifiedVet => _verifiedVet;

  var _verifiedTrainer = 0;
  get verifiedTrainer => _verifiedTrainer;

  var _verifiedPetWalker = 0;
  get verifiedPetWalker => _verifiedPetWalker;

  var _verifiedGroomer = 0;
  get verifiedGroomer => _verifiedGroomer;


  var _verifiedLostPet = 0;
  get verifiedLostPet => _verifiedLostPet;

  var _verifiedFoundtPet = 0;
  get verifiedFoundtPet => _verifiedFoundtPet;

  allUser() async {
    var countUser =  userFirestore.collection("users").count().get().then((value) => value.count) ;
    _totalUsers = await countUser as int;
    notifyListeners();
    // return await countUser ;
  }

   user() async {
    var user =  userFirestore.collection("users").where("isProfessional", isEqualTo:false) .count().get().then((value) => value.count) ;
    _users = await user as int;
    notifyListeners();
   }

  allProfessional() async {
    var countProfessional =  userFirestore.collection("users").where("isProfessional", isEqualTo:true) .count().get().then((value) => value.count) ;
    _totalProfessional = await countProfessional as int;
    notifyListeners();
  }
   delUsers() async {
    var delUser =  userFirestore.collection("deletedUser").count().get().then((value) => value.count) ;
    _deletedUsers = await delUser as int;
    notifyListeners();
  }

   allLostPet() async {
    var lostPet =  userFirestore.collection("lfPets").where("pet_status", isEqualTo: "lost") .count().get().then((value) => value.count) ;
    _totalLostPet = await lostPet as int ;
    notifyListeners();
   }

   allFoundtPet() async {
    var foundPet =  userFirestore.collection("lfPets").where("pet_status", isEqualTo: "found") .count().get().then((value) => value.count) ;
    _totalFoundtPet = await foundPet as int;
    notifyListeners();
  }

  reviewedProfessional() async {
    var verifiedProfessional =  userFirestore.collection("users").where("isProfessional", isEqualTo:true,).
    where("isIdVerified", isEqualTo: true).
    where("isDocVerified", isEqualTo: true)
        .count().get().then((value) => value.count) ;
    _verifiedProfessional = await verifiedProfessional as int;
    notifyListeners();
  }

  allVet() async {
    var countProfessional =  userFirestore.collection("users").where("isProfessional", isEqualTo:true)
        .where("professionalType", isEqualTo: "Veterinarian")
        .count().get().then((value) => value.count) ;
    _totalVet = await countProfessional as int;
    notifyListeners();
  }

  allTrainer() async {
    var countProfessional =  userFirestore.collection("users").where("isProfessional", isEqualTo:true)
        .where("professionalType", isEqualTo: "Trainer")
        .count().get().then((value) => value.count) ;
    _totalTrainer = await countProfessional as int;
    notifyListeners();
      }

  allPetWalker() async {
    var countProfessional =  userFirestore.collection("users").where("isProfessional", isEqualTo:true)
        .where("professionalType", isEqualTo: "Pet Walker")
        .count().get().then((value) => value.count) ;
    _totalPetWalker = await countProfessional as int;
    notifyListeners();
  }

  allGroomer() async {
    var countProfessional =  userFirestore.collection("users").where("isProfessional", isEqualTo:true)
        .where("professionalType", isEqualTo: "Groomer")
        .count().get().then((value) => value.count) ;
    _totalGroomer = await countProfessional as int;
    notifyListeners();
  }



      totalVerifiedVet() async {
        var verifiedVet =  userFirestore.collection("users").
        where("isProfessional", isEqualTo:true)
            .where("professionalType", isEqualTo: "Veterinarian").
        where("isIdVerified", isEqualTo: true).
        where("isDocVerified", isEqualTo: true)
            .count().get().then((value) => value.count) ;
        _verifiedVet = await verifiedVet as int;
        notifyListeners();
      }

  totalVerifiedTrainer() async {
    var verifiedVet =  userFirestore.collection("users").
    where("isProfessional", isEqualTo:true)
        .where("professionalType", isEqualTo: "Trainer").
    where("isIdVerified", isEqualTo: true).
    where("isDocVerified", isEqualTo: true)
        .count().get().then((value) => value.count) ;
    _verifiedTrainer = await verifiedVet as int;
    notifyListeners();
  }

  totalVerifiedPetWalker() async {
    var verifiedVet =  userFirestore.collection("users").
    where("isProfessional", isEqualTo:true)
        .where("professionalType", isEqualTo: "Pet Walker").
    where("isIdVerified", isEqualTo: true).
    where("isDocVerified", isEqualTo: true)
        .count().get().then((value) => value.count) ;
    _verifiedPetWalker = await verifiedVet as int;
    notifyListeners();
  }


  totalVerifiedGroomer() async {
    var verifiedVet =  userFirestore.collection("users").
    where("isProfessional", isEqualTo:true)
        .where("professionalType", isEqualTo: "Groomer").
    where("isIdVerified", isEqualTo: true).
    where("isDocVerified", isEqualTo: true)
        .count().get().then((value) => value.count) ;
    _verifiedGroomer = await verifiedVet as int;
    notifyListeners();
  }


  reviewedLostPet() async {
    var verifiedlostPet =  userFirestore.collection("lfPets")
        .where("pet_status", isEqualTo: "lost")
        .where("review", isEqualTo: true)
        .count().get().then((value) => value.count) ;
    _verifiedLostPet = await verifiedlostPet as int ;
    notifyListeners();
  }

  reviewedFoundtPet() async {
    var reviewedFoundPet =  userFirestore.collection("lfPets")
        .where("pet_status", isEqualTo: "found")
        .where("review", isEqualTo: true)
        .count().get().then((value) => value.count) ;
    _verifiedFoundtPet = await reviewedFoundPet as int;
    notifyListeners();
  }

}