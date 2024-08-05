// // ignore_for_file: prefer_typing_uninitialized_variables
//
// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:petfindernetwork/constant/colors.dart';
// import 'package:petfindernetwork/model/user_profile.dart';
// import 'package:petfindernetwork/repository/loginsignupRepo.dart';
// import 'package:petfindernetwork/repository/userRepo.dart';
// import 'package:petfindernetwork/validator/inputValidator.dart';
// import 'package:petfindernetwork/views/shareAbleWidget.dart/commonShareWidget.dart';
// import 'package:petfindernetwork/views/user/userPostedItem.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher_string.dart';
// import 'package:velocity_x/velocity_x.dart';
// import '../../constant/values.dart';
// import '../../helper/image_picker_helper.dart';
// import '../loginSignUp/login.dart';
// import '../serviceProvider/identity_verify.dart';
// import '../serviceProvider/profession_verification.dart';
// import 'delete_reason_page.dart';
//
// class UserProfile extends StatefulWidget {
//   const UserProfile({super.key});
//
//   @override
//   State<UserProfile> createState() => _UserProfileState();
// }
//
// class _UserProfileState extends State<UserProfile>
// {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _controllerName = TextEditingController();
//   final TextEditingController _controllerAddress = TextEditingController();
//   final TextEditingController _controllerPhone = TextEditingController();
//   CountryCode countryCode = CountryCode.fromDialCode("+1");
//   var _oldImageProfile;
//   var _oldImageNid;
//   bool _loaderState = false;
//   final UserRepo _userRepo = UserRepo();
//
//   @override
//   void dispose() {
//     _controllerName.dispose();
//     _controllerAddress.dispose();
//     _controllerPhone.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//    final size = MediaQuery.of(context).size;
//    var width = size.width;
//
//     return Consumer<User?>(
//       builder: (_, user, child) {
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text("Profile"),
//           ),
//           body: user != null
//               ?
//           _loaderState ? CommonShareWidget.circularLoader()
// :  StreamBuilder<DocumentSnapshot>(
//                     stream: _userRepo.getUserProfileStream(user.uid),
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData)
//                       {
//                         UserProfileModel profile =
//                             UserProfileModel.fromDocumentSnap(snapshot.data
//                                 as DocumentSnapshot<Map<String, dynamic>>);
//                           if (kDebugMode) {
//                             print("user identity check ${profile.isIdPending}");
//                           }
//                             if(profile.profilephotoImageUrl != null){
//                               return Padding(
//                                 padding: const EdgeInsets.all(20.0),
//                                 child: SingleChildScrollView(
//                                   child: Column
//                                     (
//                                     children: <Widget>
//                                     [
//                                       SizedBox(
//                                         height: 200,
//                                         width: double.infinity,
//                                         child: Stack(
//                                           // alignment: Alignment.bottomLeft,
//                                           children: <Widget>[
//                                             Stack(
//                                               alignment: Alignment.topRight,
//                                               children: <Widget>[
//                                                 SizedBox(
//                                                   height: 160.0,
//                                                   width: double.infinity,
//                                                   child:
//                                                   CommonShareWidget.imageNetwork(
//                                                       elevationCard: 10.0,
//                                                       height: double.infinity,
//                                                       width: double.infinity,
//                                                       imageurl: profile.profilephotoImageUrl ),
//                                                 ),
//                                                 Positioned(
//                                                   top: 10,
//                                                   right: 15,
//                                                   child: Container(
//                                                     color: AppColor.blackColor
//                                                         .withOpacity(0.4),
//                                                     child: IconButton(
//                                                         icon: Icon(Icons.edit,
//                                                             color: AppColor.whiteColor),
//                                                         onPressed: () {
//                                                           getImage(
//                                                               true,
//                                                               profile.profilephotoImageUrl,
//                                                               user.uid);
//                                                         }),
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                             // Center(
//                                             //   child: Container(
//                                             //     margin:
//                                             //     const EdgeInsets.only(top: 120.0),
//                                             //     height: 80.0,
//                                             //     width: 80.0,
//                                             //     child: Stack(
//                                             //       alignment: Alignment.topRight,
//                                             //       children: <Widget>[
//                                             //         CommonShareWidget.imageNetwork(
//                                             //           // borderadius: 80.0,
//                                             //             elevationCard: 10.0,
//                                             //             height: double.infinity,
//                                             //             width: double.infinity,
//                                             //             imageurl: profile
//                                             //                 .profilephotoImageUrl),
//                                             //         Container(
//                                             //           margin: const EdgeInsets.only(
//                                             //               top: 4.0),
//                                             //           color: AppColor.blackColor
//                                             //               .withOpacity(0.5),
//                                             //           child: InkWell(
//                                             //             child: Icon(
//                                             //               Icons.edit,
//                                             //               size: 20.0,
//                                             //               color: AppColor.whiteColor,
//                                             //             ),
//                                             //             onTap: () {
//                                             //               getImage(
//                                             //                   true,
//                                             //                   profile
//                                             //                       .profilephotoImageUrl,
//                                             //                   user.uid);
//                                             //             },
//                                             //           ),
//                                             //         )
//                                             //       ],
//                                             //     ),
//                                             //   ),
//                                             // ),
//                                           ],
//                                         ),
//                                       ),
//
//                                       const SizedBox(height: 15.0),
//                                       buildInfoWidget(Icons.account_circle,
//                                           profile.name.toString(), () {
//                                             buildUpdateDialog(
//                                               context: context,
//                                               controller: _controllerName,
//                                               hint: profile.name,
//                                               pos: 1,
//                                               title: "Enter User Name",
//                                               uid: user.uid,
//                                             );
//                                           }),
//                                       buildInfoWidget(
//                                           Icons.my_location, profile.address, () {
//                                         buildUpdateDialog(
//                                           context: context,
//                                           controller: _controllerAddress,
//                                           hint: profile.address,
//                                           pos: 3,
//                                           title: "Enter Address",
//                                           uid: user.uid,
//                                         );
//                                       }),
//                                       profile.email.isNotEmptyAndNotNull ? buildInfoWidget(
//                                           Icons.mail_outline, profile.email, null) : const SizedBox(height: 0,),
//                                       profile.phone.isNotEmptyAndNotNull ? buildInfoWidget(
//                                           Icons.phone, profile.phone, null) : const SizedBox(height: 0,),
//                                       const SizedBox(height: 10),
//                                       if(profile.isAdmin != true)...[
//                                         if(profile.isProfessional == true)...[
//                                           Column(
//                                             children: [
//                                               Card(
//                                                 color: AppColor.orange,
//                                                 child: Container(
//                                                   alignment: Alignment.topLeft,
//                                                   padding: const EdgeInsets.all(15),
//                                                   child: Column(
//                                                     children: <Widget>[
//                                                       const SizedBox(height: 10,),
//
//                                                       ...ListTile.divideTiles(
//                                                         color: Colors.grey,
//                                                         tiles: [
//
//                                                           if(profile.isIdVerified == null
//                                                               || (profile.isIdVerified == false
//                                                                   && profile.isIdPending == false))...[
//                                                             // if(UserProvider.userInfoModel?.isIdVerified == null
//                                                             //     || (UserProvider.userInfoModel?.isIdVerified == false
//                                                             //         && UserProvider.userInfoModel?.isIdPending == false))...[
//                                                             ListTile(
//                                                               contentPadding: const EdgeInsets.symmetric(
//                                                                   horizontal: 12, vertical: 4),
//                                                               leading: const Icon(Icons.circle_outlined, color: Colors.red,),
//                                                               title:  Text("Verify Your Identity",
//                                                                 maxLines: 1,
//                                                                 overflow: TextOverflow.ellipsis,
//                                                                 softWrap: true,
//                                                                 style: TextStyle(
//                                                                   color: AppColor.whiteColor,
//                                                                   fontSize: 18,
//                                                                   fontWeight: FontWeight.bold,
//                                                                 ),
//
//                                                               ),
//                                                               trailing: const Icon(Icons.arrow_forward_ios_sharp,
//                                                               ),
//                                                               onTap: (){
//                                                                 Navigator.push(context, MaterialPageRoute(builder: (_) => const IdendtityVerify()));
//                                                               },
//                                                             ),
//
//                                                           ]
//                                                           else if(profile.isIdPending == true
//                                                               && profile.isIdVerified == false) ...[
//                                                             ListTile(
//                                                               contentPadding: const EdgeInsets.symmetric(
//                                                                   horizontal: 12, vertical: 4),
//                                                               leading: const Icon(Icons.pending_outlined,
//                                                                 color: Colors.red,),
//                                                               title:  Text("ID Verification is pending",
//                                                                 maxLines: 1,
//                                                                 overflow: TextOverflow.ellipsis,
//                                                                 softWrap: true,
//                                                                 style: TextStyle(
//                                                                   color: AppColor.whiteColor,
//                                                                   fontSize: 18,
//                                                                   fontWeight: FontWeight.bold,
//                                                                 ),
//
//                                                               ),
//                                                               onTap: (){
//                                                                 CommonShareWidget.showFlushBar(
//                                                                     context: context,
//                                                                     duration: 2,
//                                                                     message: "Please wait, Verification is pending");
//                                                               },
//                                                             ),
//                                                           ]
//                                                           else ...[
//                                                                ListTile(
//                                                                 contentPadding: const EdgeInsets.symmetric(
//                                                                     horizontal: 12, vertical: 4),
//                                                                 leading: const Icon(Icons.check_circle_outline_outlined,
//                                                                   color: Colors.green,
//                                                                 ),
//                                                                 title: Text("ID Verified",
//                                                                   style: TextStyle(
//                                                                     color: AppColor.whiteColor,
//                                                                     fontSize: 18,
//                                                                     fontWeight: FontWeight.bold,
//                                                                   ),
//
//                                                                 ),
//                                                               ),                      ] ,
//
//                                                           // const SizedBox(height: 05,),
//                                                           // Container(
//                                                           //   height: 01,
//                                                           //   width: double.infinity,
//                                                           //   color: Colors.black ,
//                                                           // ),
//                                                           // if(profile.isDocVerified == null
//                                                           // || (profile.isDocVerified == false
//                                                           // && profile.isDocPending == false))...[
//                                                           //                         // if(UserProvider.userInfoModel?.isDocVerified == null
//                                                           //                         //     || (UserProvider.userInfoModel?.isDocVerified == false
//                                                           //                         //         && UserProvider.userInfoModel?.isDocPending == false))...[
//                                                           //                         //
//                                                           //                           ListTile(
//                                                           //                             contentPadding: const EdgeInsets.symmetric(
//                                                           //                             horizontal: 12, vertical: 4),
//                                                           //                             leading:  Icon(Icons.circle_outlined, color: Colors.red,),
//                                                           //                             title: const Text("Verify Professional Certificate"),
//                                                           //                             trailing: const Icon(Icons.arrow_forward_ios_sharp),
//                                                           //                             onTap: (){
//                                                           //                               Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfessionVerification()));
//                                                           //                             },
//                                                           //                           ),
//                                                           //                         ]
//                                                           //                           else if(profile.isDocPending == true
//                                                           //                           && profile.isDocVerified == false) ...[
//                                                           //                             //   else if(UserProvider.userInfoModel?.isDocPending == true
//                                                           //                             // && UserProvider.userInfoModel?.isDocVerified == false) ...[
//                                                           //                           ListTile(
//                                                           //                             contentPadding: const EdgeInsets.symmetric(
//                                                           //                                 horizontal: 12, vertical: 4),
//                                                           //                             leading: const Icon(Icons.pending_outlined, color: Colors.red,),
//                                                           //                             title: const Text("Certificate Verification is pending"),
//                                                           //                             onTap: (){
//                                                           //                               CommonShareWidget.showFlushBar(
//                                                           //                                   context: context,
//                                                           //                                   duration: 2,
//                                                           //                                   message: "Please wait, Verification is pending");
//                                                           //                             },
//                                                           //                           ),
//                                                           //                         ]
//                                                           //                         else ...[
//                                                           //                             const ListTile(
//                                                           //                               contentPadding: EdgeInsets.symmetric(
//                                                           //                                   horizontal: 12, vertical: 4),
//                                                           //                               leading: Icon(Icons.check_circle_outline_outlined, color: Colors.greenAccent,),
//                                                           //                               title: Text("Professional Certificate Verified"),
//                                                           //                             ),                      ] ,
//                                                         ],
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                               Card(
//                                                 color: AppColor.orange,
//                                                 child: Container(
//                                                   alignment: Alignment.topLeft,
//                                                   padding: const EdgeInsets.all(15),
//                                                   child: Column(
//                                                     children: <Widget>[
//                                                       const SizedBox(height: 10,),
//
//                                                       ...ListTile.divideTiles(
//                                                         color: Colors.grey,
//                                                         tiles: [
//
//                                                           if(profile.isDocVerified == null
//                                                               || (profile.isDocVerified == false
//                                                                   && profile.isDocPending == false))...[
//                                                             ListTile(
//                                                               contentPadding:  const EdgeInsets.symmetric(
//                                                                   horizontal: 12, vertical: 4),
//                                                               leading:  const Icon(
//                                                                 Icons.circle_outlined,
//                                                                 color: Colors.red,
//                                                                 weight: 100,
//                                                               ),
//                                                               title:  Text("Verify Professional ID",
//                                                                 maxLines: 1,
//                                                                 overflow: TextOverflow.ellipsis,
//                                                                 softWrap: true,
//                                                                 style: TextStyle(
//                                                                   color: AppColor.whiteColor,
//                                                                   fontSize: 18,
//                                                                   fontWeight: FontWeight.bold,
//                                                                 ),
//
//
//                                                               ),
//                                                               trailing: const Icon(Icons.arrow_forward_ios_sharp),
//                                                               onTap: (){
//                                                                 Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfessionVerification()));
//                                                               },
//                                                             ),
//                                                           ]
//                                                           else if(profile.isDocPending == true
//                                                               && profile.isDocVerified == false) ...[
//
//                                                             ListTile(
//                                                               contentPadding: const EdgeInsets.symmetric(
//                                                                   horizontal: 12, vertical: 4),
//                                                               leading: const Icon(Icons.pending_outlined, color: Colors.red,),
//                                                               title:  Text("Certificate Verification is pending",
//                                                                 maxLines: 1,
//                                                                 overflow: TextOverflow.ellipsis,
//                                                                 softWrap: true,
//                                                                 style: TextStyle(
//                                                                   color: AppColor.whiteColor,
//                                                                   fontSize: 18,
//                                                                   fontWeight: FontWeight.bold,
//                                                                 ),
//
//                                                               ),
//                                                               onTap: (){
//                                                                 CommonShareWidget.showFlushBar(
//                                                                     context: context,
//                                                                     duration: 2,
//                                                                     message: "Please wait, Verification is pending");
//                                                               },
//                                                             ),
//                                                           ]
//                                                           else ...[
//                                                                ListTile(
//                                                                 contentPadding: const EdgeInsets.symmetric(
//                                                                     horizontal: 12, vertical: 4),
//                                                                 leading: const Icon(Icons.check_circle_outline_outlined,
//                                                                   color: Colors.green,),
//                                                                 title: Text("Professional ID Verified",
//                                                                   maxLines: 1,
//                                                                   overflow: TextOverflow.ellipsis,
//                                                                   softWrap: true,
//                                                                   style: TextStyle(
//                                                                     color: AppColor.whiteColor,
//                                                                     fontSize: 18,
//                                                                     fontWeight: FontWeight.bold,
//                                                                   ),
//
//                                                                 ),
//
//                                                               ),                      ] ,
//                                                         ],
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               )
//
//                                             ],
//                                           )
//                                         ]
//                                         else...
//                                         [
//                                           // Card(
//                                           //   elevation: 1.0,
//                                           //   color: Colors.black,
//                                           //   child: Padding(
//                                           //     padding: const EdgeInsets.all(6.0),
//                                           //     child: ListTile(
//                                           //       leading: const Icon(
//                                           //         Icons.pets_rounded,
//                                           //         color: Colors.white,
//                                           //       ),
//                                           //       title: Text(
//                                           //         "Register your pet",
//                                           //         style: TextStyle(
//                                           //           color: AppColor.whiteColor,
//                                           //           fontSize: 18,
//                                           //           fontWeight: FontWeight.bold,
//                                           //         ),
//                                           //       ),
//                                           //       onTap: () {
//                                           //         CommonShareWidget.goToAnotherPage(
//                                           //             nextPage: PetRegistration(uid: user.uid),
//                                           //             context: context);
//                                           //       },
//                                           //     ),
//                                           //   ),
//                                           // ),
//                                           // Card(
//                                           //   elevation: 1.0,
//                                           //   color: AppColor.green,
//                                           //   child: Padding(
//                                           //     padding: const EdgeInsets.all(6.0),
//                                           //     child: ListTile(
//                                           //       leading: const Icon(
//                                           //         Icons.calendar_view_month_sharp,
//                                           //         // Icons.note_alt_outlined,
//                                           //         color: Colors.white,
//                                           //       ),
//                                           //       title: Text(
//                                           //         "Digital Diary",
//                                           //         style: TextStyle(
//                                           //           color: AppColor.whiteColor,
//                                           //           fontSize: 18,
//                                           //           fontWeight: FontWeight.bold,
//                                           //         ),
//                                           //       ),
//                                           //       onTap: () {
//                                           //         CommonShareWidget.goToAnotherPage(
//                                           //             nextPage: PetDiaryList(userUid: user.uid),
//                                           //             context: context);
//                                           //       },
//                                           //     ),
//                                           //   ),
//                                           // ),
//                                           Card(
//                                             elevation: 1.0,
//                                             // color: Colors.blue,
//                                             color: Colors.black,
//                                             child: Padding(
//                                               padding: const EdgeInsets.all(6.0),
//                                               child: ListTile(
//                                                 leading: const Icon(
//                                                   Icons.category,
//                                                   color: Colors.white,
//                                                 ),
//                                                 title: Text(
//                                                   "Your Posts",
//                                                   style: TextStyle(
//                                                     color: AppColor.whiteColor,
//                                                     fontSize: 18,
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                                 onTap: () {
//                                                   CommonShareWidget.goToAnotherPage(
//                                                       nextPage: UserPostedPet(user.uid),
//                                                       context: context);
//                                                 },
//                                               ),
//                                             ),
//                                           ),
//                                           // Card(
//                                           //   elevation: 1.0,
//                                           //   // color: Colors.blue,
//                                           //   color: AppColor.green,
//                                           //   child: Padding(
//                                           //     padding: const EdgeInsets.all(6.0),
//                                           //     child: ListTile(
//                                           //       leading: const Icon(
//                                           //         Icons.history,
//                                           //         // Icons.calendar_view_day,
//                                           //         color: Colors.white,
//                                           //       ),
//                                           //       title: Text(
//                                           //         "Your Appointment",
//                                           //         style: TextStyle(
//                                           //           color: AppColor.whiteColor,
//                                           //           fontSize: 18,
//                                           //           fontWeight: FontWeight.bold,
//                                           //         ),
//                                           //       ),
//                                           //       onTap: () {
//                                           //         CommonShareWidget.goToAnotherPage(
//                                           //             nextPage: UserAppointmentList(user.uid),
//                                           //             context: context);
//                                           //       },
//                                           //     ),
//                                           //   ),
//                                           // ),
//                                         ],
//                                       ],
//                                       const SizedBox(height: 5),
//                                       Card(
//                                         elevation: 1.0,
//                                         // color: Colors.blue,
//                                         color: AppColor.green,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(6.0),
//                                           child: ListTile(
//                                             leading: const Icon(
//                                               Icons.lock,
//                                               color: Colors.white,
//                                             ),
//                                             title: Text(
//                                               "Privacy Policy",
//                                               style: TextStyle(
//                                                 color: AppColor.whiteColor,
//                                                 fontSize: 18,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             onTap: () {
//                                               launchUrlString(
//                                                 privacyPolicyUrl,
//                                                 mode: LaunchMode.externalApplication,
//                                               );
//                                             },
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(height: 5),
//                                       Card(
//                                         elevation: 1.0,
//                                         // color: Colors.blue,
//                                         color: AppColor.green,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(6.0),
//                                           child: ListTile(
//                                             leading: const Icon(
//                                               Icons.copyright_rounded,
//                                               color: Colors.white,
//                                             ),
//                                             title: Text(
//                                               "Term and Conditions",
//                                               style: TextStyle(
//                                                 color: AppColor.whiteColor,
//                                                 fontSize: 18,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             onTap: () {
//                                               launchUrlString(
//                                                 termsAndConditionsUrl,
//                                                 mode: LaunchMode.externalApplication,
//                                               );
//                                             },
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(height: 5),
//                                       Card(
//                                         elevation: 1.0,
//                                         // color: Colors.red.shade600,
//                                         color: Colors.black,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(6.0),
//                                           child: ListTile(
//                                             leading: const Icon(
//                                               //user == null ? Icons.touch_app :
//                                               Icons.logout,
//                                               color:
//                                               //user == null ? AppColor.lightGreen :
//                                               Colors.white,
//                                             ),
//                                             title: Text(
//                                               // user == null ? "Log In" :
//                                               "Log Out",
//                                               style: TextStyle(
//                                                 color: AppColor.whiteColor,
//                                                 fontSize: 18,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             onTap: () {
//                                               Provider.of<LoginSignupRepo>(context,
//                                                   listen: false)
//                                                   .logout()
//                                                   .then((value) {
//                                                 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) =>
//                                                 const LoginPage() ), (route) => false);
//                                               });
//
//                                             },
//                                           ),
//                                         ),
//                                       ),
//
//                                       const SizedBox(height: 5),
//                                       Card(
//                                         elevation: 1.0,
//                                         color: Colors.red.shade600,
//                                         // color: Colors.red,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(6.0),
//                                           child: ListTile(
//                                             leading: const Icon(
//                                               //user == null ? Icons.touch_app :
//                                               Icons.delete,
//                                               color:
//                                               //user == null ? AppColor.lightGreen :
//                                               Colors.white,
//                                             ),
//                                             title: Text(
//                                               // user == null ? "Log In" :
//                                               "Delete Account",
//                                               style: TextStyle(
//                                                 color: AppColor.whiteColor,
//                                                 fontSize: 18,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             onTap: () {
//                                               showDialog(
//                                                   context: context,
//                                                   builder: (BuildContext context)
//                                                   {
//                                                     return AlertDialog(
//                                                       backgroundColor: Colors.transparent,
//                                                       elevation: 5,
//                                                       content: Container(
//                                                         height: 350,
//                                                         width: width,
//                                                         decoration:  BoxDecoration(
//                                                           color: Colors.white,
//                                                           borderRadius: BorderRadius.circular(25),
//                                                         ),
//                                                         child: Padding(
//                                                           padding: const EdgeInsets.all(8.0),
//                                                           child: Column(
//                                                             children: [
//                                                               const SizedBox(height: 30,),
//                                                               const Text("Do you want to Delete your profile?",
//                                                                 style: TextStyle(
//                                                                   fontWeight: FontWeight.bold,
//                                                                   fontSize: 18,
//                                                                   color: Colors.blueAccent
//                                                                 ),
//                                                               ),
//                                                               const SizedBox(height: 20,),
//
//                                                               const Text("Your profile will be deleted permanently, all of your data will be deleted"
//                                                                   " and You will not be able to recover this profile again.",
//                                                                 style: TextStyle(
//                                                                     fontSize: 16
//                                                                 ),
//                                                               ),
//                                                               const SizedBox(height: 20,),
//                                                               Row(
//                                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                 children: [
//                                                                   InkWell(
//                                                                     onTap: () async {
//                                                                       Navigator.push(context, MaterialPageRoute(builder: (_) => DeleteReasonPage(phone: profile.phone.toString(), email: profile.email.toString(),)));
//                                                                                                                                           },
//                                                                     child: Container(
//                                                                       height: 35,
//                                                                       width: 70,
//                                                                       decoration: const BoxDecoration(
//                                                                         color: Colors.green,
//                                                                         borderRadius: BorderRadius.all(Radius.circular(25)),
//                                                                       ),
//                                                                       child: const Center(child: Text('Yes')),
//
//                                                                     ),
//                                                                   ),
//                                                                   const SizedBox(width: 10,),
//                                                                   InkWell(
//                                                                     onTap: (){
//                                                                       Navigator.of(context).pop();
//                                                                     },
//                                                                     child: Container(
//                                                                       height: 40,
//                                                                       width: 70,
//                                                                       decoration: const BoxDecoration(
//                                                                         color: Colors.red,
//                                                                         borderRadius: BorderRadius.all(Radius.circular(25)),
//                                                                       ),
//                                                                       child: const Center(child: Text('No')),
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               )
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     );
//                                                   }
//                                               );
//
//                                             },
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(height: 80),
//
//                                     ],
//                                   ),
//                                 ),
//                               );
//
//                             }
//                             else{
//                               Provider.of<LoginSignupRepo>(context,
//                                   listen: false)
//                                   .logout()
//                                   .then((value) {
//                                 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) =>
//                                 const LoginPage() ), (route) => false);
//                               });
//                               if (kDebugMode) {
//                                 print("user profile else part----");
//                               }
//                             }
//                       }
//                       return Container(
//                         child: CommonShareWidget.circularLoader(),
//                       );
//                     },
//                   )
//                 // )
//               : const SizedBox(),
//         );
//       },
//     );
//   }
//
//
//   Future getImage(bool isprofile, String? oldImageUrl, String uid) async {
//     var img = await ImagePickerHelper().pickImage(source: ImageSource.gallery);
//
//     if (img != null) {
//       final image = File(img.path.toString());
//       var _croppedImage = await ImagePickerHelper.cropImage(image);
//
//       if (isprofile) {
//         setState(() {
//           _oldImageProfile = oldImageUrl;
//           _loaderState = true;
//         });
//         updateImage(uid, 'profile_image_url', File(_croppedImage?.path.toString() ?? ''), true);
//       } else {
//         setState(() {
//           _oldImageNid = oldImageUrl;
//           _loaderState = true;
//         });
//         updateImage(uid, 'nid_image_url', File(_croppedImage?.path.toString() ?? ''), false);
//       }
//     }
//   }
//
//   updateImage(
//     String uid,
//     String title,
//     File image,
//     bool isprofile,
//   ) async {
//     Map<String, dynamic> value = {};
//     var imageurl = await LoginSignupRepo()
//         .uploadImage(image, uid)
//         .onError((error, stackTrace) => '');
//     if (imageurl.isNotEmpty) {
//       value[title] = imageurl;
//       await UserRepo.updateUserProfileData(uid, value);
//       await UserRepo.deleteProfileImage(
//           isprofile ? _oldImageProfile : _oldImageNid);
//       setState(() {
//         _loaderState = false;
//       });
//     } else {
//       setState(() {
//         _loaderState = false;
//       });
//     }
//     _loaderState = false;
//   }
//
//   Widget buildInfoWidget(icon, text, VoidCallback? callback) {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Row(
//         children: <Widget>[
//           Icon(icon),
//           const SizedBox(width: 20.0),
//           Expanded(
//             child: Text(
//               text,
//               style: TextStyle(color: AppColor.blackColor, fontSize: 16),
//             ),
//           ),
//           const SizedBox(width: 10.0),
//           IconButton(
//             icon: const Icon(Icons.edit),
//             color: Colors.blueAccent,
//             onPressed: callback,
//           )
//         ],
//       ),
//     );
//   }
//
//   Future<void> buildUpdateDialog({
//     required BuildContext context,
//     title,
//     int? pos,
//     TextEditingController? controller,
//     hint,
//     uid,
//   }) {
//     FocusScope.of(context).requestFocus(FocusNode());
//     bool loaderstatus = false;
//     return showDialog(
//       builder: (context) {
//         return StatefulBuilder(builder: (context, setDialougeState) {
//           return Form(
//             key: _formKey,
//             child: AlertDialog(
//               elevation: 0,
//               title: Text(loaderstatus ? "Please wait..." : title),
//               content: TextFormField(
//                 keyboardType: pos == 4 ? TextInputType.phone : TextInputType.text,
//                 controller: controller,
//                 validator: (value) {
//                       return pos == 4
//                       ? InputValidator.validateMobile(value)
//                       :  InputValidator.emptyTextvalidator(
//                           value!, "required field");
//                 },
//                 decoration: InputDecoration(hintText: hint,
//                 ),
//               ),
//               actions: <Widget>[
//                 TextButton
//                   (
//                   onPressed: loaderstatus
//                       ? null
//                       : () {
//                           if (!_formKey.currentState!.validate()) {
//                             return;
//                           }
//                           else {
//                             setDialougeState(() {
//                               loaderstatus = true;
//                             });
//                             switch (pos) {
//                               case 1:
//                                 _userRepo.updateName(
//                                     uid, context, _controllerName);
//                                 break;
//                               case 3:
//                                 _userRepo.updateaddress(
//                                     uid, context, _controllerAddress);
//                                 break;
//                               case 4:
//                                 _userRepo.updatephoneNumber(
//                                     uid, context,  _controllerPhone, countryCode.dialCode);
//                                 break;
//                             }
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
//             ),
//           );
//         });
//       },
//       context: context,
//     );
//   }
//
// }
