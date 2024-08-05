// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/views/user/user_email_reverify.dart';
// import 'package:petfindernetwork/views/user/user_phone_reverify.dart';
//
// import '../shareAbleWidget.dart/commonShareWidget.dart';
//
//
//
// class VerifyUserPage extends StatefulWidget {
//   const VerifyUserPage({Key? key, required this.phone, required this.email}) : super(key: key);
//   final String email;
//   final String phone;
//   @override
//   State<VerifyUserPage> createState() => _VerifyUserPageState();
// }
//
// class _VerifyUserPageState extends State<VerifyUserPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         // mainAxisAlignment: MainAxisAlignment.center,
//         // crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const Padding(
//             padding: EdgeInsets.all(20.0),
//             child: Text("We are sorry to let you go",
//               style: TextStyle(
//                   fontSize: 25,
//                 fontWeight: FontWeight.bold
//               ),
//
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
//             child: Center(
//               child: Text("Please verify yourself",
//                 style: TextStyle(
//                   fontSize: 20
//                 ),
//
//               ),
//             ),
//           ),
//
//           const SizedBox(height: 150,),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 32.0),
//             child: Center(
//               child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black,
//                     minimumSize: const Size.fromHeight(50), // NEW
//                   ),
//                   onPressed: (){
//
//
//                     // Provider.of<LoaderProvider>(context, listen: false).loading(true);
//                     CommonShareWidget.goToAnotherPage(
//                       nextPage:  UserEmailReverify(phone: widget.phone, email: widget.email),
//                       context: context,
//                     );
//                   },
//                   child: const Text("Verify with Email",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 23,
//                       // fontWeight: FontWeight.bold
//                     ),
//                   )),
//             ),
//           ),
//           const SizedBox(height: 30,),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 32.0),
//             child: Center(
//               child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black,
//                     minimumSize: const Size.fromHeight(50), // NEW
//                   ),
//                   onPressed: (){
//                     CommonShareWidget.goToAnotherPage(
//                       nextPage:  UserPhoneReverify(phone: widget.phone, email: widget.email),
//                       context: context,
//                     );
//                   },
//                   child: const Text("Verify using Mobile",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 23,
//                       // fontWeight: FontWeight.bold
//                     ),
//                   )),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
