// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:petfindernetwork/bloc/professional_id_upload_provider.dart';
// import 'package:provider/provider.dart';
// import '../../admin/user_data.dart';
// import '../../bloc/loader_provider.dart';
// import '../../constant/colors.dart';
// import '../../helper/app_dropdown_button.dart';
// import '../../helper/image_picker_helper.dart';
// import '../../repository/loginsignupRepo.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
//
// class IdendtityVerify extends StatefulWidget {
//   const IdendtityVerify({super.key});
//
//   @override
//   State<IdendtityVerify> createState() => _IdendtityVerifyState();
// }
//
// class _IdendtityVerifyState extends State<IdendtityVerify> {
//   String? iDType;
//   // var size,height,width;
//   File? _image;
//   final picker = ImagePicker();
//   CollectionReference ref = FirebaseFirestore.instance.collection('users');
//   bool _loaderState = false;
//   // final UserRepo _userRepo = UserRepo();
//
//   static const List<String> idList = [
//     "Voter Id",
//     "Driving Licence",
//     "Aadhar Card",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//    final size = MediaQuery.of(context).size;
//    // var height = size.height;
//    LoaderProvider loaderProvider = Provider.of<LoaderProvider>(context);
//    _loaderState = loaderProvider.isLoading;
//    ProfessionalIdProvider professionalIdProvider = Provider.of<ProfessionalIdProvider>(context);
//    var width = size.width;
//     return  Scaffold(
//       appBar: AppBar(
//       ),
//       body:
//          SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Center(
//               child: Column(
//                 children: [
//                   const SizedBox(height: 40,),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 32),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         const Text(
//                           "ID Type : ",
//                           style: TextStyle(
//                             fontSize: 16,
//                             // fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         AppDropDownButton(
//                           dropdownItems: idList,
//                           onChange: (value) async {
//                             if (value != null) {
//                               setState(() {
//                                 iDType = value;
//                               });
//                             }
//                           },
//                           value: iDType,
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 50,),
//                   SizedBox(
//                     height: 250,
//                     width:300,
//                     // decoration: BoxDecoration(
//                     // color: Colors.black54,
//                     //     border: Border.all(
//                     // color: Colors.black
//                     // )
//                     // ),
//                     child: Card(
//                       color: AppColor.orange,
//                       elevation: 5,
//                       child:_image != null ?
//                       Image.file(_image!.absolute,
//                       fit: BoxFit.fill,
//                       ) :
//                       const Icon(Icons.image
//                                             ),
//                     ),
//                   ),
//                   const SizedBox(height: 50,),
//                   _image == null ? (Card(
//                     elevation: 1.0,
//                     color: Colors.black,
//                     child: Padding(
//                       padding: const EdgeInsets.all(6.0),
//                       child: ListTile(
//                         title: Center(
//                           child: _loaderState ? const CircularProgressIndicator(color: Colors.white,) : Text(
//                             "Pick your ID",
//                             style: TextStyle(
//                               color: AppColor.whiteColor,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         onTap: () {
//                           bottomForm(width);
//                         },
//                       ),
//                     ),
//                   )
//                   ) : ( Card(
//                     elevation: 1.0,
//                     color: AppColor.green,
//                     child: Padding(
//                       padding: const EdgeInsets.all(6.0),
//                       child: ListTile(
//                         title: Center(
//                           child: _loaderState ? const CircularProgressIndicator(color: Colors.white,) : Text(
//                             "Submit",
//                             style: TextStyle(
//                               color: AppColor.whiteColor,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         onTap: ()  {
//                           if (_image == null) {
//                             CommonShareWidget.showFlushBar(
//                                 context: context,
//                                 duration: 2,
//                                 message: "Please upload ID");
//                           } else if(iDType == null ){
//                             CommonShareWidget.showFlushBar(
//                                 context: context,
//                                 duration: 2,
//                                 message: "Please select ID Type");
//                           } else {
//                             // _userRepo.iDSubmit(UserProvider.userInfoModel?.uid, context, _image, iDType!);
//                             // _userRepo.updateIsIdPending(
//                             //     UserProvider.userInfoModel?.uid, context, iDType!, UserProvider.userInfoModel?.isIdPending ?? false, _image!);
//                             professionalIdProvider.formSubmit(_image, iDType!, context);
//                             // formSubmit(_image!, );
//
//                             // uid, context, String iDType, bool isIdPending, idImage
//                           }
//                         },
//                       ),
//                     ),
//                   )
//                   ),
//                 const SizedBox(height: 20,),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       // ),
//     );
//   }
//   void bottomForm(var width){
//     showModalBottomSheet(context: context,
//         // barrierColor: Colors.transparent,
//         backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//         builder: (BuildContext context){
//
//           return StatefulBuilder( builder: (BuildContext context, StateSetter setState) {
//             return Container(
//               height: 250,
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(30))
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 10,),
//                     InkWell(
//                       onTap: ()  {
//                         // professionalIdProvider.getImageGallery(context);
//                         getImageGallery();
//                         Navigator.pop(context);
//                       },
//                       child: const Row(
//                         children: [
//                           SizedBox(
//                               height: 60,
//                               width: 320 ,
//                               child: Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: Row(
//                                   children: [
//                                     Icon(Icons.image),
//                                     SizedBox(width: 10,),
//                                     Text("Image from Gallery",
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.bold
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: double.infinity,
//                       height: 1.0,
//                       color: Colors.redAccent,
//                     ),
//                     InkWell(
//                       onTap: (){
//                         // professionalIdProvider.getCameraImage(context);
//                         getCameraImage();
//                         Navigator.pop(context);
//                       },
//                       child: const Row(
//                         children: [
//                           SizedBox(
//                               height: 60,
//                               width: 320 ,
//                               child: Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: Row(
//                                   children: [
//                                     Icon(Icons.camera_alt_rounded),
//                                     SizedBox(width: 10,),
//                                     Text("Image from Camera",
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.bold
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: width,
//                       height: 1.0,
//                       color: Colors.redAccent,
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }
//           );
//         });
//   }
//
//   // Future getImageGallery() async{
//   //   final XFile ? pickFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
//   //   setState(() {
//   //     if (mounted) {
//   //       setState(() {
//   //         Provider.of<LoaderProvider>(context, listen: false).loading(true);
//   //         // _loaderState = true;
//   //       });
//   //     }
//   //     if(pickFile!=null){
//   //       _image = File(pickFile.path);
//   //       if (mounted) {
//   //         setState(() {
//   //           Provider.of<LoaderProvider>(context, listen: false).loading(false);
//   //
//   //           // _loaderState = false;
//   //         });
//   //       }
//   //       if (kDebugMode) {
//   //         print("=====image path: $_image");
//   //       }
//   //     } else{
//   //       if (mounted) {
//   //         setState(() {
//   //           Provider.of<LoaderProvider>(context, listen: false).loading(false);
//   //
//   //           // _loaderState = false;
//   //         });
//   //       }
//   //       if (kDebugMode) {
//   //         print('No Image Picked');
//   //       }
//   //     }
//   //   });
//   // }
//   //
//   // Future getCameraImage() async{
//   //   final XFile ? pickFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
//   //
//   //   if (mounted) {
//   //     setState(() {
//   //       Provider.of<LoaderProvider>(context, listen: false).loading(true);
//   //
//   //       // _loaderState = true;
//   //     });
//   //   }
//   //
//   //   setState(() {
//   //     if(pickFile!=null){
//   //       _image = File(pickFile.path);
//   //       if (mounted) {
//   //         setState(() {
//   //           Provider.of<LoaderProvider>(context, listen: false).loading(false);
//   //
//   //           // _loaderState = false;
//   //         });
//   //       }
//   //
//   //       if (kDebugMode) {
//   //         print("=====image path: $_image");
//   //       }
//   //     } else{
//   //       if (mounted) {
//   //         setState(() {
//   //           Provider.of<LoaderProvider>(context, listen: false).loading(false);
//   //
//   //           // _loaderState = false;
//   //         });
//   //       }
//   //
//   //       if (kDebugMode) {
//   //         print('No Image Picked');
//   //       }
//   //     }
//   //   });
//   // }
//
//   Future getImageGallery() async{
//     final XFile ? pickFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
//     if (mounted) {
//       setState(() {
//         Provider.of<LoaderProvider>(context, listen: false).loading(true);
//         // _loaderState = true;
//       });
//     }
//     if(pickFile!=null){
//       // _image = File(pickFile.path);
//       final image = File(pickFile.path.toString());
//       var croppedImage = await ImagePickerHelper.cropImage(image);
//       if(croppedImage != null){
//         if (mounted) {
//           setState(() {
//             Provider.of<LoaderProvider>(context, listen: false).loading(true);
//             // _loaderState = true;
//           });
//         }
//         _image = File(croppedImage.path);
//       }
//       if (mounted) {
//         setState(() {
//           Provider.of<LoaderProvider>(context, listen: false).loading(false);
//           // _loaderState = false;
//         });
//       }
//       if (kDebugMode) {
//         print("=====image path: $_image");
//       }
//     }
//     else{
//       if (mounted) {
//         setState(() {
//           Provider.of<LoaderProvider>(context, listen: false).loading(false);
//           // _loaderState = false;
//         });
//       }
//       if (kDebugMode) {
//         print('No Image Picked');
//       }
//     }
//   }
//
//   Future getCameraImage() async{
//     final XFile ? pickFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
//     if(pickFile!=null){
//       final image = File(pickFile.path.toString());
//       var croppedImage = await ImagePickerHelper.cropImage(image);
//       if(croppedImage != null){
//         if (mounted) {
//           Provider.of<LoaderProvider>(context, listen: false).loading(true);
//         }
//         _image = File(croppedImage.path);
//       }
//       if (mounted) {
//         Provider.of<LoaderProvider>(context, listen: false).loading(false);
//       }
//       if (kDebugMode) {
//         print("=====image path: $_image");
//       }
//     }
//     else{
//       if (mounted) {
//         Provider.of<LoaderProvider>(context, listen: false).loading(false);
//       }
//       if (kDebugMode) {
//         print('No Image Picked');
//       }
//     }
//     // setState(() async {
//     //
//     // });
//   }
//
//   formSubmit() async {
//     if (validateForm() != true) {
//       return;
//     }
//     if (mounted) {
//       setState(() {
//         _loaderState = true;
//       });
//     }
//
//     String? uid = UserProvider.userInfoModel?.uid;
//     if (kDebugMode) {
//       print("user id on submit button: $uid");
//     }
//     String imageUrl = await LoginSignupRepo()
//         .uploadImage(_image!, uid!);
//     if (kDebugMode) {
//       print("After submit image url: $imageUrl");
//     }
//
//     setState(() {
//       ref.doc(uid).update(
//           {
//             "idImageUrl": imageUrl.toString(),
//             "isIdPending" : true ,
//             "idType": iDType,
//           }).then((value){
//         const Text('Update');
//         // showHideLoading(false);
//         // _isLoading = false;
//         if (mounted) {
//           setState(() {
//             _loaderState = false;
//           });
//         }
//         Navigator.pop(context);
//       }).onError((error, stackTrace){
//         const Text('Error');
//         if (mounted) {
//           setState(() {
//             _loaderState = false;
//           });
//         }
//       });
//     });
//   }
//
//   bool validateForm() {
//     FocusScope.of(context).unfocus();
//     bool isValid = false;
//       if (_image == null) {
//         CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 2,
//             message: "Please upload ID");
//       } else if(iDType == null ){
//         CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 2,
//             message: "Please select ID Type");
//       } else {
//
//         isValid = true;
//       }
//       if (kDebugMode) {
//         print('=====isValid---$isValid');
//       }
//     return isValid;
//   }
//
//   showHideLoading(bool status) {
// if(status == true)
//   {
//     const Center(
//       child: CircularProgressIndicator(),
//     );}
//   }
// }
