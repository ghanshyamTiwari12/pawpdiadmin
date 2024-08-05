// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../constant/colors.dart';
// import '../../gen/assets.gen.dart';
// import '../../repository/loginsignupRepo.dart';
// import '../chat/myChatList.dart';
// import '../loginSignUp/login_with_email.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
// import '../user/userPostedItem.dart';
// import '../user/userProfile.dart';
//
// class SideBar extends StatelessWidget {
//   const SideBar({super.key, required this.user});
//   final User? user;
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       // width: MediaQuery.of(context).size.width / 1.6,
//       // color: AppColor.whiteColor,
//       child: ListView(
//         children: <Widget>[
//           DrawerHeader(child: Assets.images.logo.image()),
//           Card(
//             elevation: 3.0,
//             child: ListTile(
//               leading: Icon(
//                 Icons.account_circle,
//                 color: AppColor.lightGreen,
//               ),
//               title: Text(
//                 "My profile",
//                 style: TextStyle(color: AppColor.blackColor),
//               ),
//               onTap: user == null
//                   ? null
//                   : () {
//                       CommonShareWidget.goToAnotherPage(
//                           nextPage: const UserProfile(), context: context);
//                     },
//             ),
//           ),
//           Card(
//             elevation: 3.0,
//             child: ListTile(
//               leading: Icon(
//                 Icons.category,
//                 color: AppColor.lightGreen,
//               ),
//               title: Text(
//                 "My Posts",
//                 style: TextStyle(color: AppColor.blackColor),
//               ),
//               onTap: user == null
//                   ? null
//                   : () {
//                       CommonShareWidget.goToAnotherPage(
//                           nextPage: UserPostedPet(user!.uid), context: context);
//                     },
//             ),
//           ),
//           Card(
//             elevation: 3.0,
//             child: ListTile(
//               leading: Icon(
//                 Icons.chat,
//                 color: AppColor.lightGreen,
//               ),
//               title: Text(
//                 "Chat",
//                 style: TextStyle(color: AppColor.blackColor),
//               ),
//               onTap: user == null
//                   ? null
//                   : () {
//                       CommonShareWidget.goToAnotherPage(
//                           nextPage: const MyChatList(), context: context);
//                     },
//             ),
//           ),
//           Card(
//             elevation: 3.0,
//             child: ListTile(
//               leading: Icon(
//                 user == null ? Icons.touch_app : Icons.exit_to_app,
//                 color: user == null ? AppColor.lightGreen : Colors.red,
//               ),
//               title: Text(
//                 user == null ? "Log In" : "Log Out",
//                 style: TextStyle(color: AppColor.blackColor),
//               ),
//               onTap: () {
//                 if (user == null) {
//                   CommonShareWidget.goToAnotherPage(
//                       nextPage: const LoginWithEmail(), context: context);
//                 } else {
//                   Provider.of<LoginSignupRepo>(context, listen: false)
//                       .logout()
//                       .then((value) {
//                     Navigator.of(context).popUntil(ModalRoute.withName('/'));
//                   });
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
