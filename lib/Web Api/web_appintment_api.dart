import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AppointmentApi extends ChangeNotifier{
  static FirebaseFirestore userFirestore = FirebaseFirestore.instance;
  
  var _totalProfessionalAppointment = 0;
  get totalProfessionalAppointment => _totalProfessionalAppointment;

  var _totalPendingAppointment = 0;
  get totalPendingAppointment => _totalPendingAppointment;

  var _totalInProcessOrder = 0;
  get totalInProcessOrder => _totalInProcessOrder;


  var _totalCompletedOrder = 0;
  get totalCompletedOrder => _totalCompletedOrder;

  var _totalCancelOrder = 0;
  get totalCancelOrder => _totalCancelOrder;


 num _averageRating = 0;
 get averageRating => _averageRating;

  static Stream<QuerySnapshot> userAppointmentList(String userID){
  return userFirestore.collection("appointment")
      .where("userID", isEqualTo:  userID).snapshots();
}

 static Stream<QuerySnapshot> professionalAppointmentList(String professionalUserId){
    return userFirestore.collection("appointment")
        .where("professionalID", isEqualTo:  professionalUserId).snapshots();
  }


  allAppointmentUser(String professionalUserId) async {
    var countAppointment =  userFirestore.collection("appointment").where("professionalID", isEqualTo:professionalUserId) .count().get().then((value) => value.count) ;
    _totalProfessionalAppointment = await countAppointment as int;
    notifyListeners();
  }

 allInProcessAppointment(String professionalUserId ) async{
   var inProcessAppointment =  userFirestore.collection("appointment")
       .where("professionalID", isEqualTo:professionalUserId)
       .where("orderApprove", isEqualTo: true)
       .where("isOrderCompleted", isEqualTo: false)
       .count().get().then((value) => value.count) ;
   _totalInProcessOrder = await inProcessAppointment as int;
   notifyListeners();
     }

  allCompletedAppointment(String professionalUserId ) async{
    var completedAppointment =  userFirestore.collection("appointment")
        .where("professionalID", isEqualTo:professionalUserId)
        .where("isOrderCompleted", isEqualTo: true)
        .count().get().then((value) => value.count) ;
    _totalCompletedOrder = await completedAppointment as int;
    notifyListeners();
  }


  allCancelAppointment(String professionalUserId ) async{
    var cancelAppointment =  userFirestore.collection("appointment")
        .where("professionalID", isEqualTo:professionalUserId)
        .where("orderCancel", isEqualTo: true)
        .count().get().then((value) => value.count) ;
    _totalCancelOrder = await cancelAppointment as int;
    notifyListeners();
  }

  rating(String professionalUserId) async {
    final userExit = await FirebaseFirestore.instance.collection('users').doc(professionalUserId).get();
    if(userExit.exists){
      Map<String, dynamic>? data = userExit.data();
      var value = data?['average'];
      if(value == null){
        _averageRating = 0;
      } else{
        _averageRating = value;
      }
      notifyListeners();
    }
    notifyListeners();
  }

  static Stream<QuerySnapshot>  pendingAppointmentList(String userID) {
    return userFirestore.collection('appointment').where('professionalID', isEqualTo: userID)
        .where("orderApprove", isEqualTo: false).where("orderCancel", isEqualTo: false)
        .snapshots();
  }

  static Stream<QuerySnapshot>  inProcessAppointmentList(String userID) {
    return userFirestore.collection('appointment').where('professionalID', isEqualTo: userID)
        .where("orderApprove", isEqualTo: true).where("isOrderCompleted", isEqualTo: false)
        .snapshots();
  }

  static Stream<QuerySnapshot>  completedAppointmentList(String userID) {
    return userFirestore.collection('appointment').where('professionalID', isEqualTo: userID)
        .where("isOrderCompleted", isEqualTo: true)
        .snapshots();
  }

  static Stream<QuerySnapshot>  cancelAppointmentList(String userID) {
    return userFirestore.collection('appointment').where('professionalID', isEqualTo: userID)
        .where("orderCancel", isEqualTo: true)
        .snapshots();
  }

}