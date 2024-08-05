// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/constant/colors.dart';
// import 'package:petfindernetwork/views/shareAbleWidget.dart/commonShareWidget.dart';
//
// import '../../bloc/digital_diary_api.dart';
// import '../../constant/date_time.dart';
// import '../../model/book_service.dart';
// import '../../model/user_profile.dart';
//
// class UserAppointmentList extends StatefulWidget {
//   const UserAppointmentList(this.uid, {super.key});
//   final String uid;
//
//   @override
//   State<UserAppointmentList> createState() => _UserAppointmentListState();
// }
//
// class _UserAppointmentListState extends State<UserAppointmentList> {
//   final firestore = FirebaseFirestore.instance.collection("appointment").orderBy("appointmentID", descending: true).snapshots();
//   CollectionReference ref = FirebaseFirestore.instance.collection('appointment');
//   CollectionReference refUser = FirebaseFirestore.instance.collection('users');
//
//   List<BookServiceModel> _list = [];
//    UserProfileModel? userModel;
//   bool review = false;
//   @override
//   Widget build(BuildContext context) {
//    final size = MediaQuery.of(context).size;
//    // var height = size.height;
//    var width = size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Your Appointments"),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           StreamBuilder(
//               stream: firestore,
//               builder: (context, snapshot)
//               {
//                 if(snapshot.connectionState == ConnectionState.waiting){
//                   return  Center(child: CommonShareWidget.circularLoader());
//                 }
//                 if(snapshot.hasError){
//                   return const Text('Some Error');
//                 }
//                 final data = snapshot.data?.docs;
//                 // _list = data?.map((e) => BookServiceModel.fromJson(e.data())).toList() ?? [];
//                 _list = data?.map((e) => BookServiceModel.fromJson(e.data())).where(
//                         (element) =>(element.userID == widget.uid)).toList() ?? [];
//                 if (kDebugMode) {
//                   print("Length of list of user service: ${_list.length}");
//                 }
//                 if(_list.isNotEmpty){
//                   return Expanded(
//                     child: ListView.builder (
//                         itemCount:  _list.length,
//                         itemBuilder: (context, index){
//                           String date = _list[index].appointmentDate.toString();
//                           String time  = _list[index].appointmentTime.toString();
//                           String? appointmentDate = DateTimeClass.stringToddMMyyyy(date);
//                           String? appointmentTime = DateTimeClass.timeToHHMMA(time);
//                           return  Padding
//                             (
//                             padding: const EdgeInsets.all(10),
//                             child:
//                             Card(
//                               color: AppColor.orange,
//                               // color: AppColor.orange.withOpacity(0.3),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(20.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         const Text("Name: ", style:
//                                         TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 20
//                                         ) ,),
//                                         Expanded(
//                                           child: Text(_list[index].serviceProviderName.toString(),
//                                             maxLines: 1,
//                                             overflow: TextOverflow.ellipsis,
//                                             softWrap: true,
//                                             style: const TextStyle(
//                                                 fontSize: 17
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         const Text("Service: ", style:
//                                         TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 20
//                                         ) ,),
//                                         Text(_list[index].serviceType.toString(),
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                           softWrap: true,
//                                           style: const TextStyle(
//                                               fontSize: 17
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//
//                                     Row(
//                                       children: [
//                                         const Text("Order ID: ", style:
//                                         TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 20
//                                         ) ,),
//                                         Text(_list[index].appointmentID.toString(),
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                           softWrap: true,
//                                           style: const TextStyle(
//                                               fontSize: 17
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         const Text("Cause: ", style:
//                                         TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 20
//                                         ) ,),
//                                         Expanded(
//                                           child: Text(_list[index].description.toString(),
//                                             maxLines: 1,
//                                             overflow: TextOverflow.ellipsis,
//                                             softWrap: true,
//                                             style: const TextStyle(
//                                                 fontSize: 17
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         const Text("Date: ",
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                           softWrap: true,
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 20
//                                         ) ,),
//                                         Text(appointmentDate!,
//                                           style: const TextStyle(
//                                               fontSize: 17
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         const Text("Time: ",
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                           softWrap: true,
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 20
//                                         ) ,),
//                                         Text(appointmentTime!,
//                                           style: const TextStyle(
//                                               fontSize: 17
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                         children: [
//                                           const Text("Status: ",
//                                             maxLines: 1,
//                                             overflow: TextOverflow.ellipsis,
//                                             softWrap: true,
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 20
//                                           ) ,),
//                                           if(_list[index].orderApprove == false && (_list[index].orderCancel == false ||
//                                               _list[index].orderCancel == null))...[
//                                             const Text("Pending",
//                                               maxLines: 1,
//                                               overflow: TextOverflow.ellipsis,
//                                               softWrap: true,
//                                               style: TextStyle(
//                                                   fontSize: 17
//                                               ),
//                                             ),
//                                           ]  else if(_list[index].orderApprove == false
//                                               && _list[index].orderCancel == true)...[
//                                             const Text("Canceled",
//                                               maxLines: 1,
//                                               overflow: TextOverflow.ellipsis,
//                                               softWrap: true,
//                                               style: TextStyle(
//                                                   fontSize: 17
//                                               ),
//                                             ),
//                                           ]
//                                           else...[
//                                               const Text("Approved",
//                                                 maxLines: 1,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 softWrap: true,
//                                                 style: TextStyle(
//                                                     fontSize: 17
//                                                 ),
//                                               )
//                                             ]
//                                         ]
//
//                                     ),
//                                     if(_list[index].orderApprove == false
//                                         && _list[index].orderCancel == true)...[
//                                       Row(
//                                         children: [
//                                           const Text("Reason: ",
//                                               style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 20
//                                           ) ,),
//                                           Text(_list[index].cancelReason.toString(),
//                                             maxLines: 1,
//                                             overflow: TextOverflow.ellipsis,
//                                             softWrap: true,
//                                             style: const TextStyle(
//                                                 fontSize: 17
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//
//                                     ],
//                                     if(_list[index].orderApprove == true)...[
//                                       Row(
//                                           children: [
//                                             const Text("Order Completed: ", style:
//                                             TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 20
//                                             ) ,),
//                                             if(_list[index].isOrderCompleted == false)...[
//                                               const Text("No",
//                                                 maxLines: 1,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 softWrap: true,
//                                                 style: TextStyle(
//                                                     fontSize: 17
//                                                 ),
//                                               ),
//                                             ] else...[
//                                               const Text("Yes",
//                                                 maxLines: 1,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 softWrap: true,
//                                                 style: TextStyle(
//                                                     fontSize: 17
//                                                 ),
//                                               )
//                                             ]
//                                           ]
//                                       ),
//                                     ],
//                                     if((_list[index].isOrderCompleted == true && _list[index].orderApprove == true) &&
//                                         _list[index].orderCancel != true)...[
//                                       Row(
//                                         children: [
//                                           const Text("Rating: ",
//                                             maxLines: 1,
//                                             overflow: TextOverflow.ellipsis,
//                                             softWrap: true,
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 20
//                                           ) ,),
//
//
//                                           InkWell(
//                                             child: (_list[index].rating1 ?? false)  ?
//                                             Icon(Icons.star,
//                                               color: AppColor.green,
//                                               size: 25.0,
//                                             ) : const Icon(Icons.star_outline_sharp, color: Colors.black, size: 25.0,),
//                                             onTap: () async {
//                                               // print("id edit--${_list[index].appointmentID.toString()}");
//                                               if (kDebugMode) {
//                                                 print("rating1 --${_list[index].rating1}");
//                                               }
//
//
//                                               setState(() {
//                                                 DigitalDiaryApi.ref.doc(_list[index].appointmentID.toString()).update(
//                                                     {
//                                                       "rating1": true
//                                                     }).then((value) async
//                                                 {
//                                                   const Text('Update');
//                                                   UserProfileModel? userModel;
//                                                   final userExistId = await FirebaseFirestore.instance.collection('users').doc(_list[index].professionalID).get();
//                                                   userModel = UserProfileModel.fromMap(userExistId.data());
//                                                   int? starOne = userModel.oneStar;
//                                                   int? starTwo = userModel.twoStar;
//                                                   int? starThree = userModel.threeStar;
//                                                   int? starFour = userModel.fourStar;
//                                                   int? starFive = userModel.fiveStar;
//                                                   double? avg = userModel.average;
//                                                   starOne = starOne! + 1;
//                                                   int? totalStar = 0;
//                                                   totalStar = (starOne+
//                                                       (starTwo! *2) + (starThree! * 3)
//                                                   + (starFour! *4) + (starFive! * 5)
//                                                   );
//                                                   avg = totalStar / (starOne + starTwo + starThree + starFour + starFive);
//                                                   if (kDebugMode) {
//                                                     print("avg star-----$avg");
//                                                   }
//                                                   refUser.doc(_list[index].professionalID.toString()).update(
//                                                       {
//                                                         "oneStar": starOne,
//                                                         "average": avg
//                                                       }).then((value) =>const Text('Update')
//                                                   ).onError((error, stackTrace) => const Text('error'));
//                                                 }
//                                                 ).onError((error, stackTrace){
//                                                   const Text('Error');
//                                                 });
//                                                 if (kDebugMode) {
//                                                   print("rating1 after tap--${_list[index].rating1}");
//                                                 }
//                                               });
//                                             },
//                                           ),
//                                           InkWell(
//                                             // ratingRecord
//                                             child: (_list[index].rating2 ?? false)  ?
//                                              Icon(Icons.star,
//                                               color: AppColor.green,
//                                               size: 25.0,
//                                             ) : const Icon(Icons.star_outline_sharp, color: Colors.black, size: 25.0,),
//                                             onTap: () async {
//                                               if (kDebugMode) {
//                                                 print("id edit--${_list[index].appointmentID.toString()}");
//                                               }
//                                             if(_list[index].rating1 == true){
//                                               setState(() {
//                                                 DigitalDiaryApi.ref.doc(_list[index].appointmentID.toString()).update(
//                                                     {
//                                                       "rating2": true
//                                                     }).then((value) async
//                                                 {
//                                                   const Text('Update');
//                                                   UserProfileModel? userModel;
//                                                   // refUser
//                                                   final userExistId = await FirebaseFirestore.instance.collection('users').doc(_list[index].professionalID).get();
//                                                   userModel = UserProfileModel.fromMap(userExistId.data());
//                                                   int? starOne = userModel.oneStar;
//                                                   int? starTwo = userModel.twoStar;
//                                                   int? starThree = userModel.threeStar;
//                                                   int? starFour = userModel.fourStar;
//                                                   int? starFive = userModel.fiveStar;
//                                                   double? avg = userModel.average;
//                                                   if(starOne! > 0){
//                                                     starOne = starOne - 1;
//                                                   }
//                                                   starTwo = starTwo! + 1;
//                                                   int? totalStar = 0;
//                                                   totalStar = (starOne+
//                                                       (starTwo*2) + (starThree! * 3)
//                                                       + (starFour! *4) + (starFive! * 5)
//                                                   );
//
//                                                   avg = totalStar / (starOne + starTwo + starThree + starFour + starFive);
//                                                   if (kDebugMode) {
//                                                     print("avg star-----$avg");
//                                                   }
//                                                   refUser.doc(_list[index].professionalID.toString()).update(
//                                                       {
//                                                         "oneStar": starOne,
//                                                         "twoStar": starTwo,
//                                                         "average": avg
//                                                       }).then((value) =>const Text('Update')
//                                                   ).onError((error, stackTrace) => const Text('error'));
//                                                 }
//                                                 ).onError((error, stackTrace){
//                                                   const Text('Error');
//                                                 });
//                                                 if (kDebugMode) {
//                                                   print("rating1 after tap--${_list[index].rating1}");
//                                                 }
//                                               });
//                                             }
//                                             else{
//                                               CommonShareWidget.showColorFlushBar(
//                                                   context: context, duration: 2,
//                                                   color: Colors.black,
//                                                   message: "Pleae select one by one"
//                                               );}
//                                             },
//                                           ),
//                                           InkWell(
//                                             // ratingRecord
//                                             child: (_list[index].rating3 ?? false)  ?
//                                              Icon(Icons.star,
//                                               color: AppColor.green,
//                                               size: 25.0,
//                                             ) : const Icon(Icons.star_outline_sharp, color: Colors.black, size: 25.0,),
//                                             onTap: () async {
//                                               if (kDebugMode) {
//                                                 print("id edit--${_list[index].appointmentID.toString()}");
//                                               }
//
//                                               if(_list[index].rating2 == true){
//
//                                                 setState(() {
//                                                   DigitalDiaryApi.ref.doc(_list[index].appointmentID.toString()).update(
//                                                       {
//                                                         "rating3": true
//                                                       }).then((value) async
//                                                   {
//                                                     const Text('Update');
//                                                     UserProfileModel? userModel;
//                                                     // refUser
//                                                     final userExistId = await FirebaseFirestore.instance.collection('users').doc(_list[index].professionalID).get();
//
//                                                     userModel = UserProfileModel.fromMap(userExistId.data());
//                                                     int? starOne = userModel.oneStar;
//                                                     int? starTwo = userModel.twoStar;
//                                                     int? starThree = userModel.threeStar;
//                                                     int? starFour = userModel.fourStar;
//                                                     int? starFive = userModel.fiveStar;
//                                                     double? avg = userModel.average;
//                                                     if(starTwo! > 0){
//                                                       starTwo = starTwo - 1;
//                                                     }
//                                                     starThree = starThree! + 1;
//                                                     int? totalStar = 0;
//                                                     totalStar = (starOne! +
//                                                         (starTwo*2) + (starThree* 3)
//                                                         + (starFour! *4) + (starFive! * 5)
//                                                     );
//
//                                                     avg = totalStar / (starOne + starTwo + starThree + starFour + starFive);
//                                                     if (kDebugMode) {
//                                                       print("avg star-----$avg");
//                                                     }
//                                                     refUser.doc(_list[index].professionalID.toString()).update(
//                                                         {
//                                                           "oneStar": starOne,
//                                                           "twoStar": starTwo,
//                                                           "threeStar": starThree,
//                                                           "average": avg
//                                                         }).then((value) =>const Text('Update')
//                                                     ).onError((error, stackTrace) => const Text('error'));
//                                                   }
//                                                   ).onError((error, stackTrace){
//                                                     const Text('Error');
//                                                   });
//                                                 });
//                                               }
//                                               else{
//                                                 CommonShareWidget.showColorFlushBar(
//                                                     context: context, duration: 2,
//                                                     color: Colors.black,
//                                                     message: "Pleae select one by one"
//                                                 );}
//
//                                             },
//                                           ),
//                                           InkWell(
//                                             // ratingRecord
//                                             child: (_list[index].rating4 ?? false)  ?
//                                              Icon(Icons.star,
//                                                color: AppColor.green,
//                                               size: 25.0,
//                                             ) : const Icon(Icons.star_outline_sharp, color: Colors.black, size: 25.0,),
//                                             onTap: () async {
//                                               if (kDebugMode) {
//                                                 print("id edit--${_list[index].appointmentID.toString()}");
//                                               }
//
//                                           if(_list[index].rating3 == true){
//                                             setState(() {
//                                               DigitalDiaryApi.ref.doc(_list[index].appointmentID.toString()).update(
//                                                   {
//                                                     "rating4": true
//                                                   }).then((value) async
//                                               {
//                                                 const Text('Update');
//                                                 UserProfileModel? userModel;
//                                                 // refUser
//                                                 final userExistId = await FirebaseFirestore.instance.collection('users').doc(_list[index].professionalID).get();
//
//                                                 userModel = UserProfileModel.fromMap(userExistId.data());
//                                                 int? starOne = userModel.oneStar;
//                                                 int? starTwo = userModel.twoStar;
//                                                 int? starThree = userModel.threeStar;
//                                                 int? starFour = userModel.fourStar;
//                                                 int? starFive = userModel.fiveStar;
//                                                 double? avg = userModel.average;
//                                                 if(starThree! > 0){
//                                                   starThree = starThree - 1;
//                                                 }
//                                                 starFour = starFour! + 1;
//                                                 int? totalStar = 0;
//                                                 totalStar = (starOne! +
//                                                     (starTwo! *2) + (starThree* 3)
//                                                     + (starFour*4) + (starFive! * 5)
//                                                 );
//
//                                                 avg = totalStar / (starOne + starTwo + starThree + starFour + starFive);
//                                                 if (kDebugMode) {
//                                                   print("avg star-----$avg");
//                                                 }
//                                                 refUser.doc(_list[index].professionalID.toString()).update(
//                                                     {
//                                                       "oneStar": starOne,
//                                                       "twoStar": starTwo,
//                                                       "threeStar": starThree,
//                                                       "fourStar": starFour,
//                                                       "average": avg
//                                                     }).then((value) =>const Text('Update')
//                                                 ).onError((error, stackTrace) => const Text('error'));
//                                               }
//                                               ).onError((error, stackTrace){
//                                                 const Text('Error');
//                                               });
//                                             });
//
//                                           }
//                                           else{
//                                             CommonShareWidget.showColorFlushBar(
//                                                 context: context, duration: 2,
//                                                 color: Colors.black,
//                                                 message: "Pleae select one by one"
//                                             );}
//                                             },
//                                           ),
//                                           InkWell(
//                                             // ratingRecord
//                                             child: (_list[index].rating5 ?? false)  ?
//                                              Icon(Icons.star,
//                                               color: AppColor.green,
//                                               size: 25.0,
//                                             ) : const Icon(Icons.star_outline_sharp, color: Colors.black, size: 25.0,),
//                                             onTap: () async {
//                                               if (kDebugMode) {
//                                                 print("id edit--${_list[index].appointmentID.toString()}");
//                                               }
//
//                                               if(_list[index].rating4 == true){
//                                                 setState(() {
//                                                   DigitalDiaryApi.ref.doc(_list[index].appointmentID.toString()).update(
//                                                       {
//                                                         "rating5": true
//                                                       }).then((value) async
//                                                   {
//                                                     const Text('Update');
//                                                     UserProfileModel? userModel;
//                                                     final userExistId = await FirebaseFirestore.instance.collection('users').doc(_list[index].professionalID).get();
//                                                     userModel = UserProfileModel.fromMap(userExistId.data());
//                                                     int? starOne = userModel.oneStar;
//                                                     int? starTwo = userModel.twoStar;
//                                                     int? starThree = userModel.threeStar;
//                                                     int? starFour = userModel.fourStar;
//                                                     int? starFive = userModel.fiveStar;
//                                                     double? avg = userModel.average;
//                                                     if(starFour! > 0){
//                                                       starFour = starFour - 1;
//                                                     }
//                                                     starFive = starFive! + 1;
//                                                     int? totalStar = 0;
//                                                     totalStar = (starOne! +
//                                                         (starTwo! *2) + (starThree! * 3)
//                                                         + (starFour*4) + (starFive* 5)
//                                                     );
//
//                                                     avg = totalStar / (starOne + starTwo + starThree + starFour + starFive);
//                                                     if (kDebugMode) {
//                                                       print("avg star-----$avg");
//                                                     }
//                                                     refUser.doc(_list[index].professionalID.toString()).update(
//                                                         {
//                                                           "oneStar": starOne,
//                                                           "twoStar": starTwo,
//                                                           "threeStar": starThree,
//                                                           "fourStar": starFour,
//                                                           "fiveStar": starFive,
//                                                           "average": avg
//                                                         }).then((value) =>const Text('Update')
//                                                     ).onError((error, stackTrace) => const Text('error'));
//                                                   }
//                                                   ).onError((error, stackTrace){
//                                                     const Text('Error');
//                                                   });
//                                                 });
//                                               }
//                                               else{
//                                                 CommonShareWidget.showColorFlushBar(
//                                                     context: context, duration: 2,
//                                                     color: Colors.black,
//                                                     message: "Pleae select one by one"
//                                                 );}
//                                             },
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                     const SizedBox(height: 20,),
//                                     if(_list[index].isOrderCompleted == false &&
//                                         (_list[index].orderCancel == false
//                                             ||_list[index].orderCancel == null ) )...[
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           InkWell(
//                                             onTap: (){
//                                               FirebaseFirestore.instance.collection('appointment').doc(_list[index].
//                                               appointmentID.toString()).delete().then((value){
//                                                 const Text('Delete');
//                                               }).onError((error, stackTrace){
//                                                 const Text('Error');
//                                               });
//                                             },
//                                             child: Container(
//                                               height: 45,
//                                               width: width *0.30,
//                                               decoration: const BoxDecoration(
//                                                   color: Colors.black,
//                                                   borderRadius: BorderRadius.all(Radius.circular(35))
//                                               ),
//                                               child: const Center(child: Text("Cancel",
//                                                 style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontWeight: FontWeight.bold
//                                                 ),
//                                               )),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ]
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         }
//                     ),
//                   );
//                 }
//                 else{
//                   return  const Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Center(
//                         child: Text('No appointment till now',
//                           style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.blueAccent
//
//                             // fontWeight: FontWeight.bold
//                           ),),
//                       ),
//                     ],
//                   );
//                 }
//               }
//           )
//         ],
//       ),
//     );
//   }
//
//  // Future<UserProfileModel?> userData(String profID) async {
//  //    final serviceProviderExistId = await FirebaseFirestore.instance.collection('users').doc(profID).get();
//  //     userModel = UserProfileModel.fromMap(serviceProviderExistId.data());
//  //     return userModel;
//  //  }
// }
