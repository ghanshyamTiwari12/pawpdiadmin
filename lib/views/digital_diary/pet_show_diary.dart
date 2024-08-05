// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/constant/colors.dart';
// import 'package:provider/provider.dart';
// import 'package:velocity_x/velocity_x.dart';
// import '../../bloc/date_time_provider.dart';
// import '../../constant/date_time.dart';
// import '../../constant/secondary_button.dart';
// import '../../constant/sub_header.dart';
// import '../../model/activity_record_model.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
//
// class PetShowDigitalDiary extends StatefulWidget {
//   const PetShowDigitalDiary({super.key,
//     required this.uid,
//     required this.petName,
//     required this.petImage,
//     required this.petID,
//     required this.petBreed,
//     required this.petGender,
//     required this.petCategory,
//     required this.petExitID,
//     required this.dob,
//   });
//   final String uid;
//   final String petName;
//   final String petImage;
//   final String petID;
//   final String petGender;
//   final String petBreed;
//   final String petCategory;
//   final String petExitID;
//   final String dob;
//   @override
//   State<PetShowDigitalDiary> createState() => _PetShowDigitalDiaryState();
// }
//
// class _PetShowDigitalDiaryState extends State<PetShowDigitalDiary> {
//   final fireStore =  FirebaseFirestore.instance.collection('petActivities').snapshots();
//   CollectionReference ref = FirebaseFirestore.instance.collection('petActivities');
//   final _formKey = GlobalKey<FormState>();
//   bool isLoading = false;
//   String? selectedDate;
//   String? selectedTime;
//   DateTime date = DateTime.now();
//   DateTime time = DateTime.now();
//   String? petActivityId ;
//
//   // @override
//   // void dispose() {
//   //   super.dispose();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//    final size = MediaQuery.of(context).size;
//    var width = size.width;
//    var height = size.height;
//
//    String date = widget.dob.toString();
//    //               String date = _list[index].appointmentDate.toString();
//    //         String time  = _list[index].appointmentTime.toString();
//          String? petDob = DateTimeClass.stringToddMMyyyy(date);
//    // String? appointmentTime = DateTimeClass.timeToHHMMA(time);
//     return Scaffold(
//       appBar: AppBar(
//         // title: const Text("Pet Diary"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Card(
//                 color: AppColor.orange,
//                 child: Container(
//                   margin: const EdgeInsets.only(right: 20.0),
//                   // height: 230,
//                   height: height *0.25,
//                   width: width ,
//                   child: Padding(
//                     padding: const EdgeInsets.all(1.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         CommonShareWidget.imageNetwork(
//                             borderadius: 20.0,
//                             //height: double.infinity,
//                             // height: 250.0,
//                             height: height *0.25,
//                             width: width * 0.40,
//                             imageurl: widget.petImage),
//                         const SizedBox(width: 20,),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const SizedBox(height: 20,),
//                               Text(widget.petName,
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 softWrap: true,
//                                 style: const TextStyle(
//                                     fontSize: 16.0,
//                                     fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                               // const Divider(height: 10, color: Colors.black,),
//                               _buildDivider(width * 0.60),
//                               Text( petDob!,
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 softWrap: true,
//                                 style: const TextStyle(
//                                   fontSize: 16.0,
//                                   // fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                               _buildDivider(width * 0.6),
//                               Text(widget.petGender,
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 softWrap: true,
//                                 style: const TextStyle(
//                                     fontSize: 16.0,
//                                     // fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                               _buildDivider(width * 0.6),
//                               Text(widget.petBreed,
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 softWrap: true,
//                                 style: const TextStyle(
//                                     fontSize: 16.0,
//                                     // fontWeight: FontWeight.bold
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                 ),
//               ),
//
//               const SizedBox(height: 20,),
//               StreamBuilder<QuerySnapshot>(
//                 stream: fireStore,
//                 builder: (BuildContext context, snapshot) {
//                   var listLength = snapshot.data?.docs.length;
//                   if (kDebugMode) {
//                     print('snapshot length==== $listLength');
//                   }
//                   List < Map<String, dynamic>> petActivityList = [];
//                   if(listLength!= null){
//                     for(int i = 0; i < listLength; i++ ){
//                       Map<String, dynamic> val1 = snapshot.data!.docs[i].data() as Map<String, dynamic>;
//                       if (kDebugMode) {
//                         print("for loop petExitID value: ${widget.petExitID} ");
//                       }
//                       if (kDebugMode) {
//                         print("for loop val value: ${val1['id']} ");
//                       }
//                       if ("${val1['id']}" == widget.petExitID){
//                         petActivityList.add(val1);
//                         if (kDebugMode) {
//                           print("if val value: ${val1['id']} ");
//                         }
//                         if (kDebugMode) {
//                           print("if petExitID value: ${widget.petExitID} ");
//                         }
//                       }
//                     }
//                   }
//                   if (kDebugMode) {
//                     print("===petActivities Length ==${petActivityList.length}");
//                   }
//                   if(petActivityList.isNotEmpty){
//
//                     return ListView.builder(
//                       itemCount: petActivityList.length,
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemBuilder: (context, index) {
//                         dynamic val = petActivityList[index];
//                         if (kDebugMode) {
//                           print("======val value activity list:--- ${val['activityRecord']} ");
//                         }
//                         List<dynamic> activityRecord = val['activityRecord'] ?? [];
//                         List<dynamic> activityImage = val['images'] ?? [];
//                         List<dynamic> petMilestone = val['milestoneRecord'] ?? [];
//
//
//                         return Column(
//                           children: [
//                             if(activityRecord.isNotEmpty)...[
//                               const SizedBox(height: 5,),
//                               const SubHeader(text: "Activity"),
//                               SizedBox(
//                                 // height: 170,
//                                 height: 150,
//                                 width: double.infinity,
//                                 child: ListView.builder(
//                                   scrollDirection: Axis.horizontal,
//                                   itemCount: activityRecord.length,
//                                   itemBuilder: (context, index) {
//                                     String activityType = activityRecord[index]['activityType'];
//                                     if (kDebugMode) {
//                                       print("======val value activityRecord builder:--- $activityType ");
//                                     }
//                                     String date = activityRecord[index]['date'];
//                                     String time  = activityRecord[index]['time'];
//                                     String? petActivityDate = DateTimeClass.stringToddMMyyyy(date);
//                                     String? petActivityTime = DateTimeClass.timeToHHMMA(time);
//                                     if (kDebugMode) {
//                                       print("======val value petActivityDate builder:--- $petActivityDate ");
//                                     }
//
//                                     return Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Container
//                                         (
//                                         width: 170,
//                                         decoration: BoxDecoration(
//                                             borderRadius: const BorderRadius.all(Radius.circular(8.0)),
//                                             color: AppColor.green.withOpacity(0.4)
//                                         ),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(12.0),
//                                           child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: [
//                                               Center(
//                                                 child: Text(activityRecord[index]['activityType'],
//                                                 style: const TextStyle(fontWeight: FontWeight.bold),
//                                                 ),
//                                               ),
//                                               const SizedBox(height: 05,),
//                                               Row(
//                                                 // mainAxisAlignment: MainAxisAlignment.center,
//                                                 children: [
//                                                   const Text("Date: ",
//                                                   style: TextStyle(
//                                                     fontWeight: FontWeight.bold
//                                                   ),
//                                                   ),
//                                                   Text(petActivityDate!,
//                                                     maxLines: 1,
//                                                     overflow: TextOverflow.ellipsis,
//                                                     softWrap: true,
//                                                     style: const TextStyle(
//                                                       color: Colors.black,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               const SizedBox(height: 05,),
//                                               Row(
//                                                 // mainAxisAlignment: MainAxisAlignment.center,
//                                                 children: [
//                                                   const Text("Time: ",
//                                                   style: TextStyle(
//                                                     fontWeight: FontWeight.bold
//                                                   ),
//                                                   ),
//                                                   Text(petActivityTime!,
//                                                     maxLines: 1,
//                                                     overflow: TextOverflow.ellipsis,
//                                                     softWrap: true,
//                                                     style: const TextStyle(
//                                                       color: Colors.black,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               // const SizedBox(height: 5,),
//                                               Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                 children: [
//                                                   InkWell(
//                                                     onTap: (){
//                                                       Provider.of<DateTimeProvider>(context, listen: false).dateFunction(activityRecord[index]['date']!);
//                                                       Provider.of<DateTimeProvider>(context, listen: false).timeFunction(activityRecord[index]['time']!);
//                                                       editActivity(
//                                                           activityRecord[index]['activityType'],
//                                                           activityRecord[index]['date'],
//                                                           activityRecord[index]['time'],
//                                                           index, width, context);
//                                                     },
//                                                     child: Card(
//                                                       elevation: 3,
//                                                       shape: RoundedRectangleBorder( //<-- 1. SEE HERE
//                                                         borderRadius: BorderRadius.circular(12),
//                                                       ),
//                                                       child: Container(
//                                                         height: 24,
//                                                         width: 24,
//                                                         decoration: BoxDecoration(
//                                                           color: AppColor.orange,
//                                                           // Colors.blueAccent.withOpacity(0.2),
//                                                           borderRadius: const BorderRadius.all(Radius.circular(12)),
//                                                         ),
//                                                         child:  const Icon(Icons.edit, color: Colors.black, size: 12,
//
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//
//                                                   InkWell
//                                                     (
//                                                     onTap: (){
//                                                       showDialog(
//                                                           context: context,
//                                                           builder: (BuildContext context)
//                                                           {
//                                                             return AlertDialog(
//                                                               backgroundColor: Colors.white,
//                                                               content: Container(
//                                                                 height: 70,
//                                                                 width: 130,
//                                                                 decoration: const BoxDecoration(
//                                                                   // color: Colors.transparent.withOpacity(0.2),
//                                                                 ),
//                                                                 child: Column(
//                                                                   children: [
//                                                                     const Text("Do you want to Delete?",
//                                                                     style: TextStyle(
//                                                                       color: Colors.black,
//                                                                       fontWeight: FontWeight.bold
//                                                                     ),
//                                                                     ),
//                                                                   const SizedBox(height: 10,),
//                                                                    Row(
//                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                      children: [
//                                                                        InkWell(
//                                                                          onTap: ()  {
//                                                                          deleteActivity(activityRecord[index]['activityType'],activityRecord[index]['date'], activityRecord[index]['time'], index);
//                                                                          Navigator.of(context).pop();
//                                                                          },
//                                                                          child: Container(
//                                                                            height: 35,
//                                                                            width: 70,
//                                                                            decoration: const BoxDecoration(
//                                                                              color: Colors.green,
//                                                                              borderRadius: BorderRadius.all(Radius.circular(25)),
//                                                                            ),
//                                                                            child: const Center(child: Text('Yes',
//                                                                              style: TextStyle(
//                                                                                color: Colors.white,
//                                                                                fontSize: 16,
//                                                                                fontWeight: FontWeight.bold
//                                                                              ),
//
//                                                                            )),
//
//                                                                          ),
//                                                                        ),
//                                                                        const SizedBox(width: 10,),
//                                                                        InkWell(
//                                                                          onTap: (){
//                                                                            Navigator.of(context).pop();
//                                                                          },
//                                                                          child: Container(
//                                                                            height: 40,
//                                                                            width: 70,
//                                                                            decoration: const BoxDecoration(
//                                                                              color: Colors.red,
//                                                                              borderRadius: BorderRadius.all(Radius.circular(25)),
//                                                                            ),
//                                                                            child: const Center(child: Text('No',
//                                                                              style: TextStyle(
//                                                                                  color: Colors.white,
//                                                                                  fontSize: 16,
//                                                                                  fontWeight: FontWeight.bold
//                                                                              ),
//                                                                            )),
//
//                                                                          ),
//                                                                        ),
//                                                                      ],
//                                                                    )
//                                                                   ],
//                                                                 ),
//                                                               ),
//                                                             );
//                                                           }
//                                                       );
//
//                                                     },
//                                                     child: Card(
//                                                       elevation: 3,
//                                                       shape: RoundedRectangleBorder( //<-- 1. SEE HERE
//                                                         borderRadius: BorderRadius.circular(12),
//                                                       ),
//                                                       child: Container(
//                                                         height: 24,
//                                                         width: 24,
//                                                         decoration: BoxDecoration(
//                                                           color: AppColor.orange,
//                                                           // Colors.blueAccent.withOpacity(0.2),
//                                                           borderRadius: const BorderRadius.all(Radius.circular(12)),
//                                                         ),
//                                                         child:  const Icon(Icons.delete,
//                                                             size: 12,
//                                                             color: Colors.black),
//
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               )
//
//                                             ],
//                                           ),
//                                         ),
//
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               )
//                             ],
//
//                             if(activityImage.isNotEmpty)...[
//                               const SizedBox(height: 5,),
//                               const SubHeader(text: "Gallery"),
//                               const SizedBox(height: 05,),
//                               CarouselSlider.builder(
//                                 itemCount: activityImage.length,
//                                 itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
//                                   String imageUrl = activityImage[itemIndex]['image'].toString();
//                                   if (kDebugMode) {
//                                     print("image url: ${activityImage[itemIndex].toString()}");
//                                   }
//                                   return Stack(
//                                     children: [
//                                     Center(
//                                       child: CommonShareWidget.imageNetwork(
//                                           borderadius: 20.0,
//                                           height: height *0.35,
//                                           width: width *0.90,
//                                           imageurl: imageUrl,
//                                       ),
//                                     ),
//                                       Positioned(
//                                           right: 10,
//                                           top: 10,
//                                           child: InkWell(
//                                             child: Card(
//                                               color: AppColor.orange,
//                                               elevation:4,
//                                               shape: RoundedRectangleBorder( //<-- SEE HERE
//                                                 borderRadius: BorderRadius.circular(35.0), //<-- SEE HERE
//                                               ),
//                                               child: Container(
//                                                 height: 40,
//                                                 width: 40,
//                                                 decoration: const BoxDecoration(
//                                                   // color: Colors.black54.withOpacity(0.3),
//                                                   borderRadius: BorderRadius.all(Radius.circular(25)),
//                                                   // border: Border.all(
//                                                   //     width: 1,
//                                                   //     color: Colors.black
//                                                   // )
//                                                 ),
//                                                 child: const Icon(Icons.delete),
//                                               ),
//                                             ),
//                                             onTap: (){
//                                               deleteImage(imageUrl, itemIndex);
//                                             },
//                                           ),)
//                                   ],
//                                   );
//                                 },
//                                 options: CarouselOptions(
//                                   autoPlay: true,
//                                   enlargeCenterPage: true,
//                                   viewportFraction: 0.9,
//                                   aspectRatio: 2.0,
//                                   initialPage: 0,
//                                 ),
//                               ),
//                             ],
//                             const SizedBox(height: 10,),
//                             if(petMilestone.isNotEmpty)...[
//                               const SubHeader(text: "Milestone"),
//                               GridView.builder(
//                                 padding: const EdgeInsets.all(10),
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 shrinkWrap: true,
//                                 itemCount: petMilestone.length,
//                                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
//                                 itemBuilder: (context, index) {
//                                   String mileStoneimageUrl = petMilestone[index]['image'].toString();
//                                   String date = petMilestone[index]['date'];
//                                   String? petMilestonedate = DateTimeClass.stringToddMMyyyy(date);
//                                   if (kDebugMode) {
//                                     print("=====milestone image---$mileStoneimageUrl");
//                                   }
//                                   return Column(
//                                     children: [
//                                       SizedBox(
//                                         // height: height,
//                                         width: width,
//                                         child: Padding(
//                                           padding:  const EdgeInsets.only(left: 8.0, right: 8.0),
//                                           child: Card(
//                                             color: AppColor.orange.withOpacity(0.5),
//                                             child: SizedBox(
//                                               width: width *0.60,
//                                                // height: width *0.60,
//                                                child: Column(
//                                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                                 children: [
//                                                   SizedBox(
//                                                     height: 15,
//                                                     child:
//                                                     Padding(
//                                                       padding: const EdgeInsets.only(left: 8.0, right: 10.0),
//                                                       child: Row(
//                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                                         children: [
//                                                           Text(
//                                                             petMilestonedate!,
//                                                             maxLines: 1,
//                                                             overflow: TextOverflow.ellipsis,
//                                                             softWrap: true,
//                                                             style: const TextStyle(
//                                                               fontSize: 12,
//                                                               fontWeight: FontWeight.bold,
//                                                               color: Colors.black,
//                                                             ),
//                                                           ),
//                                                           InkWell(
//                                                            child: const SizedBox(
//                                                               height: 15,
//                                                               width: 15,
//                                                               child: Icon(Icons.delete_forever_sharp),
//                                                             ),
//                                                             onTap: (){
//                                                               deleteMilestone(mileStoneimageUrl,
//                                                                   petMilestone[index]['description'],
//                                                                   petMilestone[index]['date'],
//                                                                   index);
//                                                             },
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//
//                                                   const SizedBox(height: 8,),
//                                                   Padding(
//                                                     padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
//                                                     child: Container(
//                                                       height: 70,
//                                                       decoration: BoxDecoration(
//                                                         borderRadius: const BorderRadius.all(
//                                                             Radius.circular(5.0)),
//                                                         image: DecorationImage(
//                                                           image: NetworkImage(mileStoneimageUrl),
//                                                           fit: BoxFit.fill,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   const SizedBox(height: 5,),
//                                                   Padding(
//                                                     padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
//                                                     child: Container(
//                                                       // height: 20,
//                                                       width:width *0.40 ,
//                                                       decoration: BoxDecoration(
//                                                         color: Colors.black.withOpacity(0.3),
//                                                         borderRadius: const BorderRadius.all(Radius.circular(12))
//                                                       ),
//                                                       child: Center(
//                                                         child: Text(petMilestone[index]['description'],
//                                                           maxLines: 1,
//                                                           overflow: TextOverflow.ellipsis,
//                                                           softWrap: true,
//                                                           style:  const TextStyle(
//                                                             fontSize: 16,
//                                                             fontWeight: FontWeight.bold,
//                                                             color: Colors.white,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               ),
//                             ],
//                           ],
//                         );
//                       },
//                     );
//                   } else{
//
//                     return const Center(child: Text('No Activity',
//                       style: TextStyle(
//                           fontSize: 30
//                       ),
//                     ));
//                   }
//                 },
//               )
//             ],
//           ),
//         ),
//       ) ,
//
//     );
//   }
//
//
//   _buildDivider(double dividerWidth) {
//     return SizedBox(
//       height: 10,
//       child: Center(
//         child: Container(
//           margin: const EdgeInsets.symmetric(
//             // horizontal: 14.0,
//           ),
//           width: dividerWidth,
//           height: 1.0,
//           color: Colors.black,
//         ),
//       ),
//     );
//   }
//
//   Future <void> deleteImage(String iamgeUrl, int activityIndex) async {
//     ActivityRecord? petActivityModel;
//     petActivityId = widget.uid + widget.petID;
//     final petExistId = await FirebaseFirestore.instance.collection('petActivities').doc(petActivityId).get();
//
//     if (kDebugMode) {
//       print("====deleteimage:---$iamgeUrl");
//     }
//     List<Map<String, dynamic>> petimages = [
//       {
//         "image": iamgeUrl,
//       },
//     ];
//     if(petExistId.exists) {
//             petActivityModel = ActivityRecord.fromMap(petExistId.data());
//       var imageCount = petActivityModel.images?.length;
//             if (kDebugMode) {
//               print("=====delete imageCount--$imageCount");
//             }
//             for(var i= 0; i < imageCount!; i++){
//         if(i == activityIndex){
//           if (kDebugMode) {
//             print("image index---: $activityIndex");
//           }
//           await FirebaseFirestore.instance.collection("petActivities").doc(petActivityId).update(
//               {        "images": FieldValue.arrayRemove (petimages)
//
//               }
//           );
//         }
//       }
//     }
//
//   }
//
//   Future <void> deleteMilestone(String iamgeUrl, String description, String petDate, int activityIndex) async {
//     ActivityRecord? petActivityModel;
//     petActivityId = widget.uid + widget.petID;
//     List<Map<String, dynamic>> milestone = [
//       {
//         "date": petDate,
//         "description": description,
//         "image": iamgeUrl,
//       },
//     ];
//       if (kDebugMode) {
//         print("====deletemilestone:---$iamgeUrl");
//       }
//       if (kDebugMode) {
//         print("====deletemilestone description:---$description");
//       }
//       if (kDebugMode) {
//         print("====deletemilestone date:---$petDate");
//       }
//     final petExistId = await FirebaseFirestore.instance.collection('petActivities').doc(petActivityId).get();
//     if(petExistId.exists) {
//       petActivityModel = ActivityRecord.fromMap(petExistId.data());
//       var milestoneLength = petActivityModel.milestoneRecord?.length;
//
//       for(var i= 0; i < milestoneLength!; i++){
//         if(i == activityIndex){
//           await FirebaseFirestore.instance.collection("petActivities").doc(petActivityId).update(
//               {        "milestoneRecord": FieldValue.arrayRemove (milestone)
//
//               }
//           );
//         }
//       }
//     }
//
//   }
//
//
//   Future <void> deleteActivity(String activityType, String petActivityDate, String petActivityTime, int activityIndex) async {
//       ActivityRecord? petActivityModel;
//       petActivityId = widget.uid + widget.petID;
//       List<Map<String, dynamic>> petActivityEariler = [
//         {
//           "activityType": activityType ,
//           "date": petActivityDate ,
//           "time": petActivityTime
//         },
//       ];
//       final petExistId = await FirebaseFirestore.instance.collection('petActivities').doc(petActivityId).get();
//       if(petExistId.exists) {
//         petActivityModel = ActivityRecord.fromMap(petExistId.data());
//         var activityLength = petActivityModel.activityRecord?.length;
//         for(var i= 0; i < activityLength!; i++){
//           if(i == activityIndex){
//             await FirebaseFirestore.instance.collection("petActivities").doc(petActivityId).update(
//                 {        "activityRecord": FieldValue.arrayRemove (petActivityEariler)
//
//                 }
//             );
//           }
//         }
//       }
//
//   }
//
//
//   void editActivity(String activityType,
//       String petActivityDate,
//       String petActivityTime,
//       int activityIndex,
//       var width, context)
//   {
//     showModalBottomSheet(context: context,
//         barrierColor: Colors.transparent,
//         backgroundColor: AppColor.orange,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//         builder: (BuildContext context)
//         {
//           DateTimeProvider provider = Provider.of<DateTimeProvider>(context);
//           selectedDate = provider.selectedDate;
//           selectedTime = provider.selectedTime;
//           return Container(
//               height: 400,
//               width: width,
//               decoration:  BoxDecoration(
//                   color: Colors.white.withOpacity(0.3),
//                   borderRadius: const BorderRadius.all(Radius.circular(30))
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Form(
//                   autovalidateMode: AutovalidateMode.always,
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           SecondaryButton(
//                             width: MediaQuery.of(context).size.width / 2.5,
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                                 child: selectedDate.isNotEmptyAndNotNull ? Text(
//                                     DateTimeClass.stringToddMMyyyy(selectedDate!) ??
//                                         DateTimeClass.stringToddMMyyyy(petActivityDate)!   ) :
//                                 Text(DateTimeClass.stringToddMMyyyy(petActivityDate) ?? '')
//                               ),
//                             ),
//                             onTap: () {
//                               setState( (){
//                                 Provider.of<DateTimeProvider>(context, listen: false).selectDate(context);
//                                 // Provider.of<DateTimeProvider>(context, listen: false).dateFunction(selectedDate ?? '');
//                               }
//                               );
//                             },
//                           ),
//                           SecondaryButton(
//                             width: MediaQuery.of(context).size.width / 2.5,
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                                 child: selectedTime.isNotEmptyAndNotNull ? Text(
//                                     DateTimeClass.timeToHHMMA(selectedTime) ??
//                                         DateTimeClass.timeToHHMMA(petActivityTime)!):
//                                 Text( DateTimeClass.timeToHHMMA(petActivityTime)!)
//                                                                 ),
//                             ),
//                             onTap: () {
//                               Provider.of<DateTimeProvider>(context, listen: false).selectTime(context);
//                               // Provider.of<DateTimeProvider>(context, listen: false).timeFunction(selectedTime ?? '');
//                             },
//                           ),
//
//                         ],
//                       ),
//                       const SizedBox(height: 30,),
//
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                               height: 60,
//                               width: width /2,
//                               decoration: const BoxDecoration(
//                                 borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                                 color: Colors.black,
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: InkWell
//                                   (
//                                   onTap: () async
//                                   {
//                                     editActivityfunc(
//                                         activityType,
//                                         petActivityDate,
//                                         petActivityTime,
//                                         activityIndex, context);
//                                     },
//                                   child: const Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(" Update",
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
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           // }
//           // );
//         });
//   }
//
//   editActivityfunc(String activityType,
//       String petActivityDate,
//       String petActivityTime,
//       int activityIndex, context)
//       async {
//
//       if (validateForm() != true)
//       {
//         return;
//       }
//       setState(() {
//         showHideLoading(true);
//       });
//       ActivityRecord? petActivityModel;
//       petActivityId = widget.uid + widget.petID;
//       List<Map<String, dynamic>> petActivityEariler = [
//         {
//           "activityType": activityType ,
//           "date": petActivityDate ,
//           "time": petActivityTime
//         },
//       ];
//       List<Map<String, dynamic>> petActivity = [
//         {
//           "activityType": activityType ,
//           "date": selectedDate.toString() ,
//           "time": selectedTime.toString()
//         },
//       ];
//       final petExistId = await FirebaseFirestore.instance.collection('petActivities').doc(petActivityId).get();
//
//       if(petExistId.exists){
//         petActivityModel = ActivityRecord.fromMap(petExistId.data());
//         var activityLength = petActivityModel.activityRecord?.length;
//         for(var i= 0; i < activityLength!; i++){
//           if(i == activityIndex){
//             await FirebaseFirestore.instance.collection("petActivities").doc(petActivityId).update(
//                 {        "activityRecord": FieldValue.arrayRemove (petActivityEariler)
//
//                 }
//             );
//             await FirebaseFirestore.instance.collection("petActivities").doc(petActivityId).update(
//                 {        "activityRecord": FieldValue.arrayUnion(petActivity)
//
//                 }
//
//             );
//           }
//           // Navigator.pop(context);
//           // CommonShareWidget.showColorFlushBar(
//           //     context: context,
//           //     duration: 2,
//           //     message: "Activity Updated",
//           //     color: Colors.black);
//           // setState(() {
//           //   showHideLoading(true);
//           // });
//         }
//         Navigator.pop(context);
//         CommonShareWidget.showColorFlushBar(
//             context: context,
//             duration: 2,
//             message: "Activity Updated",
//             color: Colors.black);
//         setState(() {
//           showHideLoading(true);
//         });
//         // clearValue();
//       }
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
//         // CommonShareWidget.showFlushBar(
//         //     context: context,
//         //     duration: 2,
//         //     message: "All fields are true");
//         isValid = true;
//       }
//       if (kDebugMode) {
//         print('=====isValid---$isValid');
//       }
//     }
//     return isValid;
//   }
//
//   clearValue() {
//     setState(() {
//       selectedDate = null;
//       selectedTime = null;
//       Provider.of<DateTimeProvider>(context, listen: false).clearFunction(selectedDate ?? '', selectedTime ?? '');
//     });
//   }
//
//
//   showHideLoading(bool status) {
//     if (mounted) {
//       setState(() {
//         isLoading = status;
//         const CircularProgressIndicator();
//       });
//     }
//   }
//
// }
