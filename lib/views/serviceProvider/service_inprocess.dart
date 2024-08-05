// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/constant/colors.dart';
// import 'package:velocity_x/velocity_x.dart';
//
// import '../../admin/user_data.dart';
// import '../../constant/date_time.dart';
// import '../../model/book_service.dart';
// import '../../model/user_profile.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
//
// class ServiceInProcess extends StatefulWidget {
//   const ServiceInProcess({super.key});
//
//   @override
//   State<ServiceInProcess> createState() => _ServiceInProcessState();
// }
//
// class _ServiceInProcessState extends State<ServiceInProcess> {
//   // bool _isSearching = false;
//   final TextEditingController _reasonForCancelController =
//   TextEditingController();
//
//   final fireStore = FirebaseFirestore.instance.collection("appointment").snapshots();
//   CollectionReference ref = FirebaseFirestore.instance.collection('appointment');
//   List<BookServiceModel> _list = [];
//   UserProfileModel? userModel;
//
//   @override
//   void dispose() {
//     _reasonForCancelController.dispose();
//     _list.clear();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//    final size = MediaQuery.of(context).size;
//    var width = size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Your appointment List"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             StreamBuilder<QuerySnapshot>(
//                 stream: fireStore,
//                 builder: (context, AsyncSnapshot<QuerySnapshot> snapshot ){
//                   if(snapshot.connectionState == ConnectionState.waiting){
//                     return const CircularProgressIndicator();
//                   }
//                   if(snapshot.hasError){
//                     return const Center(child: Text('Some Error'));
//                   }
//                   final data = snapshot.data?.docs;
//                   _list = data?.map((e) => BookServiceModel.fromJson(e.data() as Map<String, dynamic>))
//                       .where((element) => (element.professionalID == UserProvider.userInfoModel?.uid
//                       && (element.userName != null) && (element.orderApprove == true) &&
//                       (element.isOrderCompleted == false || element.isOrderCompleted == null) ) ).toList() ?? [];
//                   if (kDebugMode) {
//                     print("list of users of Professionals: ${_list.length}");
//                   }
//
//                   if(_list.isNotEmpty){
//                     return Expanded(
//                       child: ListView.builder(
//                           itemCount: _list.length,
//                           shrinkWrap: true,
//                           physics:  const AlwaysScrollableScrollPhysics(),
//                           itemBuilder: (context, index){
//                             String date = _list[index].appointmentDate.toString();
//                             String time  = _list[index].appointmentTime.toString();
//                             String? appointmentDate = DateTimeClass.stringToddMMyyyy(date);
//                             String? appointmentTime = DateTimeClass.timeToHHMMA(time);
//                             return Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 5.0, bottom: 2,
//                                       left: 10, right: 10 ),                                  child: Card(
//                                     color: AppColor.orange,
//                                     child: SizedBox(
//                                       height: 320,
//                                       width: width,
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(20.0),
//                                         child: Column(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 const Text("Name: ", style:
//                                                 TextStyle(
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 20
//                                                 ) ,),
//                                                 Expanded(
//                                                   child: Text(_list[index].userName.toString(),
//                                                     maxLines: 1,
//                                                     overflow: TextOverflow.ellipsis,
//                                                     softWrap: true,
//                                                     style: const TextStyle(
//                                                         fontSize: 17
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Row(
//                                               children: [
//                                                 const Text("Visit ID: ",
//                                                   style: TextStyle(
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 20
//                                                 ) ,),
//                                                 Text(_list[index].appointmentID.toString(),
//                                                   maxLines: 1,
//                                                   overflow: TextOverflow.ellipsis,
//                                                   softWrap: true,
//                                                   style: const TextStyle(
//                                                       fontSize: 17
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Row(
//                                               children: [
//                                                 const Text("Visit Date: ", style:
//                                                 TextStyle(
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 20
//                                                 ) ,),
//                                                 Text(appointmentDate!,
//                                                   maxLines: 1,
//                                                   overflow: TextOverflow.ellipsis,
//                                                   softWrap: true,
//                                                   style: const TextStyle(
//                                                       fontSize: 17
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Row(
//                                               children: [
//                                                 const Text("Visit Time: ", style:
//                                                 TextStyle(
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 20
//                                                 ) ,),
//                                                 Text(appointmentTime!,
//                                                   maxLines: 1,
//                                                   overflow: TextOverflow.ellipsis,
//                                                   softWrap: true,
//                                                   style: const TextStyle(
//                                                       fontSize: 17
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Row(
//                                               children: [
//                                                 const Text("Cause: ", style:
//                                                 TextStyle(
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 20
//                                                 ) ,),
//                                                 Expanded(
//                                                   child: Text(_list[index].description.toString(),
//                                                     maxLines: 1,
//                                                     overflow: TextOverflow.ellipsis,
//                                                     softWrap: true,
//                                                     style: const TextStyle(
//                                                         fontSize: 17
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             const Row(
//                                               children: [
//                                                 Text("Status: ", style:
//                                                 TextStyle(
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 20
//                                                 ) ,),
//                                                 Text("In Process",
//                                                   style: TextStyle(
//                                                       fontSize: 17
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//
//                                             const SizedBox(height: 20,),
//                                             Row(
//                                               mainAxisAlignment: MainAxisAlignment.center,
//                                               children: [
//                                                 InkWell(
//                                                   onTap: (){
//                                                     setState(()
//                                                     {
//                                                       ref.doc(_list[index].appointmentID.toString()).update(
//                                                           {
//                                                             "isOrderCompleted": true,
//                                                           }).then((value){
//                                                         const Text('Update');
//                                                       }).onError((error, stackTrace){
//                                                         const Text('Error');
//                                                       });
//                                                     }
//                                                     );
//                                                   },
//                                                   child: Container(
//                                                     height: 70,
//                                                     width: 70,
//                                                     decoration:  BoxDecoration(
//                                                         color: AppColor.green,
//                                                         borderRadius: const BorderRadius.all(Radius.circular(35))
//                                                     ),
//                                                     child: const Center(child: Text("Ok",
//                                                       style: TextStyle(
//                                                           color: Colors.white,
//                                                           fontWeight: FontWeight.bold
//                                                       ),
//                                                     )),
//                                                   ),
//                                                 ),
//                                                 const SizedBox(width: 20,),
//                                                 Row(
//                                                   children: [
//                                                     InkWell(
//                                                       onTap: (){
//                                                         showDialog(
//                                                             context: context,
//                                                             builder: (BuildContext context)
//                                                             {
//                                                               return AlertDialog(
//                                                                 // backgroundColor: Colors.blueAccent.withOpacity(0.3),
//                                                                 content: Container(
//                                                                   height: 150,
//                                                                   width: width,
//                                                                   decoration: const BoxDecoration(
//                                                                     // color: Colors.transparent.withOpacity(0.2),
//                                                                   ),
//                                                                   child: Column(
//                                                                     children: [
//                                                                       const Text("Do you want to Cancel?",
//                                                                         style: TextStyle(
//                                                                             fontWeight: FontWeight.bold
//                                                                         ),
//                                                                       ),
//                                                                       const SizedBox(height: 05,),
//                                                                       TextField(
//                                                                         onChanged: (String value) {},
//                                                                         cursorColor: Colors.deepOrange,
//                                                                         controller: _reasonForCancelController,
//                                                                         keyboardType: TextInputType.text,
//                                                                         // validator: (value) {
//                                                                         //   return InputValidator.emptyTextvalidator(
//                                                                         //       value!, "Book appointment");
//                                                                         // },
//                                                                         decoration: const InputDecoration(
//                                                                           hintText: "Enter Reason for cancel",
//                                                                           prefixIcon: Icon(
//                                                                             Icons.description,
//                                                                             color: Colors.indigoAccent,
//                                                                           ),
//                                                                         ),
//                                                                       ),
//
//
//                                                                       const SizedBox(height: 10,),
//                                                                       Row(
//                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                         children: [
//                                                                           InkWell(
//                                                                             onTap: () async {
//                                                                               canclReason(_list[index].appointmentID.toString());
//                                                                               },
//                                                                             child: Container(
//                                                                               height: 35,
//                                                                               width: 70,
//                                                                               decoration: const BoxDecoration(
//                                                                                 color: Colors.green,
//                                                                                 borderRadius: BorderRadius.all(Radius.circular(25)),
//                                                                               ),
//                                                                               child: const Center(child: Text('Yes')),
//
//                                                                             ),
//                                                                           ),
//                                                                           const SizedBox(width: 10,),
//                                                                           InkWell(
//                                                                             onTap: (){
//                                                                               Navigator.of(context).pop();
//                                                                             },
//                                                                             child: Container(
//                                                                               height: 40,
//                                                                               width: 70,
//                                                                               decoration: const BoxDecoration(
//                                                                                 color: Colors.red,
//                                                                                 borderRadius: BorderRadius.all(Radius.circular(25)),
//                                                                               ),
//                                                                               child: const Center(child: Text('No')),
//
//                                                                             ),
//                                                                           ),
//                                                                         ],
//                                                                       )
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               );
//                                                             }
//                                                         );
//                                                       },
//                                                       child: Container(
//                                                         height: 70,
//                                                         width: 70,
//                                                         decoration: const BoxDecoration(
//                                                             color: Colors.black,
//                                                             borderRadius: BorderRadius.all(Radius.circular(35))
//                                                         ),
//                                                         child: const Center(child: Text("Cancel",
//                                                           style: TextStyle(
//                                                               color: Colors.white,
//                                                               fontWeight: FontWeight.bold
//                                                           ),
//                                                         )),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       ) ,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             );
//                           }),
//                     );
//                   }
//                   else{
//                     return  const Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Center(
//                           child: Text('No appointment',
//                             style: TextStyle(
//                                 fontSize: 30
//                             ),),
//                         ),
//                       ],
//                     );
//
//                   }
//                 }
//
//             )
//           ],
//         ),
//       ),
//
//     );
//
//   }
//
//   canclReason(String appointmentId){
//     if (validateReason() != true) {
//       return;
//     }
//     setState(()
//     {
//       ref.doc(appointmentId.toString()).update(
//           {
//             "orderCancel": true,
//             "cancelReason": _reasonForCancelController.text.trim(),
//             "orderApprove": false
//
//           }).then((value){
//         const Text('Update');
//       }).onError((error, stackTrace){
//         const Text('Error');
//       });
//     }
//     );
//
//     Navigator.of(context).pop();
//
//
//   }
//
//   bool validateReason(){
//     FocusScope.of(context).unfocus();
//     bool isValid = false;
//     if(_reasonForCancelController.text.trim().isEmptyOrNull){
//       CommonShareWidget.showFlushBar(
//           context: context,
//           duration: 2,
//           message: "Please Write Reason");
//     } else{
//       isValid = true;
//     }
//
//     return isValid;
//   }
//
// }
