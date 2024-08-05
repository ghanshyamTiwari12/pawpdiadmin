// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../repository/loginsignupRepo.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
// import 'email_verification.dart';
// import 'login.dart';
// import 'login_with_email.dart';
//
// class SignupNewPage extends StatefulWidget {
//   const SignupNewPage({super.key});
//
//   @override
//   State<SignupNewPage> createState() => _SignupNewPageState();
// }
//
// class _SignupNewPageState extends State<SignupNewPage> {
//   final TextEditingController _controllerEmail = TextEditingController();
//   final TextEditingController _controllerPassword = TextEditingController();
//   final TextEditingController _controllerConfirmPassword = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//
//   bool _loaderState = false;
//   // bool isProfessional = false;
//   // String? professionalType;
//   // String? cityName;
//   // String? idImageUrl;
//   // String? professionalImageUrl;
//   // bool? isIdVerified = false;
//   // bool? isDocVerified = false;
//   // bool? isIdPending =  false;
//   // bool?  isIdRejected = false;
//   // bool? isDocRejected = false;
//   // bool?  isDocPending = false;
//   // bool? isAdmin= false;
//   // String? profileimageUrl;
//   // String? nidImageUrl;
//   bool passwordVisible = false;
//   bool confirmPasswordVisible = false;
//
//
//
//   @override
//   void initState(){
//     super.initState();
//     passwordVisible= true;
//     confirmPasswordVisible = true;
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       body:
//          _loaderState ? CommonShareWidget.circularLoader()
//              : SingleChildScrollView(
//           child: Form(
//             autovalidateMode: AutovalidateMode.always,
//             key: _formKey,
//             child: Column(
//               children: <Widget>[
//                 Stack(
//                   children: <Widget>[
//
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
//                                 Text("Register Using ",
//                                   style: TextStyle(
//                                       // fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                       // fontStyle: FontStyle.italic ,
//                                       fontSize: 25
//                                   ),
//                                 ),
//                                 Text("Email",
//                                   style:
//                                   TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                       // fontStyle: FontStyle.italic ,
//                                       fontSize: 25,
//                                   ),
//                                 )
//                               ],
//                             ),
//                                  ],
//                         ),
//                       ),
//                     ),
//                     // ClipPath(
//                     //   clipper: WaveClipper2(),
//                     //   child: Container(
//                     //     width: double.infinity,
//                     //     height: 250,
//                     //     decoration: BoxDecoration(
//                     //         gradient: LinearGradient(
//                     //             begin: Alignment.topLeft,
//                     //             end: Alignment.bottomRight,
//                     //             colors: [
//                     //               Colors.blue.shade200,
//                     //               Colors.purple.shade200,
//                     //             ])),
//                     //     child: const Column(),
//                     //   ),
//                     // ),
//                     // ClipPath(
//                     //   clipper: WaveClipper3(),
//                     //   child: Container(
//                     //     width: double.infinity,
//                     //     height: 250,
//                     //     decoration: BoxDecoration(
//                     //         gradient: LinearGradient(
//                     //             begin: Alignment.topLeft,
//                     //             end: Alignment.bottomRight,
//                     //             colors: [
//                     //               Colors.blue.shade300,
//                     //               Colors.purple.shade300,
//                     //             ])),
//                     //     child: const Column(),
//                     //   ),
//                     // ),
//                     // ClipPath(
//                     //   clipper: WaveClipper1(),
//                     //   child: Container(
//                     //     width: double.infinity,
//                     //     height: 250,
//                     //     decoration: const BoxDecoration(
//                     //         gradient: LinearGradient(
//                     //             begin: Alignment.topLeft,
//                     //             end: Alignment.bottomRight,
//                     //             colors: [
//                     //               Colors.blue,
//                     //               Colors.purple,
//                     //             ])),
//                     //     child: const Column(
//                     //       children: <Widget>[
//                     //         SizedBox(
//                     //           height: 40,
//                     //         ),
//                     //         Icon(
//                     //           Icons.perm_identity,
//                     //           color: Colors.white,
//                     //           size: 60,
//                     //         ),
//                     //         SizedBox(
//                     //           height: 20,
//                     //         ),
//                     //         Text(
//                     //           "Register Using Email",
//                     //           style: TextStyle(
//                     //               color: Colors.white,
//                     //               fontWeight: FontWeight.w700,
//                     //               fontSize: 30),
//                     //         ),
//                     //       ],
//                     //     ),
//                     //   ),
//                     // ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 32),
//                   child:
//                   Material(
//                     elevation: 2.0,
//                     color: Colors.grey.shade200,
//                     borderRadius: const BorderRadius.all(Radius.circular(30)),
//                     child: TextField(
//                       onChanged: (String value) {},
//                       cursorColor: Colors.deepOrange,
//                       controller: _controllerEmail,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration:  InputDecoration(
//                           hintText: "Email",
//                           prefixIcon: Material(
//                             elevation: 0,
//                             color: Colors.grey.shade200,
//                             borderRadius: const BorderRadius.all( Radius.circular(30)),
//                             child: const Icon(
//                               Icons.email,
//                               color: Colors.orange,
//                             ),
//                           ),
//                           border: InputBorder.none,
//                           contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 25, vertical: 13)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 32),
//                   child: Material(
//                     elevation: 2.0,
//                     color: Colors.grey.shade200,
//                     borderRadius:
//                     const BorderRadius.all(Radius.circular(30)),
//                     child: TextField(
//                       onChanged: (String value) {},
//                       cursorColor: Colors.deepOrange,
//                       controller: _controllerPassword,
//                       keyboardType: TextInputType.visiblePassword,
//                       obscureText: passwordVisible,
//                       decoration:  InputDecoration(
//                           hintText: "Password",
//                           prefixIcon:  Material(
//                             elevation: 0,
//                             color: Colors.grey.shade200,
//                             borderRadius:
//                             const BorderRadius.all(Radius.circular(30)),
//                             child: const Icon(
//                               Icons.lock,
//                               color: Colors.green,
//                             ),
//                           ),
//                           suffixIcon: IconButton(
//                               icon: Icon(
//                                 passwordVisible ? Icons.visibility_off : Icons.visibility,
//                               ),
//                               onPressed: (){
//                                 setState(() {
//                                   passwordVisible = !passwordVisible;
//                                 });
//                               }
//                           ),
//                           border: InputBorder.none,
//                           contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 25, vertical: 13)),
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(
//                   height: 10.0,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 32),
//                   child: Material(
//                     elevation: 2.0,
//                     color: Colors.grey.shade200,
//                     borderRadius:
//                     const BorderRadius.all(Radius.circular(30)),
//                     child: TextField(
//                       onChanged: (String value) {},
//                       cursorColor: Colors.deepOrange,
//                       controller: _controllerConfirmPassword,
//                       keyboardType: TextInputType.visiblePassword,
//                       obscureText: confirmPasswordVisible,
//                       decoration:  InputDecoration(
//                           hintText: "Confirm Password",
//                           prefixIcon:  Material(
//                             elevation: 0,
//                             color: Colors.grey.shade200,
//                             borderRadius:
//                             const BorderRadius.all(Radius.circular(30)),
//                             child: const Icon(
//                               Icons.lock,
//                               color: Colors.green,
//                             ),
//                           ),
//                           suffixIcon: IconButton(
//                               icon: Icon(
//                                 confirmPasswordVisible ? Icons.visibility_off : Icons.visibility,
//                               ),
//                               onPressed: (){
//                                 setState(() {
//                                   confirmPasswordVisible = !confirmPasswordVisible;
//                                 });
//                               }
//                           ),
//                           border: InputBorder.none,
//                           contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 25, vertical: 13)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 CommonShareWidget.signInUpbutton("SIGN UP", ()
//                 {
//                   if (_formKey.currentState!.validate()) {
//                     if (_controllerEmail.text.trim().isEmpty) {
//                       CommonShareWidget.showFlushBar(
//                           context: context,
//                           duration: 2,
//                           message: "Please Enter Email");
//                     }
//                     else if (_controllerPassword.text.trim().isEmpty)
//                     {
//                         CommonShareWidget.showFlushBar(
//                             context: context,
//                             duration: 2,
//                             message: "Please Enter Password");
//                       }
//                     else if (_controllerConfirmPassword.text.trim().isEmpty)
//                     {
//                       CommonShareWidget.showFlushBar(
//                           context: context,
//                           duration: 2,
//                           message: "Please Enter Confirm Password");
//                     } else if (_controllerConfirmPassword.text.toString() != _controllerPassword.text.toString())
//                     {
//                       CommonShareWidget.showFlushBar(
//                           context: context,
//                           duration: 2,
//                           message: "Confirm password is different");
//                     }
//                       else
//                       {
//                         if (mounted)
//                         {
//                           setState(() {
//                             _loaderState = true;
//                           });
//                         }
//                         handleSubmit();
//                       }
//
//                   }
//                 }, context),
//
//                 const SizedBox(height: 10.0),
//                 CommonShareWidget.flatTextButtonLogInUp(
//                     "Already have an account?", "Sign in", () {
//                   FocusScope.of(context).requestFocus(FocusNode());
//                   CommonShareWidget.goToAnotherPage(
//                     nextPage: const LoginPage(),
//                     context: context,
//                   );
//                 }),
//                 // const SizedBox(height: 50.0),
//                 // Wrap(
//                 //   alignment: WrapAlignment.center,
//                 //   children: [
//                 //     const Text("By "),
//                 //     const Text("continue "),
//                 //     const Text("I "),
//                 //     const Text("agree "),
//                 //     const Text("to "),
//                 //     InkWell(
//                 //       onTap: () {
//                 //         launchUrlString(
//                 //           privacyPolicyUrl,
//                 //           mode: LaunchMode.externalApplication,
//                 //         );
//                 //       },
//                 //       child: const Text(
//                 //         "privacy policy ",
//                 //         style: TextStyle(
//                 //           color: Colors.blue,
//                 //         ),
//                 //       ),
//                 //     ),
//                 //     const Text("and "),
//                 //     InkWell(
//                 //       onTap: () {
//                 //         launchUrlString(
//                 //           termsAndConditionsUrl,
//                 //           mode: LaunchMode.externalApplication,
//                 //         );
//                 //       },
//                 //       child: const Text(
//                 //         "terms & conditions",
//                 //         style: TextStyle(
//                 //           color: Colors.blue,
//                 //         ),
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//                 const SizedBox(height: 10.0),
//               ],
//             ),
//           ),
//         ),
//       // ),
//     );
//
//   }
//
//   handleSubmit() async
//   {
//
//     try {
//       await Provider.of<LoginSignupRepo>(context, listen: false)
//           .createUser(
//           email: _controllerEmail.text, password: _controllerPassword.text)
//           .then((user) async {
//         if (user?.uid != null)
//         {
//           if (mounted) {
//             setState(() {
//               _loaderState = false;
//             });
//           }
//           Navigator.push(context, MaterialPageRoute(
//               builder: (_)=>
//                EmailVerificationScreen(email: _controllerEmail.text.toString(),
//
//                )
//           )
//           );
//
//                  }
//         else {
//           CommonShareWidget.showFlushBar(
//             // context: context, duration: 3, message: "Something wrong"
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
//     }
//     on FirebaseAuthException catch (error) {
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
// }
