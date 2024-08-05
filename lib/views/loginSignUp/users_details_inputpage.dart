// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:petfindernetwork/views/home/homePage.dart';
// import 'package:provider/provider.dart';
// import '../../admin/preference.dart';
// import '../../bloc/loader_provider.dart';
// import '../../constant/choice_button.dart';
// import '../../constant/colors.dart';
// import '../../helper/app_dropdown_button.dart';
// import '../../helper/image_picker_helper.dart';
// import '../../model/user_profile.dart';
// import '../../repository/cityListRepo.dart';
// import '../../repository/loginsignupRepo.dart';
// import '../../repository/userRepo.dart';
// import '../lostFound/city_search_deligate.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
// import 'login_with_email.dart';
//
// class UserInputDetailsPage extends StatefulWidget {
//   const UserInputDetailsPage({super.key});
//
//   @override
//   State<UserInputDetailsPage> createState() => _UserInputDetailsPageState();
// }
//
// class _UserInputDetailsPageState extends State<UserInputDetailsPage> {
//   final TextEditingController _controllerName = TextEditingController();
//   final TextEditingController _controllerAddress = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   File? _imageProfile;
//   // File? _imageNid;
//   late bool _loaderState;
//   // late bool _imageLoader;
//   // late bool _imageIdLoader;
//
//   bool isProfessional = false;
//   String? professionalType;
//   String? cityName;
//   String? idImageUrl;
//   String? professionalImageUrl;
//   bool? isIdVerified = false;
//   bool? isDocVerified = false;
//   bool? isIdPending =  false;
//   bool?  isIdRejected = false;
//   bool? isDocRejected = false;
//   bool?  isDocPending = false;
//   bool? isAdmin= false;
//   String? profileimageUrl;
//   String? nidImageUrl;
//
//
//   static const List<String> listProfessionType = [
//     "Doctor",
//     "Trainer",
//     // "Shopkeeper",
//   ];
//
//   @override
//   void initState(){
//     _loaderState = false;
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     var width = size.width;
//     final colorScheme = Theme.of(context).colorScheme;
//     LoaderProvider loaderProvider = Provider.of<LoaderProvider>(context);
//     _loaderState = loaderProvider.isLoading;
//     // _imageLoader = loaderProvider.isImageLoader;
//     // _imageIdLoader = loaderProvider.isIDImagLoader;
//     return Scaffold(
//       body:
//       // _loaderState ? CommonShareWidget.circularLoader()
//           SingleChildScrollView(
//           child: Form(
//             autovalidateMode: AutovalidateMode.always,
//             key: _formKey,
//             child: Column(
//               children: <Widget>[
//                 Stack(
//                   children: <Widget>[
//                     ClipPath(
//                       clipper: WaveClipper2(),
//                       child: Container(
//                         width: double.infinity,
//                         height: 300,
//                         decoration: const BoxDecoration(
//                           gradient: LinearGradient(
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                             colors: [
//                               Color.fromRGBO(83, 160, 136, 1),
//                               Colors.orange,
//                             ],
//                           ),
//                         ),
//                         child: const Column(),
//                       ),
//                     ),
//                     ClipPath(
//                       clipper: WaveClipper3(),
//                       child: Container(
//                         width: double.infinity,
//                         height: 300,
//                         decoration: const BoxDecoration(
//                           gradient: LinearGradient(begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                             colors: [
//                               Color.fromRGBO(252,161,95,1.00),
//                               Color.fromRGBO(252,161,95,1.00),
//                             ],
//                           ),
//                         ),
//                         child: const Column(),
//                       ),
//                     ),
//                     ClipPath(
//                       clipper: WaveClipper1(),
//                       child: Container(
//                         width: double.infinity,
//                         height: 300,
//                         decoration: const BoxDecoration(
//                           gradient: LinearGradient(begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                             colors: [
//                               Color.fromRGBO(252,161,95,1.00),
//                               Colors.purple,
//                             ],
//                           ),
//                         ),
//                         child: const Column(
//                           children: <Widget>[
//                             SizedBox(
//                               height: 40,
//                             ),
//                             Icon(
//                               Icons.person,
//                               color: Colors.white,
//                               size: 60,
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text("Welcome",
//                                   style: TextStyle(
//                                     // fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                       // fontStyle: FontStyle.italic ,
//                                       fontSize: 25
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 buildChoiceButton(colorScheme),
//
//                 const SizedBox(height: 20),
//                   isProfessional ? Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 32),
//                     child: SizedBox(
//                       width: width,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.only(left: 10, right: 2),
//                             child: Text(
//                               "Select type",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 // fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ),
//                           AppDropDownButton(
//                             dropdownItems: listProfessionType,
//                             onChange: (value) async {
//                               if (value != null) {
//                                 setState(() {
//                                   professionalType = value;
//                                 });
//                               }
//                             },
//                             value: professionalType,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ) : const SizedBox(),
//                 isProfessional ? const SizedBox(height: 20) : const SizedBox(),
//                 Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 32),
//                     child: Material(
//                       elevation: 2.0,
//                       borderRadius: const BorderRadius.all(Radius.circular(30)),
//                       child: TextField(
//                         onChanged: (String value) {},
//                         cursorColor: Colors.deepOrange,
//                         controller: _controllerName,
//                         keyboardType: TextInputType.text,
//                         decoration: const InputDecoration(
//                             hintText: "Name",
//                             prefixIcon: Material(
//                               elevation: 0,
//                               borderRadius: BorderRadius.all(Radius.circular(30)),
//                               child: Icon(
//                                 Icons.person,
//                                 color: Colors.blueAccent,
//                               ),
//                             ),
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 25, vertical: 13)),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 32),
//                     child: Material(
//                       elevation: 2.0,
//                       borderRadius: const BorderRadius.all(Radius.circular(30)),
//                       child: TextField(
//                         onChanged: (String value) {},
//                         cursorColor: Colors.deepOrange,
//                         controller: _controllerAddress,
//                         keyboardType: TextInputType.text,
//                         decoration: const InputDecoration(
//                             hintText: "Address",
//                             prefixIcon: Material(
//                               elevation: 0,
//                               borderRadius: BorderRadius.all(Radius.circular(30)),
//                               child: Icon(
//                                 Icons.home,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 25, vertical: 13)),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Padding (
//                     padding: const EdgeInsets.symmetric(horizontal: 32),
//                     child: GestureDetector(
//                       onTap: () async
//                       {
//                         setState(() {
//                           Provider.of<LoaderProvider>(context, listen: false).loading(true);
//
//                           // _loaderState = true;
//                         });
//                         final cityList =
//                         await CityListRepo().fetchCityListFromCSV();
//                         setState(() {
//                           Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//                           // _loaderState = false;
//                         });
//                         final result = await showSearch<String?>(
//                           context: context,
//                           delegate: CitySearchDeligate(cityList),
//                         );
//                         setState(()
//                         {
//                           cityName = result;
//                         }
//                         );
//                       },
//                       child: TextField(
//                         enabled: false,
//                         cursorColor: Colors.deepOrange,
//                         keyboardType: TextInputType.text,
//                         decoration: InputDecoration(
//                           hintText: cityName ?? "Select city",
//                           hintStyle: cityName != null
//                               ? const TextStyle(color: Colors.black87)
//                               : const TextStyle(color: Colors.black54),
//                           prefixIcon: const Icon(
//                             Icons.location_city,
//                             color: Colors.indigoAccent,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20.0,
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(left: 32.0),
//                     child: Row(
//                       children: <Widget>[
//                         Container(
//                             height: 60.0,
//                             width: 60.0,
//                             decoration: BoxDecoration(
//                                 shape: BoxShape.rectangle,
//                                 border: Border.all(color: AppColor.blackColor),
//                                 borderRadius: BorderRadius.circular(15.0)),
//                             child: InkWell(
//                                 child: _imageProfile == null
//                                     ?  const Icon(Icons.add_a_photo)
//                                     : ClipRRect(
//                                   borderRadius: BorderRadius.circular(15.0),
//                                   child: Image.file(
//                                     _imageProfile!,
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                                 onTap: () =>
//                                     // getImage(true)
//                                      bottomForm(MediaQuery.of(context).size.width, true, context)
//                               // getImage(true),
//                             )),
//                         const SizedBox(
//                           width: 15.0,
//                         ),
//                         const Text('Add profile photo')
//                       ],
//                     ),
//                   ),
//                   // const SizedBox(
//                   //   height: 20.0,
//                   // ),
//                   // Container(
//                   //   margin: const EdgeInsets.only(left: 32.0),
//                   //   child: Row(
//                   //     children: <Widget>[
//                   //       Container(
//                   //           height: 60.0,
//                   //           width: 60.0,
//                   //           decoration: BoxDecoration(
//                   //               shape: BoxShape.rectangle,
//                   //               border: Border.all(color: AppColor.blackColor),
//                   //               borderRadius: BorderRadius.circular(15.0)),
//                   //           child: InkWell(
//                   //               child: _imageNid == null
//                   //                   ? const Icon(Icons.add_a_photo)
//                   //                : ClipRRect(
//                   //                 borderRadius: BorderRadius.circular(15.0),
//                   //                 child: Image.file(
//                   //                   _imageNid!,
//                   //                   fit: BoxFit.fill,
//                   //                 ),
//                   //               ),
//                   //               onTap: () =>
//                   //                   bottomForm(MediaQuery.of(context).size.width, false, context)
//                   //             // getImage(false),
//                   //           )),
//                   //       const SizedBox(
//                   //         width: 15.0,
//                   //       ),
//                   //       const Text('Add National Id photo')
//                   //     ],
//                   //   ),
//                   // ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 32.0),
//                   child: Center(
//                     child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.black,
//                           minimumSize: const Size.fromHeight(50), // NEW
//                         ),
//                         onPressed: () async
//                         {
//                           handleSubmit(context);
//                         },
//
//                         child: _loaderState ? const CircularProgressIndicator(color: Colors.white,) : const Text("OK",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 23,
//                               fontWeight: FontWeight.bold
//                           ),
//                         )),
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//
//               ],
//             ),
//           ),
//         ),
//       // ),
//     );
//   }
//
//   handleSubmit(context) async {
//     if (validateForm() != true) {
//       return;}
//
//     try
//     {
//
//       setState(() {
//         Provider.of<LoaderProvider>(context, listen: false).loading(true);
//         // _loaderState = true;
//       });
//       final String? uid = await FirebaseAuth.instance.currentUser?.uid;
//
//       if (kDebugMode) {
//         print("handleSubmit uid = $uid");
//       }
//        // FirebaseAuth.instance.currentUser!.emailVerified;
//       if (kDebugMode) {
//         print("handleSubmit emailverified = ${FirebaseAuth.instance.currentUser!.emailVerified}");
//         print("handleSubmit email = ${FirebaseAuth.instance.currentUser?.email}");
//         print("handleSubmit phone = ${FirebaseAuth.instance.currentUser?.phoneNumber}");
//       }
//       if (FirebaseAuth.instance.currentUser?.uid != null)
//         {
//        LoginSignupRepo()
//               .uploadImage(_imageProfile!, uid.toString())
//               .then((profileimageUrl)
//          {
//               UserRepo()
//                   .setUserProfileData
//                 (
//                   uid,
//                       UserProfileModel(
//                           uid: uid,
//                           name: _controllerName.text,
//                           email: FirebaseAuth.instance.currentUser?.email ?? '',
//                           phone: FirebaseAuth.instance.currentUser?.phoneNumber ?? '',
//                           address: _controllerAddress.text ,
//                           profilephotoImageUrl: profileimageUrl,
//                           nidImageUrl: nidImageUrl ,
//                           isProfessional: isProfessional,
//                          location: cityName ?? "",
//                           professionalType: professionalType ?? '',
//                           // idImageUrl: idImageUrl ?? '',
//                           // professionalImageUrl: professionalImageUrl ?? '',
//                           isAdmin: isAdmin ?? false,
//                           isIdVerified: isIdVerified ?? false,
//                           isDocVerified: isDocVerified  ?? false,
//                           isIdPending: isDocVerified ?? false,
//                           isIdRejected: isDocVerified ?? false,
//                           isDocRejected: isDocRejected ?? false,
//                           isDocPending: isDocPending ?? false,
//                       ))
//                   .then((value) async {
//                 if (mounted)
//                 {
//                   setState(() {
//                     Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//                     // _loaderState = false;
//                     CommonShareWidget.showFlushBar (
//                         context: context, duration: 5, message: "Form submitted");
//                   });
//                 }
//                 final userData = await FirebaseFirestore.instance.collection("users").doc(uid).get();
//                 await Preferences.saveUserData(userData.data());
//                 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const HomePage()), (route) => false);
//                 // Navigator.push(context, MaterialPageRoute(builder: (_) => const HomePage(),));
//               });
//           }
//           );
//         }
//         else
//         {
//         if (mounted) {
//           setState(() {
//             Provider.of<LoaderProvider>(context, listen: false).loading(false);
//             // _loaderState = false;
//           });
//         }
//         }
//     }
//     on FirebaseAuthException catch (error)
//     {
//       if (mounted) {
//         setState(() {
//           Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//           // _loaderState = false;
//         });
//       }
//       return CommonShareWidget.buildErrorDialog(context, error.message);
//     }
//     // on Exception catch (error)
//     // {
//     //   if (mounted) {
//     //     setState(() {
//     //       // _loaderState = false;
//     //       Provider.of<LoaderProvider>(context, listen: false).loading(false);
//     //
//     //     });
//     //   }
//     //   return CommonShareWidget.buildErrorDialog(context, error.toString());
//     // }
//   }
//
//   bool validateForm() {
//     FocusScope.of(context).unfocus();
//     bool isValid = false;
//
//     if (_imageProfile == null)
//     {
//       CommonShareWidget.showFlushBar(
//           context: context,
//           duration: 2,
//           message: "Please add profile image");
//     }
//     // else if (_imageNid == null)
//     // {
//     //   CommonShareWidget.showFlushBar(
//     //       context: context,
//     //       duration: 2,
//     //       message: "Please add national id photo");
//     // }
//     else if (_controllerName.text.trim().isEmpty)
//     {
//       CommonShareWidget.showFlushBar(
//           context: context,
//           duration: 2,
//           message: "Please Enter Name");
//     }
//     else if (_controllerAddress.text.trim().isEmpty)
//     {
//       CommonShareWidget.showFlushBar(
//           context: context,
//           duration: 2,
//           message: "Please Enter Address");
//     }
//     else if (cityName == null)
//     {
//       CommonShareWidget.showFlushBar(
//           context: context,
//           duration: 2,
//           message: "Please Select City");
//     }
//     else if (isProfessional == true && professionalType!.isEmpty )
//     {
//       CommonShareWidget.showFlushBar(
//           context: context,
//           duration: 2,
//           message: "Please Select Profession");
//     }
//     else {
//       setState(() {
//         isValid = true;
//       });
//       }
//     return isValid;
//   }
//
//   Widget buildChoiceButton(ColorScheme colorScheme) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         ChoiceButton(
//           text: "User",
//           isSelected: !isProfessional,
//           onTap: () {
//             setState(() {
//               isProfessional = false;
//             });
//           },
//         ),
//         const SizedBox(width: 10),
//         ChoiceButton(
//           text: "Professional",
//           isSelected: isProfessional,
//           onTap: () {
//             setState(() {
//               isProfessional = true;
//             });
//           },
//         ),
//       ],
//     );
//   }
//
//   Future getImage(bool isprofile, context) async {
//     var img = await ImagePickerHelper().pickImage(source: ImageSource.gallery);
//     if (img != null) {
//       final image = File(img.path.toString());
//       var croppedImage = await ImagePickerHelper.cropImage(image);
//       if(croppedImage != null){
//         if (isprofile) {
//           setState(() {
//             _imageProfile = File(croppedImage.path);
//           });
//         }
//         else {
//           setState(() {
//             // _imageNid = File(croppedImage.path);
//           });
//         }
//       }
//     }
//   }
//
//   Future getImageCamera(bool isprofile, context) async {
//     var img =  await ImagePickerHelper().pickImage(source: ImageSource.camera);
//     if (img != null) {
//       final image = File(img.path.toString());
//       var croppedImage = await ImagePickerHelper.cropImage(image);
//
//       if(croppedImage != null){
//         if (isprofile) {
//           setState(() {
//             _imageProfile = File(croppedImage.path);
//           });
//         } else {
//           setState(() {
//             // _imageNid = File(croppedImage.path);
//           });
//         }
//       }
//
//     }
//   }
//
//   void bottomForm(var width, bool isprofile, context){
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
//                       onTap: () async {
//                         setState((){
//                           getImage(isprofile, context);
//                         });
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
//                         setState((){
//                           getImageCamera(isprofile, context);
//                         });
//                         // Navigator.pop(context);
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
//                                   Text(" Image from Camera",
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
//                   ],
//                 ),
//               ),
//             );
//           }
//           );
//         });
//   }
//
// }
