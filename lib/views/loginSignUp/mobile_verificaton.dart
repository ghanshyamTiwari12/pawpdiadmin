// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/views/home/homePage.dart';
// import 'package:petfindernetwork/views/loginSignUp/users_details_inputpage.dart';
// import 'package:provider/provider.dart';
//
// import '../../bloc/loader_provider.dart';
// import '../../constant/colors.dart';
// import '../../repository/loginsignupRepo.dart';
// import '../../validator/inputValidator.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
//
// class MobileVerificationPage extends StatefulWidget {
//   const MobileVerificationPage({super.key, required this.verificationId,
//   required this.login,
//     required this.phoneNumber,
//     required this.phoneReverify
//
//   });
//
//   final String verificationId;
//   final bool login;
//   final String phoneNumber;
//   final bool phoneReverify;
//   @override
//   State<MobileVerificationPage> createState() => _MobileVerificationPageState();
// }
//
// class _MobileVerificationPageState extends State<MobileVerificationPage> {
//   final otpController = TextEditingController();
//   CountryCode countryCode = CountryCode.fromDialCode("+91");
//   bool loading = false;
//   final auth = FirebaseAuth.instance;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 32.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               'OTP Verification',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: AppColor.orange
//                 // color: AppColor.orange
//               ),
//             ),
//
//             // Icon(Icons.mobile_friendly, size: 35,),
//             const SizedBox(height: 50,),
//             Center(
//               child: TextFormField(
//                 controller: otpController,
//                 validator: InputValidator.passWordValidation,
//                 // validatePhoneNumber,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                   hintText: "Enter six digit code",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(30)),
//                   ),
//                 ),
//                               ),
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
//                     onPressed: () async{
//                       setState(() {
//                         loading = true;
//                         loader(loading);
//                       });
//
//                      var credential = await PhoneAuthProvider.credential(
//                           verificationId: widget.verificationId,
//                           smsCode: otpController.text.toString() );
//                      try {
//                        if(widget.login == true)
//                        {
//                          await auth.signInWithCredential(credential);
//                          setState(() {
//                            loading = false;
//                            loader(loading);
//                          });
//                          Provider.of<LoaderProvider>(context, listen: false).loading(false);
//                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) =>
//                          const HomePage() ), (route) => false);
//
//                        }
//                        else if(widget.phoneReverify == true){
//                          // User? user = FirebaseAuth.instance.currentUser;
//                          // UserCredential? result =
//                          // await user?.reauthenticateWithCredential(credential);
//                          // await result?.user?.delete();
//                          // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) =>
//                          // const LoginPage() ), (route) => false);
//                          await Provider.of<LoginSignupRepo>(context,
//                              listen: false)
//                              .deleteUserPhoneAuth(credential, context);
//                          Provider.of<LoaderProvider>(context, listen: false).loading(false);
//                        }
//                        else {
//                         // await auth.currentUser?.linkWithCredential(credential);
//                         //  final auth = FirebaseAuth.instance;
//                          await auth.signInWithCredential(credential);
//                         //  FirebaseAuth.instance.currentUser?.linkWithCredential(credential);
//                          setState(() {
//                            loading = false;
//                            loader(loading);
//                            Provider.of<LoaderProvider>(context, listen: false).loading(false);
//                          });
//                         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) =>
//                         const UserInputDetailsPage() ), (route) => false);
//                        }
//                      } catch(e){
//                        setState(() {
//                          loading = false;
//                          loader(loading);
//                        });
//                        CommonShareWidget.showFlushBar(
//                            context: context,
//                            duration: 2,
//                            message: "OTP Invalid");
//                      }
//                       },
//                     child: loading ? const CircularProgressIndicator(color: Colors.white,) : const Text("Verify",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 23,
//                           fontWeight: FontWeight.bold
//                       ),
//                     )),
//               ),
//             )
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   loader(bool status)
//   {
//     if(status == true)
//     {
//       const CircularProgressIndicator();
//     }
//
//
// }}
