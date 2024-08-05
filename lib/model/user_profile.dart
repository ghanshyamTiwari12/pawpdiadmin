import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileModel {
  UserProfileModel
      ({
    this.uid,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.nidImageUrl,
    this.profilephotoImageUrl,
    this.idImageUrl,
    this.professionalImageUrl,
    this.isAdmin,
    this.isProfessional,
    this.isIdVerified,
    this.isDocVerified,
    this.isIdPending,
    this.isDocPending,
    this.isIdRejected,
    this.isDocRejected,
    this.location,
    this.professionalType,
    this.idType,
    this.isProfessionalVerified,
    this.professionalDocType,
    this.fiveStar,
    this.fourStar,
    this.threeStar,
    this.twoStar,
    this.oneStar,
    this.average
  });
  String? uid;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? profilephotoImageUrl;
  String? nidImageUrl;
  String? idImageUrl;
  String? professionalImageUrl;
  bool? isAdmin;
  bool? isProfessional;
  bool? isIdVerified;
  bool? isDocVerified;
  bool? isIdPending;
  bool? isDocPending;
  bool? isIdRejected;
  bool? isDocRejected;
  bool? isProfessionalVerified;
  String? location;
  String? professionalType;
  String? idType;
  String? professionalDocType;
  int? fiveStar;
  int? fourStar;
  int? threeStar;
  int? twoStar;
  int? oneStar;
  double? average;


  UserProfileModel.fromDocumentSnap(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : name = snapshot.data()?['name'] ?? "",
        uid = snapshot.data()?['uid'] ?? "",
        email = snapshot.data()?['email'] ?? "",
        phone = snapshot.data()?['phone'] ?? "",
        address = snapshot.data()?['address'] ?? "",
        profilephotoImageUrl = snapshot.data()?['profile_image_url'],
        nidImageUrl = snapshot.data()?['nid_image_url'],
        idImageUrl = snapshot.data()?['idImageUrl'],
        professionalImageUrl = snapshot.data()?['professionalImageUrl'],
        location = snapshot.data()?['location'] ?? "",
        professionalType = snapshot.data()?['professionalType'] ?? "",
        idType = snapshot.data()?['idType'] ?? '',
        professionalDocType = snapshot.data()?['professionalDocType'] ?? '',
        fiveStar = snapshot.data()?['fiveStar'] ?? 0,
        fourStar = snapshot.data()?['fourStar'] ?? 0,
        threeStar = snapshot.data()?['threeStar'] ?? 0,
        twoStar = snapshot.data()?['twoStar'] ?? 0,
        oneStar = snapshot.data()?['oneStar'] ?? 0,
        average = snapshot.data()?['average'] ?? 0.0,
        isAdmin= snapshot.data()?['isAdmin'] ?? false,
        isProfessional = snapshot.data()?['isProfessional'] ?? false,
        isIdVerified = snapshot.data()?['isIdVerified'] ?? false,
        isDocVerified = snapshot.data()?['isDocVerified'] ?? false,
        isIdPending = snapshot.data()?['isIdPending'] ?? false,
        isIdRejected = snapshot.data()?['isIdRejected'] ?? false,
        isDocRejected = snapshot.data()?['isDocRejected'] ?? false,
        isProfessionalVerified = snapshot.data()?['isProfessionalVerified'] ?? false,
        isDocPending = snapshot.data()?['isDocPending'] ?? false;


  factory UserProfileModel.fromJson(Map<String, dynamic> json)
  {
    return UserProfileModel(
        uid: json['uid'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        isAdmin:json['isAdmin'],
        isProfessional: json['isProfessional'],
        nidImageUrl: json['nid_image_url'],
        profilephotoImageUrl: json['profile_image_url'],
        idImageUrl: json['idImageUrl'],
        professionalImageUrl: json['professionalImageUrl'],
        address: json['address'],
        location: json['location'],
        professionalType: json['professionalType'],
        idType: json['idType'],
        professionalDocType: json['professionalDocType'],
        isIdVerified: json['isIdVerified'],
        isDocVerified: json['isDocVerified'],
        isIdPending: json['isIdPending'],
        isDocPending: json['isDocPending'],
        isIdRejected: json['isIdRejected'],
        isDocRejected: json['isDocRejected'],
      isProfessionalVerified: json['isProfessionalVerified'],
        fiveStar: json['fiveStar'],
        fourStar: json['fourStar'],
        threeStar: json['threeStar'],
        twoStar: json['twoStar'],
        oneStar: json['oneStar'],
        average: json['average'],
    );
  }


  UserProfileModel.fromMap(Map<String, dynamic>? snapshot)
      : name = snapshot?['name'] ?? "",
        uid = snapshot?['uid'] ?? "",
        email = snapshot?['email'] ?? "",
        phone = snapshot?['phone'] ?? "",
        address = snapshot?['address'] ?? "",
        profilephotoImageUrl = snapshot?['profile_image_url'] ?? "",
        nidImageUrl = snapshot?['nid_image_url'] ?? "",
        idImageUrl = snapshot?['idImageUrl'] ?? "",
        professionalImageUrl = snapshot?['professionalImageUrl'] ?? "",
        location = snapshot?['location'] ?? "",
        professionalType = snapshot?['professionalType'] ?? "",
        idType = snapshot?['idType'] ?? "",
        professionalDocType = snapshot?['professionalDocType'] ?? "" ,
        isAdmin= snapshot?['isAdmin'] ?? false,
        isProfessional = snapshot?['isProfessional'] ?? false,
        isIdVerified = snapshot?['isIdVerified'] ?? false,
        isDocVerified = snapshot?['isDocVerified'] ?? false,
        isIdPending = snapshot?['isIdPending'] ?? false,
        isIdRejected = snapshot?['isIdRejected'] ?? false,
        isProfessionalVerified = snapshot?['isProfessionalVerified'] ?? false,
        isDocRejected = snapshot?['isDocRejected'] ?? false,
        fiveStar = snapshot?['fiveStar'] ?? 0,
        fourStar = snapshot?['fourStar'] ?? 0,
        threeStar = snapshot?['threeStar'] ?? 0,
        twoStar = snapshot?['twoStar'] ?? 0,
        oneStar = snapshot?['oneStar'] ?? 0,
        average = snapshot?['average'] ?? 0.0,
        isDocPending = snapshot?['isDocPending'] ?? false;



  toJson() {
    return {
      "name": name,
       "uid": uid,
      'email': email,
      'phone': phone,
      'address': address,
      'profile_image_url': profilephotoImageUrl,
      'nid_image_url': nidImageUrl,
      'idImageUrl': idImageUrl,
      'professionalImageUrl' : professionalImageUrl,
      'isAdmin': isAdmin,
      'location': location,
      'isProfessional': isProfessional,
      'professionalType': professionalType,
      'idType' : idType,
      'professionalDocType': professionalDocType,
      'isIdVerified': isIdVerified,
      'isDocVerified': isDocVerified,
      'isIdPending' : isIdPending,
      'isDocPending' : isDocPending,
      'isIdRejected': isIdRejected,
      'isDocRejected': isDocRejected,
      'isProfessionalVerified': isProfessionalVerified,
      'fiveStar': fiveStar,
      'fourStar': fourStar,
      'threeStar': threeStar,
      'twoStar': twoStar,
      'oneStar': oneStar,
      'average': average
    };


  }



  UserProfileModel copyWith
      ({
    String? uid,
    String? name,
    String? email,
    String? phone,
    String? address,
    String? profilephotoImageUrl,
    String? nidImageUrl,
    String? idImageUrl,
    String?   professionalImageUrl,
    String? professionalType,
    bool? isAdmin,
    bool? isProfessional,
    bool? isIdVerified,
    bool? isDocVerified,
    bool? isIdPending,
    bool? isDocPending,
    bool? isIdRejected,
    bool? isDocRejected,
    bool? isProfessionalVerified,
    String? idType,
    String? professionalDocType,

  }) {


    return UserProfileModel(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        nidImageUrl: nidImageUrl ?? this.nidImageUrl,
        profilephotoImageUrl:  profilephotoImageUrl ?? this.nidImageUrl,
        idImageUrl: idImageUrl ?? this.idImageUrl,
        professionalImageUrl: professionalImageUrl ?? this.professionalImageUrl,
        isAdmin: isAdmin ?? this.isAdmin,
        isProfessional: isProfessional ?? this.isProfessional,
        professionalType: professionalType ?? this.professionalType,
        isIdVerified: isIdVerified ?? this.isIdVerified,
        isDocVerified: isDocVerified ?? this.isDocVerified,
        isIdPending: isIdPending ?? this.isIdPending,
        isDocPending: isDocPending ?? this.isDocPending,
        isIdRejected: isIdRejected ?? this.isIdRejected,
        isDocRejected: isDocRejected ?? this.isDocRejected,
        isProfessionalVerified: isProfessionalVerified ?? this.isProfessionalVerified,
        idType: idType ?? this.idType,
        professionalDocType: professionalDocType ?? this.professionalDocType,
        fiveStar: fiveStar ?? fiveStar,
        fourStar: fourStar ?? fourStar,
        threeStar: threeStar ?? threeStar,
        twoStar: twoStar ?? twoStar,
        oneStar: oneStar ?? oneStar,
        average: average ?? average
    );
  }
}
