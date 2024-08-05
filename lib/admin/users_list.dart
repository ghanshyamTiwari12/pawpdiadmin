// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/admin/user_data.dart';
// import 'package:petfindernetwork/admin/user_petlist.dart';
// import 'package:provider/provider.dart';
// import '../Web_helper/colors.dart';
// import '../model/user_profile.dart';
// import '../views/loginSignUp/login.dart';
// import '../Web_helper/commonShareWidget.dart';
// import '../views/user/userProfile.dart';
//
// class UsersList extends StatefulWidget {
//   const UsersList({super.key});
//   @override
//   State<UsersList> createState() => _UsersListState();
// }
//
// class _UsersListState extends State<UsersList> {
//   final fireStore =  FirebaseFirestore.instance.collection('users').snapshots();
//   CollectionReference ref = FirebaseFirestore.instance.collection('users');
//   final carouselStream =  FirebaseFirestore.instance.collection('carousel').snapshots();
//   CollectionReference carouselref = FirebaseFirestore.instance.collection('carousel');
//
//   final userInfoModel = UserProvider.userInfoModel;
//   // final _formKey = GlobalKey<FormState>();
//   // List<File> images = <File>[];
//   // File? _imageProfile;
//   // bool _loaderState = false;
//   List<UserProfileModel> _list = [];
//   final List<UserProfileModel> _searchList = [];
//   bool _isSearching = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     var width = size.width;
//
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: _isSearching ? TextField(
//           autofocus: true,
//           decoration: const InputDecoration(
//               hintText: 'Enter Name or Email',
//               border: InputBorder.none
//           ),
//           style:  const TextStyle(
//             fontSize: 16,
//             letterSpacing: 1,
//           ),
//           onChanged:(val){
//             _searchList.clear();
//             for( var i in _list)
//             {
//               if(i.name!.toLowerCase().contains(val.toLowerCase())
//                   || i.email!.toLowerCase().contains(val.toLowerCase())){
//                 _searchList.add(i);
//               }
//               setState(() {
//                 _searchList;
//               });
//             }
//           },
//         ): actionProfileButton(),
//
//         actions: [
//           IconButton(onPressed: (){
//             setState(() {
//               _isSearching = !_isSearching;
//               _searchList.clear();
//             });
//           }, icon:  Icon( _isSearching ? CupertinoIcons.clear_circled_solid :Icons.search)
//           ),
//         ],
//       ),
//
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//                   // ElevatedButton(
//                   //     style: ElevatedButton.styleFrom(
//                   //       backgroundColor: Colors.black,
//                   //     ),
//                   //     onPressed: (){
//                   //       bottomImageCapture(width, context);
//                   // },
//                   //     child: const Text("Add Carousel",
//                   //     style: TextStyle(
//                   //       color: Colors.white,
//                   //       fontSize: 18,
//                   //     ),
//                   //     )),
//
//             // StreamBuilder<QuerySnapshot>(
//             //   stream: carouselStream,
//             //   builder: (BuildContext context, snapshot) {
//             //     if(snapshot.data?.docs.length != null){
//             //       return ListView.builder(
//             //         itemCount: snapshot.data?.docs.length,
//             //         shrinkWrap: true,
//             //         physics: const NeverScrollableScrollPhysics(),
//             //         itemBuilder: (context, index) {
//             //           dynamic val = snapshot.data?.docs[index];
//             //           List<dynamic> carouselImage = val['carousel'] ?? [] ;
//             //           return Column(
//             //             children: [
//             //               if(carouselImage.isNotEmpty)...[
//             //                 CarouselSlider.builder(
//             //                   itemCount: carouselImage.length,
//             //                   itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
//             //                     String imageUrl = carouselImage[itemIndex]['image'].toString();
//             //                     return Stack(
//             //                       children: [
//             //                         SizedBox(
//             //                           width: 350,
//             //                           height: 300,
//             //                           child: Image.network(imageUrl),
//             //                           ),
//             //                         Positioned(
//             //                           right: 30,
//             //                           top: 10,
//             //                           child: InkWell(
//             //                             child: Container(
//             //                               height: 40,
//             //                               width: 40,
//             //                               decoration: BoxDecoration(
//             //                                 color: Colors.white.withOpacity(0.3),
//             //                                 borderRadius: const BorderRadius.all(Radius.circular(25)),
//             //                               ),
//             //                               child: const Icon(Icons.delete),
//             //                             ),
//             //                             onTap: (){
//             //                               deleteImage(imageUrl, itemIndex);
//             //                             },
//             //                           ),
//             //                         ),
//             //                        ],
//             //                     );
//             //                   },
//             //                   options: CarouselOptions(
//             //                     autoPlay: true,
//             //                     enlargeCenterPage: true,
//             //                     viewportFraction: 0.9,
//             //                     aspectRatio: 2.0,
//             //                     initialPage: 0,
//             //                   ),
//             //                 ),
//             //               ],
//             //               const SizedBox(height: 10,),
//             //             ],
//             //           );
//             //         },
//             //       );
//             //     } else{
//             //       return const Center(child: Text('No Activity',
//             //         style: TextStyle(
//             //             fontSize: 30
//             //         ),
//             //       ));
//             //     }
//             //   },
//             // ),
//
//             StreamBuilder<QuerySnapshot>(
//                 stream: fireStore,
//                 builder: (BuildContext context,
//                     AsyncSnapshot<QuerySnapshot> snapshot)
//                 {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator(color: Colors.black,));
//                   }
//                   if (snapshot.hasError) return const Text('Some Error');
//                   final data = snapshot.data?.docs;
//                   if (kDebugMode) {
//                     print('====Snapshot length : ${data?.length}');
//                   }
//                   _list = data?.map((e) => UserProfileModel.fromJson(e.data() as Map<String, dynamic>))
//                       .where((element) => element.isProfessional == false
//                       || element.isProfessional == null
//                       && (element.isAdmin == false
//                               || element.isAdmin == null)
//                   ) .toList() ?? [];
//
//                  if (kDebugMode) {
//                     print('====_list length : ${_list.length}');
//                   }
//                   if(_list.isNotEmpty)
//                   {
//                     return Expanded(
//                         child: ListView.builder(
//                             itemCount: _isSearching ? _searchList.length : _list.length,
//                             itemBuilder: (context, index) {
//                               if(_isSearching == true){
//                                 return Padding(
//                                   padding: const EdgeInsets.only(left: 20.0,
//                                       right: 20.0, bottom: 10.0),
//                                   child:
//                                   InkWell(
//                                     onTap: ()
//                                     async {
//                                       final userExit = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get();
//                                       if(userExit.exists){
//                                         Navigator.push(context, MaterialPageRoute(builder: (_) =>
//                                             UserPetListPage(uid: "${_searchList[index].uid}",
//                                               userName: "${_searchList[index].name}", )));
//                                       } else {
//                                         CommonShareWidget.goToAnotherPage(
//                                             nextPage: const LoginPage(), context: context);
//                                       }
//                                     },
//                                     child:
//                                     Card(
//                                       color: AppColor.orange,
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(12.0),
//                                         child: SizedBox(
//                                             height: 130,
//                                             width: width,
//                                             child: Column(
//                                               children: [
//                                                 Row(
//                                                   mainAxisAlignment: MainAxisAlignment.start,
//                                                   children: [
//                                                     Expanded(
//                                                       child: Column(
//                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                         children: [
//                                                           Row(
//                                                             children: [
//                                                               const Text("Name: ",
//                                                                 style: TextStyle(
//                                                                   fontSize: 15,
//                                                                   fontWeight: FontWeight.bold,
//                                                                 ),
//                                                               ),
//                                                               Expanded(
//                                                                 child: Text("${_searchList[index].name}",
//                                                                   maxLines: 1,
//                                                                   overflow: TextOverflow.ellipsis,
//                                                                   softWrap: true,
//                                                                   style: const TextStyle(
//                                                                     fontSize: 12,
//                                                                     // fontWeight: FontWeight.bold,
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                               // const Spacer(),
//                                                               const SizedBox(width: 20,),
//                                                               CircleAvatar(
//                                                                 backgroundImage: NetworkImage(_searchList[index].profilephotoImageUrl.toString()),
//                                                                 radius: 20,
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           const SizedBox(height: 5,),
//                                                           Row(
//                                                             children: [
//                                                                const Text("Contact No: ",
//                                                                 style: TextStyle(
//                                                                   fontSize: 15,
//                                                                   fontWeight: FontWeight.bold,
//                                                                 ),
//                                                               ),
//                                                               Text("${_searchList[index].phone}",
//                                                                 maxLines: 1,
//                                                                 overflow: TextOverflow.ellipsis,
//                                                                 softWrap: true,
//                                                                 style: const TextStyle(
//                                                                   fontSize: 12,
//                                                                   // fontWeight: FontWeight.bold,
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           const SizedBox(height: 5,),
//                                                           Row(
//                                                             children: [
//                                                               const Text("Email: ",
//                                                                 style: TextStyle(
//                                                                   fontSize: 15,
//                                                                   fontWeight: FontWeight.bold,
//                                                                 ),
//                                                               ),
//                                                               Expanded(
//                                                                 child: Text("${_searchList[index].email}",
//                                                                   maxLines: 1,
//                                                                   overflow: TextOverflow.ellipsis,
//                                                                   softWrap: true,
//                                                                   style: const TextStyle(
//                                                                     fontSize: 12,
//                                                                     // fontWeight: FontWeight.bold,
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           const SizedBox(height: 5,),
//                                                           Row(
//                                                             children: [
//                                                               const Text("Address: ",
//                                                                 style: TextStyle(
//                                                                   fontSize: 15,
//                                                                   fontWeight: FontWeight.bold,
//                                                                 ),
//                                                               ),
//                                                               Expanded(
//                                                                 child: Text("${_searchList[index].address}",
//                                                                   maxLines: 1,
//                                                                   overflow: TextOverflow.ellipsis,
//                                                                   softWrap: true,
//                                                                   style: const TextStyle(
//                                                                     fontSize: 12,
//                                                                     // fontWeight: FontWeight.bold,
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           )
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 const SizedBox(height: 10,),
//                                               ],
//                                             )
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               }
//                               else
//                               {
//                                 return Padding(
//                                   padding: const EdgeInsets.only(left: 20.0,
//                                       right: 20.0, bottom: 10.0),
//                                   child: InkWell(
//                                     onTap: () async {
//                                       final userExit = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get();
//
//                                       if(userExit.exists){
//                                         Navigator.push(context, MaterialPageRoute(builder: (_) =>
//                                             UserPetListPage(uid: _list[index].uid.toString(),
//                                               userName: _list[index].name.toString(), )));
//                                       } else {
//                                         CommonShareWidget.goToAnotherPage(
//                                             nextPage: const LoginPage(), context: context);
//                                       }
//
//                                     },
//                                     child:
//                                     Card(
//                                       color: AppColor.orange,
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(12.0),
//                                         child: SizedBox(
//                                             height: 130,
//                                             width: width,
//                                             child: Column(
//                                               children: [
//                                                 Row(
//                                                   mainAxisAlignment: MainAxisAlignment.start,
//                                                   children: [
//                                                     // SizedBox(width: 15,),
//                                                     Expanded(
//                                                       child: Column(
//                                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                                           children: [
//                                                             Row(
//                                                               children: [
//                                                                 const Text("Name: ",
//                                                                   style: TextStyle(
//                                                                     fontSize: 15,
//                                                                     fontWeight: FontWeight.bold,
//                                                                   ),
//                                                                 ),
//                                                                 Expanded(
//                                                                   child: Text("${_list[index].name}",
//                                                                     maxLines: 1,
//                                                                     overflow: TextOverflow.ellipsis,
//                                                                     softWrap: true,
//                                                                     style: const TextStyle(
//                                                                       fontSize: 12,
//                                                                       // fontWeight: FontWeight.bold,
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 const SizedBox(width: 20,),
//                                                                 // Spacer(),
//                                                                 CircleAvatar(
//                                                                   backgroundImage: NetworkImage(_list[index].profilephotoImageUrl.toString()),
//                                                                   radius: 20,
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                             const SizedBox(height: 5,),
//                                                             Row(
//                                                               children: [
//                                                                 const Text("Contact No: ",
//                                                                   style: TextStyle(
//                                                                     fontSize: 15,
//                                                                     fontWeight: FontWeight.bold,
//                                                                   ),
//                                                                 ),
//                                                                 Text("${_list[index].phone}",
//                                                                   maxLines: 1,
//                                                                   overflow: TextOverflow.ellipsis,
//                                                                   softWrap: true,
//                                                                   style: const TextStyle(
//                                                                     fontSize: 12,
//                                                                     // fontWeight: FontWeight.bold,
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                             const SizedBox(height: 5,),
//                                                             Row(
//                                                               children: [
//                                                                 const Text("Email: ",
//                                                                   style: TextStyle(
//                                                                     fontSize: 15,
//                                                                     fontWeight: FontWeight.bold,
//                                                                   ),
//                                                                 ),
//                                                                 Expanded(
//                                                                   child: Text("${_list[index].email}",
//                                                                     maxLines: 1,
//                                                                     overflow: TextOverflow.ellipsis,
//                                                                     softWrap: true,
//                                                                     style: const TextStyle(
//                                                                       fontSize: 12,
//                                                                       // fontWeight: FontWeight.bold,
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                             const SizedBox(height: 5,),
//                                                             Row(
//                                                               children: [
//                                                                 const Text("Address: ",
//                                                                   style: TextStyle(
//                                                                     fontSize: 15,
//                                                                     fontWeight: FontWeight.bold,
//                                                                   ),
//                                                                 ),
//                                                                 Expanded(
//                                                                   child: Text("${_list[index].address}",
//                                                                     maxLines: 1,
//                                                                     overflow: TextOverflow.ellipsis,
//                                                                     softWrap: true,
//                                                                     style: const TextStyle(
//                                                                       fontSize: 12,
//                                                                       // fontWeight: FontWeight.bold,
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             )
//                                                           ]
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 const SizedBox(height: 10,),
//                                               ],
//                                             )
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               }
//                             }
//                         )
//                     );
//                   }
//                   return const Center(
//                     child: Text('No User found',
//                         style: TextStyle(
//                             fontSize: 20
//                         )
//                     ),
//                   );
//                 }
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   actionProfileButton() {
//     return Consumer<User?>(builder: (_, user, child) {
//       return IconButton(
//           icon: const Icon(Icons.person,
//             color: Colors.black,
//           ),
//           style: IconButton.styleFrom(
//             backgroundColor: AppColor.orange,
//           ),
//           onPressed: () {
//             if (user == null) {
//               CommonShareWidget.goToAnotherPage(
//                   nextPage: const LoginPage(), context: context);
//             } else {
//               CommonShareWidget.goToAnotherPage(
//                   nextPage: const UserProfile(), context: context);
//             }
//
//             //_scaffoldKey.currentState!.openEndDrawer();
//           });
//     });
//   }
//
//   // void bottomImageCapture(var width, context){
//   //   showModalBottomSheet(context: context,
//   //       barrierColor: Colors.transparent,
//   //       backgroundColor: AppColor.orange,
//   //       shape: const RoundedRectangleBorder(
//   //         borderRadius: BorderRadius.only(
//   //             topLeft: Radius.circular(30.0),
//   //             topRight:Radius.circular(30.0) ),
//   //       ),
//   //       builder: (BuildContext context){
//   //         ImagePickerHelper  imageProvider = Provider.of<ImagePickerHelper>(context);
//   //         _imageProfile = imageProvider.imageProfile;
//   //         LoaderProvider loaderProvider = Provider.of<LoaderProvider>(context);
//   //         _loaderState = loaderProvider.isLoading;
//   //         return
//   //           Container(
//   //             height: 300,
//   //             width: width,
//   //             decoration: BoxDecoration(
//   //                 color: Colors.white.withOpacity(0.3),
//   //                 borderRadius: const BorderRadius.only(
//   //                     topLeft: Radius.circular(30.0),
//   //                     topRight:Radius.circular(30.0))
//   //             ),
//   //             child: Padding(
//   //               padding: const EdgeInsets.all(20.0),
//   //               child: Form(
//   //                 autovalidateMode: AutovalidateMode.always,
//   //                 key: _formKey,
//   //                 child: Column(
//   //                   crossAxisAlignment: CrossAxisAlignment.start,
//   //                   children: [
//   //                     Container(
//   //                       margin: const EdgeInsets.only(left: 32.0),
//   //                       child: Row(
//   //                         children: <Widget>[
//   //                           Container(
//   //                               height: 60.0,
//   //                               width: 60.0,
//   //                               decoration: BoxDecoration(
//   //                                   shape: BoxShape.rectangle,
//   //                                   color: Colors.white,
//   //                                   border: Border.all(color: AppColor.blackColor),
//   //                                   borderRadius: BorderRadius.circular(15.0)),
//   //                               child: InkWell(
//   //                                   child: _imageProfile == null
//   //                                       ? const Icon(Icons.add_a_photo)
//   //                                       : ClipRRect(
//   //                                     borderRadius: BorderRadius.circular(15.0),
//   //                                     child: Image.file(
//   //                                       _imageProfile!,
//   //                                       fit: BoxFit.fill,
//   //                                     ),
//   //                                   ),
//   //                                   onTap: (){
//   //                                     ImagePickerHelper().getImage1(true, context);
//   //                                   }
//   //                                 // getImage(true),
//   //                               )),
//   //                           const SizedBox(
//   //                             width: 15.0,
//   //                           ),
//   //                           const Text('Add Carousel')
//   //                         ],
//   //                       ),
//   //                     ),
//   //                     const SizedBox(height: 30,),
//   //
//   //                     Row(
//   //                       mainAxisAlignment: MainAxisAlignment.center,
//   //                       children: [
//   //                         Card(
//   //                           child: Container(
//   //                               height: 60,
//   //                               width: width /2,
//   //                               decoration: const BoxDecoration(
//   //                                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
//   //                                 color: Colors.black,
//   //                               ),
//   //                               child: Padding(
//   //                                 padding: const EdgeInsets.all(2.0),
//   //                                 child: InkWell(
//   //                                   onTap: (){
//   //                                     formImageSubmit(context);
//   //                                   },
//   //                                   child:  Row(
//   //                                     mainAxisAlignment: MainAxisAlignment.center,
//   //                                     children: [
//   //                                       _loaderState
//   //                                           ? const CircularProgressIndicator(color: Colors.white,)
//   //                                           :  const Text( "Submit",
//   //                                         style: TextStyle(
//   //                                             fontSize: 20,
//   //                                             color: Colors.white
//   //                                         ),
//   //                                       ),
//   //                                     ],
//   //                                   ),
//   //                                 ),
//   //                               )
//   //                           ),
//   //                         ),
//   //                       ],
//   //                     ),
//   //                   ],
//   //                 ),
//   //               ),
//   //             ),
//   //           );
//   //       });
//   // }
//
//   // bool validateImageForm(context) {
//   //   FocusScope.of(context).unfocus();
//   //   bool isValid = false;
//   //   if (_formKey.currentState!.validate()) {
//   //     if (_imageProfile == null) {
//   //       CommonShareWidget.showFlushBar(
//   //           context: context,
//   //           duration: 2,
//   //           message: "please add image");
//   //     }
//   //     else {
//   //       isValid = true;
//   //     }
//   //     if (kDebugMode) {
//   //       print('=====isValid---$isValid');
//   //     }
//   //   }
//   //   return isValid;
//   // }
//
//   // formImageSubmit(context) async {
//   //   if (validateImageForm(context) != true) {
//   //     return;
//   //   }
//   //   Provider.of<LoaderProvider>(context, listen: false).loading(true);
//   //
//   //   CarouselRecord? carouselRecord;
//   //
//   //   String imageUrl = await LoginSignupRepo()
//   //       .uploadImage(_imageProfile!, userInfoModel!.uid.toString());
//   //   if (kDebugMode) {
//   //     print('upload image in firestore---$imageUrl');
//   //   }
//   //
//   //   List<Map<String, dynamic>> carouselImages = [
//   //     {
//   //       "image": imageUrl,
//   //     },
//   //   ];
//   //   final userIdExist = await FirebaseFirestore.instance.collection('carousel').doc("adminCredentia2024").get();
//   //
//   //   if(userIdExist.exists)
//   //   {
//   //     carouselRecord = CarouselRecord.fromMap(userIdExist.data());
//   //       await FirebaseFirestore.instance.collection("carousel").doc("adminCredentia2024").update(
//   //           {        "carousel": FieldValue.arrayUnion(carouselImages)
//   //           }
//   //       );
//   //       Provider.of<LoaderProvider>(context, listen: false).loading(false);
//   //       clearValue();
//   //       Navigator.pop(context);
//   //       CommonShareWidget.showFlushBar(
//   //           context: context,
//   //           duration: 2,
//   //           message: "Carousel submitted");
//   //
//   //   }
//   //
//   //   if(!userIdExist.exists){
//   //     FirebaseFirestore.instance
//   //         .collection("carousel")
//   //         .doc("adminCredentia2024")
//   //         .set({
//   //       "id": "adminCredentia2024",
//   //       "carousel": carouselImages,
//   //     });
//   //     clearValue();
//   //     Provider.of<LoaderProvider>(context, listen: false).loading(false);
//   //     Navigator.pop(context);
//   //     CommonShareWidget.showFlushBar(
//   //         context: context,
//   //         duration: 2,
//   //         message: "Carousel submitted");
//   //   }
//   // }
//
//   // Future <void> deleteImage(String iamgeUrl, int activityIndex) async {
//   //   // ActivityRecord? petActivityModel;
//   //   CarouselRecord? carouselRecord;
//   //
//   //   final userExistId = await FirebaseFirestore.instance.collection('carousel').doc("adminCredentia2024").get();
//   //
//   //   if (kDebugMode) {
//   //     print("====deleteimage:---$iamgeUrl");
//   //   }
//   //   List<Map<String, dynamic>> petimages = [
//   //     {
//   //       "image": iamgeUrl,
//   //     },
//   //   ];
//   //   if(userExistId.exists) {
//   //     carouselRecord = CarouselRecord.fromMap(userExistId.data());
//   //     var imageCount = carouselRecord.carousel?.length;
//   //     if (kDebugMode) {
//   //       print("=====delete imageCount--$imageCount");
//   //     }
//   //     for(var i= 0; i < imageCount!; i++){
//   //       if(i == activityIndex){
//   //         if (kDebugMode) {
//   //           print("image index---: $activityIndex");
//   //         }
//   //         await FirebaseFirestore.instance.collection("carousel").doc("adminCredentia2024").update(
//   //             {        "carousel": FieldValue.arrayRemove (petimages)
//   //
//   //             }
//   //         );
//   //       }
//   //     }
//   //   }
//   //
//   // }
//
//   // clearValue() {
//   //   setState(() {
//   //           _loaderState = false;
//   //   });
//   //   Provider.of<ImagePickerHelper>(context, listen: false).imageClear();
//   //   Provider.of<LoaderProvider>(context, listen: false).loading(_loaderState);
//   // }
// }
