import 'package:cloud_firestore/cloud_firestore.dart';

class BookServiceModel{
  List<dynamic>? appointmentRecord;
  String? userID;
  String? professionalID;
  String? serviceProviderName;
  String? serviceType;
  String? userName;
  String? appointmentDate;
  String? appointmentTime;
  String? appointmentID;
  String? description;
  bool? orderApprove;
  bool? isOrderCompleted;
  bool? orderCancel;
  String? cancelReason;
  bool? rating1;
  bool? rating2;
  bool? rating3;
  bool? rating4;
  bool? rating5;

  BookServiceModel({
    this.appointmentRecord,
    this.userID,
    this.professionalID,
    this.serviceProviderName,
    this.serviceType,
    this.userName,
    this.appointmentDate,
    this.appointmentTime,
    this.appointmentID,
    this.description,
    this.orderApprove,
    this.isOrderCompleted,
    this.orderCancel,
    this.cancelReason,
    this.rating1,
    this.rating2,
    this.rating3,
    this.rating4,
    this.rating5
  });


  BookServiceModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>? >snapshot )
  :         appointmentRecord = snapshot.data()?["appointmentRecord"] ?? [],
        userID= snapshot.data()?['userID'] ?? '' ,
        professionalID = snapshot.data()?['professionalID'] ?? '',
        serviceType = snapshot.data()?['serviceType'] ?? '',
        userName = snapshot.data()?['userName'] ?? '' ,
        appointmentDate = snapshot.data()?['appointmentDate'] ?? '',
        appointmentTime = snapshot.data()?['appointmentTime'] ?? '',
        appointmentID = snapshot.data()?['appointmentID'] ?? '',
        description = snapshot.data()?['description'] ?? '',
        orderApprove = snapshot.data()?['orderApprove'] ?? false,
        isOrderCompleted = snapshot.data()?['isOrderCompleted'] ?? false,
        orderCancel = snapshot.data()?['orderCancel'] ?? false,
        rating1 = snapshot.data()?['rating1'] ?? false,
        rating2 = snapshot.data()?['rating2'] ?? false,
        rating3 = snapshot.data()?['rating3'] ?? false,
        rating4 = snapshot.data()?['rating4'] ?? false,
        rating5 = snapshot.data()?['rating5'] ?? false,
      cancelReason = snapshot.data()?['cancelReason'] ?? '',
        serviceProviderName = snapshot.data()?['serviceProviderName'] ?? '';



  factory BookServiceModel.fromJson(Map<String, dynamic> json){
    return BookServiceModel(
        appointmentRecord : json['appointmentRecord'],
        userID: json['userID'],
        professionalID: json['professionalID'],
        serviceType: json['serviceType'],
        serviceProviderName: json['serviceProviderName'],
        userName : json['userName'],
        appointmentDate : json['appointmentDate'],
        appointmentTime : json['appointmentTime'],
        description : json['description'],
        orderApprove : json['orderApprove'],
      appointmentID: json['appointmentID'],
        isOrderCompleted : json['isOrderCompleted'],
        orderCancel: json['orderCancel'],
        cancelReason: json['cancelReason'],
        rating1: json['rating1'],
      rating2: json['rating2'],
      rating3: json['rating3'],
      rating4: json['rating4'],
      rating5: json['rating5'],
    );
  }

  BookServiceModel.fromMap(Map<String, dynamic> ? snapshot)
  : appointmentRecord = snapshot?['appointmentRecord'] ?? [],
        userID = snapshot?['userID'] ?? '',
        professionalID = snapshot?['professionalID'] ?? '',
        serviceType = snapshot?['serviceType'] ?? '',
        userName = snapshot?['userName'] ?? '',
        appointmentDate = snapshot?['appointmentDate'] ?? '',
        appointmentTime = snapshot?['appointmentTime'] ?? '',
        description = snapshot?['description'] ?? '',
        appointmentID = snapshot?['appointmentID'] ?? '',
        orderApprove = snapshot?['orderApprove'] ?? false,
        isOrderCompleted = snapshot?['isOrderCompleted'] ?? false,
        orderCancel = snapshot?['orderCancel'] ?? false,
        rating1 = snapshot?['rating1'] ?? false,
        rating2 = snapshot?['rating2'] ?? false,
        rating3 = snapshot?['rating3'] ?? false,
        rating4 = snapshot?['rating4'] ?? false,
        rating5 = snapshot?['rating5'] ?? false,
      cancelReason = snapshot?['cancelReason'] ?? '',
        serviceProviderName = snapshot?['serviceProviderName'] ?? '' ;

  toJson(){
   return{
  'appointmentRecord': appointmentRecord,
   'userID': userID,
   'professionalID' : professionalID,
     'serviceType' : serviceType,
    'serviceProviderName': serviceProviderName,
     'userName': userName,
     'appointmentDate': appointmentDate,
     'appointmentTime': appointmentTime,
     'description': description,
     'orderApprove': orderApprove,
     'isOrderCompleted': isOrderCompleted,
     'appointmentID': appointmentID,
     'orderCancel': orderCancel,
     'cancelReason': cancelReason,
     'rating1': rating1,
     'rating2': rating2,
     'rating3': rating3,
     'rating4': rating4,
     'rating5': rating5
  };
  }
}





