// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// import '../../admin/user_data.dart';
// import '../../constant/colors.dart';
// import '../../constant/date_time.dart';
// import '../../model/book_service.dart';
// import '../../model/user_profile.dart';
//
// class ServiceCompleted extends StatefulWidget {
//   const ServiceCompleted({super.key});
//
//   @override
//   State<ServiceCompleted> createState() => _ServiceCompletedState();
// }
//
// class _ServiceCompletedState extends State<ServiceCompleted> {
//   // bool _isSearching = false;
//
//   final fireStore = FirebaseFirestore.instance.collection("appointment").orderBy("appointmentID", descending: true)
//       .snapshots();
//   CollectionReference ref = FirebaseFirestore.instance.collection('appointment');
//   List<BookServiceModel> _list = [];
//   UserProfileModel? userModel;
//   @override
//   void dispose() {
//     _list.clear();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     var width = size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Your Completed order"),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           StreamBuilder<QuerySnapshot>(
//               stream: fireStore,
//               builder: (context, AsyncSnapshot<QuerySnapshot> snapshot ){
//                 if(snapshot.connectionState == ConnectionState.waiting){
//                   return const CircularProgressIndicator();
//                 }
//                 if(snapshot.hasError){
//                   return const Center(child: Text('Some Error'));
//                 }
//                 final data = snapshot.data?.docs;
//                 _list = data?.map((e) => BookServiceModel.fromJson(e.data() as Map<String, dynamic>))
//                     .where((element) => (element.professionalID == UserProvider.userInfoModel?.uid
//                     && (element.orderApprove == true) &&
//                     (element.isOrderCompleted == true) ) ).toList() ?? [];
//                 if (kDebugMode) {
//                   print("list of users of Professionals: ${_list.length}");
//                 }
//
//                 if(_list.isNotEmpty){
//                   return Expanded(
//                     child: ListView.builder(
//                         itemCount: _list.length,
//                         itemBuilder: (context, index){
//                           String date = _list[index].appointmentDate.toString();
//                           String time  = _list[index].appointmentTime.toString();
//                           String? appointmentDate = DateTimeClass.stringToddMMyyyy(date);
//                           String? appointmentTime = DateTimeClass.timeToHHMMA(time);
//                           return Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 5.0, bottom: 2,
//                                     left: 10, right: 10 ),                                child: Card(
//                                   color: AppColor.orange,
//                                   child: SizedBox(
//                                     height: 220,
//                                     width: width,
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(20.0),
//                                       child: Column(
//                                         children: [
//                                           Row(
//                                             children: [
//                                               const Text("Name: ", style:
//                                               TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 20
//                                               ) ,),
//                                               Expanded(
//                                                 child: Text(_list[index].userName.toString(),
//                                                   maxLines: 1,
//                                                   overflow: TextOverflow.ellipsis,
//                                                   softWrap: true,
//                                                   style: const TextStyle(
//                                                       fontSize: 17
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           Row(
//                                             children: [
//                                               const Text("Visit ID: ", style:
//                                               TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 20
//                                               ) ,),
//                                               Text(_list[index].appointmentID.toString(),
//                                                 maxLines: 1,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 softWrap: true,
//                                                 style: const TextStyle(
//                                                     fontSize: 17
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           Row(
//                                             children: [
//                                               const Text("Visit Date: ", style:
//                                               TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 20
//                                               ) ,),
//                                               Text(appointmentDate!,
//                                                 maxLines: 1,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 softWrap: true,
//                                                 style: const TextStyle(
//                                                     fontSize: 17
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           Row(
//                                             children: [
//                                               const Text("Visit Time: ", style:
//                                               TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 20
//                                               ) ,),
//                                               Text(appointmentTime!,
//                                                 maxLines: 1,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 softWrap: true,
//                                                 style: const TextStyle(
//                                                     fontSize: 17
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           const Row(
//                                             children: [
//                                               Text("Status: ",
//                                                 style: TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 20
//                                               ) ,),
//                                               Text("Completed",
//                                                 maxLines: 1,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 softWrap: true,
//                                                 style: TextStyle(
//                                                     fontSize: 17
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                            Row(
//                                             children: [
//                                               const Text("Rating: ", style:
//                                               TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 20
//                                               ) ,
//                                               ),
//
//                                               if(_list[index].rating1 == true)...[
//                                                  Icon(Icons.star,
//                                                     color: AppColor.green,
//                                                     size: 25.0,
//                                                   )
//                                               ] else...[
//                                                 const Icon(Icons.star_outline_sharp,
//                                                   color: Colors.black, size: 25.0,)
//                                               ],
//                                               if(_list[index].rating2 == true)...[
//                                                  Icon(Icons.star,
//                                                   color: AppColor.green,
//                                                   size: 25.0,
//                                                 )
//                                               ] else...[
//                                                 const Icon(Icons.star_outline_sharp,
//                                                   color: Colors.black, size: 25.0,)
//                                               ],
//                                               if(_list[index].rating3 == true)...[
//                                                  Icon(Icons.star,
//                                                   color: AppColor.green,
//                                                   size: 25.0,
//                                                 )
//                                               ] else...[
//                                                 const Icon(Icons.star_outline_sharp,
//                                                   color: Colors.black, size: 25.0,)
//                                               ],
//                                               if(_list[index].rating4 == true)...[
//                                                  Icon(Icons.star,
//                                                   color: AppColor.green,
//                                                   size: 25.0,
//                                                 )
//                                               ] else...[
//                                                 const Icon(Icons.star_outline_sharp,
//                                                   color: Colors.black, size: 25.0,)
//                                               ],
//                                               if(_list[index].rating5 == true)...[
//                                                  Icon(Icons.star,
//                                                   color: AppColor.green,
//                                                   size: 25.0,
//                                                 )
//                                               ] else...[
//                                                 const Icon(Icons.star_outline_sharp,
//                                                   color: Colors.black, size: 25.0,)
//                                               ]
//                                             ],
//                                           ),
//
//                                         ],
//                                       ),
//                                     ) ,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           );
//                         }),
//                   );
//                 }
//                 else{
//                   return  const Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Center(
//                         child: Text('No User',
//                           style: TextStyle(
//                               fontSize: 30
//                           ),),
//                       ),
//                     ],
//                   );
//                 }
//               }
//
//           )
//         ],
//       ),
//
//     );
//   }
// }
