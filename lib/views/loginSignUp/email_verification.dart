// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/constant/colors.dart';
// import 'package:petfindernetwork/views/loginSignUp/users_details_inputpage.dart';
// import 'package:provider/provider.dart';
//
// import '../../bloc/loader_provider.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
//
// class EmailVerificationScreen extends StatefulWidget {
//   const EmailVerificationScreen({super.key,
//     required this.email,
//     });
//   final String email;
//
//   @override
//   State<EmailVerificationScreen> createState() =>
//       _EmailVerificationScreenState();
//
// }
//
// class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
//   bool isEmailVerified = false;
//   Timer? timer;
//   final User? user = FirebaseAuth.instance.currentUser;
//   bool resendEmail = false;
//   bool isLoading = false;
//
//   Future<void> verifyEmail() async {
//     try {
//       await user?.sendEmailVerification();
//       await Future.delayed(const Duration(seconds: 5));
//       resendEmail = true;
//     } catch (e) {
//       CommonShareWidget.showFlushBar(
//           context: context,
//           duration: 2,
//           message: e.toString());
//     }
//   }
//
//   @override
//   void initState() {
//     verifyEmail();
//     chkEmailVerified();
//     super.initState();
//   }
//
//
//   Future chkEmailVerified() async {
//     timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
//       await FirebaseAuth.instance.currentUser!.reload();
//       User? user = FirebaseAuth.instance.currentUser;
//       if (user!.emailVerified) {
//         setState(() {
//           isEmailVerified = true;
//         });
//         timer.cancel();
//       }
//     });
//   }
//
//   @override
//   void dispose()
//   {
//     timer!.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 35),
//               const SizedBox(height: 30),
//               Icon(Icons.mark_email_read_outlined, size: 150, color: AppColor.orange,),
//               const SizedBox(height: 20),
//               const Center(
//                 child: Text(
//                   'Hi ! Check your Email',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 15),
//                Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 32.0),
//                 child: Center(
//                   child: Text(
//                     'We have sent you an Email for verification on ${widget.email}, verify to continue ',
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold
//                       // color: AppColor.orange
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 57),
//               // Padding(
//               //   padding: const EdgeInsets.symmetric(horizontal: 32.0),
//               //   child: Center(
//               //     child: ElevatedButton(
//               //         style: ElevatedButton.styleFrom(
//               //           backgroundColor: Colors.black,
//               //           minimumSize: const Size.fromHeight(50), // NEW
//               //         ),
//               //         onPressed: (){
//               //           verifyEmail();                      },
//               //         child: const Text("Resend",
//               //           style: TextStyle(
//               //               color: Colors.white,
//               //               fontSize: 23,
//               //               fontWeight: FontWeight.bold
//               //           ),
//               //         )),
//               //   ),
//               // ),
//               // const SizedBox(height: 10),
//               //
//               // const SizedBox(height: 20),
//               isEmailVerified
//                   ? Padding(
//                     padding: const EdgeInsets.all(30.0),
//                     child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black,
//                     minimumSize: const Size.fromHeight(50), // NEW
//                 ),
//                 onPressed: () async {
//                   Provider.of<LoaderProvider>(context, listen: false).loading(false);
//                   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const UserInputDetailsPage()), (route) => false);
//
//                   // Navigator.push(context, MaterialPageRoute(builder: (_) => const MobileInputPage(login: false)));
//                 },
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         "Go Ahead",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 23,
//                             fontWeight: FontWeight.bold
//                         ),
//                       ),
//                       const SizedBox(width: 20),
//                       isLoading
//                           ? const SizedBox(
//                         height: 25,
//                         width: 25,
//                         child: CircularProgressIndicator(
//                             color: Colors.white),
//                       )
//                           : const Icon(Icons.arrow_forward, color: Colors.white,)
//                     ],
//                 ),
//               ),
//                   )
//                   : const SizedBox()
//               // Padding(
//               //   padding: const EdgeInsets.symmetric(horizontal: 32.0),
//               //   child: Center(
//               //     child: ElevatedButton(
//               //         style: ElevatedButton.styleFrom(
//               //           backgroundColor: Colors.black,
//               //           minimumSize: const Size.fromHeight(50), // NEW
//               //         ),
//               //         onPressed: (){
//               //           Navigator.push(context, MaterialPageRoute(builder: (_) => MobileInputPage()));
//               //           },
//               //         child: const Text("Next",
//               //       style: TextStyle(
//               //         color: Colors.white,
//               //         fontSize: 23,
//               //         fontWeight: FontWeight.bold
//               //       ),
//               //     )),
//               //   ),
//               // )
//
//               // Padding(
//               //   padding: const EdgeInsets
//               //       .symmetric(horizontal: 32.0),
//               //   child:
//               //
//               //   ElevatedButton(
//               //     child:  Text('Next'),
//               //     onPressed: () {
//               //       Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
//               //     },
//               //   ),
//               // ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }