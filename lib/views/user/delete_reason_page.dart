//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../admin/user_data.dart';
// import '../../bloc/loader_provider.dart';
// import '../../validator/inputValidator.dart';
// import '../loginSignUp/reauthentication_screen.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
//
// class DeleteReasonPage extends StatefulWidget {
//   const DeleteReasonPage({Key? key , required this.phone, required this.email}) : super(key: key);
//   final String email;
//   final String phone;
//   @override
//   State<DeleteReasonPage> createState() => _DeleteReasonPageState();
// }
//
// class _DeleteReasonPageState extends State<DeleteReasonPage> {
//  final TextEditingController _reasonForDeleteController = TextEditingController();
//   bool checkBoxValue1  = false;
//   bool checkBoxValue2  = false;
//   bool checkBoxValue3  = false;
//   bool checkBoxValue4  = false;
//   bool _loaderState = false;
//
//   @override
//   Widget build(BuildContext context) {
//     LoaderProvider loaderProvider = Provider.of<LoaderProvider>(context);
//     _loaderState = loaderProvider.isLoading;
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               // crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text("Please select a reason for deleting your account",
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blueAccent
//                   ),
//                   ),
//                 ),
//                 const SizedBox(height: 50,),
//                 Row(
//                   children: [
//                     Transform.scale(
//                       scale: 1.5,
//                       child: Checkbox(
//                         checkColor: Colors.white,
//                         activeColor: Colors.green,
//                         // shape: const CircleBorder(
//                         // ),
//                         value: checkBoxValue1,
//                         onChanged: (value) {
//                           setState(()  {
//                             checkBoxValue1 = value!;
//                             if(checkBoxValue1 == true){
//                               checkBoxValue2 = false;
//                               checkBoxValue3 = false;
//                               checkBoxValue4 = false;
//                             }
//                           });
//                         },
//                       ),
//                     ),
//                  const SizedBox(width: 10,),
//                  const Text("Not find what I am looking for",
//                  style: TextStyle(
//                    fontSize: 17,
//                     fontWeight: FontWeight.bold
//                  ),
//                  ),
//
//
//
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Transform.scale(
//                       scale: 1.5,
//                       child: Checkbox(
//                         checkColor: Colors.white,
//                         activeColor: Colors.green,
//                         // shape: const CircleBorder(
//                         // ),
//                         value: checkBoxValue2,
//                         onChanged: (value) {
//                           setState(() {
//                             checkBoxValue2 = value!;
//                             if(checkBoxValue2 == true){
//                               checkBoxValue1 = false;
//                               checkBoxValue3 = false;
//                               checkBoxValue4 = false;
//                             }
//                           });
//                         },
//                       ),
//                     ),
//                     const SizedBox(width: 10,),
//                     const Text("Dissatisfied with service",
//                       style: TextStyle(
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold
//                       ),
//                     ),
//                   ],
//
//                 ),
//                 Row(
//                   children: [
//                     Transform.scale(
//                       scale: 1.5,
//                       child: Checkbox(
//                         checkColor: Colors.white,
//                         activeColor: Colors.green,
//                         // shape: const CircleBorder(
//                         // ),
//                         value: checkBoxValue3,
//                         onChanged: (value) {
//                           setState(() {
//                             checkBoxValue3 = value!;
//                             if(checkBoxValue3 == true){
//                               checkBoxValue1 = false;
//                               checkBoxValue2 = false;
//                               checkBoxValue4 = false;
//                             }
//                           });
//                         },
//                       ),
//                     ),
//                     const SizedBox(width: 10,),
//
//                     const Text("Not found my lost pet",
//                       style: TextStyle(
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold
//                       ),
//                     ),
//
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Transform.scale(
//                       scale: 1.5,
//                       child: Checkbox(
//                         checkColor: Colors.white,
//                         activeColor: Colors.green,
//                         // shape: const CircleBorder(
//                         // ),
//                         value: checkBoxValue4,
//                         onChanged: (value) {
//                           setState(() {
//                             checkBoxValue4 = value!;
//                             if(checkBoxValue4 == true){
//                               checkBoxValue1 = false;
//                               checkBoxValue2 = false;
//                               checkBoxValue3 = false;
//                             }
//                           });
//                         },
//                       ),
//                     ),
//                     const SizedBox(width: 10,),
//                     const Text("Other",
//                       style: TextStyle(
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold
//                       ),
//                     ),
//
//
//
//                   ],
//                 ),
//                 const SizedBox(height: 20,),
//                 if(checkBoxValue4 == true)...[
//                   // TextField()
//                   TextFormField(
//                     onChanged: (String value) {},
//                     cursorColor: Colors.deepOrange,
//                     controller: _reasonForDeleteController,
//                     keyboardType: TextInputType.text,
//                     maxLength: 40,
//                     validator: (value) {
//                       return InputValidator.emptyTextvalidator(
//                           value!, "Enter Reason");
//                     },
//                     decoration: const InputDecoration(
//                       hintText: "Enter Reason to Delete",
//                       // prefixIcon: Icon(
//                       //   Icons.description,
//                       //   color: Colors.indigoAccent,
//                       // ),
//                     ),
//                   ),
//                 ],
//                 if(checkBoxValue4 == true)...[
//                   const SizedBox(height: 10,),
//                 ],
//                 ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       minimumSize: const Size.fromHeight(50), // NEW
//                     ),
//                     onPressed: ()
//                     {
//                       if(checkBoxValue1 == true){
//                         deleteReasonUpdate("Not find what I am looking for", context);
//
//
//                       } else if(checkBoxValue2 == true){
//                         deleteReasonUpdate("Dissatisfied with service", context);
//
//                       } else if(checkBoxValue3 == true){
//                         deleteReasonUpdate("Not found my lost pet", context);
//                       } else if(checkBoxValue4 == true) {
//                         deleteReasonUpdate(_reasonForDeleteController.text.toString(), context);
//                       } else
//                       {
//                     CommonShareWidget.showFlushBar(
//                     context: context,
//                     duration: 2,
//                     message: "Please Select one of the Reason");
//                     }
//
//                     }, child: _loaderState ? const Center(child: CircularProgressIndicator()): const Text("Submit",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 23,
//                       fontWeight: FontWeight.bold
//                   ),
//                 )),
//               ],
//             ),
//           ),
//         ),
//       ),
//
//     );
//
//
//   }
//
//  deleteReasonUpdate(String reason, context) async {
//    String? uid = UserProvider.userInfoModel?.uid;
//    String? name = UserProvider.userInfoModel?.name;
//    String? address = UserProvider.userInfoModel?.address;
//    String? phone = UserProvider.userInfoModel?.phone;
//    String? email = UserProvider.userInfoModel?.email;
//    Provider.of<LoaderProvider>(context, listen: false).loading(true);
//
//    try{
//      await FirebaseFirestore.instance
//          .collection("deletedUser")
//          .doc(uid)
//          .set({
//        "uid": uid,
//        "name": name,
//        "email": email,
//        "phone": phone,
//        "address": address,
//        "reason" : reason
//      }).then((value) => {
//      Navigator.push(context, MaterialPageRoute(builder: (_)=> const ReAuthenticationScreen()))
//
//
//        // Navigator.push(context, MaterialPageRoute(builder: (_)=> VerifyUserPage(phone: widget.phone, email: widget.email,)));
//
//      });
//      Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//      // user?.providerData[0].providerId;
//
//
//    } catch(e) {
//      CommonShareWidget.showFlushBar(
//          context: context,
//          duration: 2,
//          message: "Please select Reason");
//    }
//    Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//  }
// }
