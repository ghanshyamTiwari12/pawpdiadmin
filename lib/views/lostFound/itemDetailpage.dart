// import 'dart:io';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:petfindernetwork/constant/colors.dart';
// import 'package:petfindernetwork/gen/assets.gen.dart';
// import 'package:petfindernetwork/model/lost_found_item_info_model.dart';
// import 'package:petfindernetwork/model/pending_block_model.dart';
// import 'package:petfindernetwork/model/user_profile.dart';
// import 'package:petfindernetwork/repository/loginsignupRepo.dart';
// import 'package:petfindernetwork/repository/userRepo.dart';
// import 'package:petfindernetwork/views/chat/chatBoard.dart';
// import 'package:petfindernetwork/views/chat/myChatList.dart';
// import 'package:petfindernetwork/views/shareAbleWidget.dart/commonShareWidget.dart';
// import 'package:provider/provider.dart';
// import '../../admin/user_data.dart';
// import '../../helper/image_picker_helper.dart';
// import '../loginSignUp/login_with_email.dart';
// import 'image_compare.dart';
//
// class PetDetailPage extends StatefulWidget {
//   const PetDetailPage(
//       {
//         required this.matchPet,
//       // required this.petDetails,
//       super.key});
//   final bool matchPet;
//   @override
//   State<PetDetailPage> createState() => _PetDetailPageState();
//
//   // final LostFoundPetInfoModel petDetails;
// }
//
// class _PetDetailPageState extends State<PetDetailPage> {
//   final UserRepo _userRepo = UserRepo();
//   LostFoundPetInfoModel? _foundPetInfoModel;
//   late UserProfileModel userProfileModel ;
//
//   bool _loaderState = false;
//   var _images;
//   var _singleImage;
//   @override
//   Widget build(BuildContext context) {
//     userProfileModel = UserProvider.userInfoModel!;
//
//     return Consumer<User?>(
//       builder: (context, user, child) =>
//           Consumer<DocumentSnapshot<Map<String, dynamic>?>?>(
//         child: buildNoPetAvailable(),
//         builder: (_, snapshot, child) {
//           if (snapshot?.data != null) {
//             final foundPetInfoModel =
//                 LostFoundPetInfoModel.fromDocumentSnapshot(snapshot);
//             return infoMainWidget(foundPetInfoModel, user);
//           } else {
//             return const SizedBox();
//             // return infoMainWidget(widget.petDetails, user);
//           }
//         },
//       ),
//     );
//   }
//
//   infoMainWidget(LostFoundPetInfoModel snapshot, user) {
//     _foundPetInfoModel = snapshot;
//     _images = _foundPetInfoModel!.petImageUrl;
//
//     return _foundPetInfoModel != null
//         ? Scaffold(
//             appBar: AppBar(
//               title: const Text('Detail'),
//               // title: InkWell(onTap: (){
//               //   Navigator.push(context, MaterialPageRoute(builder: (_)=> CheckImage(foundImage: _foundPetInfoModel!.petImageUrl,)));
//               // }, child: const Text('Detail')),
//
//               actions: <Widget>[
//                 user != null && user.uid != _foundPetInfoModel!.postedId
//                     ? blockUserWidget(user.uid, _foundPetInfoModel!.postedId)
//                     : IconButton(
//                         icon: const Icon(Icons.delete),
//                         onPressed: () {
//                           buildUpdateDialog(
//                             context: context,
//                             docref: _foundPetInfoModel!.documentReference,
//                             imagesurl: _foundPetInfoModel!.petImageUrl,
//                             title: "Sure you want to delete?",
//                             pos: 6,
//                           ).then((value) => setState(() {
//                              Navigator.pop(context);
//                           }));
//                         })
//               ],
//             ),
//             body:
//         _loaderState ? CommonShareWidget.circularLoader()
//             : SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Column(
//                     children: <Widget>[
//                       CarouselSlider(
//                         options: CarouselOptions(
//                           viewportFraction: 1,
//                           enableInfiniteScroll: false,
//                           autoPlayInterval: const Duration(seconds: 2),
//                         ),
//                         items: _foundPetInfoModel!.petImageUrl!.isNotEmpty
//                             ? _foundPetInfoModel!.petImageUrl!
//                                 .map((img) => Stack(
//                                       fit: StackFit.expand,
//                                       children: <Widget>[
//                                         InkWell(
//                                           child: ClipRRect(
//                                             borderRadius:
//                                                 BorderRadius.circular(12),
//                                             child: CachedNetworkImage(
//                                               filterQuality: FilterQuality.low,
//                                               imageUrl: img,
//                                               fit: BoxFit.cover,
//                                               placeholder: (context, url) =>
//                                                   const CupertinoActivityIndicator(
//                                                       radius: 15.0),
//                                               errorWidget:
//                                                   (context, url, error) =>
//                                                       const Icon(Icons.error),
//                                             ),
//                                           ),
//                                           onTap:(){
//
//                                           },
//                                         ),
//                                         _foundPetInfoModel!.postedId == user.uid
//                                             ? Positioned(
//                                                 right: 0.0,
//                                                 child: Row(
//                                                   children: <Widget>[
//                                                     _foundPetInfoModel!
//                                                                 .petImageUrl!
//                                                                 .length <
//                                                             3
//                                                         ? editMyPetIconButton(
//                                                             Icons.add_a_photo,
//                                                             () {
//                                                             updatePhotoPress(
//                                                                 _foundPetInfoModel!
//                                                                     .docID,
//                                                                 img);
//                                                           })
//                                                         : Container(),
//                                                     _foundPetInfoModel!
//                                                                 .petImageUrl!
//                                                                 .length >
//                                                             1
//                                                         ? editMyPetIconButton(
//                                                             Icons.delete, () {
//                                                             _singleImage = img;
//                                                             buildUpdateDialog(
//                                                               uid:
//                                                                   _foundPetInfoModel!
//                                                                       .docID,
//                                                               title:
//                                                                   "Sure you want to delete this image",
//                                                               context: context,
//                                                               pos: 7,
//                                                             );
//                                                           })
//                                                         : const SizedBox(),
//                                                     //  _foundItemInfoModel.itemImageUrl.length<3? editMyItemIconButton(Icons.add_a_photo, updatePhotoPress):Container()
//                                                   ],
//                                                 ),
//                                               )
//                                             : const SizedBox()
//                                       ],
//                                     ))
//                                 .toList()
//                             : [Assets.images.logo.image()],
//                       ),
//                       Column(
//                         children: <Widget>[
//                           const SizedBox(height: 10,),
//                           widget.matchPet ? const SizedBox() : Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.black,
//                                     // minimumSize: const Size.fromHeight(50), // NEW
//                                   ),
//                                   onPressed: (){
//                                     Navigator.push(context, MaterialPageRoute(builder: (_)=>
//                                         PetMatchList(
//                                           foundPetLogitude: '${_foundPetInfoModel?.longitude}',
//                                           foundPetLatitude: '${_foundPetInfoModel?.latitude}',
//                                           foundPetStatus: '${_foundPetInfoModel?.petStatus}',
//                                           foundPetColor: '${_foundPetInfoModel?.petColor}',
//                                           foundPetGender: '${_foundPetInfoModel?.petGender}',
//                                           foundPetcategory: '${_foundPetInfoModel?.petCategory}',
//                                         )));
//
//                                     if (kDebugMode) {
//                                       print('pet status on tap: ${_foundPetInfoModel?.petStatus} ');
//                                     }
//
//                                   }
//                                   , child: const Text('Tap to see Matches',
//                                 style: TextStyle(
//                                     color: Colors.white
//                                 ),
//                               )),
//                             ],
//                           ),
//                           const SizedBox(height: 10,),
//                           buildTitleWithIcon(
//                             title: _foundPetInfoModel!.petName ?? "",
//                             icon: Icons.pets,
//                             hint: _foundPetInfoModel!.petName ?? "",
//                             pos: 1,
//                             uid: _foundPetInfoModel!.docID,
//                             dialougeTitle: "Update pet name",
//                             isOwner: user != null
//                                 ? user.uid == _foundPetInfoModel!.postedId
//                                     ? true
//                                     : false
//                                 : false,
//                           ),
//                           buildTitleWithIcon(
//                             title: _foundPetInfoModel!.description,
//                             icon: Icons.description,
//                             hint: _foundPetInfoModel!.description,
//                             pos: 2,
//                             uid: _foundPetInfoModel!.docID,
//                             dialougeTitle: "Update pet description",
//                             isOwner: user != null
//                                 ? user.uid == _foundPetInfoModel!.postedId
//                                     ? true
//                                     : false
//                                 : false,
//                           ),
//                           buildTitleWithIcon(
//                             title: _foundPetInfoModel!.location,
//                             icon: Icons.my_location,
//                             hint: _foundPetInfoModel!.location,
//                             pos: 3,
//                             uid: _foundPetInfoModel!.docID,
//                             dialougeTitle: "Update pet location",
//                             isOwner: user != null
//                                 ? user.uid == _foundPetInfoModel!.postedId
//                                     ? true
//                                     : false
//                                 : false,
//                           ),
//                           buildTitleWithIcon(
//                             title: _foundPetInfoModel!.petCategory,
//                             icon: Icons.category,
//                             hint: _foundPetInfoModel!.petCategory,
//                             pos: 4,
//                             uid: _foundPetInfoModel!.docID,
//                             dialougeTitle: "Update pet category",
//                             isOwner: user != null
//                                 ? user.uid == _foundPetInfoModel!.postedId
//                                     ? true
//                                     : false
//                                 : false,
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 30),
//                       buildUserInfo(_foundPetInfoModel!, user),
//                       const SizedBox(height: 80),
//
//                     ],
//                   ),
//                 ),
//               ),
//             // ),
//           )
//         : const Scaffold();
//   }
//
//   updatePhotoPress(uid, oldImageUrl) async {
//     var pickedimage = await ImagePickerHelper()
//         .pickImage(source: ImageSource.gallery, imageQuality: 40);
//     if (pickedimage != null) {
//       if (mounted) {
//         setState(() {
//           _loaderState = true;
//         });
//       }
//
//       final image = File(pickedimage.path.toString());
//       var croppedImage = await ImagePickerHelper.cropImage(image);
//
//       var imageurl = await LoginSignupRepo()
//           .uploadImage(
//             File(croppedImage?.path ?? ''),
//             uid,
//           )
//           .onError((error, stackTrace) => '');
//       if (imageurl.isNotEmpty) {
//         await _userRepo.addNewImageIntoMyPet(uid, imageurl);
//         if (mounted) {
//           setState(() {
//             _loaderState = false;
//           });
//         }
//       } else {
//         if (mounted) {
//           setState(() {
//             _loaderState = false;
//           });
//         }
//       }
//     }
//   }
//
//   editMyPetIconButton(icon, VoidCallback callback) {
//     return Container(
//       color: AppColor.blackColor.withOpacity(0.6),
//       child: IconButton(
//         icon: Icon(
//           icon,
//           color: AppColor.whiteColor,
//         ),
//         onPressed: callback,
//       ),
//     );
//   }
//
//   blockUserWidget(uid, blocID) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _userRepo.isAlreadyblockedThisUser(uid, blocID),
//       builder: (BuildContext context, snapshot) {
//         if (!snapshot.hasData) return Container();
//         if (snapshot.data!.docs.isEmpty) {
//           return Tooltip(
//             message: 'Block user',
//             child: IconButton(
//               icon: Icon(
//                 Icons.block,
//                 color: AppColor.blackColor,
//               ),
//               onPressed: () {
//                 buildUpdateDialog(
//                   context: context,
//                   hint: "Enter something",
//                   title: "Why you want to block this user?",
//                   pos: 5,
//                   uid: uid,
//                   blockid: blocID,
//                 );
//               },
//             ),
//           );
//         }
//         return Container();
//       },
//     );
//   }
//
//   buildUserInfo(LostFoundPetInfoModel foundPetInfoModel, user) {
//     return FutureBuilder<DocumentSnapshot>(
//       future: UserRepo.getUserProfileDocument(foundPetInfoModel.postedId),
//       builder: (_, data) {
//         if (data.data != null) {
//           UserProfileModel profileModel = UserProfileModel.fromDocumentSnap(
//               data.data as DocumentSnapshot<Map<String, dynamic>>);
//
//           return Card(
//             elevation: 1.0,
//             color: Colors.amber.shade50,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 8.0,
//                 vertical: 16,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text("Contact Person"),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: <Widget>[
//                       CommonShareWidget.imageNetwork(
//                         height: 100.0,
//                         width: 100.0,
//                         shape: const CircleBorder(),
//                         imageurl: profileModel.profilephotoImageUrl,
//                       ),
//                       const SizedBox(width: 20.0),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             textWidget(profileModel.name, 16.0),
//                             textWidget(profileModel.address, 14.0),
//                             const SizedBox(height: 15.0),
//                             // textWidget(profileModel.phone, 13.0),
//                            profileModel.email != null ? textWidget(profileModel.email, 13.0) : const SizedBox(),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   if(profileModel.uid != userProfileModel.uid )...
//                   [
//                     Consumer<User?>(
//                       builder: (_, user, child) {
//                         return user != null
//                             ?
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             // SizedBox(
//                             //   width:
//                             //   MediaQuery.of(context).size.width / 2.5,
//                             //   height: 45,
//                             //   child:  TextButton.icon(
//                             //     onPressed: () async {
//                             //       final Uri launchUri = Uri(
//                             //         scheme: 'tel',
//                             //         path: profileModel.phone,
//                             //       );
//                             //       await launchUrl(launchUri);
//                             //     },
//                             //     style: TextButton.styleFrom(
//                             //       backgroundColor: Colors.black,
//                             //       foregroundColor: Colors.white,
//                             //     ),
//                             //     icon: const Icon(Icons.call),
//                             //     label: const Text("Call"),
//                             //   ),
//                             // )
//                             SizedBox(
//                               width:
//                               MediaQuery.of(context).size.width / 2.5,
//                               height: 45,
//                               child: TextButton.icon(
//                                 onPressed: () {
//                                   if (foundPetInfoModel.postedId != null) {
//                                     if (user.uid ==
//                                         foundPetInfoModel.postedId) {
//                                       CommonShareWidget.goToAnotherPage(
//                                         nextPage: const MyChatList(),
//                                         context: context,
//                                       );
//                                     } else {
//                                       CommonShareWidget.goToAnotherPage(
//                                         nextPage: ChatBoard(
//                                           userId: user.uid,
//                                           clientId:
//                                           foundPetInfoModel.postedId,
//                                         ),
//                                         context: context,
//                                       );
//                                     }
//                                   }
//                                 },
//                                 style: TextButton.styleFrom(
//                                   backgroundColor: Colors.black,
//                                   foregroundColor: Colors.white,
//                                 ),
//                                 icon: const Icon(Icons.message_outlined),
//                                 label: const Text("Chat"),
//                               ),
//                             ),
//                           ],
//                         )
//                             :
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width / 2.5,
//                           height: 45,
//                           child: TextButton.icon(
//                             onPressed: () {
//                               CommonShareWidget.goToAnotherPage(
//                                 nextPage: const LoginWithEmail(),
//                                 context: context,
//                               );
//                             },
//                             style: TextButton.styleFrom(
//                               backgroundColor: Colors.black,
//                               foregroundColor: Colors.white,
//                             ),
//                             icon: const Icon(Icons.message_outlined),
//                             label: const Text("Chat"),
//                           ),
//                         );
//
//                       },
//                     ),
//
//                   ] ,
//                   const SizedBox(height: 30,)
//                 ],
//               ),
//             ),
//           );
//         }
//         return const SizedBox();
//       },
//     );
//   }
//
//   textWidget(text, size) {
//     return Text(
//       text,
//       softWrap: true,
//       overflow: TextOverflow.ellipsis,
//       style: TextStyle(
//         fontStyle: FontStyle.italic,
//         fontWeight: FontWeight.bold,
//         fontSize: size,
//       ),
//     );
//   }
//
//   buildTitleWithIcon({
//     required title,
//     IconData? icon,
//     required bool isOwner,
//     String? uid,
//     int? pos,
//     String? dialougeTitle,
//     String? hint,
//   }) {
//     return Card(
//       elevation: 0,
//       // color: AppColor.orange.withOpacity(0.8),
//       shape: RoundedRectangleBorder(
//         side: BorderSide(
//             color: AppColor.orange,
//             width: 2
//         ),
//         borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
//       ),
//       color: AppColor.orange.withOpacity(0.3),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Icon(
//               icon,
//               size: 15.0,
//             ),
//             const SizedBox(width: 15.0),
//             Expanded(
//               child: Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 15.0,
//                   fontWeight: FontWeight.normal,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 5.0),
//             isOwner
//                 ? IconButton(
//                     icon: const Icon(Icons.edit),
//                     onPressed: () {
//                       buildUpdateDialog(
//                           context: context,
//                           uid: uid,
//                           pos: pos,
//                           title: dialougeTitle,
//                           hint: hint);
//                     })
//                 : Container()
//           ],
//         ),
//       ),
//     );
//   }
//
//   deleteProduct(docRef, context) async {
//     await _userRepo.deletePostedPet(docRef);
//     if (_images != null) await _userRepo.deletePetImage(_images);
//     Navigator.of(context).pop();
//   }
//
//   removeImageFromPet(docId, context) async {
//     if (docId != null) {
//       await _userRepo.removeAnImageFromMyPet(docId, _singleImage);
//       await _userRepo.deleteSiglePetImage(_singleImage);
//       Navigator.of(context).pop();
//     }
//   }
//
//   buildNoPetAvailable() {
//     return const Scaffold(
//       body: Center(
//         child: Text("Pet is deleted or not available"),
//       ),
//     );
//   }
//
//   Future buildUpdateDialog(
//       {required BuildContext context,
//       title,
//       int? pos,
//       hint,
//       uid,
//       blockid,
//       docref,
//       imagesurl}) {
//     final TextEditingController controller = TextEditingController();
//     FocusScope.of(context).requestFocus(FocusNode());
//     bool loaderstatus = false;
//     if (pos == 6 || pos == 7) {
//       controller.text = "delete";
//     }
//     return showDialog(
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setDialougeState) {
//             return AlertDialog(
//               title: Text(loaderstatus ? "Please wait..." : title),
//               content: pos != 6 && pos != 7
//                   ? TextFormField(
//                       keyboardType:
//                           pos == 6 ? TextInputType.phone : TextInputType.text,
//                       controller: controller,
//                       decoration: InputDecoration(hintText: hint),
//                     )
//                   : const Text(""),
//               actions: <Widget>[
//                 TextButton(
//                   onPressed: loaderstatus
//                       ? null
//                       : () {
//                           if (controller.text.trim().isNotEmpty)
//                           {
//                             setDialougeState(() {
//                               loaderstatus = true;
//                             });
//                             switch (pos) {
//                               case 1:
//                                 _userRepo.updatePetTextInfo(
//                                     uid: uid,
//                                     context: context,
//                                     controller: controller,
//                                     maptitle: "pet_name");
//                                 break;
//                               case 2:
//                                 _userRepo.updatePetTextInfo(
//                                     uid: uid,
//                                     context: context,
//                                     controller: controller,
//                                     maptitle: "description");
//                                 break;
//                               case 3:
//                                 _userRepo.updatePetTextInfo(
//                                     uid: uid,
//                                     context: context,
//                                     controller: controller,
//                                     maptitle: "found_location");
//                                 break;
//                               case 4:
//                                 _userRepo.updatePetTextInfo(
//                                     uid: uid,
//                                     context: context,
//                                     controller: controller,
//                                     maptitle: "pet_category");
//                                 break;
//                               case 5:
//                                 _userRepo.setBlockDataByUser(
//                                     PendingBlockList(
//                                         blockId: blockid,
//                                         claimId: uid,
//                                         text: controller.text,
//                                         timestamp:
//                                             FieldValue.serverTimestamp()),
//                                     context);
//                                 break;
//                               case 6:
//                                 deleteProduct(docref, context);
//                                 break;
//                               case 7:
//                                 removeImageFromPet(uid, context);
//                                 break;
//                             }
//                           } else {
//                             CommonShareWidget.showColorFlushBar(
//                                 context: context,
//                                 duration: 2,
//                                 message: "Invalid Input",
//                                 color: Colors.black);
//                           }
//                         },
//                   child: const Text('Yes'),
//                 ),
//                 TextButton(
//                   onPressed: loaderstatus
//                       ? null
//                       : () {
//                           Navigator.of(context).pop();
//                         },
//                   child: const Text('Cancel'),
//                 )
//               ],
//             );
//           },
//         );
//       },
//       context: context,
//     );
//   }
// }
