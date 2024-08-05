// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/views/serviceProvider/service_provider.dart';
// import '../../constant/colors.dart';
// import '../../model/user_profile.dart';
// import '../loginSignUp/login.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
//
//
// class TrainerList extends StatefulWidget {
//   const TrainerList({super.key});
//
//   @override
//   State<TrainerList> createState() => _TrainerListState();
// }
//
// class _TrainerListState extends State<TrainerList> {
//   final fireStore =  FirebaseFirestore.instance.collection('users').
//   where("isProfessional", isEqualTo: true)
//       .where('professionalType', isEqualTo: "Trainer")
//       .where("isDocVerified", isEqualTo: true)
//       .where("isIdVerified", isEqualTo: true).snapshots();
//   bool _isSearching = false;
//   List<UserProfileModel> _searchList = [];
//   List<UserProfileModel> _list = [];
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     var width = size.width;
//
//     return Scaffold(
//       appBar:
//       AppBar(
//         title: _isSearching ?
//         TextField
//           (
//           autofocus: true,
//           decoration: const InputDecoration(
//             hintText: 'Search by Name or City ',
//             hintStyle: TextStyle(color: Colors.black,
//               fontWeight: FontWeight.bold
//             ),
//             border: InputBorder.none,
//           ),
//           style: const TextStyle(
//             fontSize: 16,
//             letterSpacing: 1,
//           ),
//           onChanged:(val){
//             _searchList.clear();
//             for( var i in _list){
//               if(i.name!.toLowerCase().contains(val.toLowerCase()) ||
//                   i.location!.toLowerCase().contains(val.toLowerCase())
//               )
//               {
//                 _searchList.add(i);
//               }
//               setState(() {
//                 _searchList;
//                 // print("found pet length in search ${_searchList.first.petName}");
//               });
//             }
//           },
//         )
//             : const Text("Trainer",
//           style: TextStyle(
//               fontWeight: FontWeight.bold
//           ),
//         ),
//         actions: <Widget>[
//           actionSearchButton(),
//           // actionProfileButton(),
//           // const SizedBox(width: 15),
//         ],
//       ),
//
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children:
//
//           [
//             StreamBuilder<QuerySnapshot> (
//                 stream: fireStore,
//                 builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
//                 {
//                   if(snapshot.connectionState == ConnectionState.waiting){
//                     return Center(child: CommonShareWidget.circularLoader());
//                   }
//                   if(snapshot.hasError)
//                   {
//                     return const SizedBox(height: 100, width: 100,
//                       child: Text("Some Error"),
//                     );
//                   }
//                   final data = snapshot.data?.docs;
//                   _list = data?.map((e) => UserProfileModel.fromMap(e.data() as Map<String, dynamic>?)).toList() ?? [];
//
//                   if(data!.isNotEmpty) {
//                     return Expanded
//                       (
//                       child: ListView.builder(
//                           itemCount: _isSearching ? _searchList.length : snapshot.data?.docs.length,
//                           // scrollDirection: Axis.horizontal,
//
//                           shrinkWrap: true,
//                           scrollDirection: Axis.vertical,
//                           physics: const AlwaysScrollableScrollPhysics(),
//                           itemBuilder: (context, index) {
//                             dynamic _vetList = snapshot.data
//                                 ?.docs[index];
//                             var ratingAverage = _vetList["average"];
//                             // var ratingAverage = _trainerList[index].average;
//                             if (kDebugMode) {
//                               print(
//                                   "rating average---$ratingAverage");
//                             }
//                             if(_isSearching == true){
//                               return Row(
//                                 children: [
//                                   InkWell(
//                                     onTap: () {
//                                       providerProfilepage(_searchList[index].uid.toString(), context);
//                                     },
//                                     child: Card(
//                                       elevation: 0,
//                                       shape: RoundedRectangleBorder(
//                                         side: BorderSide(
//                                             color: AppColor.orange,
//                                             width: 1
//                                         ),
//                                         borderRadius: BorderRadius
//                                             .circular(
//                                             20.0), //<-- SEE HERE
//                                       ),
//                                       color: AppColor.orange
//                                           .withOpacity(0.3),
//                                       // color: AppColor.orange.withOpacity(0.3),
//                                       // color: AppColor.orange.withOpacity(0.7),
//                                       child: SizedBox(
//                                         height: 140,
//                                         width: width *0.83,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(
//                                               12.0),
//                                           child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment
//                                                 .start,
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   Expanded(
//                                                     child: Text(
//                                                       // _vetList["name"]
//                                                       //     .toString()
//                                                       //     .toUpperCase(),
//                                                       _searchList[index].name.toString(),
//                                                       maxLines: 1,
//                                                       overflow: TextOverflow
//                                                           .ellipsis,
//                                                       softWrap: true,
//                                                       style: const TextStyle(
//                                                         fontSize: 16,
//                                                         fontWeight: FontWeight
//                                                             .bold,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   const Spacer(),
//                                                   // CircleAvatar(
//                                                   //   backgroundImage: CachedNetworkImageProvider(
//                                                   //       _vetList["profile_image_url"]
//                                                   //           .toString()),
//                                                   //   // backgroundImage: NetworkImage(_vetList[index].profilephotoImageUrl.toString()),
//                                                   //   radius: 20,
//                                                   // ),
//                                                   CircleAvatar(
//                                                     backgroundImage: CachedNetworkImageProvider(
//                                                         _searchList[index].profilephotoImageUrl
//                                                             .toString()),
//                                                     // backgroundImage: NetworkImage(_vetList[index].profilephotoImageUrl.toString()),
//                                                     radius: 20,
//                                                   ),
//                                                 ],
//                                               ),
//                                               const SizedBox(
//                                                 height: 2,),
//                                               Row(
//                                                 children: [
//                                                   Expanded(
//                                                     child: Text(
//                                                       _searchList[index].location
//                                                           .toString(),
//                                                       maxLines: 1,
//                                                       overflow: TextOverflow
//                                                           .ellipsis,
//                                                       softWrap: true,
//                                                       style: const TextStyle(
//                                                         fontSize: 16,
//                                                         // fontWeight: FontWeight.bold,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               const SizedBox(
//                                                 height: 05,),
//                                               Container(
//                                                 height: 35,
//                                                 width: 60,
//                                                 decoration: const BoxDecoration(
//                                                     color: Colors.green,
//                                                     borderRadius: BorderRadius
//                                                         .all(
//                                                         Radius.circular(
//                                                             10))
//                                                 ),
//                                                 child:
//                                                 Row(
//                                                   mainAxisAlignment: MainAxisAlignment
//                                                       .center,
//                                                   crossAxisAlignment: CrossAxisAlignment
//                                                       .center,
//                                                   children: [
//                                                     const Icon(
//                                                       Icons.star,
//                                                       color: Colors
//                                                           .white,
//                                                       size: 25.0,
//                                                     ),
//                                                     const SizedBox(
//                                                       width: 3,),
//
//                                                     if(ratingAverage ==
//                                                         null)...[
//                                                       const Text("0",
//                                                         style: TextStyle(
//                                                             fontWeight: FontWeight
//                                                                 .bold,
//                                                             color: Colors
//                                                                 .white,
//                                                             fontSize: 15
//                                                         ),
//                                                       )
//                                                     ] else
//                                                       ...[
//                                                         Text(
//                                                           _searchList[index].average
//                                                           !.toStringAsFixed(
//                                                               1),
//                                                           style: const TextStyle(
//                                                               fontWeight: FontWeight
//                                                                   .bold,
//                                                               color: Colors
//                                                                   .white,
//                                                               fontSize: 15
//                                                           ),
//                                                         )
//                                                       ]
//                                                   ],
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//
//                                   ),
//                                 ],
//                               );
//
//                             }
//                             else {
//                               return Row(
//                                 children: [
//                                   InkWell(
//                                     onTap: () {
//                                       providerProfilepage(_vetList["uid"].toString(), context);
//                                     },
//                                     child: Card(
//                                       elevation: 0,
//                                       shape: RoundedRectangleBorder(
//                                         side: BorderSide(
//                                             color: AppColor.orange,
//                                             width: 1
//                                         ),
//                                         borderRadius: BorderRadius
//                                             .circular(
//                                             20.0), //<-- SEE HERE
//                                       ),
//                                       color: AppColor.orange
//                                           .withOpacity(0.3),
//                                       // color: AppColor.orange.withOpacity(0.3),
//                                       // color: AppColor.orange.withOpacity(0.7),
//                                       child: SizedBox(
//                                         height: 140,
//                                         width: width *0.83,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(
//                                               12.0),
//                                           child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment
//                                                 .start,
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   Expanded(
//                                                     child: Text(
//                                                       _vetList["name"]
//                                                           .toString()
//                                                           .toUpperCase(),
//                                                       maxLines: 1,
//                                                       overflow: TextOverflow
//                                                           .ellipsis,
//                                                       softWrap: true,
//                                                       style: const TextStyle(
//                                                         fontSize: 16,
//                                                         fontWeight: FontWeight
//                                                             .bold,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   const Spacer(),
//                                                   CircleAvatar(
//                                                     backgroundImage: CachedNetworkImageProvider(
//                                                         _vetList["profile_image_url"]
//                                                             .toString()),
//                                                     // backgroundImage: NetworkImage(_vetList[index].profilephotoImageUrl.toString()),
//                                                     radius: 20,
//                                                   ),
//                                                 ],
//                                               ),
//                                               const SizedBox(
//                                                 height: 2,),
//                                               Row(
//                                                 children: [
//                                                   Expanded(
//                                                     child: Text(
//                                                       _vetList["location"]
//                                                           .toString(),
//                                                       maxLines: 1,
//                                                       overflow: TextOverflow
//                                                           .ellipsis,
//                                                       softWrap: true,
//                                                       style: const TextStyle(
//                                                         fontSize: 16,
//                                                         // fontWeight: FontWeight.bold,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               const SizedBox(
//                                                 height: 05,),
//                                               Container(
//                                                 height: 35,
//                                                 width: 60,
//                                                 decoration: const BoxDecoration(
//                                                     color: Colors.green,
//                                                     borderRadius: BorderRadius
//                                                         .all(
//                                                         Radius.circular(
//                                                             10))
//                                                 ),
//                                                 child:
//                                                 Row(
//                                                   mainAxisAlignment: MainAxisAlignment
//                                                       .center,
//                                                   crossAxisAlignment: CrossAxisAlignment
//                                                       .center,
//                                                   children: [
//                                                     const Icon(
//                                                       Icons.star,
//                                                       color: Colors
//                                                           .white,
//                                                       size: 25.0,
//                                                     ),
//                                                     const SizedBox(
//                                                       width: 3,),
//
//                                                     if(ratingAverage ==
//                                                         null)...[
//                                                       const Text("0",
//                                                         style: TextStyle(
//                                                             fontWeight: FontWeight
//                                                                 .bold,
//                                                             color: Colors
//                                                                 .white,
//                                                             fontSize: 15
//                                                         ),
//                                                       )
//                                                     ] else
//                                                       ...[
//                                                         Text(
//                                                           _vetList["average"]
//                                                               .toStringAsFixed(
//                                                               1),
//                                                           style: const TextStyle(
//                                                               fontWeight: FontWeight
//                                                                   .bold,
//                                                               color: Colors
//                                                                   .white,
//                                                               fontSize: 15
//                                                           ),
//                                                         )
//                                                       ]
//                                                   ],
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//
//                                   ),
//                                 ],
//                               );
//
//                             }
//                           }
//                       ),
//                     );
//                   }
//                   else {
//                     return  const Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(height: 40,),
//                         Center(
//                           child: Text('No Service in your area',
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             softWrap: true,
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 color: Colors.blueAccent
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   }
//                   // const SizedBox(height: 20,),
//
//                 }
//             ),
//           ],
//
//         ),
//       ),
//     );
//   }
//   providerProfilepage(String providerUid, context) async {
//
//     final userExit = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get();
//
//     if(userExit.exists){
//       Navigator.push(context, MaterialPageRoute(builder: (_) =>
//           ServiceProviderInfo(
//             serviceProvideruserID: providerUid,
//           )));
//     } else {
//       CommonShareWidget.goToAnotherPage(
//           nextPage: const LoginPage(), context: context);
//     }
//   }
//
//   actionSearchButton() {
//     return Padding(
//       padding: const EdgeInsets.only(right: 35.0),
//       child: InkWell(
//         onTap:() async {
//                 setState(() {
//                   _isSearching = !_isSearching;
//                   _searchList.clear();
//                 });
//           // checkUser(context, false, "no");
//         },
//         child: Card(
//           elevation: 6,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(22.0), //<-- SEE HERE
//           ),
//           child: Container(
//             height: 45,
//             width: 45,
//             decoration: BoxDecoration(color: AppColor.orange,
//                 borderRadius: const BorderRadius.all(Radius.circular(22))
//
//             ),
//             child: Center(
//                 child: Icon( _isSearching ? CupertinoIcons.clear_circled_solid :Icons.search)
//             ),
//           ),
//         ),
//       ),
//     );
//
//     //   IconButton(
//     //     onPressed: () {
//     //       setState(() {
//     //         _isSearching = !_isSearching;
//     //         _searchList.clear();
//     //       });
//     //     },
//     //     icon:  Icon( _isSearching ? CupertinoIcons.clear_circled_solid :Icons.search)
//     //
//     //
//     // );
//   }
//
// }
