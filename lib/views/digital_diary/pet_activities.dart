// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:velocity_x/velocity_x.dart';
// import '../../bloc/date_time_provider.dart';
// import '../../constant/colors.dart';
// import '../../constant/date_time.dart';
// import '../../constant/secondary_button.dart';
// import '../../model/activity_record_model.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
//
// class PetActivities extends StatefulWidget {
//   const PetActivities({super.key,
//     required this.uid,
//     required this.petName,
//     required this.petImage,
//     required this.petId
//   });
//   final String uid;
//   final String petName;
//   final String petImage;
//   final String petId;
//
//   @override
//   State<PetActivities> createState() => _PetActivitiesState();
// }
//
// class _PetActivitiesState extends State<PetActivities> {
//   final _formKey = GlobalKey<FormState>();
//   final fireStore =  FirebaseFirestore.instance.collection('petActivities').snapshots();
//   CollectionReference ref = FirebaseFirestore.instance.collection('petActivities');
//   bool loaderState = false;
//   String? selectedDate;
//   String? selectedTime;
//   DateTime date = DateTime.now();
//   DateTime time = DateTime.now();
//   String? petActivityId ;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     var width = size.width;
//      return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Pet Activities'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               Card(
//                 shape: const RoundedRectangleBorder(
//                   side: BorderSide(
//                     color: Colors.black
//                   )
//                 ),
//                 color: AppColor.orange,
//                 elevation: 8,
//                 child: CircleAvatar(
//                   radius: 128,
//                   // backgroundImage: NetworkImage(widget.petImage.toString()),
//                   backgroundImage: CachedNetworkImageProvider(widget.petImage),
//                 ),
//               ),
//
//               Container(
//                 width: 200,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: AppColor.green,
//                   borderRadius: const BorderRadius.all(Radius.circular(5))
//                 ),
//                 child: Center(
//                   child: Text(widget.petName.toUpperCase(),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     softWrap: true,
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold
//                   ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20,),
//               Row(
//                 children: [
//                   InkWell(
//                     onTap: (){
//                       clearValue();
//                       bottomForm("Food", width, context);
//                     },
//                     child: Card(
//                       color: AppColor.orange,
//                       child: SizedBox(
//                           height: 60,
//                           width: width /2.5,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Image.asset('assets/images/pet_food.png'),
//                                 const SizedBox(width: 25,),
//                                 const Text("Food",
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                 ),
//
//                               ],
//                             ),
//                           )
//
//                       ),
//
//                     ),
//                   ),
//                   const Spacer(),
//                   InkWell(
//
//                     onTap: (){
//                       clearValue();
//                       bottomForm("Water", width, context);
//                     },
//                     child: Card(
//                       color: AppColor.orange,
//                       child: SizedBox(
//                           height: 60,
//                           width: width /2.5,
//                           child: const Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Icon(Icons.water_drop_sharp),
//                                 SizedBox(width: 25,),
//                                 Text("Water",
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                 ),
//
//                               ],
//                             ),
//                           )
//
//                       ),
//
//                     ),
//                   ),
//
//                 ],
//               ),
//               const SizedBox(height: 20,),
//               Row(
//                 children: [
//                   InkWell(
//                     onTap: (){
//                       clearValue();
//                       bottomForm("Walking", width, context);
//                     },
//                     child: Card(
//                       color: AppColor.orange,
//                       child: SizedBox(
//                           height: 60,
//                           width: width /2.5,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Image.asset('assets/images/playing.png'),
//                                 const Text("Walking",
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   InkWell(
//                     onTap: (){
//                       clearValue();
//                       bottomForm("Exercise", width, context);
//                     },
//                     child: Card(
//                       color: AppColor.orange,
//                       child: SizedBox(
//                           height: 60,
//                           width: width /2.5,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Image.asset('assets/images/petExercise.png'),
//                                 const SizedBox(width: 25,),
//                                 const Text("Exercise",
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//
//                       ),
//
//                     ),
//                   ),
//
//                 ],
//               ),
//               const SizedBox(height: 30,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   InkWell(
//                     onTap: (){
//                       clearValue();
//                       bottomForm("Grooming", width, context);
//                     },
//                     child: Card(
//                       color: AppColor.orange,
//                       child: SizedBox(
//                           height: 60,
//                           width: width /2.5,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Image.asset('assets/images/pet_grooming.png'),
//                                 const Text("Grooming",
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//                           ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void bottomForm(String activityType, var width, context){
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
//           selectedTime = provider.selectedTime;
//           return Container(
//             height: 300,
//             width: width,
//             decoration:  BoxDecoration(
//                 color: Colors.white.withOpacity(0.3),
//                 borderRadius:  const BorderRadius.
//                 only(topRight: Radius.circular(30),
//                     topLeft: Radius.circular(30))
//             ),
//             child:
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Form(
//                 autovalidateMode: AutovalidateMode.always,
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SecondaryButton(
//                           width: width * 0.35,
//                           child: Align(
//                             alignment: Alignment.centerLeft,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                               child: selectedDate.isNotEmptyAndNotNull ? Text(
//                                   DateTimeClass.stringToddMMyyyy(selectedDate!) ??
//                                       "Select Date"   ) :
//                               const Text("Select Date")
//
//                             ),
//                           ),
//                           onTap: () {
//                             setState( (){
//                               Provider.of<DateTimeProvider>(context, listen: false).selectDate(context);
//                             }
//                             );
//                           },
//                         ),
//                         SecondaryButton(
//                           width: width * 0.35,
//                           child: Align(
//                             alignment: Alignment.centerLeft,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                               child: selectedTime.isNotEmptyAndNotNull ? Text(
//                                   DateTimeClass.timeToHHMMA(selectedTime) ??
//                                       "Select Time"):
//                               const Text( "Select Time")
//
//                             ),
//                           ),
//                           onTap: () {
//                             setState( (){
//                               Provider.of<DateTimeProvider>(context, listen: false).selectTime(context);
//                             }
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 30,),
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
//                                     formSubmit(activityType, context);
//                                   },
//                                   child: const Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(" Submit",
//                                         style: TextStyle(
//                                             fontSize: 20,
//                                             color: Colors.white
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
//                   ],
//                 ),
//               ),
//             ),
//           );
//
//           // );
//         });
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
//       else if (selectedTime == null) {
//         CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 2,
//             message: "Please select Time");
//       } else {
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
//     setState(() {
//       showHideLoading(true);
//     });
//     ActivityRecord? petActivityModel;
//
//     petActivityId = widget.uid + widget.petId;
//         List<Map<String, dynamic>> petActivity = [
//       {
//         "activityType": activityType ,
//         "date": selectedDate.toString() ,
//         "time": selectedTime.toString()
//       },
//           ];
//     final petExistId = await FirebaseFirestore.instance.collection('petActivities').doc(petActivityId).get();
//
//    if(petExistId.exists)
//    {
//      petActivityModel = ActivityRecord.fromMap(petExistId.data());
//
//      var activityLength = petActivityModel.activityRecord?.length;
//      if (kDebugMode) {
//        print('acitvity length==== $activityLength');
//      }
//      int acitvityCount = 0;
//      for(var i= 0; i < activityLength!; i++){
//      var petActivityType = petActivityModel.activityRecord?[i]['activityType'];
//      if (kDebugMode) {
//        print("=====accc: $petActivityType");
//      }
//      if(petActivityType == activityType ){
//        acitvityCount = acitvityCount+1;
//      }
//      }
//
//      if( acitvityCount < 3){
//        await FirebaseFirestore.instance.collection("petActivities").doc(petActivityId).update(
//            {        "activityRecord": FieldValue.arrayUnion(petActivity)
//            }
//        );
//        showHideLoading(false);
//        clearValue();
//        Navigator.pop(context);
//        CommonShareWidget.showFlushBar(
//            context: context,
//            duration: 2,
//            message: "Your activities submitted");
//
//      } else{
//        showHideLoading(false);
//        clearValue();
//        Navigator.pop(context);
//        CommonShareWidget.showFlushBar(
//            context: context,
//            duration: 2,
//            message: "Limit Over");
//      }
//     }
//     if(!petExistId.exists){
//       FirebaseFirestore.instance
//           .collection("petActivities")
//           .doc(petActivityId)
//           .set({
//         "id": petActivityId,
//         "userID": widget.uid,
//         "petName": widget.petName,
//         "activityRecord": petActivity,
//       });
//       showHideLoading(false);
//       clearValue();
//       Navigator.pop(context);
//       CommonShareWidget.showFlushBar(
//           context: context,
//           duration: 2,
//           message: "Your activities submitted");
//           }
//   }
//   clearValue() {
//       selectedDate = null;
//       selectedTime = null;
//     Provider.of<DateTimeProvider>(context, listen: false).clearFunction(selectedDate ?? '', selectedTime ?? '');
//     setState(() {
//       showHideLoading(false);
//     });
//   }
//
//   showHideLoading(bool status) {
// if(status == true)  {
//   const Center(child: CircularProgressIndicator());
// }
//   }
//   }
