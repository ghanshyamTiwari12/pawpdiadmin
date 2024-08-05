// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class DigitalDiaryApi
// {
//   static FirebaseFirestore firestore = FirebaseFirestore.instance;
//   static CollectionReference ref = FirebaseFirestore.instance.collection('appointment');
//
//
//
//   static Stream<QuerySnapshot<Map<String, dynamic>>> userList()
//   {
//     return firestore.collection("users").where(
//         "isProfessional", isNotEqualTo: true).snapshots();
//       }
//
//     static Stream<QuerySnapshot<Map<String, dynamic>>> userAppointmentList(String currentUserId )
//     {
//        return FirebaseFirestore.instance.collection("appointment").where(
//            "userID", isEqualTo: currentUserId).snapshots();
//     }
//
//   static Stream<QuerySnapshot<Map<String, dynamic>>> userPetDiary(String currentUserId )
//   {
//     return FirebaseFirestore.instance.collection("registeredPet").where(
//         "userUid", isEqualTo: currentUserId).snapshots();
//   }
//
//   static userRegisteredPetDelete(String id, String userId )
//   {
//     DigitalDiaryApi.userPetActivityDelete(userId + id);
//     return FirebaseFirestore.instance.collection("registeredPet").doc(id).delete();
//   }
//
//   static userPetActivityDelete(String id )
//   {
//     return FirebaseFirestore.instance.collection("petActivities").doc(id).delete();
//   }
//
//
// }
//
