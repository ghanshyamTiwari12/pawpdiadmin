// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../bloc/loader_provider.dart';
// import '../../constant/colors.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
// import 'mobile_verificaton.dart';
//
// class PhoneReverifyWidget{
//   PhoneReverifyWidget(this.phoneNumber);
//   final String phoneNumber;
//
//   Widget phoneReverify(context, ){
//     final _formKey = GlobalKey<FormState>();
//     final size = MediaQuery.of(context).size;
//     var width = size.width;
//     bool loaderState = false;
//     final auth = FirebaseAuth.instance;
//     bool loading = false;
//     LoaderProvider loaderProvider = Provider.of<LoaderProvider>(context);
//     loaderState = loaderProvider.isLoading;
//
//     return       Column(
//       children: [
//         Form(
//           autovalidateMode: AutovalidateMode.always,
//           key: _formKey,
//           child: SingleChildScrollView(
//             child:
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 const SizedBox(
//                   height: kToolbarHeight,
//                 ),
//
//                 Text("Hi, Your Phone No is:",
//                   style: TextStyle(
//                       fontSize: 25,
//                       color: AppColor.orange,
//                       fontWeight: FontWeight.bold
//                   ),
//                 ),
//                 const SizedBox(height: 10,),
//                 Text(phoneNumber,
//                   style: const TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.bold
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 const SizedBox(
//                   height: 20.0,
//                 ),
//                 const SizedBox(
//                   height: 1.0,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Card(
//                       child: Container(
//                           height: 60,
//                           width: width /2,
//                           decoration: const BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                             color: Colors.black,
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(2.0),
//                             child: InkWell(
//                               onTap: () async {
//                                 Provider.of<LoaderProvider>(context, listen: false).loading(true);
//
//                                 await  auth.verifyPhoneNumber
//                                   (
//                                     phoneNumber: phoneNumber,
//                                     verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async
//                                     {
//                                       // await auth.signInWithCredential(phoneAuthCredential);
//                                     },
//                                     verificationFailed: (e){
//                                       CommonShareWidget.showFlushBar(
//                                           context: context,
//                                           duration: 2,
//                                           message: "Verification failed");
//                                      Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//                                     },
//                                     codeSent: (String verificationId, int? token) async {
//                                      Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//                                       Navigator.push(context, MaterialPageRoute(builder: (_) => MobileVerificationPage(
//                                         verificationId: verificationId,
//                                         login: false,
//                                         phoneNumber: phoneNumber.toString(), phoneReverify: true,
//
//                                       )));
//
//                                     },
//                                     codeAutoRetrievalTimeout: (String verificationId){
//                                       verificationId = verificationId;
//                                       // CommonShareWidget.showFlushBar(
//                                       //     context: context,
//                                       //     duration: 2,
//                                       //     message: "Time out");
//                                       // setState(() {
//                                       //   loading = false;
//                                       //   loader(loading);
//                                       // });
//                                     }
//                                 );
//
//                                Provider.of<LoaderProvider>(context, listen: false).loading(false);
//                               },
//                               child:  Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   loaderState ? const CircularProgressIndicator(color: Colors.white,):
//                                   const Text( "Send OTP",
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         color: Colors.white
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           )
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(
//                   height: 30.0,
//                 ),
//               ],
//             ),
//           ),
//         ),
//
//       ],
//     );
//   }
//
//
// }