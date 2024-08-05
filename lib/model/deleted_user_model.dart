

import 'package:cloud_firestore/cloud_firestore.dart';

class DeletedUser {
  DeletedUser
      ({
    this.uid,
    this.name,
    this.email,
    this.phone,
    this.address,
  });
  String? uid;
  String? name;
  String? email;
  String? phone;
  String? address;

  DeletedUser.fromDocumentSnap(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : name = snapshot.data()?['name'] ?? "",
        uid = snapshot.data()?['uid'] ?? "",
        email = snapshot.data()?['email'] ?? "",
        phone = snapshot.data()?['phone'] ?? "",
        address = snapshot.data()?['address'] ?? "";

  factory DeletedUser.fromJson(Map<String, dynamic> json)
  {
    return DeletedUser(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }


  DeletedUser.fromMap(Map<String, dynamic>? snapshot)
      : name = snapshot?['name'] ?? "",
        uid = snapshot?['uid'] ?? "",
        email = snapshot?['email'] ?? "",
        phone = snapshot?['phone'] ?? "",
        address = snapshot?['address'] ?? "";



  toJson() {
    return {
      "name": name,
      "uid": uid,
      'email': email,
      'phone': phone,
      'address': address,
          };


  }


  DeletedUser copyWith
      ({
    String? uid,
    String? name,
    String? email,
    String? phone,
    String? address,
  }) {


    return DeletedUser(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        address: address ?? this.address,
    );
  }
}
