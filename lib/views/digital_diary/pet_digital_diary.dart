// import 'dart:io';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
// import 'package:petfindernetwork/bloc/loader_provider.dart';
// import 'package:petfindernetwork/views/digital_diary/pet_activities.dart';
// import 'package:petfindernetwork/views/digital_diary/pet_reminder_new.dart';
// import 'package:provider/provider.dart';
// import 'package:velocity_x/velocity_x.dart';
// import '../../bloc/date_time_provider.dart';
// import '../../constant/colors.dart';
// import '../../constant/date_time.dart';
// import '../../constant/secondary_button.dart';
// import '../../helper/image_picker_helper.dart';
// import '../../model/activity_record_model.dart';
// import '../../repository/loginsignupRepo.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
//
// class PetDigitalDiary extends StatefulWidget {
//   const PetDigitalDiary({super.key, required this.uid, required this.petName, required this.petImage, required this.petID});
//   final String uid;
//   final String petName;
//   final String petImage;
//   final String petID;
//   @override
//   State<PetDigitalDiary> createState() => _PetDigitalDiaryState();
// }
//
// class _PetDigitalDiaryState extends State<PetDigitalDiary> {
//   // var size,height,width;
//   String? selectedDate;
//   String? selectedTime;
//   File? _imageProfile;
//   // List<File> images = <File>[];
//   TextEditingController descriptionCotroller = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   String? petActivityId ;
//   bool _loaderState = false;
//   // bool _imageLoader = false;
//
//   DateTime scheduleTime = DateTime.now();
//   // String? scheduleTime;
//
//   @override
//   void dispose() {
//     descriptionCotroller.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     var width = size.width;
//     var height = size.height;
//
//     return Scaffold(
//         appBar: AppBar(
//           // automaticallyImplyLeading: false,
//           // flexibleSpace: _appBar(height, width),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(20),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: height *0.30,
//                   width: width *0.70,
//                   child: Card(
//                     color: AppColor.transparentColor,
//                     elevation: 6,
//                     child: Stack(
//                     children: [
//                       Center(
//                         child: CircleAvatar(
//                           radius: height *0.30 *0.4,
//                           backgroundImage: CachedNetworkImageProvider(
//                             widget.petImage,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         left: width *0.70 *0.20,
//                         bottom: height *0.30 *0.02,
//                         child: Container(
//                           padding: const EdgeInsets.all(20),
//                           width: width *0.4,
//                           decoration: BoxDecoration(
//                             borderRadius: const BorderRadius.all(Radius.circular(20) ),
//                             color: Colors.transparent.withOpacity(0.5),
//                           ),
//                           child: Center(
//                             child: Text(
//                               widget.petName,
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               softWrap: true,
//                               style:  const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold
//                               ),
//                             ),
//                           ),
//
//                         )
//
//                       )
//                     ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 Card(
//                   color: AppColor.orange,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 20.0, top: 15.0, right: 20.0,
//                         bottom: 15.0),
//                     child: SizedBox(
//                         height: 50,
//                         width: width,
//                         child: InkWell(
//                           onTap:(){
//                             Navigator.push(context, MaterialPageRoute(builder: (_)=>
//                                 PetActivities(uid: widget.uid,
//                                   petName: widget.petName,
//                                   petImage: widget.petImage,
//                                   petId: widget.petID, )));},
//                           child: const Row(
//                             children: [
//                               Icon(Icons.pets_rounded),
//                               SizedBox(width: 25,),
//                               Text("Enter Pet Activities",
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 softWrap: true,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                     ),
//                   ),
//
//                 ),
//                 const SizedBox(height: 10,),
//                 Card(
//                   color: AppColor.orange,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 20.0, top: 15.0, right: 20.0,
//                         bottom: 15.0),
//                     child: InkWell(
//                       onTap: (){
//                         clearValue();
//                         bottomForm(width, context);
//                       },
//                       child: SizedBox(
//                           height: 50,
//                           width: width,
//                           child: const Row(
//                             children: [
//                               Icon(Icons.celebration),
//                               SizedBox(width: 25,),
//                               Text("Enter Pet Milestones",
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 softWrap: true,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ],
//                           )
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10,),
//                 Card(
//                   color: AppColor.orange,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 20.0, top: 15.0, right: 20.0,
//                         bottom: 15.0),
//                     child: SizedBox(
//                         height: 50,
//                         width: width,
//                         child: InkWell(
//                           onTap: (){
//                             clearValue();
//                             bottomImageCapture(width ,context);
//                           },
//                           child:   const Row(
//                             children: [
//                               Icon(Icons.image),
//                               SizedBox(width: 25,),
//                               Text("Add Images",
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 softWrap: true,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10,),
//                 Card(
//                   color: AppColor.orange,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 20.0, top: 15.0, right: 20.0,
//                         bottom: 15.0),
//                     child: SizedBox(
//                         height: 50,
//                         width: width,
//                         child:  InkWell(
//                           onTap: (){
//                             clearValue();
//                             bottomReminderForm(width);
//                           },
//                           child: const Row(
//                             children: [
//                               Icon(Icons.workspace_premium),
//                               SizedBox(width: 25,),
//                               Text("Set your Reminder",
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 softWrap: true,
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                     ),
//                   ),
//
//                 ),
//               ],
//             ),
//           ),
//         )
//     );
//
//   }
//
//   void bottomReminderForm(var width){
//     showModalBottomSheet(context: context,
//         // barrierColor: Colors.transparent,
//         // backgroundColor: Colors.blue.withOpacity(0.2),
//         barrierColor: Colors.transparent,
//         backgroundColor: AppColor.orange,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(30),
//               topRight: Radius.circular(30)
//           ),
//         ),
//         builder: (BuildContext context){
//           return Container(
//             height: 400,
//             width: width,
//             decoration:  BoxDecoration(
//               color: Colors.white.withOpacity(0.3),
//               borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30)
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Form(
//                 autovalidateMode: AutovalidateMode.always,
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 32),
//                       child: Material(
//                         elevation: 2.0,
//                         borderRadius: const BorderRadius.all(Radius.circular(30)),
//                         child: TextField(
//                           onChanged: (String value) {},
//                           cursorColor: Colors.deepOrange,
//                           controller: descriptionCotroller,
//                           keyboardType: TextInputType.text,
//                           decoration:  const InputDecoration(
//                             hintText: "Write message for reminder",
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 25, vertical: 13),
//                             enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.all(Radius.circular(30)),
//                                 borderSide: BorderSide(
//                                   width: 1,
//                                   color: Colors.black87,
//                                 )
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.all(Radius.circular(30)),
//                                 borderSide: BorderSide(
//                                   width: 0.5,
//                                   color: Colors.black87,
//                                 )
//                             ),
//                             errorBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.all(Radius.circular(30)),
//                                 borderSide: BorderSide(
//                                   width: 0.5,
//                                   color: Colors.black87,
//                                 )
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.all(Radius.circular(30)),
//                                 borderSide: BorderSide(
//                                   width: 0.5,
//                                   color: Colors.black87,
//                                 )
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 32),
//                           child: SecondaryButton(
//                             width: MediaQuery.of(context).size.width / 2,
//                             child: const Align(
//                               alignment: Alignment.centerLeft,
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 16.0),
//                                 child: Text( "Press here to select Date and Time"
//                                 ),
//                               ),
//                             ),
//                             onTap: () {
//                               // CupertinoDatePicker datePicker = CupertinoDatePicker(
//                               //   backgroundColor: Colors.red,
//                               //   minimumDate: DateTime(1950),
//                               //   initialDateTime: DateTime.now(),
//                               //   maximumDate: DateTime.now(),
//                               //   mode: CupertinoDatePickerMode.date,
//                               //   onDateTimeChanged: (date) {
//                               //     setState(() {
//                               //       // dob = "${date.day} / ${date.month} / ${date.year}";
//                               //       scheduleTime = date;
//                               //
//                               //     });
//                               //   },
//                               // );
//                               // showCupertinoModalPopup(
//                               //   context: context,
//                               //   builder: (context) {
//                               //     return Container(
//                               //       height: 300,
//                               //       width:MediaQuery.of(context).size.width,
//                               //       decoration: BoxDecoration(
//                               //         borderRadius: BorderRadius.all(Radius.circular(20))
//                               //       ),
//                               //       child: datePicker,
//                               //     );
//                               //   },
//                               // );
//
//                               DatePicker.showDateTimePicker(
//                                 context,
//                                 showTitleActions: true,
//                                 onChanged: (date) => scheduleTime = date,
//                                 onConfirm: (date) {},
//                               );
//                             },
//                           ),
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: 60,
//                               width: 60,
//                               decoration: BoxDecoration(
//                                   borderRadius: const BorderRadius.all(Radius.circular(7.0)),
//                                   color: Colors.white,
//                                   border: Border.all(
//                                       width: 1,
//                                       color: Colors.black
//                                   )
//                               ),
//                               child:  Center(child: Text('Date: ${scheduleTime.day}/${scheduleTime.month}/${scheduleTime.year}')),
//
//                             ),
//                             const SizedBox(height: 05,),
//                             Container(
//                               height: 60,
//                               width: 60,
//                               decoration: BoxDecoration(
//                                   borderRadius: const BorderRadius.all(Radius.circular(7.0)),
//                                   color: Colors.white,
//                                   border: Border.all(
//                                       width: 1,
//                                       color: Colors.black
//                                   )
//                               ),
//                               child:  Center(child: Text('Time: ${scheduleTime.hour}/${scheduleTime.minute}')),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                     const SizedBox(height: 30,),
//
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
//
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: InkWell(
//                                   onTap: (){
//                                     if( validateReminderForm(context) != true){
//                                       return;
//                                     }
//                                     debugPrint('Notification Scheduled for $scheduleTime');
//                                     LocalNotification.showScheduleNotification(title:widget.petName , body: descriptionCotroller.text,
//                                         scheduledNotificationDateTime: scheduleTime
//                                     );
//                                     if (kDebugMode) {
//                                       print('Reminder submit pressed');
//                                     }
//                                     clearValue();
//                                     Navigator.pop(context);
//                                   },
//                                   child: const Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(" Submit",
//                                         style: TextStyle(
//                                           fontSize: 20,
//                                           color: Colors.white
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               )
//                           ),
//                         ),
//                       ],
//                     ),
//
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.center,
//                     //   children: [
//                     //     Card(
//                     //       child: Container(
//                     //           height: 60,
//                     //           width: width /2,
//                     //           decoration: const BoxDecoration(
//                     //             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     //             color: Colors.black,
//                     //           ),
//                     //           child: Padding(
//                     //             padding: const EdgeInsets.all(2.0),
//                     //             child: InkWell(
//                     //               onTap: (){
//                     //                 // clearValue();
//                     //                 formSubmit("Milestone", context);
//                     //               },
//                     //               child:  Row(
//                     //                 mainAxisAlignment: MainAxisAlignment.center,
//                     //                 children: [
//                     //                   _loaderState ?
//                     //                   const CircularProgressIndicator(color: Colors.white,)
//                     //                       :  const Text( "Submit",
//                     //                     style:  TextStyle(
//                     //                         fontSize: 20,
//                     //                         color: Colors.white
//                     //                     ),
//                     //                   ),
//                     //                 ],
//                     //               ),
//                     //             ),
//                     //           )
//                     //       ),
//                     //     ),
//                     //   ],
//                     // ),
//
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
//
//
//   void bottomImageCapture(var width, context){
//     showModalBottomSheet(context: context,
//         barrierColor: Colors.transparent,
//         backgroundColor: AppColor.orange,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(30),
//               topRight: Radius.circular(30)
//           ),        ),
//         builder: (BuildContext context){
//           ImagePickerHelper  imageProvider = Provider.of<ImagePickerHelper>(context);
//           _imageProfile = imageProvider.imageProfile;
//           LoaderProvider loaderProvider = Provider.of<LoaderProvider>(context);
//           _loaderState = loaderProvider.isLoading;
//           return
//             Container(
//               height: 300,
//               width: width,
//               decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.3),
//                 borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30)
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Form(
//                   autovalidateMode: AutovalidateMode.always,
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         margin: const EdgeInsets.only(left: 32.0),
//                         child: Row(
//                           children: <Widget>[
//                             Container(
//                                 height: 60.0,
//                                 width: 60.0,
//                                 decoration: BoxDecoration(
//                                     shape: BoxShape.rectangle,
//                                     color: Colors.white,
//                                     border: Border.all(color: AppColor.blackColor),
//                                     borderRadius: BorderRadius.circular(15.0)),
//                                 child: InkWell(
//                                   child: _imageProfile == null
//                                       ? const Icon(Icons.add_a_photo)
//                                       : ClipRRect(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                     child: Image.file(
//                                       _imageProfile!,
//                                       fit: BoxFit.fill,
//                                     ),
//                                   ),
//                                   onTap: (){
//                                     ImagePickerHelper().getImage(true, context);
//                                   }
//                                       // getImage(true),
//                                 )),
//                             const SizedBox(
//                               width: 15.0,
//                             ),
//                             const Text('Add Images')
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 30,),
//
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Card(
//                             child: Container(
//                                 height: 60,
//                                 width: width /2,
//                                 decoration: const BoxDecoration(
//                                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                                   color: Colors.black,
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(2.0),
//                                   child: InkWell(
//                                     onTap: (){
//                                       formImageSubmit("images", context);
//                                     },
//                                     child:  Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                          _loaderState
//                                              ? const CircularProgressIndicator(color: Colors.white,)
//                                             :  const Text( "Submit",
//                                           style: TextStyle(
//                                             fontSize: 20,
//                                             color: Colors.white
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 )
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//         });
//   }
//
//
//   void bottomForm(var width, context){
//     showModalBottomSheet(context: context,
//         barrierColor: Colors.transparent,
//         backgroundColor: AppColor.orange,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(30),
//               topRight: Radius.circular(30)
//           ),
//         ),
//         builder: (BuildContext context){
//           DateTimeProvider provider = Provider.of<DateTimeProvider>(context);
//           selectedDate = provider.selectedDate;
//           ImagePickerHelper  imageProvider = Provider.of<ImagePickerHelper>(context);
//           _imageProfile = imageProvider.imageProfile;
//           LoaderProvider loaderProvider = Provider.of<LoaderProvider>(context);
//           _loaderState = loaderProvider.isLoading;
//           // _imageLoader = imageProvider.loaderState ?? false;
//           return
//             Container(
//               height: 500,
//               width: width,
//               decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.3),
//                 borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30)
//                 ),              ),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Form(
//                   autovalidateMode: AutovalidateMode.always,
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 32),
//                         child: SecondaryButton(
//                           width: MediaQuery.of(context).size.width / 2.5,
//                           child: Align(
//                             alignment: Alignment.centerLeft,
//                             child: Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                                 child: selectedDate.isNotEmptyAndNotNull ? Text(
//                                     DateTimeClass.stringToddMMyyyy(selectedDate!) ??
//                                         "Select Date"   ) :
//                                 const Text("Select Date")
//                               // Text(
//                               //     DateTimeClass.stringToddMMyyyy(selectedDate) ??
//                               //         "Select Date"),
//                             ),
//                           ),
//                           onTap: () {
//                             setState(() {
//                               Provider.of<DateTimeProvider>(context, listen: false).selecMilestonetDate(context);
//                               // selectDate(context);
//                               // Provider.of<DateTimeProvider>(context, listen: false).dateFunction(selectedDate ?? '');
//                             });
//                           },
//                         ),
//                       ),
//                       const SizedBox(height: 30,),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 32),
//                         child: Material(
//                           elevation: 2.0,
//                           borderRadius:  const BorderRadius.all(Radius.circular(30)),
//                           child: TextField(
//                             onChanged: (String value) {},
//                             cursorColor: Colors.deepOrange,
//                             controller: descriptionCotroller,
//                             keyboardType: TextInputType.text,
//                             decoration:   const InputDecoration(
//                               hintText: "Enter Description",
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 25, vertical: 13),
//                               enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.all(Radius.circular(30)),
//                                   borderSide: BorderSide(
//                                     width: 1,
//                                     color: Colors.black87,
//                                   )
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.all(Radius.circular(30)),
//                                   borderSide: BorderSide(
//                                     width: 0.5,
//                                     color: Colors.black87,
//                                   )
//                               ),
//                               errorBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.all(Radius.circular(30)),
//                                   borderSide: BorderSide(
//                                     width: 0.5,
//                                     color: Colors.black87,
//                                   )
//                               ),
//                               focusedErrorBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.all(Radius.circular(30)),
//                                   borderSide: BorderSide(
//                                     width: 0.5,
//                                     color: Colors.black87,
//                                   )
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 30,),
//                       Container(
//                         margin: const EdgeInsets.only(left: 32.0),
//                         child: Row(
//                           children: <Widget>[
//                             Container(
//                                 height: 60.0,
//                                 width: 60.0,
//                                 decoration: BoxDecoration(
//                                     shape: BoxShape.rectangle,
//                                     color: Colors.white,
//                                     border: Border.all(color: AppColor.blackColor),
//                                     borderRadius: BorderRadius.circular(15.0)),
//                                 child: InkWell(
//                                     child: _imageProfile == null
//                                         ? const Icon(Icons.add_a_photo)
//                                         : ClipRRect(
//                                       borderRadius: BorderRadius.circular(15.0),
//                                       child: Image.file(
//                                         _imageProfile!,
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                     onTap: (){
//                                       ImagePickerHelper().getImage(true, context);
//                                     }
//                                   // getImage(true),
//                                 )),
//                             const SizedBox(
//                               width: 15.0,
//                             ),
//                             const Text('Add Images')
//                           ],
//                         ),
//                       ),
//                      const SizedBox(height: 30,),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Card(
//                             child: Container(
//                                 height: 60,
//                                 width: width /2,
//                                 decoration: const BoxDecoration(
//                                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                                   color: Colors.black,
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(2.0),
//                                   child: InkWell(
//                                     onTap: (){
//                                       // clearValue();
//                                       formSubmit("Milestone", context);
//                                     },
//                                     child:  Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         _loaderState ?
//                                         const CircularProgressIndicator(color: Colors.white,)
//                                             :  const Text( "Submit",
//                                           style:  TextStyle(
//                                               fontSize: 20,
//                                               color: Colors.white
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 )
//                             ),
//                           ),
//                         ],
//                       ),
//
//           ],
//                   ),
//                 ),
//               ),
//             );
//         });
//   }
//
//   bool validateReminderForm(contex) {
//     FocusScope.of(context).unfocus();
//     bool isValid = false;
//     if (_formKey.currentState!.validate()) {
//       DateTime currentTime = DateTime.now();
//       if ((scheduleTime.day < currentTime.day)
//           ||(scheduleTime.day == currentTime.day && scheduleTime.hour < currentTime.hour)
//           ||((scheduleTime.day == currentTime.day && scheduleTime.hour == currentTime.hour) &&
//           scheduleTime.minute <= currentTime.minute
//           )
//       ) {
//         CommonShareWidget.showColorFlushBar(
//             context: context,
//             duration: 2,
//             message: "Please select correct Date and Time", color: Colors.black);
//       }
//       // else if (scheduleTime.day == currentTime.day && scheduleTime.hour < currentTime.hour) {
//       //   CommonShareWidget.showFlushBar(
//       //       context: context,
//       //       duration: 2,
//       //       message: "Please select correct Time");
//       // }
//       else if (descriptionCotroller.text.trim().isEmpty) {
//         CommonShareWidget.showColorFlushBar(
//             context: context,
//             duration: 2,
//             message: "Please write description", color: Colors.black);
//       }
//       else {
//         isValid = true;
//       }
//       if (kDebugMode) {
//         print('=====isValid---$isValid');
//       }
//     }
//     return isValid;
//   }
//
//   bool validateForm() {
//     FocusScope.of(context).unfocus();
//     bool isValid = false;
//     if (_formKey.currentState!.validate()) {
//       if (selectedDate == null) {
//         CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 2,
//             message: "Please select Date");
//       }
//       else if (descriptionCotroller.text.trim().isEmpty) {
//         CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 2,
//             message: "Please write description");
//       }
//       else if (_imageProfile == null) {
//         CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 2,
//             message: "please add image");
//       }
//       else {
//         isValid = true;
//       }
//       if (kDebugMode) {
//         print('=====isValid---$isValid');
//       }
//     }
//     return isValid;
//   }
//
//   bool validateImageForm(context) {
//     FocusScope.of(context).unfocus();
//     bool isValid = false;
//     if (_formKey.currentState!.validate()) {
//       if (_imageProfile == null) {
//         CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 2,
//             message: "please add image");
//       }
//       else {
//         isValid = true;
//       }
//       if (kDebugMode) {
//         print('=====isValid---$isValid');
//       }
//     }
//     return isValid;
//   }
//
//   formSubmit(String activityType, context) async {
//     if (validateForm() != true) {
//       return;
//     }
//     Provider.of<LoaderProvider>(context, listen: false).loading(true);
//
//     ActivityRecord? petActivityModel;
//
//     petActivityId = widget.uid + widget.petID;
//     String imageUrl = await LoginSignupRepo()
//         .uploadImage(_imageProfile!, widget.uid);
//     List<Map<String, dynamic>> milestone = [
//       {
//         "date": selectedDate.toString() ,
//         "description": descriptionCotroller.text,
//         "image": imageUrl,
//       },
//     ];
//     final petExistId = await FirebaseFirestore.instance.collection('petActivities').doc(petActivityId).get();
//
//     if(petExistId.exists){
//       petActivityModel = ActivityRecord.fromMap(petExistId.data());
//       var milestoneLength = petActivityModel.milestoneRecord?.length;
//       if (kDebugMode) {
//         print("=====milestoneLength--$milestoneLength");
//       }
//       if( milestoneLength! < 4){
//         await FirebaseFirestore.instance.collection("petActivities").doc(petActivityId).update(
//             {        "milestoneRecord": FieldValue.arrayUnion(milestone)
//             }
//         );
//         clearValue();
//         Navigator.pop(context);
//         CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 2,
//             message: "Your activities submitted");
//         Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//       } else{
//         clearValue();
//         Provider.of<LoaderProvider>(context, listen: false).loading(false);
//         Navigator.pop(context);
//         CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 2,
//             message: "Limit Over");
//       }
//       clearValue();
//     }
//
//     if(!petExistId.exists){
//       FirebaseFirestore.instance
//           .collection("petActivities")
//           .doc(petActivityId)
//           .set({
//         "id": petActivityId,
//         "userID": widget.uid,
//         "petName": widget.petName,
//         "milestoneRecord": milestone,
//       });
//       Provider.of<LoaderProvider>(context, listen: false).loading(false);
//       clearValue();
//       Navigator.pop(context);
//       CommonShareWidget.showFlushBar(
//           context: context,
//           duration: 2,
//           message: "Your activities submitted");
//     }
//   }
//
//   formImageSubmit(String activityType, context) async {
//     if (validateImageForm(context) != true) {
//       return;
//     }
//     Provider.of<LoaderProvider>(context, listen: false).loading(true);
//
//     ActivityRecord? petActivityModel;
//
//     petActivityId = widget.uid + widget.petID;
//     String imageUrl = await LoginSignupRepo()
//         .uploadImage(_imageProfile!, widget.uid);
//     if (kDebugMode) {
//       print('upload image in firestore---$imageUrl');
//     }
//
//     List<Map<String, dynamic>> petimages = [
//       {
//         "image": imageUrl,
//       },
//     ];
//
//     final petExistId = await FirebaseFirestore.instance.collection('petActivities').doc(petActivityId).get();
//
//     if(petExistId.exists)
//     {
//       petActivityModel = ActivityRecord.fromMap(petExistId.data());
//       var imageCount = petActivityModel.images?.length;
//
//       if (kDebugMode) {
//         print("=====imageCount--$imageCount");
//       }
//
//       if( imageCount! < 3){
//         await FirebaseFirestore.instance.collection("petActivities").doc(petActivityId).update(
//             {        "images": FieldValue.arrayUnion(petimages)
//             }
//         );
//         Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//        clearValue();
//         Navigator.pop(context);
//         CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 2,
//             message: "Your activities submitted");
//
//       } else{
//         Provider.of<LoaderProvider>(context, listen: false).loading(false);
//         clearValue();
//         Navigator.pop(context);
//         CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 2,
//             message: "Limit Over");
//       }
//       clearValue();
//     }
//
//     if(!petExistId.exists){
//       FirebaseFirestore.instance
//           .collection("petActivities")
//           .doc(petActivityId)
//           .set({
//         "id": petActivityId,
//         "userID": widget.uid,
//         "petName": widget.petName,
//         "images": petimages,
//       });
//       clearValue();
//       Provider.of<LoaderProvider>(context, listen: false).loading(false);
//       Navigator.pop(context);
//       CommonShareWidget.showFlushBar(
//           context: context,
//           duration: 2,
//           message: "Your activities submitted");
//     }
//   }
//
//   clearValue() {
//     setState(() {
//       descriptionCotroller.clear();
//       _loaderState = false;
//       selectedDate = null;
//       selectedTime = null;
//       Provider.of<DateTimeProvider>(context, listen: false).clearFunction(selectedDate ?? '', selectedTime ?? '');
//       Provider.of<ImagePickerHelper>(context, listen: false).imageClear();
//       Provider.of<LoaderProvider>(context, listen: false).loading(_loaderState);
//
//     });
//
//   }
//
// }
