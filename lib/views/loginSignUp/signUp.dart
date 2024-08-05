// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:petfindernetwork/constant/colors.dart';
// import 'package:petfindernetwork/constant/values.dart';
// import 'package:petfindernetwork/model/user_profile.dart';
// import 'package:petfindernetwork/repository/loginsignupRepo.dart';
// import 'package:petfindernetwork/views/shareAbleWidget.dart/commonShareWidget.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher_string.dart';
// import '../../admin/preference.dart';
// import '../../bloc/loader_provider.dart';
// import '../../constant/choice_button.dart';
// import '../../helper/app_dropdown_button.dart';
// import '../../helper/image_picker_helper.dart';
// import '../../repository/cityListRepo.dart';
// import '../lostFound/city_search_deligate.dart';
// import 'login.dart';
// import 'login_with_email.dart';
//
// class SignUp extends StatefulWidget {
//   const SignUp({super.key});
//
//   @override
//   State<SignUp> createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> {
//   final TextEditingController _controllerName = TextEditingController();
//   final TextEditingController _controllerEmail = TextEditingController();
//   final TextEditingController _controllerPassword = TextEditingController();
//   final TextEditingController _controllerPhone = TextEditingController();
//   final TextEditingController _controllerAddress = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//    File? _imageProfile;
//    File? _imageNid;
//   bool _loaderState = false;
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
//  String? profileimageUrl;
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
//   Widget build(BuildContext context) {
//
//     final colorScheme = Theme.of(context).colorScheme;
//
//     return Scaffold(
//       body:
//         _loaderState ? CommonShareWidget.circularLoader()
// : SingleChildScrollView(
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
//                         height: 250,
//                         decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight,
//                                 colors: [
//                               Colors.blue.shade200,
//                               Colors.purple.shade200,
//                             ])),
//                         child: const Column(),
//                       ),
//                     ),
//                     ClipPath(
//                       clipper: WaveClipper3(),
//                       child: Container(
//                         width: double.infinity,
//                         height: 250,
//                         decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight,
//                                 colors: [
//                               Colors.blue.shade300,
//                               Colors.purple.shade300,
//                             ])),
//                         child: const Column(),
//                       ),
//                     ),
//                     ClipPath(
//                       clipper: WaveClipper1(),
//                       child: Container(
//                         width: double.infinity,
//                         height: 250,
//                         decoration: const BoxDecoration(
//                             gradient: LinearGradient(
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight,
//                                 colors: [
//                               Colors.blue,
//                               Colors.purple,
//                             ])),
//                         child: const Column(
//                           children: <Widget>[
//                             SizedBox(
//                               height: 40,
//                             ),
//                             Icon(
//                               Icons.perm_identity,
//                               color: Colors.white,
//                               size: 60,
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text(
//                               "Register",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 30),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 buildChoiceButton(colorScheme),
//                 isProfessional == true ? buildForm() : buildUserForm(),
//
//                 const SizedBox(height: 20),
//                 CommonShareWidget.signInUpbutton("SIGN UP", () {
//                   if (_formKey.currentState!.validate()) {
//                     if (_imageProfile == null) {
//                       CommonShareWidget.showFlushBar(
//                           context: context,
//                           duration: 2,
//                           message: "please add profile image");
//                     } else {
//                       if (_imageNid == null) {
//                         CommonShareWidget.showFlushBar(
//                             context: context,
//                             duration: 2,
//                             message: "please add national id photo");
//                       } else {
//                         if (mounted) {
//                           setState(() {
//                             _loaderState = true;
//                           });
//                         }
//                         handleSubmit();
//                       }
//                     }
//                   }
//                 }, context),
//
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.center,
//                 //   children: [
//                 //     CommonShareWidget.signInUpbutton("Email verify", () {
//                 //       if (_formKey.currentState!.validate()) {
//                 //         if (_imageProfile == null) {
//                 //           CommonShareWidget.showFlushBar(
//                 //               context: context,
//                 //               duration: 2,
//                 //               message: "please add profile image");
//                 //         } else {
//                 //           if (_imageNid == null) {
//                 //             CommonShareWidget.showFlushBar(
//                 //                 context: context,
//                 //                 duration: 2,
//                 //                 message: "please add national id photo");
//                 //           } else {
//                 //             if (mounted) {
//                 //               setState(() {
//                 //                 _loaderState = true;
//                 //               });
//                 //             }
//                 //             handleSubmit();
//                 //           }
//                 //         }
//                 //       }
//                 //     }, context),
//                 //     SizedBox( width: 03),
//                 //     CommonShareWidget.signInUpbutton("Phone verify", () {
//                 //       if (_formKey.currentState!.validate()) {
//                 //         if (_imageProfile == null) {
//                 //           CommonShareWidget.showFlushBar(
//                 //               context: context,
//                 //               duration: 2,
//                 //               message: "please add profile image");
//                 //         } else {
//                 //           if (_imageNid == null) {
//                 //             CommonShareWidget.showFlushBar(
//                 //                 context: context,
//                 //                 duration: 2,
//                 //                 message: "please add national id photo");
//                 //           } else {
//                 //             if (mounted) {
//                 //               setState(() {
//                 //                 _loaderState = true;
//                 //               });
//                 //             }
//                 //             handleSubmit();
//                 //           }
//                 //         }
//                 //       }
//                 //     }, context),
//                 //     SizedBox( width: 03),
//                 //     CommonShareWidget.signInUpbutton("SIGN UP", () {
//                 //       if (_formKey.currentState!.validate()) {
//                 //         if (_imageProfile == null) {
//                 //           CommonShareWidget.showFlushBar(
//                 //               context: context,
//                 //               duration: 2,
//                 //               message: "please add profile image");
//                 //         } else {
//                 //           if (_imageNid == null) {
//                 //             CommonShareWidget.showFlushBar(
//                 //                 context: context,
//                 //                 duration: 2,
//                 //                 message: "please add national id photo");
//                 //           } else {
//                 //             if (mounted) {
//                 //               setState(() {
//                 //                 _loaderState = true;
//                 //               });
//                 //             }
//                 //             handleSubmit();
//                 //           }
//                 //         }
//                 //       }
//                 //     }, context),
//                 //
//                 //   ],
//                 // ),
//
//
//                 const SizedBox(height: 10.0),
//                 CommonShareWidget.flatTextButtonLogInUp(
//                     "Already have an account?", "Sign in", () {
//                   FocusScope.of(context).requestFocus(FocusNode());
//                   Provider.of<LoaderProvider>(context, listen: false).loading(false);
//                   CommonShareWidget.goToAnotherPage(
//                     nextPage: const LoginPage(),
//                     context: context,
//                   );
//                 }),
//                 const SizedBox(height: 50.0),
//                 Wrap(
//                   alignment: WrapAlignment.center,
//                   children: [
//                     const Text("By "),
//                     const Text("continue "),
//                     const Text("I "),
//                     const Text("agree "),
//                     const Text("to "),
//                     InkWell(
//                       onTap: () {
//                         launchUrlString(
//                           privacyPolicyUrl,
//                           mode: LaunchMode.externalApplication,
//                         );
//                       },
//                       child: const Text(
//                         "privacy policy ",
//                         style: TextStyle(
//                           color: Colors.blue,
//                         ),
//                       ),
//                     ),
//                     const Text("and "),
//                     InkWell(
//                       onTap: () {
//                         launchUrlString(
//                           termsAndConditionsUrl,
//                           mode: LaunchMode.externalApplication,
//                         );
//                       },
//                       child: const Text(
//                         "terms & conditions",
//                         style: TextStyle(
//                           color: Colors.blue,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10.0),
//               ],
//             ),
//           ),
//         ),
//       // ),
//     );
//   }
//
//   handleSubmit() async {
//
//     try {
//       await Provider.of<LoginSignupRepo>(context, listen: false)
//           .createUser(
//               email: _controllerEmail.text, password: _controllerPassword.text)
//           .then((user) async {
//         if (user?.uid != null)
//         {
//            // Navigator.push(context, MaterialPageRoute(builder: (_)=>
//            //  EmailVerificationScreen(name: '', email: '',
//            //
//            //
//            //  )));
//
//            profileimageUrl = LoginSignupRepo()
//               .uploadImage(_imageProfile!, user!.uid) as String?;
//
//              nidImageUrl = LoginSignupRepo()
//                 .uploadImage(_imageNid!, user.uid) as String?;
//
//               UserProfileModel userProfileModel = UserProfileModel(
//                                 uid: user.uid,
//                                 name: _controllerName.text,
//                                 email: _controllerEmail.text,
//                                 phone: _controllerPhone.text,
//                                 address: _controllerAddress.text,
//                                 profilephotoImageUrl: profileimageUrl,
//                                 nidImageUrl: nidImageUrl,
//                                 isProfessional: isProfessional,
//                                location: cityName ?? "",
//                                 professionalType: professionalType ?? '',
//                                 // idImageUrl: idImageUrl ?? '',
//                                 // professionalImageUrl: professionalImageUrl ?? '',
//                                 isIdVerified: isIdVerified ?? false,
//                                  isDocVerified: isDocVerified  ?? false,
//                                 isIdPending: isDocVerified ?? false,
//                                 isIdRejected: isDocVerified ?? false,
//                                 isDocRejected: isDocRejected ?? false,
//                                 isDocPending: isDocPending ?? false,
//               );
//             await Preferences.saveUserData(userProfileModel.toJson());
//
//
//
//            // UserInfoModel userInfoModel = UserInfoModel(
//            //   uid: user.uid,
//            //   name: nameController.text.trim(),
//            //   email: emailController.text.trim(),
//            //   photoUrl: ApiConstant.photoUrl,
//            //   phone: countryCode.dialCode! + phoneNumberController.text.trim(),
//            //   fcmToken: fcmToken ?? "",
//            //   joinAt: joinAt,
//            //   isAstrologer: isAstrologer,
//            //   appLanguage: "en",
//            //   bannerUrl: ApiConstant.bannerUrl,
//            //   about: "",
//            //   astrologerType: astrologerType ?? "",
//            //   astrologerSubType: astrologerSubTypeController.text.trim(),
//            // );
//            //
//            // await FirebaseFirestore.instance
//            //     .collection("users")
//            //     .doc(user.uid)
//            //     .set(userInfoModel.toJson())
//            //     .then((value) async {
//            //   await Preferences.saveUserData(userInfoModel.toJson());
//            // });
//           // LoginSignupRepo()
//           //     .uploadImage(_imageProfile!, user!.uid)
//           //     .then((profileimageUrl) {
//           //   LoginSignupRepo()
//           //       .uploadImage(_imageNid!, user.uid)
//           //       .then((nidImageUrl) {
//           //     UserRepo()
//           //         .setUserProfileData
//           //       (
//           //             user.uid,
//           //             UserProfileModel(
//           //                 uid: user.uid,
//           //                 name: _controllerName.text,
//           //                 email: _controllerEmail.text,
//           //                 phone: _controllerPhone.text,
//           //                 address: _controllerAddress.text,
//           //                 profilephotoImageUrl: profileimageUrl,
//           //                 nidImageUrl: nidImageUrl,
//           //                 isProfessional: isProfessional,
//           //                location: cityName ?? "",
//           //                 professionalType: professionalType ?? '',
//           //                 // idImageUrl: idImageUrl ?? '',
//           //                 // professionalImageUrl: professionalImageUrl ?? '',
//           //                 isIdVerified: isIdVerified ?? false,
//           //                  isDocVerified: isDocVerified  ?? false,
//           //                 isIdPending: isDocVerified ?? false,
//           //                 isIdRejected: isDocVerified ?? false,
//           //                 isDocRejected: isDocRejected ?? false,
//           //                 isDocPending: isDocPending ?? false,
//           //             ))
//           //         .then((value) {
//           //       if (mounted)
//           //       {
//           //         setState(() {
//           //           _loaderState = false;
//           //           CommonShareWidget.showFlushBar (
//           //               context: context, duration: 5, message: "Form submitted");
//           //         });
//           //       }
//           //       Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage(),));
//           //     });
//           //     // Navigator.of(context).pushNamedAndRemoveUntil(
//           //     //     '/', (Route<dynamic> route) => false);
//           //   });
//           // }
//           // );
//                   }
//         else {
//           CommonShareWidget.showFlushBar(
//               // context: context, duration: 3, message: "Something wrong"
//               context: context, duration: 3, message: "User null"
//
//           );
//           if (mounted) {
//             setState(() {
//               _loaderState = false;
//             });
//           }
//         }
//       }
//       );
//     } on FirebaseAuthException catch (error) {
//       if (mounted) {
//         setState(() {
//           _loaderState = false;
//         });
//       }
//       return CommonShareWidget.buildErrorDialog(context, error.message);
//     } on Exception catch (error) {
//       if (mounted) {
//         setState(() {
//           _loaderState = false;
//         });
//       }
//       return CommonShareWidget.buildErrorDialog(context, error.toString());
//     }
//   }
//
//   Widget buildForm(){
//     return Column(
//       children: [
//         const SizedBox(height: 20,),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 32),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Text(
//                 "Professional type",
//                 style: TextStyle(
//                   fontSize: 16,
//                   // fontWeight: FontWeight.w700,
//                 ),
//               ),
//               AppDropDownButton(
//                 dropdownItems: listProfessionType,
//                 onChange: (value) async {
//                   if (value != null) {
//                     setState(() {
//                       professionalType = value;
//                     });
//                   }
//                 },
//                 value: professionalType,
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 32),
//           child: Material(
//             elevation: 2.0,
//             borderRadius: const BorderRadius.all(Radius.circular(30)),
//             child: TextField(
//               onChanged: (String value) {},
//               cursorColor: Colors.deepOrange,
//               controller: _controllerName,
//               keyboardType: TextInputType.text,
//               decoration: const InputDecoration(
//                   hintText: "Name",
//                   prefixIcon: Material(
//                     elevation: 0,
//                     borderRadius: BorderRadius.all(Radius.circular(30)),
//                     child: Icon(
//                       Icons.person,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.symmetric(
//                       horizontal: 25, vertical: 13)),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 32),
//           child:
//           Material(
//             elevation: 2.0,
//             borderRadius: const BorderRadius.all(Radius.circular(30)),
//             child: TextField(
//               onChanged: (String value) {},
//               cursorColor: Colors.deepOrange,
//               controller: _controllerEmail,
//               keyboardType: TextInputType.emailAddress,
//               decoration: const InputDecoration(
//                   hintText: "Email",
//                   prefixIcon: Material(
//                     elevation: 0,
//                     borderRadius: BorderRadius.all(Radius.circular(30)),
//                     child: Icon(
//                       Icons.email,
//                       color: Colors.orange,
//                     ),
//                   ),
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.symmetric(
//                       horizontal: 25, vertical: 13)),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 32),
//           child: Material(
//             elevation: 2.0,
//             borderRadius: const BorderRadius.all(Radius.circular(30)),
//             child: TextField(
//               onChanged: (String value) {},
//               cursorColor: Colors.deepOrange,
//               controller: _controllerPassword,
//               keyboardType: TextInputType.visiblePassword,
//               decoration: const InputDecoration(
//                   hintText: "Password",
//                   prefixIcon: Material(
//                     elevation: 0,
//                     borderRadius: BorderRadius.all(Radius.circular(30)),
//                     child: Icon(
//                       Icons.lock,
//                       color: Colors.green,
//                     ),
//                   ),
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.symmetric(
//                       horizontal: 25, vertical: 13)),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 10.0,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 32),
//           child: Material(
//             elevation: 2.0,
//             borderRadius: const BorderRadius.all(Radius.circular(30)),
//             child: TextField(
//               onChanged: (String value) {},
//               cursorColor: Colors.deepOrange,
//               controller: _controllerAddress,
//               keyboardType: TextInputType.text,
//               decoration: const InputDecoration(
//                   hintText: "Address",
//                   prefixIcon: Material(
//                     elevation: 0,
//                     borderRadius: BorderRadius.all(Radius.circular(30)),
//                     child: Icon(
//                       Icons.home,
//                       color: Colors.black,
//                     ),
//                   ),
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.symmetric(
//                       horizontal: 25, vertical: 13)),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 32),
//           child: Material(
//             elevation: 2.0,
//             borderRadius: const BorderRadius.all(Radius.circular(30)),
//             child: TextField(
//               onChanged: (String value) {},
//               cursorColor: Colors.deepOrange,
//               controller: _controllerPhone,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                   hintText: "Phone",
//                   prefixIcon: Material(
//                     elevation: 0,
//                     borderRadius: BorderRadius.all(Radius.circular(30)),
//                     child: Icon(
//                       Icons.phone,
//                       color: Colors.blue,
//                     ),
//                   ),
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.symmetric(
//                       horizontal: 25, vertical: 13)),
//             ),
//           ),
//         ),
//         const SizedBox(height: 20.0,),
//
//         Padding (
//           padding: const EdgeInsets.symmetric(horizontal: 32),
//           child: GestureDetector(
//             onTap: () async {
//               setState(() {
//                 _loaderState = true;
//               });
//               final cityList =
//               await CityListRepo().fetchCityListFromCSV();
//               setState(() {
//                 _loaderState = false;
//               });
//               final result = await showSearch<String?>(
//                 context: context,
//                 delegate: CitySearchDeligate(cityList),
//               );
//               setState(()
//               {
//                 cityName = result;
//               }
//               );
//             },
//             child: TextField(
//               enabled: false,
//               cursorColor: Colors.deepOrange,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 hintText: cityName ?? "Select city",
//                 hintStyle: cityName != null
//                     ? const TextStyle(color: Colors.black87)
//                     : const TextStyle(color: Colors.black54),
//                 prefixIcon: const Icon(
//                   Icons.location_city,
//                   color: Colors.indigoAccent,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 20.0,
//         ),
//         Container(
//           margin: const EdgeInsets.only(left: 32.0),
//           child: Row(
//             children: <Widget>[
//               Container(
//                   height: 60.0,
//                   width: 60.0,
//                   decoration: BoxDecoration(
//                       shape: BoxShape.rectangle,
//                       border: Border.all(color: AppColor.blackColor),
//                       borderRadius: BorderRadius.circular(15.0)),
//                   child: InkWell(
//                     child: _imageProfile == null
//                         ? const Icon(Icons.add_a_photo)
//                         : ClipRRect(
//                       borderRadius: BorderRadius.circular(15.0),
//                       child: Image.file(
//                         _imageProfile!,
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                     onTap: () => bottomForm(MediaQuery.of(context).size.width, true)
//                         // getImage(true),
//                   )),
//               const SizedBox(
//                 width: 15.0,
//               ),
//               const Text('Add profile photo')
//             ],
//           ),
//         ),
//         const SizedBox(
//           height: 20.0,
//         ),
//         Container(
//           margin: const EdgeInsets.only(left: 32.0),
//           child: Row(
//             children: <Widget>[
//               Container(
//                   height: 60.0,
//                   width: 60.0,
//                   decoration: BoxDecoration(
//                       shape: BoxShape.rectangle,
//                       border: Border.all(color: AppColor.blackColor),
//                       borderRadius: BorderRadius.circular(15.0)),
//                   child: InkWell(
//                     child: _imageNid == null
//                         ? const Icon(Icons.add_a_photo)
//                         : ClipRRect(
//                       borderRadius: BorderRadius.circular(15.0),
//                       child: Image.file(
//                         _imageNid!,
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                     onTap: () => bottomForm(MediaQuery.of(context).size.width, false)
//                         // getImage(false),
//                   )),
//               const SizedBox(
//                 width: 15.0,
//               ),
//               const Text('Add National Id photo')
//             ],
//           ),
//         ),
//
//       ],
//     );
//   }
//
//
//   Widget buildUserForm(){
//     return Column(
//       children: [
//         const SizedBox(height: 20,),
//         Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 32),
//             child: Material(
//               elevation: 2.0,
//               borderRadius: const BorderRadius.all(Radius.circular(30)),
//               child: TextField(
//                 onChanged: (String value) {},
//                 cursorColor: Colors.deepOrange,
//                 controller: _controllerName,
//                 keyboardType: TextInputType.text,
//                 decoration: const InputDecoration(
//                     hintText: "Name",
//                     prefixIcon: Material(
//                       elevation: 0,
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                       child: Icon(
//                         Icons.person,
//                         color: Colors.blueAccent,
//                       ),
//                     ),
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(
//                         horizontal: 25, vertical: 13)),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//         Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 32),
//             child:
//             Material(
//               elevation: 2.0,
//               borderRadius: const BorderRadius.all(Radius.circular(30)),
//               child: TextField(
//                 onChanged: (String value) {},
//                 cursorColor: Colors.deepOrange,
//                 controller: _controllerEmail,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: const InputDecoration(
//                     hintText: "Email",
//                     prefixIcon: Material(
//                       elevation: 0,
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                       child: Icon(
//                         Icons.email,
//                         color: Colors.orange,
//                       ),
//                     ),
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(
//                         horizontal: 25, vertical: 13)),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 32),
//             child: Material(
//               elevation: 2.0,
//               borderRadius: const BorderRadius.all(Radius.circular(30)),
//               child: TextField(
//                 onChanged: (String value) {},
//                 cursorColor: Colors.deepOrange,
//                 controller: _controllerPassword,
//                 keyboardType: TextInputType.visiblePassword,
//                 decoration: const InputDecoration(
//                     hintText: "Password",
//                     prefixIcon: Material(
//                       elevation: 0,
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                       child: Icon(
//                         Icons.lock,
//                         color: Colors.green,
//                       ),
//                     ),
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(
//                         horizontal: 25, vertical: 13)),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 10.0,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 32),
//             child: Material(
//               elevation: 2.0,
//               borderRadius: const BorderRadius.all(Radius.circular(30)),
//               child: TextField(
//                 onChanged: (String value) {},
//                 cursorColor: Colors.deepOrange,
//                 controller: _controllerAddress,
//                 keyboardType: TextInputType.text,
//                 decoration: const InputDecoration(
//                     hintText: "Address",
//                     prefixIcon: Material(
//                       elevation: 0,
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                       child: Icon(
//                         Icons.home,
//                         color: Colors.black,
//                       ),
//                     ),
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(
//                         horizontal: 25, vertical: 13)),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 32),
//             child: Material(
//               elevation: 2.0,
//               borderRadius: const BorderRadius.all(Radius.circular(30)),
//               child: TextField(
//                 onChanged: (String value) {},
//                 cursorColor: Colors.deepOrange,
//                 controller: _controllerPhone,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                     hintText: "Phone",
//                     prefixIcon: Material(
//                       elevation: 0,
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                       child: Icon(
//                         Icons.phone,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(
//                         horizontal: 25, vertical: 13)),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20.0,
//           ),
//           Container(
//             margin: const EdgeInsets.only(left: 32.0),
//             child: Row(
//               children: <Widget>[
//                 Container(
//                     height: 60.0,
//                     width: 60.0,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.rectangle,
//                         border: Border.all(color: AppColor.blackColor),
//                         borderRadius: BorderRadius.circular(15.0)),
//                     child: InkWell(
//                       child: _imageProfile == null
//                           ? const Icon(Icons.add_a_photo)
//                           : ClipRRect(
//                         borderRadius: BorderRadius.circular(15.0),
//                         child: Image.file(
//                           _imageProfile!,
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                       onTap: () => bottomForm(MediaQuery.of(context).size.width, true)
//                           // getImage(true),
//                     )),
//                 const SizedBox(
//                   width: 15.0,
//                 ),
//                 const Text('Add profile photo')
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 20.0,
//           ),
//           Container(
//             margin: const EdgeInsets.only(left: 32.0),
//             child: Row(
//               children: <Widget>[
//                 Container(
//                     height: 60.0,
//                     width: 60.0,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.rectangle,
//                         border: Border.all(color: AppColor.blackColor),
//                         borderRadius: BorderRadius.circular(15.0)),
//                     child: InkWell(
//                       child: _imageNid == null
//                           ? const Icon(Icons.add_a_photo)
//                           : ClipRRect(
//                         borderRadius: BorderRadius.circular(15.0),
//                         child: Image.file(
//                           _imageNid!,
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                       onTap: () => bottomForm(MediaQuery.of(context).size.width, false)
//                           // getImage(false),
//                     )),
//                 const SizedBox(
//                   width: 15.0,
//                 ),
//                 const Text('Add National Id photo')
//               ],
//             ),
//           ),
//
//       ],
//     );
//   }
//
//   Widget buildChoiceButton(ColorScheme colorScheme) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         ChoiceButton(
//           text: "User",
//           isSelected: isProfessional == false,
//           onTap: () {
//             setState(() {
//               isProfessional = false;
//             });
//           },
//         ),
//         const SizedBox(width: 10),
//         ChoiceButton(
//           text: "Professional",
//           isSelected: isProfessional == true,
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
//
//   Future getImage(bool isprofile) async {
//     var image =
//         await ImagePickerHelper().pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       if (isprofile) {
//         setState(() {
//           _imageProfile = File(image.path);
//         });
//       } else {
//         setState(() {
//           _imageNid = File(image.path);
//         });
//       }
//     }
//   }
//
//   Future getImageCamera(bool isprofile) async {
//     var image =
//     await ImagePickerHelper().pickImage(source: ImageSource.camera);
//     if (image != null) {
//       if (isprofile) {
//         setState(() {
//           _imageProfile = File(image.path);
//         });
//       } else {
//         setState(() {
//           _imageNid = File(image.path);
//         });
//       }
//     }
//   }
//
//   void bottomForm(var width, bool isprofile){
//     showModalBottomSheet(context: context,
//         // barrierColor: Colors.transparent,
//         backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//         builder: (BuildContext context){
//           ImagePickerHelper  imageProvider = Provider.of<ImagePickerHelper>(context);
//           _imageProfile = imageProvider.imageProfile;
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
//                         getImage(isprofile);
//                         // ImagePickerHelper().getImage(true, context);
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
//                         getImageCamera(isprofile);
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
//
// }
