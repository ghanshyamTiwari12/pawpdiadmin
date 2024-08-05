//
// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/constant/colors.dart';
// import 'package:provider/provider.dart';
// import '../../bloc/itemBloc.dart';
// import '../../model/user_profile.dart';
// import '../../repository/userRepo.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
// import 'itemDetailpage.dart';
//
// class PetMatchList extends StatefulWidget {
//   const PetMatchList( {super.key,
//     required this.foundPetColor,
//     required this.foundPetGender,
//     required this.foundPetLogitude,
//     required this.foundPetLatitude,
//     required this.foundPetStatus,
//     required this.foundPetcategory,
//   });
//   final String foundPetLogitude;
//   final String foundPetLatitude;
//   final String foundPetStatus;
//   final String foundPetColor;
//   final String foundPetGender;
//   final String foundPetcategory;
//
//   @override
//   State<PetMatchList> createState() => _PetMatchListState();
// }
//
// class _PetMatchListState extends State<PetMatchList> {
//   ScrollController controller = ScrollController();
//   // late CommonLostFoundWidget _commonLostFoundWidget;
//   String stAddress = '';
//   late PetBloc petBloc;
//   late Stream<List<DocumentSnapshot>?>? stream;
//   final fireStore =  FirebaseFirestore.instance.collection('lfPets').snapshots();
//   CollectionReference ref = FirebaseFirestore.instance.collection('lfPets');
//   bool match = false;
//   @override
//   void initState() {
//       if(widget.foundPetStatus == "found" ){
//         petBloc = PetBloc("lost");
//       } else{
//         petBloc = PetBloc("found");
//       }
//     petBloc.fetchFirstList();
//     petBloc.listentChangeofData();
//     stream = petBloc.petStream;
//      controller.addListener(_scrollListener);
//
//       super.initState();
//   }
//   void _scrollListener() {
//     if (controller.offset >= controller.position.maxScrollExtent &&
//         !controller.position.outOfRange) {
//       petBloc.fetchNextMovies();
//     }
//   }
//   @override
//   void dispose(){
//     petBloc.dispose();
//     controller.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     var height = size.height;
//     var width = size.width;
//
//     return Scaffold(
//       appBar: AppBar(
//         title:  const Text('Matches')
//       ),
//
//       body:  StreamBuilder<QuerySnapshot>(
//         stream: fireStore,
//         builder: (BuildContext context, snapshot){
//           var listLength1 = snapshot.data?.docs.length;
//             if (kDebugMode) {
//               print('snapshot length==== $listLength1');
//             }
//           List < Map<String, dynamic>> petCompareList = [];
//           if(listLength1!=null)
//           {
//             for(int i = 0; i < listLength1; i++ )
//             {
//               Map<String, dynamic> val1 = snapshot.data!.docs[i].data() as Map<String, dynamic>;
//               double? lat2;
//               double? lon2;
//               if(val1['latitude'] != null && val1['longitude'] !=null )
//               {
//                  lat2 = double.tryParse(val1['latitude']) ;
//                  lon2 = double.tryParse(val1['longitude']);
//                  if (kDebugMode) {
//                    print("=======latitude in first if: $lat2");
//                  }
//               }
//               double? lat1 = double.tryParse(widget.foundPetLatitude);
//               double? lon1 = double.tryParse(widget.foundPetLogitude);
//               String petColor1 = val1['pet_color']!.toString().toLowerCase();
//               String petColor2 = widget.foundPetColor.toLowerCase();
//               double distance = calculateDistance(lat1 ?? 0.0, lon1 ?? 0.0, lat2 ?? 0.0, lon2 ?? 0.0);
//                 if (val1['pet_category'] == widget.foundPetcategory
//                     && val1['pet_status']!= widget.foundPetStatus
//                 && petColor1 == petColor2
//                     && val1['pet_gender'] == widget.foundPetGender && distance <= 25 && val1['review'] == true
//                 )
//                 {
//                    if (kDebugMode) {
//                     print('if condition longitude ==="${val1['longitude']}"');
//                   }
//                   if (kDebugMode) {
//                     print('if condition pet_color ==="${val1['pet_color']}"');
//                   }
//                   if (kDebugMode) {
//                     print('if condition pet_color ==="${val1['pet_category']}"');
//                   }
//                   if (kDebugMode) {
//                     print('if condition pet_color ==="${val1['pet_name']}"');
//                   }
//                   petCompareList.add(val1);
//                 }
//                                             }
//           }
//             if (kDebugMode) {
//               print('======petCompareList.length = ${petCompareList.length}');
//             }
//           if (petCompareList.isNotEmpty) {
//             return ListView.builder(
//               itemCount: petCompareList.length,
//               shrinkWrap: true,
//               controller: controller,
//               itemBuilder: (context, index) {
//                 dynamic val = petCompareList[index];
//                 List<dynamic> urlList = petCompareList[index]['image_url'];
//                 String url = urlList.first.toString();
//                 if (kDebugMode) {
//                   print('image url======$url');
//                 }
//                 return
//                   Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: InkWell(
//                       onTap: ()
//                       {
//                         CommonShareWidget.goToAnotherPage(
//                         checkLogin: true,
//                         nextPage: StreamProvider<DocumentSnapshot<Map<String, dynamic>?>?>(
//                           create: (BuildContext context) {
//                             return petBloc
//                                 .getSinglePetStream(val['docID']);
//                           },
//                           initialData: null,
//                           child: const PetDetailPage(matchPet: true,
//
//                             // petDetails: lostFoundPetInfoModel,
//                           ),
//                         ),
//                         context: context,
//                       ).then((value) => setState(() {
//                         stream = petBloc.petStream;
//                       }));
//                            },
//                       child: Container(
//                       height: height *0.20,
//                       width: width *0.80,
//                       margin: const EdgeInsets.only(
//                       left: 5.0,
//                       right: 5.0,
//                       bottom: 10,
//                       ),
//                     child:  Card(
//                       elevation: 0,
//                       color: AppColor.orange.withOpacity(0.5),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             CommonShareWidget.imageNetwork(
//                                 borderadius: 20.0,
//                                 //height: double.infinity,
//                                 height: 210.0,
//                                 width: 150.0,
//                                 imageurl: url),
//                             const SizedBox(width: 20,),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   const SizedBox(height: 20,),
//                                   Text(petCompareList[index]['pet_name'],
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     softWrap: true,
//                                     style: const TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                   Text(petCompareList[index]['found_location'],
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     softWrap: true,
//                                     style: const TextStyle(
//                                         fontSize: 14,
//                                         // fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                   const Divider(height: 10, color: Colors.grey,),
//                                   //const Spacer(),
//                                   getPostedProfile(petCompareList[index]['posted_id']),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                       ),
//
//                     ),
//                   );
//               },
//             );
//           }
//           else
//           {
//             return const Center(child: Text('No Match',
//             style: TextStyle(
//               fontSize: 30
//             ),
//             ));
//           }
//         },
//       ),
//     );
//   }
//   getPostedProfile(id) {
//     return FutureBuilder<DocumentSnapshot>(
//       future: UserRepo.getUserProfileDocument(id),
//       builder: (context, snapshot) {
//         if (snapshot.data != null) {
//           UserProfileModel userProfileModel = UserProfileModel.fromDocumentSnap(
//               snapshot.data as DocumentSnapshot<Map<String, dynamic>>);
//           return Provider<UserProfileModel>(
//               create: (_) => UserProfileModel.fromDocumentSnap(
//                   snapshot.data as DocumentSnapshot<Map<String, dynamic>>),
//               child:
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.50,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Text(
//                     //   "Contact Person",
//                     //   maxLines: 1,
//                     //   overflow: TextOverflow.ellipsis,
//                     //   softWrap: true,
//                     //   style: const TextStyle(
//                     //       fontWeight: FontWeight.bold,
//                     //       fontSize: 17
//                     //   ),
//                     // ),
//                     const Text("Contact Person:",
//
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         CommonShareWidget.imageNetwork(
//                           imageurl: userProfileModel.profilephotoImageUrl,
//                           height: MediaQuery.of(context).size.height * 0.05,
//                           width: MediaQuery.of(context).size.height * 0.05,
//                           // borderadius: 50.0,
//                           shape: const CircleBorder(),
//                         ),
//                         const SizedBox(width: 5,),
//                         Expanded(
//                           child: Text(
//                             userProfileModel.name!,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             softWrap: true,
//                             style: const TextStyle(
//                               // fontWeight: FontWeight.bold,
//                                 fontSize: 17
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     // const SizedBox(width: 5,),
//                     // Text(
//                     //       userProfileModel.phone!,
//                     //       maxLines: 1,
//                     //       overflow: TextOverflow.ellipsis,
//                     //       softWrap: true,
//                     //       style: const TextStyle(
//                     //           // fontWeight: FontWeight.bold,
//                     //           fontSize: 15
//                     //       ),
//                     //     ),
//                   ],
//                 ),
//               )
//           );
//         }
//         return Container();
//       },
//     );
//   }
//
//   calculateDistance(double lat1, double lon1, double lat2, double lon2,){
//     if (kDebugMode) {
//       print('Call calculator');
//     }
//     var p = 0.017453292519943295;
//     var a = 0.5 - cos(( lat2 - lat1) * p)/2 +
//         cos(lat1 * p) * cos(lat2 * p) *
//             (1 - cos((lon2 - lon1) * p))/2;
//     var result  = 12742 * asin(sqrt(a));
//     if (kDebugMode) {
//       print('Distance in km= $result');
//     }
//
//     return 12742 * asin(sqrt(a));
//
//   }
//
//
// }
//
//
//
