// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/constant/colors.dart';
// import 'package:provider/provider.dart';
//
// import '../../admin/user_data.dart';
// import '../../bloc/date_time_provider.dart';
// import '../../constant/date_time.dart';
// import '../../constant/secondary_button.dart';
// import '../../validator/inputValidator.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
//
// class BookServicePage extends StatefulWidget {
//   const BookServicePage({super.key,
//     required this.serviceProviderId,
//     required this.userID,
//     required this.serviceProviderName,
//     required this.serviceType,
//   });
//   final String serviceProviderId;
//   final String userID;
//   final String serviceProviderName;
//   final String serviceType;
//
//   @override
//   State<BookServicePage> createState() => _BookServicePageState();
// }
// // appointment, userid+serviceproviderid, myBooking, datetime
// //user,docID,(sub collection) appointmentUser,
//
// class _BookServicePageState extends State<BookServicePage> {
//   String? selectedDate;
//   String? selectedTime;
//   DateTime date = DateTime.now();
//   DateTime time = DateTime.now();
//   final TextEditingController _controllerAppointmentDescription =
//   TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//
//   String? orderUserId ;
//
//   @override
//   Widget build(BuildContext context) {
//     DateTimeProvider provider = Provider.of<DateTimeProvider>(context);
//     selectedDate = provider.selectedDate;
//     selectedTime = provider.selectedTime;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("HI! ${UserProvider.userInfoModel?.name}",
//         style: TextStyle(
//           color: AppColor.orange,
//           fontWeight: FontWeight.bold
//         ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Center(
//                   child: Text("Book your appointment",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                       // color: Colors.orange
//                     ) ,
//                   ),
//                 ),
//
//                 const SizedBox(height: 30,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text("Date", style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold
//                     ),),
//                     const Spacer(),
//                     SecondaryButton(
//                       width: MediaQuery.of(context).size.width / 2.5,
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           child: Text(
//                               DateTimeClass.stringToddMMyyyy(selectedDate) ??
//                                   "Select Date"),
//                         ),
//                       ),
//                       onTap: () {
//                         // selectDate(context);
//                         Provider.of<DateTimeProvider>(context, listen: false).selectDate(context);
//
//                       },
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 30,),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text("Time", style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold
//                     ),),
//                     const Spacer(),
//                     SecondaryButton(
//                       width: MediaQuery.of(context).size.width / 2.5,
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           child: Text(
//                               DateTimeClass.timeToHHMMA(selectedTime) ??
//                                   "Select Time"),
//                         ),
//                       ),
//                       onTap: () {
//                         // selectTime();
//                         Provider.of<DateTimeProvider>(context, listen: false).selectTime(context);
//                       },
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(height: 30,),
//
//                 TextFormField(
//                   onChanged: (String value) {},
//                   cursorColor: Colors.deepOrange,
//                   controller: _controllerAppointmentDescription,
//                   keyboardType: TextInputType.text,
//                   validator: (value) {
//                     return InputValidator.emptyTextvalidator(
//                         value!, "Book appointment");
//                   },
//                   decoration: const InputDecoration(
//                     hintText: "Enter your Query",
//                     prefixIcon: Icon(
//                       Icons.description,
//                       color: Colors.indigoAccent,
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 30,),
//                 ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       minimumSize: const Size.fromHeight(50), // NEW
//                     ),
//                     onPressed: ()
//                     {
//                       formSubmit(widget.serviceProviderId.toString());
//                     }, child: const Text("Ok",
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
//     );
//   }
//
//   formSubmit(String serviceProviderID) async {
//   if (validateForm() != true) {
//     return;}
//
//  final appointmentId = DateTime.now().millisecondsSinceEpoch.toString();
//
//  FirebaseFirestore.instance
//         .collection("appointment")
//         .doc(appointmentId)
//         .set({
//             "appointmentID" : appointmentId,
//             "userID": widget.userID,
//             "professionalID": widget.serviceProviderId,
//             "serviceProviderName": widget.serviceProviderName,
//              "userName": UserProvider.userInfoModel?.name,
//             "serviceType": widget.serviceType,
//            "appointmentDate": selectedDate.toString() ,
//            "appointmentTime": selectedTime.toString(),
//            "description": _controllerAppointmentDescription.text,
//            "orderApprove": false,
//            "isOrderCompleted": false,
//         }).then((value) => {
//       // FirebaseFirestore.instance.collection('users').doc(widget.serviceProviderId).collection('my_Booked_users').doc(widget.userID).set({})
//     }
//     );
//     clearValue();
//     Navigator.pop(context);
//     CommonShareWidget.showFlushBar(
//         context: context,
//         duration: 2,
//         message: "Your appointment has been booked");
//   }
//
//
//
//   bool validateForm() {
//     FocusScope.of(context).unfocus();
//     bool isValid = false;
//       if (selectedDate == null) {
//         CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 2,
//             message: "Please select Date");
//       }
//       else if (selectedTime == null) {
//         CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 2,
//             message: "Please select Time");
//       } else if(_controllerAppointmentDescription.text.trim().isEmpty){
//         CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 2,
//             message: "Please write description");
//       }
//       else {
//         isValid = true;
//       }
//       if (kDebugMode) {
//         print('=====isValid---$isValid');
//       }
//     return isValid;
//   }
//
//   clearValue() {
//     setState(() {
//       _controllerAppointmentDescription.text = '';
//       selectedDate = null;
//       selectedTime = null;
//       Provider.of<DateTimeProvider>(context, listen: false).clearFunction(selectedDate ?? '', selectedTime ?? '');
//     });
//   }
//
//
//
// }
