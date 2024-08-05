//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/repository/loginsignupRepo.dart';
// import 'package:petfindernetwork/views/loginSignUp/users_details_inputpage.dart';
// import 'package:petfindernetwork/views/shareAbleWidget.dart/commonShareWidget.dart';
// import 'package:provider/provider.dart';
// import '../../admin/preference.dart';
// import '../../bloc/loader_provider.dart';
// import '../../constant/colors.dart';
// import '../home/homePage.dart';
// import 'email_verification.dart';
// import 'forgotPassword.dart';
// import 'new_singn_UP.dart';
//
// class LoginWithEmail extends StatefulWidget {
//   const LoginWithEmail({super.key});
//
//   @override
//   State<LoginWithEmail> createState() => _LoginWithEmailState();
// }
//
// class _LoginWithEmailState extends State<LoginWithEmail> {
//   final TextEditingController _controllerEmail = TextEditingController();
//   final TextEditingController _controllerPassword = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//    bool _loaderState = false;
//   bool passwordVisible = false;
//   bool checkCurrentuser = false;
//
//   @override
//   void initState(){
//     super.initState();
//     passwordVisible= true;
//   }
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     var width = size.width;
//     // var height = size.height;
//     if (kDebugMode) {
//       print(" login loader value=== ${_loaderState.toString()}");
//     }
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Stack(
//               children: <Widget>[
//                 ClipPath(
//                   clipper: WaveClipper2(),
//                   child: Container(
//                     width: double.infinity,
//                     height: 300,
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [
//                           Color.fromRGBO(83, 160, 136, 1),
//                           Colors.orange,
//                         ],
//                       ),
//                     ),
//                     child: const Column(),
//                   ),
//                 ),
//                 ClipPath(
//                   clipper: WaveClipper3(),
//                   child: Container(
//                     width: double.infinity,
//                     height: 300,
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [
//                           Color.fromRGBO(252,161,95,1.00),
//                           Color.fromRGBO(252,161,95,1.00),
//                         ],
//                       ),
//                     ),
//                     child: const Column(),
//                   ),
//                 ),
//                 ClipPath(
//                   clipper: WaveClipper1(),
//                   child: Container(
//                     width: double.infinity,
//                     height: 300,
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [
//                           Color.fromRGBO(252,161,95,1.00),
//                           Colors.purple,
//                         ],
//                       ),
//                     ),
//                     child: const Column(
//                       children: <Widget>[
//                         SizedBox(
//                           height: 40,
//                         ),
//                         Icon(
//                           Icons.person,
//                           color: Colors.white,
//                           size: 60,
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text("Login Using ",
//                               style: TextStyle(
//                                 // fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                   // fontStyle: FontStyle.italic ,
//                                   fontSize: 25
//                               ),
//                             ),
//                             Text("Email",
//                               style:
//                               TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                                 // fontStyle: FontStyle.italic ,
//                                 fontSize: 25,
//                               ),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Form(
//               autovalidateMode: AutovalidateMode.always,
//               key: _formKey,
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     const SizedBox(
//                       height: kToolbarHeight,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 32),
//                       child: Material(
//                         elevation: 2.0,
//                         borderRadius:
//                         const BorderRadius.all(Radius.circular(30)),
//                         // color: Colors.grey.shade200,
//                         color: AppColor.orange.withOpacity(0.3),
//                         child: TextField(
//                           onChanged: (String value) {},
//                           cursorColor: Colors.black,
//                           controller: _controllerEmail,
//                           keyboardType: TextInputType.emailAddress,
//                           decoration:  const InputDecoration(
//                               hintText: " Enter Your Email",
//                               hintStyle: TextStyle(
//                                 color: Colors.black,
//                               ),
//                               prefixIcon: Icon(
//                                 Icons.email,
//                                 color: Colors.black ,
//                               ),
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 25, vertical: 13)),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 32),
//                       child: Material(
//                         elevation: 2.0,
//                         // color: Colors.grey.shade200,
//                         color: AppColor.green.withOpacity(0.3),
//                         borderRadius:
//                         const BorderRadius.all(Radius.circular(30)),
//                         child: TextField(
//                           onChanged: (String value) {},
//                           cursorColor: Colors.black,
//                           controller: _controllerPassword,
//                           keyboardType: TextInputType.visiblePassword,
//                           obscureText: passwordVisible,
//                           decoration:  InputDecoration(
//                               hintText: " Enter Your Password",
//                               hintStyle: const TextStyle(
//                                 color: Colors.black,
//                               ),
//
//                               prefixIcon:  const Icon(
//                                 Icons.lock,
//                                 color: Colors.black,
//                               ),
//                               suffixIcon: IconButton(
//                                   icon: Icon(
//                                     passwordVisible ? Icons.visibility_off : Icons.visibility,
//                                   ),
//                                   onPressed: (){
//                                     setState(() {
//                                       passwordVisible = !passwordVisible;
//                                     });
//                                   }
//                               ),
//                               border: InputBorder.none,
//                               contentPadding: const EdgeInsets.symmetric(
//                                   horizontal: 25, vertical: 13)),
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(
//                       height: 30.0,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 32),
//                       child: GestureDetector(
//                         onTap: (){
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (_)=> const ForgotPassword() ));
//                         },
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             SizedBox(
//                               height: 50,
//                               child: Text("Forgot Password?", style: TextStyle(
//                                 color: AppColor.blackColor,
//                                 fontWeight: FontWeight.bold,
//                               ),),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10.0,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Card(
//                           child: Container(
//                               height: 60,
//                               width: width /2,
//                               decoration: const BoxDecoration(
//                                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                                 color: Colors.black,
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(2.0),
//                                 child: InkWell(
//                                   onTap: (){
//                                     setState(() {
//                                       // clearValue();
//                                       handleSubmit();
//                                     });
//
//                                   },
//                                   child:  Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       _loaderState ? const CircularProgressIndicator(color: Colors.white,):
//                                       const Text( "Login",
//                                         style: TextStyle(
//                                             fontSize: 20,
//                                             color: Colors.white
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               )
//                           ),
//                         ),
//                       ],
//                     ),
//
//                     const SizedBox(
//                       height: 5.0,
//                     ),
//                     const SizedBox(
//                       height: 30.0,
//                     ),
//                     CommonShareWidget.flatTextButtonLogInUp(
//                         "Don't have an account?", "Sign up", () {
//                       FocusScope.of(context).requestFocus(FocusNode());
//                       CommonShareWidget.goToAnotherPage(
//                           nextPage: const SignupNewPage(), context: context);
//                     })
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 25,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//       // ),
//     );
//   }
//
//    bool validateForm() {
//     FocusScope.of(context).unfocus();
//     bool isValid = false;
//     if (_formKey.currentState!.validate()) {
//       if (_controllerEmail.text.isEmpty) {
//         CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 2,
//             message: "Please Enter email");
//       }
//   else if (_controllerPassword.text.isEmpty){
//   CommonShareWidget.showFlushBar(
//   context: context,
//   duration: 2,
//   message: "Please Enter Password");
//   }       else {
//         isValid = true;
//       }
//       if (kDebugMode) {
//         print('=====isValid---$isValid');
//       }
//     }
//     return isValid;
//   }
//   handleSubmit() async {
//     if (validateForm() != true) {
//       return;
//     }
//     if (mounted)
//     {
//
//       setState(() {
//         // Provider.of<LoaderProvider>(context, listen: false).loading(true);
//         _loaderState = true;
//       });
//     }
//
//     try
//     {
//       await Provider.of<LoginSignupRepo>(context, listen: false)
//           .signIn(
//           email: _controllerEmail.text.trim(), password: _controllerPassword.text.trim())
//           .then((onValue) async
//       {
//         if (mounted)
//         {
//           setState(() {
//             _loaderState = false;
//           });
//         }
//         // Navigator.of(context).popUntil(ModalRoute.withName('/'));
//         final String? uid = FirebaseAuth.instance.currentUser?.uid;
//         final userData = await FirebaseFirestore.instance.collection("users").doc(uid).get();
//         if(userData.exists){
//           await Preferences.saveUserData(userData.data());
//         }
//         if (kDebugMode) {
//           print("user id in login--$uid");
//           print("user data in updateUserInfo--${userData.data()?.isNotEmpty}");
//
//         }
//
//         if(uid!.isNotEmpty)
//         {
//           if (FirebaseAuth.instance.currentUser!.emailVerified          )
//
//           {
//             await   FirebaseFirestore.instance.collection('users').where('uid', isEqualTo: uid )
//                 .get().then((value)
//             {
//               if(value.docs.isNotEmpty)
//               {
//                 setState(() {
//                   checkCurrentuser = true;
//
//                 });
//                 if (kDebugMode) {
//                   print("=========user check ${checkCurrentuser.toString()}");
//                 }
//               }
//             });
//             // clearValue();
//
//             if(checkCurrentuser == true)
//             {
//               clearValue();
//               if (kDebugMode) {
//                 print("=========user check true condition ====${checkCurrentuser.toString()}");
//               }
//               Navigator.pushAndRemoveUntil(
//                   context, MaterialPageRoute(builder: (_) => const HomePage()), (
//                   route) => false);
//
//             } else
//             {
//               clearValue();
//               if (kDebugMode) {
//                 print("=========user check falses condition ====${checkCurrentuser.toString()}");
//               }
//               Provider.of<LoaderProvider>(context, listen: false).loading(false);
//               Navigator.push(context, MaterialPageRoute(builder: (_) =>
//               const UserInputDetailsPage()
//               ));
//             }
//           }
//           else if (!FirebaseAuth.instance.currentUser!.emailVerified) {
//             Navigator.push(context, MaterialPageRoute(
//                 builder: (_)=>
//                     EmailVerificationScreen(email: _controllerEmail.text.toString(),
//                     )
//             )
//             );
//             CommonShareWidget.showFlushBar(
//                 context: context,
//                 duration: 2,
//                 message: "Please verify your email on link");
//           }
//         }
//         else{
//           CommonShareWidget.showFlushBar(
//               context: context,
//               duration: 2,
//               message: "Please Sign up first");
//         }
//       }
//       );
//
//     }
//     on FirebaseAuthException catch (error)
//     {
//       if (mounted) {
//         setState(() {
//           _loaderState = false;
//         });
//       }
//       clearValue();
//
//       if (kDebugMode) {
//         print("error on login page= ${error.message}");
//       }
//       return CommonShareWidget.buildErrorDialog(context, error.message);
//
//     } on Exception catch (error) {
//       if (mounted) {
//         setState(() {
//           _loaderState = false;
//         });
//       }
//       clearValue();
//
//       if (kDebugMode) {
//         print("error on login page tostring= ${error.toString()}");
//       }
//       return CommonShareWidget.buildErrorDialog(context, error.toString());
//     }
//   }
//
//
//  clearValue() {
//     setState(() {
//       _loaderState = false;
//     });
//     Provider.of<LoaderProvider>(context, listen: false).loading(_loaderState);
//   }
// }
//
//
// class WaveClipper1 extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0.0, size.height - 50);
//
//     var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
//     var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//         firstEndPoint.dx, firstEndPoint.dy);
//
//     var secondEndPoint = Offset(size.width, size.height - 60);
//     var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
//     path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//         secondEndPoint.dx, secondEndPoint.dy);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
//
// class WaveClipper3 extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0.0, size.height - 50);
//
//     var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
//     var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//         firstEndPoint.dx, firstEndPoint.dy);
//
//     var secondEndPoint = Offset(size.width, size.height - 40);
//     var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
//     path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//         secondEndPoint.dx, secondEndPoint.dy);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
//
// class WaveClipper2 extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0.0, size.height - 50);
//
//     var firstEndPoint = Offset(size.width * .7, size.height - 40);
//     var firstControlPoint = Offset(size.width * .25, size.height);
//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//         firstEndPoint.dx, firstEndPoint.dy);
//
//     var secondEndPoint = Offset(size.width, size.height - 45);
//     var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
//     path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//         secondEndPoint.dx, secondEndPoint.dy);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
