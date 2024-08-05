// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/constant/colors.dart';
// import 'package:petfindernetwork/model/lost_found_item_info_model.dart';
// import 'package:petfindernetwork/model/user_profile.dart';
// import 'package:petfindernetwork/repository/userRepo.dart';
// import 'package:petfindernetwork/views/shareAbleWidget.dart/commonShareWidget.dart';
// import 'package:provider/provider.dart';
//
// class CommonLostFoundWidget {
//   CommonLostFoundWidget(this.lostFoundPetInfoModel, this.postedPet);
//   final LostFoundPetInfoModel lostFoundPetInfoModel;
//   final bool postedPet;
//
//
//   Widget buildPetTile(context, VoidCallback? callback)
//   {
//     if(postedPet == true && lostFoundPetInfoModel.review == false){
//       return Container(
//         // height: MediaQuery.of(context).size.height / 4.0,
//         margin: const EdgeInsets.only(
//           left: 5.0,
//           right: 5.0,
//           bottom: 10,
//         ),
//         child: Card(
//           elevation: 0,
//           // color: Colors.grey.shade200,
//           // Colors.greenAccent.withOpacity(0.4),
//           shape: RoundedRectangleBorder(
//             side: BorderSide(
//                 color: AppColor.orange,
//                 width: 2
//             ),
//             borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
//           ),
//           color: AppColor.orange.withOpacity(0.3),
//           child: Padding(
//             padding: const EdgeInsets.only(right: 1.0),
//             child: InkWell(
//               onTap: callback,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   CommonShareWidget.imageNetwork(
//                       borderadius: 20.0,
//                       //height: double.infinity,
//                       height: 250.0,
//                       width: 200.0,
//                       imageurl: lostFoundPetInfoModel.petImageUrl!.isNotEmpty
//                           ? lostFoundPetInfoModel.petImageUrl![0]
//                       //TODO: replace www.google.com with placeholder image url
//                           : 'www.google.com'),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width - 230,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//
//                         textWidget(
//                             fontsize: 16.0,
//                             fontweight: FontWeight.bold,
//                             // color: Colors.black,
//                             maxline: 1,
//                             title: lostFoundPetInfoModel.petName,
//                             bottom: 5.0),
//                         textWidget(
//                             fontsize: 14.0,
//                             maxline: 1,
//                             title: lostFoundPetInfoModel.petCategory,
//                             bottom: 5.0),
//                         textWidget(
//                             fontsize: 14.0,
//                             // fontweight: FontWeight.bold,
//                             // color: Colors.white,
//                             maxline: 1,
//                             title: CommonShareWidget.timeAgo(
//                                 lostFoundPetInfoModel.timestamp ??
//                                     Timestamp.now()),
//                             bottom: 5.0),
//                         const Divider(height: 10, color: Colors.grey,),
//                         const Row(
//                           children: [
//                             Text("Status:",
//                             style: TextStyle(
//                                   fontSize: 14.0,
//                                   fontWeight: FontWeight.bold
//                             ),
//                             ),
//                             Text(" Pending",
//                               style: TextStyle(
//                                   fontSize: 14.0,
//                               ),
//                             )
//                           ],
//                         ),
//                         const Divider(height: 10, color: Colors.grey,),
//                         // buildTitleWithIcon(lostFoundPetInfoModel.location,
//                         //     Icons.location_searching),
//                         textWidget(
//                             fontsize: 14.0,
//                             // fontweight: FontWeight.bold,
//                             // color: Colors.white,
//                             maxline: 1,
//                             title: lostFoundPetInfoModel.location,
//                             bottom: 5.0),
//                         const Divider(height: 10, color: Colors.grey,),
//                         //const Spacer(),
//                         getPostedProfile(lostFoundPetInfoModel.postedId),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//
//     } else{
//       if(lostFoundPetInfoModel.review == true){
//         return Container(
//           // height: MediaQuery.of(context).size.height / 4.0,
//           margin: const EdgeInsets.only(
//             left: 5.0,
//             right: 5.0,
//             bottom: 10,
//           ),
//           child: Card(
//             elevation: 0,
//             // color: Colors.grey.shade200,
//             // Colors.greenAccent.withOpacity(0.4),
//             shape: RoundedRectangleBorder(
//               side: BorderSide(
//                   color: AppColor.orange,
//                   width: 2
//               ),
//               borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
//             ),
//             color: AppColor.orange.withOpacity(0.3),
//             child: Padding(
//               padding: const EdgeInsets.only(right: 1.0),
//               child: InkWell(
//                 onTap: callback,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     CommonShareWidget.imageNetwork(
//                         borderadius: 20.0,
//                         //height: double.infinity,
//                         height: 250.0,
//                         width: 200.0,
//                         imageurl: lostFoundPetInfoModel.petImageUrl!.isNotEmpty
//                             ? lostFoundPetInfoModel.petImageUrl![0]
//                         //TODO: replace www.google.com with placeholder image url
//                             : 'www.google.com'),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width - 230,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//
//                           textWidget(
//                               fontsize: 16.0,
//                               fontweight: FontWeight.bold,
//                               // color: Colors.black,
//                               maxline: 1,
//                               title: lostFoundPetInfoModel.petName,
//                               bottom: 5.0),
//                           textWidget(
//                               fontsize: 14.0,
//                               maxline: 1,
//                               title: lostFoundPetInfoModel.petCategory,
//                               bottom: 5.0),
//                           textWidget(
//                               fontsize: 14.0,
//                               // fontweight: FontWeight.bold,
//                               // color: Colors.white,
//                               maxline: 1,
//                               title: CommonShareWidget.timeAgo(
//                                   lostFoundPetInfoModel.timestamp ??
//                                       Timestamp.now()),
//                               bottom: 5.0),
//
//                           const Divider(height: 10, color: Colors.grey,),
//                           // buildTitleWithIcon(lostFoundPetInfoModel.location,
//                           //     Icons.location_searching),
//                           textWidget(
//                               fontsize: 14.0,
//                               // fontweight: FontWeight.bold,
//                               // color: Colors.white,
//                               maxline: 1,
//                               title: lostFoundPetInfoModel.location,
//                               bottom: 5.0),
//                           const Divider(height: 10, color: Colors.grey,),
//                           //const Spacer(),
//                           getPostedProfile(lostFoundPetInfoModel.postedId),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       }
//       else{
//         return const Text('',
//         );
//       }
//     }
//     // if(lostFoundPetInfoModel.review == true){
//     //   return Container(
//     //     // height: MediaQuery.of(context).size.height / 4.0,
//     //     margin: const EdgeInsets.only(
//     //       left: 5.0,
//     //       right: 5.0,
//     //       bottom: 10,
//     //     ),
//     //     child: Card(
//     //       elevation: 0,
//     //       // color: Colors.grey.shade200,
//     //       // Colors.greenAccent.withOpacity(0.4),
//     //       shape: RoundedRectangleBorder(
//     //         side: BorderSide(
//     //           color: AppColor.orange,
//     //           width: 2
//     //         ),
//     //         borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
//     //       ),
//     //       color: AppColor.orange.withOpacity(0.3),
//     //       child: Padding(
//     //         padding: const EdgeInsets.only(right: 1.0),
//     //         child: InkWell(
//     //           onTap: callback,
//     //           child: Row(
//     //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //             children: <Widget>[
//     //               CommonShareWidget.imageNetwork(
//     //                   borderadius: 20.0,
//     //                   //height: double.infinity,
//     //                   height: 250.0,
//     //                   width: 200.0,
//     //                   imageurl: lostFoundPetInfoModel.petImageUrl!.isNotEmpty
//     //                       ? lostFoundPetInfoModel.petImageUrl![0]
//     //                   //TODO: replace www.google.com with placeholder image url
//     //                       : 'www.google.com'),
//     //               SizedBox(
//     //                 width: MediaQuery.of(context).size.width - 230,
//     //                 child: Column(
//     //                   crossAxisAlignment: CrossAxisAlignment.start,
//     //                   children: <Widget>[
//     //
//     //                     textWidget(
//     //                         fontsize: 16.0,
//     //                         fontweight: FontWeight.bold,
//     //                         // color: Colors.black,
//     //                         maxline: 1,
//     //                         title: lostFoundPetInfoModel.petName,
//     //                         bottom: 5.0),
//     //                     textWidget(
//     //                         fontsize: 14.0,
//     //                         maxline: 1,
//     //                         title: lostFoundPetInfoModel.petCategory,
//     //                         bottom: 5.0),
//     //                     textWidget(
//     //                         fontsize: 14.0,
//     //                         // fontweight: FontWeight.bold,
//     //                         // color: Colors.white,
//     //                         maxline: 1,
//     //                         title: CommonShareWidget.timeAgo(
//     //                                 lostFoundPetInfoModel.timestamp ??
//     //                                     Timestamp.now()),
//     //                         bottom: 5.0),
//     //
//     //                     const Divider(height: 10, color: Colors.grey,),
//     //                     // buildTitleWithIcon(lostFoundPetInfoModel.location,
//     //                     //     Icons.location_searching),
//     //                     textWidget(
//     //                         fontsize: 14.0,
//     //                         // fontweight: FontWeight.bold,
//     //                         // color: Colors.white,
//     //                         maxline: 1,
//     //                         title: lostFoundPetInfoModel.location,
//     //                         bottom: 5.0),
//     //                     const Divider(height: 10, color: Colors.grey,),
//     //                     //const Spacer(),
//     //                     getPostedProfile(lostFoundPetInfoModel.postedId),
//     //                   ],
//     //                 ),
//     //               )
//     //             ],
//     //           ),
//     //         ),
//     //       ),
//     //     ),
//     //   );
//     // }
//     // else{
//     //   return const Text('',
//     //     );
//     // }
//   }
//
//   getPostedProfile(id) {
//     return FutureBuilder<DocumentSnapshot>(
//       future: UserRepo.getUserProfileDocument(id),
//       builder: (context, snapshot) {
//         if (snapshot.data != null) {
//           UserProfileModel userProfileModel = UserProfileModel.fromDocumentSnap(
//               snapshot.data as DocumentSnapshot<Map<String, dynamic>>);
//           return Provider<UserProfileModel>(
//             create: (_) => UserProfileModel.fromDocumentSnap(
//                 snapshot.data as DocumentSnapshot<Map<String, dynamic>>),
//             child:
//             SizedBox(
//               width: MediaQuery.of(context).size.width * 0.50,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Text(
//                   //   "Contact Person",
//                   //   maxLines: 1,
//                   //   overflow: TextOverflow.ellipsis,
//                   //   softWrap: true,
//                   //   style: const TextStyle(
//                   //       fontWeight: FontWeight.bold,
//                   //       fontSize: 17
//                   //   ),
//                   // ),
//                   const Text("Contact Person:",
//
//                   style: TextStyle(
//                       fontSize: 17,
//                     // fontWeight: FontWeight.bold
//                   ),
//                   ),
//                 Row(
//                   children: [
//                     CommonShareWidget.imageNetwork(
//                     imageurl: userProfileModel.profilephotoImageUrl,
//                     height: 50.0,
//                     width: 50.0,
//                     // borderadius: 50.0,
//                     shape: const CircleBorder(),
//                   ),
//                     const SizedBox(width: 5,),
//                     Expanded(
//                       child: Text(
//                           userProfileModel.name!,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           softWrap: true,
//                           style: const TextStyle(
//                             // fontWeight: FontWeight.bold,
//                             fontSize: 17
//                           ),
//                         ),
//                     ),
//                   ],
//                 ),
//               // const SizedBox(width: 5,),
//               // Text(
//               //       userProfileModel.phone!,
//               //       maxLines: 1,
//               //       overflow: TextOverflow.ellipsis,
//               //       softWrap: true,
//               //       style: const TextStyle(
//               //           // fontWeight: FontWeight.bold,
//               //           fontSize: 15
//               //       ),
//               //     ),
//                 ],
//               ),
//             )
//           );
//         }
//         return Container();
//       },
//     );
//   }
//
//   buildTitleWithIcon(title, icon) {
//     return textWidget(
//       fontsize: 15.0,
//       fontweight: FontWeight.normal,
//       // maxline: 1,
//       title: title,
//       bottom: 5.0,
//     );
//   }
//
//   Widget textWidget(
//       {required title,
//       fontsize,
//       int? maxline,
//       fontweight,
//       color,
//       double? top,
//       double? bottom}) {
//     return Container(
//       margin: EdgeInsets.only(top: top ?? 0.0, bottom: bottom ?? 0.0),
//       child: Text(
//         title,
//         style: TextStyle(
//           fontSize: fontsize,
//           fontWeight: fontweight,
//           color: color,
//         ),
//         maxLines: 2,
//         softWrap: true,
//         overflow: TextOverflow.ellipsis,
//       ),
//     );
//   }
// }
