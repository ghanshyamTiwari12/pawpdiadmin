//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../bloc/loader_provider.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
// import 'login.dart';
// import 'login_with_email.dart';
// import 'moblie_input_page.dart';
// import 'new_singn_UP.dart';
//
//
// class SignUpFirstPage extends StatefulWidget {
//   const SignUpFirstPage({super.key});
//
//   @override
//   State<SignUpFirstPage> createState() => _SignUpFirstPageState();
// }
//
// class _SignUpFirstPageState extends State<SignUpFirstPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//
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
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text("Pet",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                   // fontStyle: FontStyle.italic ,
//                                   fontSize: 40
//                               ),
//                             ),
//                             Text("finder",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.orange,
//                                   // fontStyle: FontStyle.italic ,
//                                   fontSize: 40
//                               ),
//                             ),
//                           ],
//                         ),
//
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 30,),
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 32.0),
//               child: Center(
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       minimumSize: const Size.fromHeight(50), // NEW
//                     ),
//                     onPressed: (){
//                       Provider.of<LoaderProvider>(context, listen: false).loading(true);
//                       CommonShareWidget.goToAnotherPage(
//                         nextPage: const SignupNewPage(),
//                         context: context,
//                       );
//                     },
//                     child: const Text("Sign Up with Email",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 23,
//                         // fontWeight: FontWeight.bold
//                       ),
//                     )),
//               ),
//             ),
//             const SizedBox(height: 30,),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 32.0),
//               child: Center(
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       minimumSize: const Size.fromHeight(50), // NEW
//                     ),
//                     onPressed: (){
//                       Provider.of<LoaderProvider>(context, listen: false).loading(false);
//                       Navigator.push(context, MaterialPageRoute(builder: (_) =>
//                       const MobileInputPage(login: true)));
//                     },
//                     child: const Text("Sign Up Using Mobile",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 23,
//                         // fontWeight: FontWeight.bold
//                       ),
//                     )),
//               ),
//             ),
//
//             const SizedBox(
//               height: 50.0,
//             ),
//             CommonShareWidget.flatTextButtonLogInUp(
//                 "Already have an account?", "Sign in", () {
//               FocusScope.of(context).requestFocus(FocusNode());
//               CommonShareWidget.goToAnotherPage(
//                 nextPage: const LoginPage(),
//                 context: context,
//               );
//             }),
//             // CommonShareWidget.flatTextButtonLogInUp(
//             //     "Don't have an account?", "Sign up", () {
//             //   FocusScope.of(context).requestFocus(FocusNode());
//             //   CommonShareWidget.goToAnotherPage(
//             //       nextPage: const SignupNewPage(), context: context);
//             // }),
//
//             const SizedBox(height: 50.0),
//             // Wrap(
//             //   alignment: WrapAlignment.center,
//             //   children: [
//             //     const Text("By "),
//             //     const Text("continue "),
//             //     const Text("I "),
//             //     const Text("agree "),
//             //     const Text("to "),
//             //     InkWell(
//             //       onTap: () {
//             //         launchUrlString(
//             //           privacyPolicyUrl,
//             //           mode: LaunchMode.externalApplication,
//             //         );
//             //       },
//             //       child: const Text(
//             //         "privacy policy ",
//             //         style: TextStyle(
//             //           color: Colors.blue,
//             //         ),
//             //       ),
//             //     ),
//             //     const Text("and "),
//             //     InkWell(
//             //       onTap: () {
//             //         launchUrlString(
//             //           termsAndConditionsUrl,
//             //           mode: LaunchMode.externalApplication,
//             //         );
//             //       },
//             //       child: const Text(
//             //         "terms & conditions",
//             //         style: TextStyle(
//             //           color: Colors.blue,
//             //         ),
//             //       ),
//             //     ),
//             //   ],
//             // ),
//             // const SizedBox(height: 10.0),
//             //       ],
//             //     ),
//             //   ),
//             // // ),
//             // const SizedBox(
//             //   height: 25,
//             // ),
//             // const SizedBox(
//             //   height: 20,
//             // ),
//           ],
//         ),
//       ),
//
//     );
//   }
// }
