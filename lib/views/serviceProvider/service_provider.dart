// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/constant/colors.dart';
// import 'package:petfindernetwork/model/user_profile.dart';
// import 'package:petfindernetwork/views/shareAbleWidget.dart/commonShareWidget.dart';
// import '../../repository/userRepo.dart';
// import 'book_service_input.dart';
//
// class ServiceProviderInfo extends StatefulWidget {
//   const ServiceProviderInfo({super.key, required this.serviceProvideruserID});
//   final String serviceProvideruserID;
//
//   @override
//   State<ServiceProviderInfo> createState() => _ServiceProviderInfoState();
// }
//
// class _ServiceProviderInfoState extends State<ServiceProviderInfo> {
//   final firestore = FirebaseFirestore.instance.collection("users").snapshots();
//   // List<UserProfileModel> _list = [];
//
//   final String? userUid = FirebaseAuth.instance.currentUser?.uid;
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//    var width = size.width;
//    var height = size.height;
//     return Scaffold(
//       appBar: AppBar(
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             StreamBuilder<DocumentSnapshot>(
//                 stream: UserRepo().getUserProfileStream(widget.serviceProvideruserID),
//                 builder: (context, snapshot){
//
//               if(snapshot.connectionState == ConnectionState.waiting){
//                 return  CommonShareWidget.circularLoader();
//               }
//               if(snapshot.hasError){
//                 return const Text("Error");
//               }
//               if(snapshot.hasData){
//                 UserProfileModel serviceProviderprofile =
//                 UserProfileModel.fromDocumentSnap(snapshot.data
//                 as DocumentSnapshot<Map<String, dynamic>>);
//
//                 var ratingAverage = serviceProviderprofile.average?.toStringAsFixed(1);
//                 var fiveStar = serviceProviderprofile.fiveStar;
//                 var fourStar = serviceProviderprofile.fourStar;
//                 var threeStar = serviceProviderprofile.threeStar;
//                 var twoStar = serviceProviderprofile.twoStar;
//                 var oneStar = serviceProviderprofile.oneStar;
//                 var totalStar = oneStar! + twoStar! + threeStar! + fourStar! + fiveStar!;
//
//                 num fiveStarPercentage, fourStarPercentage, threeStarPercentage, twoStarPercentage, oneStarPercentage;
//                 if(totalStar != 0){
//                   fiveStarPercentage = ((fiveStar / totalStar)*100).toInt();
//                   fiveStarPercentage = fiveStarPercentage /100;
//                   fourStarPercentage = ((fourStar / totalStar)*100).toInt();
//                   fourStarPercentage = fourStarPercentage /100;
//                   threeStarPercentage = ((threeStar / totalStar)*100).toInt();
//                   threeStarPercentage = threeStarPercentage /100;
//                   twoStarPercentage = ((twoStar / totalStar)*100).toInt();
//                   twoStarPercentage = twoStarPercentage /100;
//                   oneStarPercentage = ((oneStar / totalStar)*100).toInt();
//                   oneStarPercentage = oneStarPercentage /100;
//                 } else{
//                   fiveStarPercentage = 0;
//                   fourStarPercentage = 0;
//                   threeStarPercentage = 0;
//                   twoStarPercentage = 0;
//                   oneStarPercentage =0;
//                                  }
//                 return Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Center(
//                           child: SizedBox(
//                             width: width *0.80,
//                             height: height * 0.40,
//                             // color: Colors.orange,
//                             child: Stack(
//                               children: [
//                                 Positioned(
//                                     left: width *0.05,
//                                     bottom: 80,
//                                     child: Container(
//                                       // height: 250,
//                                       // width: width *60,
//                                       height: height * 0.30,
//                                       width: width * 0.70,
//                                       // color: Colors.black,
//                                       decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                             image: CachedNetworkImageProvider(serviceProviderprofile.profilephotoImageUrl.toString()
//                                               // image: NetworkImage(serviceProviderprofile.profilephotoImageUrl.toString(),
//                                             ),
//                                             fit: BoxFit.fill
//                                         ),
//                                         borderRadius:  const BorderRadius.only(
//                                             topLeft: Radius.circular(30),
//                                             topRight: Radius.circular(30),
//                                             bottomLeft: Radius.circular(10),
//                                             bottomRight: Radius.circular(10),
//                                         ),
//                                       ),
//                                     )),
//                                 Positioned(
//                                     left: width *0.09,
//                                     bottom: 1,
//                                     child: Card(
//                                       elevation: 20,
//                                       color: AppColor.green.withOpacity(0.9),
//                                       shape: RoundedRectangleBorder( //<-- 1. SEE HERE
//                                         borderRadius: BorderRadius.circular(20.0),
//                                       ),
//                                       child: Container(
//                                         height: 130,
//                                         width: width *0.60,
//                                         // color: Colors.green,
//                                         decoration: const BoxDecoration(
//                                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                                         ),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(14.0),
//                                           child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             children: [
//                                               const SizedBox(height: 12,),
//                                               Row(
//                                                 children: [
//                                                   // const Text("Name: ",
//                                                   //   style: TextStyle(
//                                                   //       fontSize: 18,
//                                                   //       fontWeight: FontWeight.bold
//                                                   //   ),
//                                                   // ),
//                                                   Expanded(
//                                                     child: Text("${serviceProviderprofile.name}",
//                                                       maxLines: 1,
//                                                       overflow: TextOverflow.ellipsis,
//                                                       softWrap: true,
//                                                       style: const TextStyle(
//                                                         color: Colors.white,
//                                                         fontSize: 16,
//                                                         fontWeight: FontWeight.bold
//                                                       ),
//
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               const SizedBox(height: 5,),
//                                               Row(
//                                                 children: [
//                                                   // const Text("Service Type: ",
//                                                   //   style: TextStyle(
//                                                   //       fontSize: 18,
//                                                   //       fontWeight: FontWeight.bold
//                                                   //   ),
//                                                   // ),
//                                                   Text("${serviceProviderprofile.professionalType}",
//                                                     maxLines: 1,
//                                                     overflow: TextOverflow.ellipsis,
//                                                     softWrap: true,
//                                                     style: const TextStyle(
//                                                       color: Colors.white,
//                                                       fontSize: 16,
//                                                       fontWeight: FontWeight.bold
//                                                     ),
//                                                   ),
//
//                                                 ],
//                                               ),
//                                               const SizedBox(height: 5,),
//                                               Row(
//                                                 children: [
//                                                   // const Text("Location: ",
//                                                   //   maxLines: 1,
//                                                   //   overflow: TextOverflow.ellipsis,
//                                                   //   softWrap: true,
//                                                   //   style: TextStyle(
//                                                   //       fontSize: 18,
//                                                   //       fontWeight: FontWeight.bold
//                                                   //   ),
//                                                   // ),
//                                                   Expanded(
//                                                     child: Text("${serviceProviderprofile.location}",
//                                                       maxLines: 1,
//                                                       overflow: TextOverflow.ellipsis,
//                                                       softWrap: true,
//                                                       style: const TextStyle(
//                                                         color: Colors.white,
//                                                         fontSize: 16,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//
//                                       ),
//                                     ))
//
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 05,),
//                       Row(
//                         children: [
//                     if(ratingAverage == 0.0.toString())...[
//                       const Text("Reviews: 0",
//                         style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold
//                         ),
//                       ),
//                     ] else...[
//                       Text("Reviews: $ratingAverage",
//                         style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold
//                         ),
//                       ),
//                     ],
//                           const Icon(Icons.star,
//                           color: Colors.orange,
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 5,),
//                       Row(
//
//                         children: [
//                           const Text("5",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold
//                           ),
//                           ),
//                           const SizedBox(width: 05,),
//                           const Icon(Icons.star_outline_sharp,
//                             color: Colors.orange,
//                           ),
//                           const SizedBox(width: 05,),
//                           Stack(
//                             children: <Widget>[
//                               Container(
//                                 width: width *0.57,
//                                 height: 40,
//                                 decoration: BoxDecoration(
//                                     color: Colors.blueAccent.withOpacity(0.3),
//                                     borderRadius: const BorderRadius.all(
//                                         Radius.circular(15))
//                                 ),
//                               ),
//                               Container(
//                                 width: (width *0.57) * fiveStarPercentage, // here you can define your percentage of progress, 0.2 = 20%, 0.3 = 30 % .....
//                                 height: 40,
//                   decoration:  BoxDecoration(
//                       color: AppColor.orange,
//                       borderRadius: const BorderRadius.all(
//                           Radius.circular(15))
//                     ),
//                                 //     borderRadius: const BorderRadius.all(
//                                 //         Radius.circular(15))
//                               ),
//                             ],
//                           ),
//                           const SizedBox(width: 05,),
//                           if(fiveStar.toInt() == 0)...[
//                             const Text("0%",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20
//                               )
//                               ,)
//                           ] else...[
//                             Text("${((fiveStar / totalStar)*100).toInt()}%",
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20
//                               )
//                               ,)
//                           ]
//
//                         ],
//                       ),
//                       const SizedBox(height: 5,),
//                       Row(
//                         children: [
//                           const Text("4",
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold
//                             ),
//                           ),
//                           const SizedBox(width: 05,),
//                           const Icon(Icons.star_outline_sharp,
//                             color: Colors.orange,
//                           ),
//                           const SizedBox(width: 05,),
//                           Stack(
//                             children: <Widget>[
//                               Container(
//                                 width: width *0.57,
//                                 height: 40,
//                                 decoration: BoxDecoration(
//                                     color: Colors.blueAccent.withOpacity(0.3),
//                                     borderRadius: const BorderRadius.all(
//                                         Radius.circular(15))
//                                 ),
//                               ),
//                               Container(
//                                 width: (width *0.57) * fourStarPercentage, // here you can define your percentage of progress, 0.2 = 20%, 0.3 = 30 % .....
//                                 height: 40,
//                                 decoration:  BoxDecoration(
//                                     color: AppColor.orange,
//                                     borderRadius: const BorderRadius.all(
//                                         Radius.circular(15))
//                                 ),
//                                 //     borderRadius: const BorderRadius.all(
//                                 //         Radius.circular(15))
//                               ),
//                             ],
//                           ),
//                           const SizedBox(width: 05,),
//                           if(fourStar.toInt() == 0)...[
//                             const Text("0 %",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20
//                               )
//                               ,)
//                           ]else...[
//                             Text("${((fourStar / totalStar)*100).toInt()}%",
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20
//                               ),
//                             )
//                           ]
//                         ],
//                       ),
//                       const SizedBox(height: 5,),
//                       Row(
//                         children: [
//                           const Text("3",
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold
//                             ),
//                           ),
//                           const SizedBox(width: 05,),
//                           const Icon(Icons.star_outline_sharp,
//                             color: Colors.orange,
//                           ),
//                           const SizedBox(width: 05,),
//                           Stack(
//                             children: <Widget>[
//                               Container(
//                                 width: width *0.57,
//                                 height: 40,
//                                 decoration: BoxDecoration(
//                                     color: Colors.blueAccent.withOpacity(0.3),
//                                     borderRadius: const BorderRadius.all(
//                                         Radius.circular(15))
//                                 ),
//                               ),
//                               Container(
//                                 width: (width *0.57) * threeStarPercentage, // here you can define your percentage of progress, 0.2 = 20%, 0.3 = 30 % .....
//                                 height: 40,
//                                 decoration:  BoxDecoration(
//                                     color: AppColor.orange,
//                                     borderRadius: const BorderRadius.all(
//                                         Radius.circular(15))
//                                 ),
//                                 //     borderRadius: const BorderRadius.all(
//                                 //         Radius.circular(15))
//                               ),
//                             ],
//                           ),
//                           const SizedBox(width: 05,),
//                           if(threeStar.toInt() == 0)...[
//                             const Text("0 %",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20
//                               )
//                               ,)
//
//                           ]else...[
//                             Text("${((threeStar/ totalStar)*100).toInt()}%",
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20
//                               )
//                               ,)
//
//                           ]
//                         ],
//                       ),
//                       const SizedBox(height: 5,),
//                       Row(
//                         children: [
//                           const Text("2",
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold
//                             ),
//                           ),
//                           const SizedBox(width: 05,),
//                           const Icon(Icons.star_outline_sharp,
//                             color: Colors.orange,
//                           ),
//                           const SizedBox(width: 05,),
//                           Stack(
//                             children: <Widget>[
//                               Container(
//                                 width: width *0.57,
//                                 height: 40,
//                                 decoration: BoxDecoration(
//                                     color: Colors.blueAccent.withOpacity(0.3),
//                                     borderRadius: const BorderRadius.all(
//                                         Radius.circular(15))
//                                 ),
//                               ),
//                               Container(
//                                 width: (width *0.57) * twoStarPercentage, // here you can define your percentage of progress, 0.2 = 20%, 0.3 = 30 % .....
//                                 height: 40,
//                                 decoration:  BoxDecoration(
//                                     color: AppColor.orange,
//                                     borderRadius: const BorderRadius.all(
//                                         Radius.circular(15))
//                                 ),
//                                 //     borderRadius: const BorderRadius.all(
//                                 //         Radius.circular(15))
//                               ),
//                             ],
//                           ),
//                           const SizedBox(width: 05,),
//                           if(twoStar == 0)...[
//                             const Text("0%",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20
//                               )
//                               ,)
//                           ] else...[
//                             Text("${((twoStar / totalStar)*100).toInt()}%",
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20
//                               )
//                               ,)
//                           ]
//
//                         ],
//                       ),
//                       const SizedBox(height: 5,),
//                       Row(
//                         children: [
//                           const Text("1 ",
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold
//                             ),
//                           ),
//                           const SizedBox(width: 05,),
//                            const Icon(Icons.star_outline_sharp,
//                            color: Colors.orange,
//                            ),
//                           const SizedBox(width: 05,),
//                           Stack(
//                             children: <Widget>[
//                               Container(
//                                 width: width *0.57,
//                                 height: 40,
//                                 decoration: BoxDecoration(
//                                     color: Colors.blueAccent.withOpacity(0.3),
//                                     borderRadius: const BorderRadius.all(
//                                         Radius.circular(15))
//                                 ),
//                               ),
//                               Container(
//                                 width: (width *0.57) * oneStarPercentage, // here you can define your percentage of progress, 0.2 = 20%, 0.3 = 30 % .....
//                                 height: 40,
//                                 decoration:  BoxDecoration(
//                                     color: AppColor.orange,
//                                     borderRadius: const BorderRadius.all(
//                                         Radius.circular(15))
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                          const SizedBox(width: 05,),
//                           if(oneStar.toInt() == 0)...[
//                             const Text("0 %",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20
//                               ),
//                               ),
//                           ]
//                           else...[
//                             Text("${((oneStar / totalStar)*100).toInt()}%",
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20
//                               )
//                               ,)
//                           ]                      ],
//                       ),
//                       const SizedBox(height: 20,),
//                       ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.black,
//                             minimumSize: const Size.fromHeight(50), // NEW
//                           ),
//                           onPressed: ()
//                           {
//                           Navigator.push(context, MaterialPageRoute(builder: (_) =>
//                               BookServicePage(
//                             serviceProviderId: serviceProviderprofile.uid.toString(),
//                             userID: userUid.toString(),
//                             serviceProviderName: serviceProviderprofile.name.toString(),
//                             serviceType: serviceProviderprofile.professionalType.toString(),)));
//                           }, child: const Text("Book Appointment",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 23,
//                           fontWeight: FontWeight.bold
//                         ),
//                       )),
//                       const SizedBox(height: 80),
//                     ],
//                   ),
//                 );
//               }
//               else{
//                 return const Center(
//                   child: Text('No User found',
//                       style: TextStyle(
//                           fontSize: 20
//                       )
//                   ),
//                 );
//               }
//             }
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//
// }
