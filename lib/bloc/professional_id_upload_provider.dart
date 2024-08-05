//
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:petfindernetwork/Web_helper/commonShareWidget.dart';
// import 'package:provider/provider.dart';
// import '../admin/user_data.dart';
// import '../Web_helper/loginsignupRepo.dart';
// import '../repository/userRepo.dart';
// import '../Web_helper/loader_provider.dart';
//
// class ProfessionalIdProvider extends ChangeNotifier
// {
//   final picker = ImagePicker();
//    File? _image;
//    File? get image => _image;
//
//   formSubmit(File? image, String iDType, context) async {
//    Provider.of<LoaderProvider>(context, listen: false).loading(true);
//     String? uid = UserProvider.userInfoModel?.uid;
//     if (kDebugMode) {
//       print("user id on submit button: $uid");
//     }
//     String imageUrl = await LoginSignupRepo()
//         .uploadImage(image!, uid!);
//
//     Map<String, dynamic> value = {};
//     value['idImageUrl'] = imageUrl.toString();
//    value['isIdPending'] = true;
//    value['idType'] = iDType;
//    await UserRepo.updateUserProfileData(uid, value);
//    notifyListeners();
//     Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//     if (kDebugMode) {
//       print("After submit image url: $imageUrl");
//     }
//     Navigator.pop(context);
//     CommonShareWidget.showFlushBar(
//         context: context,
//         duration: 3,
//       message: "Your Document Submitted"
//     );
//     notifyListeners();
//
//   }
//
//
//   docFormSubmit(File? image, context) async {
//     Provider.of<LoaderProvider>(context, listen: false).loading(true);
//     String? uid = UserProvider.userInfoModel?.uid;
//     String imageUrl = await LoginSignupRepo()
//         .uploadImage(image!, uid!);
//     if (kDebugMode) {
//       print("After submit image url: $imageUrl");
//     }
//     Map<String, dynamic> value = {};
//     value['professionalImageUrl'] = imageUrl.toString();
//     value['isDocPending'] = true;
//     await UserRepo.updateUserProfileData(uid, value);
//     notifyListeners();
//     Provider.of<LoaderProvider>(context, listen: false).loading(false);
//     Navigator.pop(context);
//     CommonShareWidget.showFlushBar(
//         context: context,
//         duration: 3,
//         message: "Your Document Submitted"
//     );
//     notifyListeners();
//     // ref.doc(uid).update
//     //   (
//     //     {
//     //       "professionalImageUrl": imageUrl.toString(),
//     //       "isDocPending" : true ,
//     //     }).then((value) async {
//     //
//     //   const Text('Update');
//     //   // showHideLoading(false);
//     //   // _isLoading = false;
//     //   Provider.of<LoaderProvider>(context, listen: false).loading(false);
//     //   notifyListeners();
//     //   Navigator.pop(context);
//     //
//     // }).onError((error, stackTrace){
//     //   const Text('Error');
//     //   Provider.of<LoaderProvider>(context, listen: false).loading(false);
//     //   notifyListeners();
//     // });
//     // notifyListeners();
//   }
//
//   Future getImageGallery(context) async{
//     final XFile ? pickFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
//              Provider.of<LoaderProvider>(context, listen: false).loading(true);
//           // _loaderState = true;
//
//       if(pickFile!=null){
//         _image = File(pickFile.path);
//         Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//
//         if (kDebugMode) {
//           print("=====image path: $_image");
//         }
//       } else{
//         Provider.of<LoaderProvider>(context, listen: false).loading(false);
//         if (kDebugMode) {
//           print('No Image Picked');
//         }
//       }
//     notifyListeners();
//
//   }
//
//   Future getVideoGallery(context) async{
//     final XFile ? pickFile = await picker.pickVideo(source: ImageSource.gallery);
//     Provider.of<LoaderProvider>(context, listen: false).loading(true);
//     // _loaderState = true;
//
//     if(pickFile!=null){
//       _image = File(pickFile.path);
//       Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//
//       if (kDebugMode) {
//         print("=====image path: $_image");
//       }
//     } else{
//       Provider.of<LoaderProvider>(context, listen: false).loading(false);
//       if (kDebugMode) {
//         print('No Image Picked');
//       }
//     }
//     notifyListeners();
//
//   }
//
//   Future getCameraImage(context) async{
//
//     final XFile ? pickFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
//
//    Provider.of<LoaderProvider>(context, listen: false).loading(true);
//
//
//
//        if(pickFile!=null){
//         _image = File(pickFile.path);
//        Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//
//
//         if (kDebugMode) {
//           print("=====image path: $_image");
//         }
//       } else{
//         Provider.of<LoaderProvider>(context, listen: false).loading(false);
//             if (kDebugMode) {
//           print('No Image Picked');
//         }
//       }
//        notifyListeners();
//     }
//
//   }
//
//
//
//
//
