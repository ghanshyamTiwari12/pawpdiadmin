// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/constant/colors.dart';
// import 'package:provider/provider.dart';
// import '../../bloc/loader_provider.dart';
// import '../../validator/inputValidator.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
// import 'mobile_verificaton.dart';
//
// class MobileInputPage extends StatefulWidget {
//   const MobileInputPage({super.key, required this.login});
// final bool login;
//   @override
//   State<MobileInputPage> createState() => _MobileInputPageState();
// }
//
// class _MobileInputPageState extends State<MobileInputPage> {
//   final phoneNumberController = TextEditingController();
//   CountryCode countryCode = CountryCode.fromDialCode("+91");
//   // bool loading = false;
//   final auth = FirebaseAuth.instance;
//    bool _loaderState = false;
//
//    @override
//    void initState(){
//      super.initState();
//    }
//   @override
//   void dispose() {
//     phoneNumberController.dispose();
//     _loaderState = false;
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     LoaderProvider loaderProvider = Provider.of<LoaderProvider>(context);
//     _loaderState = loaderProvider.isLoading;
//     return Scaffold(
//      body: Padding(
//        padding: const EdgeInsets.symmetric(horizontal: 32.0),
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: [
//            Text(
//              'Mobile Verification',
//              textAlign: TextAlign.center,
//              style: TextStyle(
//                  fontSize: 32,
//                  fontWeight: FontWeight.bold,
//                  color: AppColor.orange
//                // color: AppColor.orange
//              ),
//            ),
//
//            // Icon(Icons.mobile_friendly, size: 35,),
// const SizedBox(height: 50,),
//            Center(
//              child: TextFormField(
//                controller: phoneNumberController,
//                validator: InputValidator.validateMobile,
//                // validatePhoneNumber,
//                autovalidateMode: AutovalidateMode.onUserInteraction,
//                keyboardType: TextInputType.number,
//                decoration: InputDecoration(
//                  hintText: "Enter your Moblie No",
//                  //prefixIcon: Icon(Icons.call),
//                  prefixIcon: CountryCodePicker(
//                    onChanged: (value) {
//                      setState(() {
//                        countryCode = value;
//                      });
//                    },
//                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
//                    initialSelection: 'IN',
//                    favorite: const ['+91', 'IN'],
//                    // optional. Shows only country name and flag
//                    showCountryOnly: false,
//                    // boxDecoration: const BoxDecoration(
//                    //   color: Colors.orange
//                    // ),
//                    backgroundColor: Colors.black,
//                    // optional. Shows only country name and flag when popup is closed.
//                    showOnlyCountryWhenClosed: false,
//                    // optional. aligns the flag and the Text left
//                    alignLeft: false,
//
//                  ),
//                  border: const OutlineInputBorder(
//                    borderRadius: BorderRadius.all(Radius.circular(30)),
//
//                  ),
//                ),
//                // decoration: inputDecoration(
//                //   icon: Icons.call,
//                //   hintText: "Phone Number",
//                // ),
//              ),
//            ),
//           const SizedBox(height: 30,),
//            Padding(
//              padding: const EdgeInsets.symmetric(horizontal: 32.0),
//              child: Center(
//                child: ElevatedButton(
//                    style: ElevatedButton.styleFrom(
//                      backgroundColor: Colors.black,
//                      minimumSize: const Size.fromHeight(50), // NEW
//                    ),
//                    onPressed: () async {
//                      Provider.of<LoaderProvider>(context, listen: false).loading(true);
//
//                      if(phoneNumberController.text.trim().length == 10)
//                      {
//
//                        if(widget.login == true)
//                      {
//                        await  FirebaseFirestore.instance.collection('users').
//                        where('phone', isEqualTo: countryCode.dialCode! + phoneNumberController.text.trim())
//                            .get().then((value)
//                        async {
//                              if (kDebugMode) {
//                                print("value of doc in mobile input page: ${value.docs.length}");
//                              }
//                              if(value.docs.isNotEmpty)
//                                {
//                                await  auth.verifyPhoneNumber
//                                    (
//                                    phoneNumber: countryCode.dialCode! + phoneNumberController.text.trim(),
//
//                                    // phoneNumber: countryCode.dialCode! + phoneNumberController.text.trim(),
//                                      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async
//                                      {
//                                         // await auth.signInWithCredential(phoneAuthCredential);
//                                      },
//                                      verificationFailed: (e){
//                                        CommonShareWidget.showFlushBar(
//                                            context: context,
//                                            duration: 2,
//                                            message: "Verification failed");
//
//                                        Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//                                        // setState(() {
//                                        //   loading = false;
//                                        //   loader(loading);
//                                        // });
//                                      },
//                                      codeSent: (String verificationId, int? token){
//                                          Navigator.push(context, MaterialPageRoute(builder: (_) => MobileVerificationPage(
//                                          verificationId: verificationId,
//                                          login: widget.login,
//                                          phoneNumber: countryCode.dialCode! + phoneNumberController.text.trim(),
//                                          phoneReverify: false,
//
//                                        )));
//                                          Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//                                        // setState(() {
//                                        //   loading = false;
//                                        //   loader(loading);
//                                        // });
//                                      },
//                                      codeAutoRetrievalTimeout: (String verificationId){
//                                        verificationId = verificationId;
//                                        // CommonShareWidget.showFlushBar(
//                                        //     context: context,
//                                        //     duration: 2,
//                                        //     message: "Time out");
//                                        // setState(() {
//                                        //   loading = false;
//                                        //   loader(loading);
//                                        // });
//                                        // Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//                                      }
//                                      );
//                              }
//                              else {
//                                // setState(() {
//                                //   loading = false;
//                                //   loader(loading);
//                                // });
//                                // Provider.of<LoaderProvider>(context, listen: false).loading(false);
//                                //
//                                // CommonShareWidget.goToAnotherPage(
//                                //   nextPage: const LoginWithEmail(),
//                                //   context: context,
//                                // );
//                                // CommonShareWidget.showFlushBar(
//                                //     context: context,
//                                //     duration: 2,
//                                //     message: "Please Login using Email");
//
//                                await  auth.verifyPhoneNumber
//                                  (
//                                    phoneNumber: countryCode.dialCode! + phoneNumberController.text.trim(),
//
//                                    // phoneNumber: countryCode.dialCode! + phoneNumberController.text.trim(),
//                                    verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async
//                                    {
//                                      // await auth.signInWithCredential(phoneAuthCredential);
//                                    },
//                                    verificationFailed: (e){
//                                      CommonShareWidget.showFlushBar(
//                                          context: context,
//                                          duration: 2,
//                                          message: "Verification failed");
//
//                                      Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//                                      // setState(() {
//                                      //   loading = false;
//                                      //   loader(loading);
//                                      // });
//                                    },
//                                    codeSent: (String verificationId, int? token){
//                                      Navigator.push(context, MaterialPageRoute(builder: (_) => MobileVerificationPage(
//                                        verificationId: verificationId,
//                                        login: false,
//                                        phoneNumber: countryCode.dialCode! + phoneNumberController.text.trim(),
//                                        phoneReverify: false,
//
//                                      )));
//                                      Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//                                      // setState(() {
//                                      //   loading = false;
//                                      //   loader(loading);
//                                      // });
//                                    },
//                                    codeAutoRetrievalTimeout: (String verificationId){
//                                      verificationId = verificationId;
//                                      // CommonShareWidget.showFlushBar(
//                                      //     context: context,
//                                      //     duration: 2,
//                                      //     message: "Time out");
//                                      // setState(() {
//                                      //   loading = false;
//                                      //   loader(loading);
//                                      // });
//                                      // Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//                                    }
//                                );
//                              }
//                        });
//                         }
//                        else{
//                       await  FirebaseFirestore.instance.collection('users').where('phone', isEqualTo: countryCode.dialCode! + phoneNumberController.text.trim())
//                           .get().then((value)
//                       {
//                         if(value.docs.isNotEmpty){
//                           CommonShareWidget.showFlushBar(
//                               context: context,
//                               duration: 2,
//                               message: "Phone number already exist");
//                           Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//                           // setState(() {
//                           //   loading = false;
//                           //   loader(loading);
//                           // });
//                         }
//                         else
//                         {
//                           auth.verifyPhoneNumber
//                             (
//                               phoneNumber: countryCode.dialCode! + phoneNumberController.text.trim(),
//                               verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async
//                               {
//                                 // await auth.signInWithCredential(phoneAuthCredential);
//                               },
//                               verificationFailed: (e){
//                                 CommonShareWidget.showFlushBar(
//                                     context: context,
//                                     duration: 2,
//                                     message: "Verification failed");
//                                 Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//                                 // setState(() {
//                                 //   loading = false;
//                                 //   loader(loading);
//                                 // });
//                               },
//                               codeSent: (String verificationId, int? token){
//                                 Navigator.push(context, MaterialPageRoute(builder: (_) => MobileVerificationPage(
//                                   verificationId: verificationId,
//                                   login: widget.login,
//                                   phoneNumber: countryCode.dialCode! + phoneNumberController.text.trim(),
//                                   phoneReverify: false,
//                                 )));
//                                 Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//                                 // setState(() {
//                                 //   loading = false;
//                                 //   loader(loading);
//                                 // });
//                               },
//                               codeAutoRetrievalTimeout: (String verificationId){
//                                 verificationId = verificationId;
//
//                                 // CommonShareWidget.showFlushBar(
//                                 //     context: context,
//                                 //     duration: 2,
//                                 //     message: "Time out");
//                                 // Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//                                 // setState(() {
//                                 //   loading = false;
//                                 //   loader(loading);
//                                 // });
//                               }
//                               );
//                         }
//                         // Navigator.push(context, MaterialPageRoute(builder: (_) =>
//                         // MobileVerificationPage(verificationId: '', login: widget.login,)
//                         // ));
//                       });
//
//                     }
//
//
//                      }
//                      else
//                      {
//                        CommonShareWidget.showFlushBar(
//                            context: context,
//                            duration: 2,
//                            message: "Please provide Mobile number");
//                        Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//                        // setState(() {
//                        //   loading = false;
//                        //   loader(loading);
//                        // });
//                      }
//                      Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//                      // setState(() {
//                      //   loading = false;
//                      //   loader(loading);
//                      // });
//                    } ,
//
//                    child:  _loaderState ? const CircularProgressIndicator(color: Colors.white) : const Text("OK",
//                      style: TextStyle(
//                          color: Colors.white,
//                          fontSize: 23,
//                          fontWeight: FontWeight.bold
//                      ),
//                    )),
//              ),
//            )
//
//          ],
//        ),
//      )
//       ,
//     );
//
//   }
// // checkPhonenumber(){
// // var length ;
// // FirebaseFirestore.instance.collection('users').where('phone', isEqualTo: countryCode.dialCode! + phoneNumberController.text.trim())
// //       .snapshots();
// //
// // }
// //   Stream<QuerySnapshot> checkPhonenumber() {
// //   FirebaseFirestore.instance.collection('users').where('phone', isEqualTo: countryCode.dialCode! + phoneNumberController.text.trim())
// //         .get().then((value){
// //
// //   });
// //
// //     // return db
// //     //     .collection('pendingBlockList')
// //     //     .where('claim_id', isEqualTo: uid)
// //     //     .where('block_id', isEqualTo: blocID)
// //     //     .snapshots();
// //   }
//
//   loader(bool status){
//     if(status == true){
//       const CircularProgressIndicator();
//     }
//
//   }
// }
