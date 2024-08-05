// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import '../../bloc/loader_provider.dart';
// import '../../bloc/professional_id_upload_provider.dart';
// import '../../constant/colors.dart';
// import '../../helper/image_picker_helper.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
//
// class ProfessionVerification extends StatefulWidget {
//   const ProfessionVerification({super.key});
//
//   @override
//   State<ProfessionVerification> createState() => _ProfessionVerificationState();
// }
//
// class _ProfessionVerificationState extends State<ProfessionVerification> {
//   String? professionType;
//   File? _image;
//   final picker = ImagePicker();
//   CollectionReference ref = FirebaseFirestore.instance.collection('users');
//   bool _loaderState = false;
//
//
//   @override
//   Widget build(BuildContext context) {
//    final size = MediaQuery.of(context).size;
//    var width = size.width;
//    LoaderProvider loaderProvider = Provider.of<LoaderProvider>(context);
//    _loaderState = loaderProvider.isLoading;
//    ProfessionalIdProvider professionalIdProvider = Provider.of<ProfessionalIdProvider>(context);
//    if (kDebugMode) {
//      print("loader state in profession verification ${_loaderState.toString()}");
//    }
//    return Scaffold(
//       appBar: AppBar(
//
//       ),
//       body:
//       // _loaderState ? CommonShareWidget.circularLoader()
//       //     :
//       SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Center(
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 40,),
//                   SizedBox(
//                     height: 250,
//                     width:300,
//                     child: Card(
//                       color: AppColor.orange,
//                       elevation: 5,
//                       child:_image != null ? Image.file(_image!.absolute,
//                         fit: BoxFit.fill,
//                       ) : const Icon(Icons.image,
//                         size: 50,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 50,),
//                   _image == null ?
//                   (
//                       Card(
//                     elevation: 1.0,
//                     color: Colors.black,
//                     child: Padding(
//                       padding: const EdgeInsets.all(6.0),
//                       child: ListTile(
//                         title: _loaderState ? const Center(child: CircularProgressIndicator(color: Colors.white,)) : Center(
//                           child: Text(
//                             "Pick your Certificate",
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
//                   )   :
//                   // const SizedBox(height: 20,),
//                   ( Card(
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
//                           if (validateForm() != true) {
//                             return;
//                           }
//                           professionalIdProvider.docFormSubmit(_image, context);
//
//                         },
//                       ),
//                     ),
//                   )),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       // ),
//
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
//           return StatefulBuilder( builder: (BuildContext context, StateSetter setState) {
//             return Container(
//               height: 250,
//               width: width,
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
//                        getImageGallery();
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
//                       width: width,
//                       height: 1.0,
//                       color: Colors.redAccent,
//                     ),
//                     InkWell(
//                       onTap: (){
//                         getCameraImage();
//                         Navigator.pop(context);
//                       },
//                       child: const Row(
//                         children: [
//                           SizedBox(
//                             height: 60,
//                             width: 320 ,
//                             child: Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: Row(
//                                 children: [
//                                   Icon(Icons.camera_alt_rounded),
//                                   SizedBox(width: 10,),
//                                   Text("Image from Camera",
//                                     style: TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: width,
//                       height: 1.0,
//                       color: Colors.redAccent,
//                     ),
//
//                   ],
//                 ),
//               ),
//             );
//           }
//           );
//         });
//   }
//
//   Future getImageGallery() async{
//     final XFile ? pickFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
//     if (mounted) {
//       setState(() {
//         Provider.of<LoaderProvider>(context, listen: false).loading(true);
//         // _loaderState = true;
//       });
//     }
//
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
//
//   }
//
//   Future getCameraImage() async{
//     final XFile ? pickFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
//
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
//
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
//   bool validateForm() {
//     FocusScope.of(context).unfocus();
//     bool isValid = false;
//     if (_image == null) {
//       CommonShareWidget.showFlushBar(
//           context: context,
//           duration: 2,
//           message: "Please upload professional certificate");
//     }  else {
//
//       isValid = true;
//     }
//     if (kDebugMode) {
//       print('=====isValid---$isValid');
//     }
//     return isValid;
//   }
//
// }
