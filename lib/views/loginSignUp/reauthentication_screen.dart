// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../bloc/loader_provider.dart';
// import '../../constant/colors.dart';
// import '../../repository/loginsignupRepo.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
// import 'mobile_verificaton.dart';
//
// class ReAuthenticationScreen extends StatefulWidget {
//   const ReAuthenticationScreen({super.key});
//
//   @override
//   State<ReAuthenticationScreen> createState() => _ReAuthenticationScreenState();
// }
//
// class _ReAuthenticationScreenState extends State<ReAuthenticationScreen> {
//   final _auth = FirebaseAuth.instance;
//   final _user = FirebaseAuth.instance.currentUser;
//   bool _loaderState = false;
//   final TextEditingController _controllerPassword = TextEditingController();
//   bool passwordVisible = false;
//   late String providerId;
//
//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       providerId = _user!.providerData[0].providerId;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 30.0),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 200,
//               width: double.maxFinite,
//             ),
//             const Padding(
//               padding: EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
//               child: Center(
//                 child: Text("Please verify yourself",
//                   style: TextStyle(
//                       fontSize: 25,
//                     fontWeight: FontWeight.bold
//                   ),
//
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             deleteMethod(context),
//             const SizedBox(height: 50),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget deleteMethod(context) {
//     if (providerId == "phone") {
//        return phoneReverify(context);
//     } else if (providerId == "password") {
//       // WidgetsBinding.instance.addPostFrameCallback((_){
//       //   Navigator.push(context, MaterialPageRoute(builder: (_) => UserEmailReverify(phone: FirebaseAuth.instance.currentUser!.phoneNumber.toString(),
//       //       email: _auth.currentUser!.email.toString())));
//       // });
//
//       return emailReverify(context);
//     }
//     else {
//       return const SizedBox();
//     }
//   }
//
//
//
//   Widget phoneReverify(context, ){
//     final formKey = GlobalKey<FormState>();
//     final size = MediaQuery.of(context).size;
//     var width = size.width;
//     // bool loaderState = false;
//     final auth = FirebaseAuth.instance;
//     // bool loading = false;
//     LoaderProvider loaderProvider = Provider.of<LoaderProvider>(context);
//     _loaderState = loaderProvider.isLoading;
//
//     return Column(
//       children: [
//         Form(
//           autovalidateMode: AutovalidateMode.always,
//           key: formKey,
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
//                 Text(_auth.currentUser?.phoneNumber.toString() ?? '',
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
//                                     phoneNumber: _auth.currentUser?.phoneNumber.toString(),
//                                     verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async
//                                     {
//                                       // await auth.signInWithCredential(phoneAuthCredential);
//                                     },
//                                     verificationFailed: (e){
//                                       CommonShareWidget.showFlushBar(
//                                           context: context,
//                                           duration: 2,
//                                           message: "Verification failed");
//                                       Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//                                     },
//                                     codeSent: (String verificationId, int? token) async {
//                                       Provider.of<LoaderProvider>(context, listen: false).loading(false);
//                                       Navigator.push(context, MaterialPageRoute(builder: (_) => MobileVerificationPage(
//                                         verificationId: verificationId,
//                                         login: false,
//                                         phoneNumber: _auth.currentUser?.phoneNumber.toString().toString() ?? '', phoneReverify: true,
//
//                                       )));
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
//                                 Provider.of<LoaderProvider>(context, listen: false).loading(false);
//                               },
//                               child:  Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   _loaderState ? const CircularProgressIndicator(color: Colors.white,):
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
// Widget emailReverify(context){
//   final formKey = GlobalKey<FormState>();
//   final size = MediaQuery.of(context).size;
//   var width = size.width;
//   LoaderProvider loaderProvider = Provider.of<LoaderProvider>(context);
//   _loaderState = loaderProvider.isLoading;
//    return Column(
//      children: [
//        Form(
//          autovalidateMode: AutovalidateMode.always,
//          key: formKey,
//          child: SingleChildScrollView(
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[
//                const SizedBox(
//                  height: kToolbarHeight,
//                ),
//
//                Text("Hi, Your Email Id:",
//                  style: TextStyle(
//                      fontSize: 25,
//                      color: AppColor.orange,
//                      fontWeight: FontWeight.bold
//                  ),
//                ),
//                const SizedBox(height: 10,),
//                Text(_auth.currentUser?.email.toString() ?? '',
//                  style: const TextStyle(
//                      fontSize: 17,
//                      fontWeight: FontWeight.bold
//                  ),
//                ),
//                const SizedBox(
//                  height: 50,
//                ),
//                Padding(
//                  padding: const EdgeInsets.symmetric(horizontal: 32),
//                  child: Material(
//                    elevation: 2.0,
//                    borderRadius:
//                    const BorderRadius.all(Radius.circular(30)),
//                    child: TextField(
//                      onChanged: (String value) {},
//                      cursorColor: Colors.deepOrange,
//                      controller: _controllerPassword,
//                      keyboardType: TextInputType.visiblePassword,
//                      obscureText: passwordVisible,
//                      decoration:  InputDecoration(
//                          hintText: "Please Enter Password",
//                          prefixIcon: const Material(
//                            elevation: 0,
//                            borderRadius:
//                            BorderRadius.all(Radius.circular(30)),
//                            child: Icon(
//                              Icons.lock,
//                              color: Colors.green,
//                            ),
//                          ),
//                          suffixIcon: IconButton(
//                              icon: Icon(
//                                passwordVisible ? Icons.visibility_off : Icons.visibility,
//                              ),
//                              onPressed: (){
//                                setState(() {
//                                  passwordVisible = !passwordVisible;
//                                });
//                              }
//                          ),
//                          border: InputBorder.none,
//                          contentPadding: const EdgeInsets.symmetric(
//                              horizontal: 25, vertical: 13)),
//                    ),
//                  ),
//                ),
//
//                const SizedBox(
//                  height: 20.0,
//                ),
//                const SizedBox(
//                  height: 1.0,
//                ),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: [
//                    Card(
//                      child: Container(
//                          height: 60,
//                          width: width /2,
//                          decoration: const BoxDecoration(
//                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                            color: Colors.black,
//                          ),
//                          child: Padding(
//                            padding: const EdgeInsets.all(2.0),
//                            child: InkWell(
//                              onTap: () async {
//
//                                await Provider.of<LoginSignupRepo>(context,
//                                    listen: false)
//                                    .deleteUser(_auth.currentUser?.email.toString() ?? '', _controllerPassword.text, context);
//
//                              },
//                              child:  Row(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: [
//                                  _loaderState ? const CircularProgressIndicator(color: Colors.white,):
//                                  const Text( "Submit",
//                                    style: TextStyle(
//                                        fontSize: 20,
//                                        color: Colors.white
//                                    ),
//                                  )
//                                ],
//                              ),
//                            ),
//                          )
//                      ),
//                    ),
//                  ],
//                ),
//
//                const SizedBox(
//                  height: 30.0,
//                ),
//              ],
//            ),
//          ),
//        ),
//
//      ],
//    );
//
// }
//
// }
