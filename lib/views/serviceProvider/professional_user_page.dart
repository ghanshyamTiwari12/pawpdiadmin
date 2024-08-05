// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/constant/colors.dart';
// import 'package:petfindernetwork/views/serviceProvider/search_professional_page.dart';
// import 'package:petfindernetwork/views/serviceProvider/service_provider.dart';
// import 'package:petfindernetwork/views/serviceProvider/trainer_list.dart';
// import 'package:petfindernetwork/views/serviceProvider/user_appointment_list.dart';
// import 'package:petfindernetwork/views/serviceProvider/vet_list.dart';
// import 'package:petfindernetwork/views/user/userProfile.dart';
// import 'package:provider/provider.dart';
// import '../../model/user_profile.dart';
// import '../../repository/cityListRepo.dart';
// import '../digital_diary/pet_diary_list.dart';
// import '../loginSignUp/login.dart';
// import '../lostFound/founditemList.dart';
// import '../lostFound/lostItemList.dart';
// import '../petRegistration/pet_registration.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
//
// class ProfessionalUserPage extends StatefulWidget {
//   const ProfessionalUserPage({super.key});
//
//   @override
//   State<ProfessionalUserPage> createState() => _ProfessionalUserPageState();
// }
//
//
// class _ProfessionalUserPageState extends State<ProfessionalUserPage> {
//
//   final fireStore =  FirebaseFirestore.instance.collection('users').snapshots();
//   CollectionReference ref = FirebaseFirestore.instance.collection('users');
//   final carouselStream =  FirebaseFirestore.instance.collection('carousel').snapshots();
//
//   List<UserProfileModel> _vetList = [];
//   List<UserProfileModel> _trainerList  = [];
//
//   @override
//   void dispose() {
//     if (kDebugMode) {
//       print("====called dispose at home page in user ");
//     }
//     _vetList.clear();
//     _trainerList.clear();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//    final size = MediaQuery.of(context).size;
//    var  width = size.width;
//     return SafeArea(
//       child: Scaffold(
//         body : NestedScrollView
//           (
//           floatHeaderSlivers: true,
//           headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
//             SliverAppBar(
//               floating: true,
//               title: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Row
//                         (
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const Text("Pet",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                         // fontStyle: FontStyle.italic ,
//                         fontSize: 40
//                       ),
//                       ),
//                       const Text("finder",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.orange,
//                             // fontStyle: FontStyle.italic ,
//                             fontSize: 40
//                         ),
//                       ),
//                       const Spacer(),
//
//                       actionProfileButton(context),
//                     ],
//                   ),
//               ),
//                 // actions: [
//                 //   actionProfileButton(),
//                 // ],
//               ),
//           ],
//           body: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Wrap(
//                   //   children: [
//                   //     Padding(
//                   //       padding: const EdgeInsets.only(right: 5),
//                   //       child: Column(
//                   //         children: [
//                   //           InkWell(
//                   //             onTap: () async {
//                   //               final userExit = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get();
//                   //               if(userExit.exists){
//                   //                 CommonShareWidget.goToAnotherPage(
//                   //                     nextPage: PetRegistration(uid: FirebaseAuth.instance.currentUser!.uid),
//                   //                     context: context);
//                   //               } else{
//                   //                 CommonShareWidget.goToAnotherPage(
//                   //                     nextPage: const LoginPage(), context: context);
//                   //               }
//                   //             },
//                   //             child: Card(
//                   //               elevation: 6,
//                   //               shape: RoundedRectangleBorder(
//                   //                 borderRadius: BorderRadius.circular(25.0), //<-- SEE HERE
//                   //               ),
//                   //               child: Container(
//                   //                 height: 50,
//                   //                 width: 50,
//                   //                 decoration: BoxDecoration(color: AppColor.orange,
//                   //                     borderRadius: const BorderRadius.all(Radius.circular(25))
//                   //                 ),
//                   //                 child: const Center(
//                   //                     child: Icon(Icons.pets)
//                   //                 ),
//                   //               ),
//                   //             ),
//                   //           ),
//                   //           const Text(
//                   //             "Register",
//                   //             style: TextStyle(
//                   //               fontSize: 15,
//                   //
//                   //               // fontWeight: FontWeight.bold
//                   //             ),
//                   //           ),
//                   //           const Text(
//                   //             "pet",
//                   //             style: TextStyle(
//                   //               fontSize: 15,
//                   //               // fontWeight: FontWeight.bold
//                   //             ),
//                   //           )
//                   //         ],
//                   //       ),
//                   //     ),
//                   //     Padding(
//                   //       padding: const EdgeInsets.only(right: 5.0),
//                   //       child: Column(
//                   //         children: [
//                   //           InkWell(
//                   //             onTap: () async {
//                   //               final userExit = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get();
//                   //               if(userExit.exists){
//                   //                 CommonShareWidget.goToAnotherPage(
//                   //                     nextPage: PetDiaryList(userUid: FirebaseAuth.instance.currentUser!.uid),
//                   //                     context: context);
//                   //               } else{
//                   //                 CommonShareWidget.goToAnotherPage(
//                   //                     nextPage: const LoginPage(), context: context);
//                   //               }
//                   //             },
//                   //             child: Card(
//                   //               elevation: 6,
//                   //               shape: RoundedRectangleBorder(
//                   //                 borderRadius: BorderRadius.circular(25.0), //<-- SEE HERE
//                   //               ),
//                   //               child: Container(
//                   //                 height: 50,
//                   //                 width: 50,
//                   //                 decoration: BoxDecoration(color: AppColor.orange,
//                   //                     borderRadius: const BorderRadius.all(Radius.circular(25))
//                   //
//                   //                 ),
//                   //                 child: const Center(
//                   //                     child: Icon(Icons.calendar_view_month_sharp)
//                   //                 ),
//                   //               ),
//                   //             ),
//                   //           ),
//                   //           const Text(
//                   //             "My Pet",
//                   //             style: TextStyle(
//                   //               fontSize: 15,
//                   //               // fontWeight: FontWeight.bold
//                   //             ),
//                   //           ),
//                   //           const Text(
//                   //             "",
//                   //             style: TextStyle(
//                   //               fontSize: 15,
//                   //               // fontWeight: FontWeight.bold
//                   //             ),
//                   //           )
//                   //         ],
//                   //       ),
//                   //     ),
//                   //     Padding(
//                   //       padding: const EdgeInsets.only(right: 5.0),
//                   //       child: Column(
//                   //         children: [
//                   //           InkWell(
//                   //             onTap:() async {
//                   //               final userExit = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get();
//                   //               if(userExit.exists){
//                   //                 CommonShareWidget.goToAnotherPage(
//                   //                     nextPage: UserAppointmentList(FirebaseAuth.instance.currentUser!.uid),
//                   //                     context: context);
//                   //               } else{
//                   //                 CommonShareWidget.goToAnotherPage(
//                   //                     nextPage: const LoginPage(), context: context);
//                   //               }
//                   //             },
//                   //             child: Card(
//                   //               elevation: 6,
//                   //               shape: RoundedRectangleBorder(
//                   //                 borderRadius: BorderRadius.circular(25.0), //<-- SEE HERE
//                   //               ),
//                   //               child: Container(
//                   //                 height: 50,
//                   //                 width: 50,
//                   //                 decoration: BoxDecoration(color: AppColor.orange,
//                   //                     borderRadius: const BorderRadius.all(Radius.circular(25))
//                   //
//                   //                 ),
//                   //                 child: const Center(
//                   //                     child: Icon(Icons.history)
//                   //                 ),
//                   //               ),
//                   //             ),
//                   //           ),
//                   //           const Text(
//                   //             "Your",
//                   //             style: TextStyle(
//                   //               fontSize: 15,
//                   //               // fontWeight: FontWeight.bold
//                   //             ),
//                   //           ),
//                   //           const Text(
//                   //             "Appointment",
//                   //             style: TextStyle(
//                   //               fontSize: 15,
//                   //               // fontWeight: FontWeight.bold
//                   //             ),
//                   //           )
//                   //
//                   //         ],
//                   //       ),
//                   //     ),
//                   //
//                   //     Padding(
//                   //       padding: const EdgeInsets.only(right: 5.0),
//                   //       child: Column(
//                   //         children: [
//                   //           InkWell(
//                   //             onTap:() async {
//                   //               checkUser(context, false, "no");
//                   //             },
//                   //             child: Card(
//                   //               elevation: 6,
//                   //               shape: RoundedRectangleBorder(
//                   //                 borderRadius: BorderRadius.circular(25.0), //<-- SEE HERE
//                   //               ),
//                   //               child: Container(
//                   //                 height: 50,
//                   //                 width: 50,
//                   //                 decoration: BoxDecoration(color: AppColor.orange,
//                   //                     borderRadius: const BorderRadius.all(Radius.circular(25))
//                   //                 ),
//                   //                 child: const Center(
//                   //                     child: Icon(Icons.search)
//                   //                 ),
//                   //               ),
//                   //             ),
//                   //           ),
//                   //           const Text(
//                   //             "Search",
//                   //             style: TextStyle(
//                   //               fontSize: 15,
//                   //               // fontWeight: FontWeight.bold
//                   //             ),
//                   //           ),
//                   //           const Text(
//                   //             "",
//                   //             style: TextStyle(
//                   //               fontSize: 15,
//                   //               // fontWeight: FontWeight.bold
//                   //             ),
//                   //           )
//                   //
//                   //         ],
//                   //       ),
//                   //     ),
//                   //
//                   //   ],
//                   // ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 5.0, right: 5),
//                         child: Column(
//                           children: [
//                             InkWell(
//                               onTap: () async {
//                                 final userExit = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get();
//                                 if(userExit.exists){
//                                   CommonShareWidget.goToAnotherPage(
//                                       nextPage: PetRegistration(uid: FirebaseAuth.instance.currentUser!.uid),
//                                       context: context);
//                                 } else{
//                                   CommonShareWidget.goToAnotherPage(
//                                       nextPage: const LoginPage(), context: context);
//                                 }
//                               },
//                               child: Card(
//                                 elevation: 6,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(22.0), //<-- SEE HERE
//                                 ),
//                                 child: Container(
//                                   height: 45,
//                                   width: 45,
//                                   decoration: BoxDecoration(color: AppColor.orange,
//                                       borderRadius: const BorderRadius.all(Radius.circular(22))
//                                                                 ),
//                                   child: const Center(
//                                       child: Icon(Icons.pets)
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const Text(
//                               "Register",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 // fontWeight: FontWeight.bold
//                               ),
//                             ),
//                             const Text(
//                               "pet",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 // fontWeight: FontWeight.bold
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 8.0),
//                         child: Column(
//                           children: [
//                             InkWell(
//                               onTap: () async {
//                                 final userExit = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get();
//                                 if(userExit.exists){
//                                   CommonShareWidget.goToAnotherPage(
//                                       nextPage: PetDiaryList(userUid: FirebaseAuth.instance.currentUser!.uid),
//                                       context: context);
//                                 } else{
//                                   CommonShareWidget.goToAnotherPage(
//                                       nextPage: const LoginPage(), context: context);
//                                 }
//                               },
//                               child: Card(
//                                 elevation: 6,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(22.0), //<-- SEE HERE
//                                 ),
//                                 child: Container(
//                                   height: 45,
//                                   width: 45,
//                                   decoration: BoxDecoration(color: AppColor.orange,
//                                       borderRadius: const BorderRadius.all(Radius.circular(22))
//
//                                   ),
//                                   child: const Center(
//                                       child: Icon(Icons.calendar_view_month_sharp)
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const Text(
//                               "My Pet",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 // fontWeight: FontWeight.bold
//                               ),
//                             ),
//                             const Text(
//                               "",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 // fontWeight: FontWeight.bold
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 8.0),
//                         child: Column(
//                           children: [
//                             InkWell(
//                               onTap:() async {
//                                 final userExit = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get();
//                                 if(userExit.exists){
//                                   CommonShareWidget.goToAnotherPage(
//                                       nextPage: UserAppointmentList(FirebaseAuth.instance.currentUser!.uid),
//                                       context: context);
//                                 } else{
//                                   CommonShareWidget.goToAnotherPage(
//                                       nextPage: const LoginPage(), context: context);
//                                 }
//                       },
//                               child: Card(
//                                 elevation: 6,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(22.0), //<-- SEE HERE
//                                 ),
//                                 child: Container(
//                                   height: 45,
//                                   width: 45,
//                                   decoration: BoxDecoration(color: AppColor.orange,
//                                       borderRadius: const BorderRadius.all(Radius.circular(22))
//
//                                   ),
//                                   child: const Center(
//                                       child: Icon(Icons.history)
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const Text(
//                               "Pet",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 // fontWeight: FontWeight.bold
//                               ),
//                             ),
//                             const Text(
//                               "Appointments",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 // fontWeight: FontWeight.bold
//                               ),
//                             )
//
//                           ],
//                         ),
//                       ),
//
//                       Padding(
//                         padding: const EdgeInsets.only(right: 8.0),
//                         child: Column(
//                           children: [
//                             InkWell(
//                               onTap:() async {
//                                 checkUser(context, false, "no");
//                                                               },
//                               child: Card(
//                                 elevation: 6,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(22.0), //<-- SEE HERE
//                                 ),
//                                 child: Container(
//                                   height: 45,
//                                   width: 45,
//                                   decoration: BoxDecoration(color: AppColor.orange,
//                                       borderRadius: const BorderRadius.all(Radius.circular(22))
//
//                                   ),
//                                   child: const Center(
//                                       child: Icon(Icons.search)
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const Text(
//                               "Search",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 // fontWeight: FontWeight.bold
//                               ),
//                             ),
//                             const Text(
//                               "",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 // fontWeight: FontWeight.bold
//                               ),
//                             )
//
//                           ],
//                         ),
//                       ),
//
//                     ],
//                   ),
//
//                   // StreamBuilder<QuerySnapshot>(
//                   //   stream: carouselStream,
//                   //   builder: (BuildContext context, snapshot) {
//                   //     if(snapshot.data?.docs.length!= null ){
//                   //       return ListView.builder(
//                   //         itemCount: snapshot.data?.docs.length,
//                   //         shrinkWrap: true,
//                   //         physics: const NeverScrollableScrollPhysics(),
//                   //         itemBuilder: (context, index) {
//                   //           dynamic val = snapshot.data?.docs[index];
//                   //           List<dynamic> carouselImage = val['carousel'] ?? [] ;
//                   //           return Column(
//                   //             children: [
//                   //               if(carouselImage.isNotEmpty)...[
//                   //                 CarouselSlider.builder(
//                   //                   itemCount: carouselImage.length,
//                   //                   itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
//                   //                     String imageUrl = carouselImage[itemIndex]['image'].toString();
//                   //                     return SizedBox(
//                   //                       width: width,
//                   //                       height: 300,
//                   //                       child:
//                   //                         Image.network(imageUrl)
//                   //                     );
//                   //                   },
//                   //                   options: CarouselOptions(
//                   //                     autoPlay: true,
//                   //                     enlargeCenterPage: true,
//                   //                     viewportFraction: 0.9,
//                   //                     aspectRatio: 2.0,
//                   //                     initialPage: 0,
//                   //                   ),
//                   //                 ),
//                   //               ],
//                   //               const SizedBox(height: 10,),
//                   //             ],
//                   //           );
//                   //         },
//                   //       );
//                   //     } else{
//                   //       return const SizedBox();
//                   //     }
//                   //   },
//                   // ),
//                  const SizedBox(height: 20,),
//                   // ElevatedButton(onPressed: (){
//                   //   List<String> str = [];
//                   //   print(str[2]);
//                   //   }, child: Text("OK")),
//                   // const Row(
//                   //   children: [
//                   //     SubHeader(text: "Our Services"),
//                   //     // const Spacer(),
//                   //     // Padding(
//                   //     //   padding: const EdgeInsets.only(right: 15),
//                   //     //   child: InkWell(
//                   //     //     onTap: () async
//                   //     //     {
//                   //     //       checkUser(context);
//                   //     //     },
//                   //     //     child: Container(
//                   //     //       height: 50,
//                   //     //       width: 50,
//                   //     //       decoration: BoxDecoration(
//                   //     //           borderRadius: const BorderRadius.all(Radius.circular(25)),
//                   //     //           color: AppColor.orange,
//                   //     //           // border: Border.all(
//                   //     //           //     color: AppColor.orange,
//                   //     //           //   width: 1
//                   //     //           // )
//                   //     //       ),
//                   //     //       child: const
//                   //     //       Icon(Icons.search, color: Colors.black,),
//                   //     //     ),
//                   //     //   ),
//                   //     // ),
//                   //   ],
//                   // ),
//                   lostFoundPet(width, "Lost"),
//                   lostFoundPet(width, "Found"),
//                   vetTrainerPage(width, "Doctor"),
//                   vetTrainerPage(width, "Trainer")
//
//                   // StreamBuilder<QuerySnapshot> (
//                   //     stream: fireStore,
//                   //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
//                   //     {
//                   //       if(snapshot.connectionState == ConnectionState.waiting){
//                   //         return Center(child: CommonShareWidget.circularLoader());
//                   //       }
//                   //       if(snapshot.hasError)
//                   //       {
//                   //         return const SizedBox(height: 100, width: 100,
//                   //           child: Text("Some Error"),
//                   //         );
//                   //       }
//                   //       final data = snapshot.data?.docs;
//                   //       _vetList = data?.map((e) => UserProfileModel.fromJson(e.data() as Map<String, dynamic> )).
//                   //       where((element) => (element.isProfessional == true &&  element.professionalType == "Doctor" && (element.isDocVerified == true && element.isIdVerified == true) )) .toList() ?? [];
//                   //       _trainerList =  data?.map((e) => UserProfileModel.fromJson(e.data() as Map<String, dynamic> ))
//                   //           .where((element) => (element.isProfessional == true && element.professionalType == "Trainer" && (element.isDocVerified == true && element.isIdVerified == true))) .toList() ?? [];
//                   //
//                   //       return Column(
//                   //          children: [
//                   //           if(_vetList.isNotEmpty)...[
//                   //             SizedBox(
//                   //               height: 150,
//                   //               width: double.infinity,
//                   //               child: ListView.builder(
//                   //                   itemCount: _vetList.length,
//                   //                   scrollDirection: Axis.horizontal,
//                   //                   itemBuilder: (context, index)
//                   //                   {
//                   //                     var ratingAverage = _vetList[index].average;
//                   //                     // var ratingAverage = _trainerList[index].average;
//                   //                     if (kDebugMode) {
//                   //                       print("rating average---$ratingAverage");
//                   //                     }
//                   //                     return Row(
//                   //                       children: [
//                   //                         InkWell(
//                   //                           onTap: (){
//                   //                             providerProfilepage(_vetList[index].uid.toString(), context);
//                   //                           },
//                   //                           child: Card(
//                   //                             color: AppColor.orange.withOpacity(0.3),
//                   //                             // color: AppColor.orange.withOpacity(0.7),
//                   //                             child: SizedBox(
//                   //                               height: 140,
//                   //                               width: 260,
//                   //                               child: Padding(
//                   //                                 padding: const EdgeInsets.all(12.0),
//                   //                                 child: Column(
//                   //                                   crossAxisAlignment: CrossAxisAlignment.start,
//                   //                                   children: [
//                   //                                     Row(
//                   //                                       children: [
//                   //                                         Expanded(
//                   //                                           child: Text(_vetList[index].name.toString().toUpperCase(),
//                   //                                             maxLines: 1,
//                   //                                             overflow: TextOverflow.ellipsis,
//                   //                                             softWrap: true,
//                   //                                             style: const TextStyle(
//                   //                                               fontSize: 16,
//                   //                                                 fontWeight: FontWeight.bold,
//                   //                                             ),
//                   //                                           ),
//                   //                                         ),
//                   //                                         const Spacer(),
//                   //                                         CircleAvatar(
//                   //                                           backgroundImage: CachedNetworkImageProvider(_vetList[index].profilephotoImageUrl.toString()),
//                   //                                             // backgroundImage: NetworkImage(_vetList[index].profilephotoImageUrl.toString()),
//                   //                                           radius: 20,
//                   //                                         ),
//                   //                                       ],
//                   //                                     ),
//                   //                                     const SizedBox(height: 2,),
//                   //                                     Row(
//                   //                                       children: [
//                   //                                         Expanded(
//                   //                                           child: Text(_vetList[index].location.toString(),
//                   //                                             maxLines: 1,
//                   //                                             overflow: TextOverflow.ellipsis,
//                   //                                             softWrap: true,
//                   //                                             style: const TextStyle(fontSize: 16,
//                   //                                                 // fontWeight: FontWeight.bold,
//                   //                                             ),
//                   //                                           ),
//                   //                                         ),
//                   //                                       ],
//                   //                                     ),
//                   //                                     const SizedBox(height: 05,),
//                   //                                     Container(
//                   //                                       height: 35,
//                   //                                       width: 60,
//                   //                                       decoration: const BoxDecoration(
//                   //                                           color: Colors.green,
//                   //                                           borderRadius: BorderRadius.all(Radius.circular(10))
//                   //                                       ),
//                   //                                       child:
//                   //                                       Row(
//                   //                                         mainAxisAlignment: MainAxisAlignment.center,
//                   //                                         crossAxisAlignment: CrossAxisAlignment.center,
//                   //                                         children: [
//                   //                                           const Icon(Icons.star,
//                   //                                             color: Colors.white,
//                   //                                             size: 25.0,
//                   //                                           ),
//                   //                                           const SizedBox(width: 3,),
//                   //
//                   //                                           if(ratingAverage == null)...[
//                   //                                             const Text("0",
//                   //                                               style: TextStyle(
//                   //                                                   fontWeight: FontWeight.bold,
//                   //                                                   color: Colors.white,
//                   //                                                   fontSize: 15
//                   //                                               ),
//                   //                                             )
//                   //                                           ] else...[
//                   //                                             Text(_vetList[index].average!.toStringAsFixed(1),
//                   //                                               style: const TextStyle(
//                   //                                                   fontWeight: FontWeight.bold,
//                   //                                                   color: Colors.white,
//                   //                                                   fontSize: 15
//                   //                                               ),
//                   //                                             )
//                   //                                           ]
//                   //                                         ],
//                   //                                       ),
//                   //                                     )
//                   //                                   ],
//                   //                                 ),
//                   //                               ),
//                   //                             ),
//                   //                           ),
//                   //
//                   //                         ),
//                   //                         const SizedBox(width: 20,),
//                   //                       ],
//                   //                     );
//                   //                   }
//                   //               ),
//                   //             )
//                   //           ]
//                   //           else...[
//                   //             // Image.asset("assets/Book doctor.jpg")
//                   //
//                   //             comingSoon(width, "Doctor")
//                   //           ],
//                   //           const SizedBox(height: 20,),
//                   //           const SubHeader(text: "Trainer"),
//                   //            const SizedBox(height: 15,),
//                   //            if(_trainerList.isNotEmpty)...[
//                   //             SizedBox(
//                   //               height: 150,
//                   //               width: double.infinity,
//                   //               child: ListView.builder(
//                   //                   itemCount: _trainerList.length,
//                   //                   scrollDirection: Axis.horizontal,
//                   //                   itemBuilder: (context, index)
//                   //                   {
//                   //                     var ratingAverage = _trainerList[index].average;
//                   //                     if (kDebugMode) {
//                   //                       print("rating average---$ratingAverage");
//                   //                     }
//                   //                     return Row(
//                   //                       children: [
//                   //                         InkWell(
//                   //                           onTap: (){
//                   //                             providerProfilepage(_trainerList[index].uid.toString(), context);
//                   //                           },
//                   //                           child: Card(
//                   //                             elevation: 6,
//                   //                             color: AppColor.orange.withOpacity(0.7),
//                   //                             child: SizedBox(
//                   //                               height: 140,
//                   //                               width: 260,
//                   //                               child: Padding(
//                   //                                 padding: const EdgeInsets.all(12.0),
//                   //                                 child: Column(
//                   //                                   crossAxisAlignment: CrossAxisAlignment.start,
//                   //                                   children: [
//                   //                                     Row(
//                   //                                       children: [
//                   //                                         Expanded(
//                   //                                           child: Text(_trainerList[index].name.toString().toUpperCase(),
//                   //                                             maxLines: 1,
//                   //                                             overflow: TextOverflow.ellipsis,
//                   //                                             softWrap: true,
//                   //                                             style: const TextStyle(fontSize: 16,
//                   //                                                 fontWeight: FontWeight.bold
//                   //                                             ),
//                   //                                           ),
//                   //                                         ),
//                   //                                         const Spacer(),
//                   //                                         CircleAvatar(
//                   //                                           backgroundImage: NetworkImage(_trainerList[index].profilephotoImageUrl.toString()),
//                   //                                           radius: 20,),
//                   //                                       ],
//                   //                                     ),
//                   //                                     const SizedBox(height: 5,),
//                   //                                     Expanded(
//                   //                                       child: Text(_trainerList[index].location.toString(),
//                   //                                         maxLines: 1,
//                   //                                         overflow: TextOverflow.ellipsis,
//                   //                                         softWrap: true,
//                   //                                         style: const TextStyle(fontSize: 16,
//                   //                                             // fontWeight: FontWeight.b old
//                   //                                         ),
//                   //                                       ),
//                   //                                     ),
//                   //                                     const SizedBox(height: 05,),
//                   //                                     Padding(
//                   //                                       padding: const EdgeInsets.only(bottom: 8.0),
//                   //                                       child: Container(
//                   //                                         height: 35,
//                   //                                         width: 60,
//                   //                                         decoration: const BoxDecoration(
//                   //                                             color: Colors.green,
//                   //                                             borderRadius: BorderRadius.all(Radius.circular(10))
//                   //                                         ),
//                   //                                         child:
//                   //                                         Row(
//                   //                                           mainAxisAlignment: MainAxisAlignment.center,
//                   //                                           crossAxisAlignment: CrossAxisAlignment.center,
//                   //                                           children: [
//                   //                                             const Icon(Icons.star,
//                   //                                               color: Colors.white,
//                   //                                               size: 25.0,
//                   //                                             ),
//                   //                                             const SizedBox(width: 3,),
//                   //                                             if(ratingAverage == null)...[
//                   //                                               const Text("0",
//                   //                                                 style: TextStyle(
//                   //                                                     fontWeight: FontWeight.bold,
//                   //                                                     color: Colors.white,
//                   //                                                     fontSize: 15
//                   //                                                 ),
//                   //                                               )
//                   //                                             ] else...[
//                   //                                               Text(_trainerList[index].average!.toStringAsFixed(1),
//                   //                                                 style: const TextStyle(
//                   //                                                     fontWeight: FontWeight.bold,
//                   //                                                     color: Colors.white,
//                   //                                                     fontSize: 15
//                   //                                                 ),
//                   //                                               )
//                   //                                             ]
//                   //                                           ],
//                   //                                         ),
//                   //                                       ),
//                   //                                     )
//                   //                                   ],
//                   //                                 ),
//                   //                               ),
//                   //                             ),
//                   //                           ),
//                   //
//                   //                         ),
//                   //                         const SizedBox(width: 20,),
//                   //                       ],
//                   //                     );
//                   //                   }
//                   //               ),
//                   //             )
//                   //           ]
//                   //           else...[
//                   //             // Image.asset("assets/Book doctor.jpg")
//                   //             // Image.asset("assets/vet book now.jpg")
//                   //
//                   //             comingSoon(width, "Trainer")
//                   //           ],
//                   //         ],
//                   //       );
//                   //     }
//                   // ),
//
//                 ],
//               ),
//             ),
//           ),
//         )
//       ),
//     );
//   }
//
//   actionProfileButton(context) {
//     return Consumer<User?>(builder: (_, user, child) {
//       return Card(
//         elevation: 3,
//         color: AppColor.orange,
//         child: IconButton(
//             icon:  const Icon(Icons.person,
//               color: Colors.black,
//             ),
//             onPressed: () async {
//               final userExit = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get();
//           if(userExit.exists){
//             CommonShareWidget.goToAnotherPage(
//                 nextPage: const UserProfile(), context: context);
//           } else {
//             CommonShareWidget.goToAnotherPage(
//                 nextPage: const LoginPage(), context: context);
//           }
//             }
//             ),
//       );
//     });
//   }
//
//   Widget comingSoon(var width, String professional ){
//     return Center(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const SizedBox(height: 10,),
//           InkWell(
//             onTap: (){
//               checkUser(context, true, professional, );
//             },
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(80),
//               ),
//               elevation: 8,
//               child:
//               professional == 'Trainer' ?
//               Image.asset("assets/images/booknowtrain.jpg",) :
//               Image.asset("assets/images/booknowvet.jpg",)
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   checkUser(context, bool comingSoon, String professional ) async {
//     final userExit = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get();
//     if(userExit.exists){
//       final cityList =
//       await CityListRepo().fetchCityListFromCSV();
//       Navigator.push(context, MaterialPageRoute(builder: (_)=>
//           SearchProfessionalPage(cityList: cityList,
//             comingSoon: comingSoon,
//             professional: professional,)));
//     } else {
//       CommonShareWidget.goToAnotherPage
//         (
//           nextPage: const LoginPage(), context: context);
//     }
//   }
//
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
//   Widget lostFoundPet(var width, String professional ){
//     return Center(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const SizedBox(height: 10,),
//           InkWell(
//             onTap: () async {
//               final userExit = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get();
//               if(userExit.exists){
//                 professional == 'Lost' ? Navigator.push(context, MaterialPageRoute(builder: (_)=> const LostPetList()))
//                     : Navigator.push(context, MaterialPageRoute(builder: (_)=> const FoundPetList()));
//               } else{
//                 CommonShareWidget.goToAnotherPage(
//                     nextPage: const LoginPage(), context: context);
//               }
//             },
//             child: Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(80),
//                 ),
//                 elevation: 8,
//                 child:
//                 professional == 'Lost' ?
//                 Image.asset("assets/images/Lost_Pet.jpg",) :
//                 Image.asset("assets/images/Found_Pet.jpg",)
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget vetTrainerPage(var width, String professional ){
//     return Center(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const SizedBox(height: 10,),
//           InkWell(
//             onTap: () async {
//               final userExit = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get();
//               if(userExit.exists){
//
//                 professional == 'Trainer' ? Navigator.push(context, MaterialPageRoute(builder: (_)=> const TrainerList()))
//                     : Navigator.push(context, MaterialPageRoute(builder: (_)=> const VetList()));
//               } else{
//                 CommonShareWidget.goToAnotherPage(
//                     nextPage: const LoginPage(), context: context);
//               }
//
//               // LostPetList();
//               // checkUser(context, true, professional, );
//             },
//             child: Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(80),
//                 ),
//                 elevation: 8,
//                 child:
//                 professional == 'Trainer' ?
//                 Image.asset("assets/images/trainer.jpg",) :
//                 Image.asset("assets/images/veterinarian.jpg",)
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//
// }
