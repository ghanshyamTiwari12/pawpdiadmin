// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../Web_helper/colors.dart';
//
// class UserLostPetList extends StatefulWidget {
//   const UserLostPetList({super.key, required this.userUid, required this.userName});
//   final String userUid;
//   final String userName;
//
//   @override
//   State<UserLostPetList> createState() => _UserLostPetListState();
// }
//
// class _UserLostPetListState extends State<UserLostPetList> {
//   final fireStore =  FirebaseFirestore.instance.collection('lfPets').snapshots();
//   CollectionReference ref = FirebaseFirestore.instance.collection('lfPets');
//   // var size,height,width;
//
//   @override
//   Widget build(BuildContext context) {
//    final size = MediaQuery.of(context).size;
//    // var height = size.height;
//     var width = size.width;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Lost pet of ${widget.userName}"),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           StreamBuilder<QuerySnapshot>(
//               stream: fireStore,
//               builder: (BuildContext context,
//                   AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const CircularProgressIndicator();
//                 }
//
//                 if (snapshot.hasError) return const Text('Some Error');
//
//                 var listLength = snapshot.data!.docs.length;
//                 List <Map<String, dynamic>> userPetList = [];
//                 for(int i = 0; i < listLength; i++ ){
//                   Map<String, dynamic> val1 = snapshot.data!.docs[i].data() as Map<String, dynamic>;
//                   if ("${val1['posted_id']}" == widget.userUid && "${val1['pet_status']}" == 'lost'){
//                     userPetList.add(val1);
//
//                   }
//                 }
//
//                 if(userPetList.isNotEmpty){
//                   return Expanded(
//                       child: ListView.builder(
//                           itemCount: userPetList.length,
//                           itemBuilder: (context, index) {
//                             dynamic val = userPetList[index];
//                             List<dynamic> urlList = val['image_url'];
//                             String url = urlList.first.toString();
//                             String documentID = val['docID'].toString();
//
//
//                             return Padding(
//                               padding: const EdgeInsets.only(left: 20.0,
//                                   right: 20.0,),
//                               child: Card(
//                                 color: AppColor.orange,
//                                 child: Padding(
//                                   // padding: const EdgeInsets.all(12.0),
//                                   padding: const EdgeInsets.only(left: 12.0,
//                                     right: 12.0, top: 12.0),
//                                   child: SizedBox(
//                                       height: 310,
//                                       width: width,
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.start,
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             children: [
//                                               Container(
//                                                 height: 200,
//                                                 width: 140,
//                                                 decoration: const BoxDecoration(
//                                                 ),
//                                                 child: Image.network(url,
//                                                   height: 200,
//                                                   width: 150,
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               ),
//                                               const SizedBox(width: 15,),
//                                               Column(
//                                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                                 mainAxisAlignment: MainAxisAlignment.center,
//                                                 children: [
//                                                   Row(
//                                                     children: [
//                                                       const Text("Name: ",
//                                                         style: TextStyle(
//                                                           fontSize: 20,
//                                                           fontWeight: FontWeight.bold,
//                                                         ),
//                                                       ),
//                                                       Text("${val['pet_name']}",
//                                                         style: const TextStyle(
//                                                           fontSize: 20,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   const SizedBox(height: 5,),
//                                                   Row(
//                                                     children: [
//                                                       const Text("Category: ",
//                                                         style: TextStyle(
//                                                           fontSize: 20,
//                                                           fontWeight: FontWeight.bold,
//                                                         ),
//                                                       ),
//                                                       Text("${val['pet_category']}",
//                                                         style: const TextStyle(
//                                                           fontSize: 20,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   const SizedBox(height: 5,),
//                                                   Row(
//                                                     children: [
//                                                       const Text("Description: ",
//                                                         style: TextStyle(
//                                                           fontSize: 20,
//                                                           fontWeight: FontWeight.bold,
//                                                         ),
//                                                       ),
//                                                       Text("${val['description']}",
//                                                         style: const TextStyle(
//                                                           fontSize: 20,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   const SizedBox(height: 5,),
//                                                   Row(
//                                                     children: [
//                                                       const Text("Gender: ",
//                                                         style: TextStyle(
//                                                           fontSize: 20,
//                                                           fontWeight: FontWeight.bold,
//                                                         ),
//                                                       ),
//                                                       Text("${val['pet_gender']}",
//                                                         style: const TextStyle(
//                                                           fontSize: 20,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   const SizedBox(height: 5,),
//                                                   Row(
//                                                     children: [
//                                                       const Text("Color: ",
//                                                         style: TextStyle(
//                                                           fontSize: 20,
//                                                           fontWeight: FontWeight.bold,
//                                                         ),
//                                                       ),
//                                                       Text("${val['pet_color']}",
//                                                         style: const TextStyle(
//                                                           fontSize: 20,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   const SizedBox(height: 5,),
//                                                   Row(
//                                                     children: [
//                                                       const Text("Status: ",
//                                                         style: TextStyle(
//                                                           fontSize: 20,
//                                                           fontWeight: FontWeight.bold,
//                                                         ),
//                                                       ),
//                                                       Text("${val['pet_status']}",
//                                                         style: const TextStyle(
//                                                           fontSize: 20,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   const SizedBox(height: 5,),
//                                                   Row(
//                                                     children: [
//                                                       const Text("Review: ",
//                                                         style: TextStyle(
//                                                           fontSize: 20,
//                                                           fontWeight: FontWeight.bold,
//                                                         ),
//                                                       ),
//                                                       Text("${val['review']}",
//                                                         style: const TextStyle(
//                                                           fontSize: 20,
//                                                         ),
//                                                       ),
//
//                                                     ],
//
//                                                   ),
//
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                           const SizedBox(height: 20,),
//                                           if(val['review'] == false)...[
//                                             Center(
//                                               child: ElevatedButton(
//                                                   style: ElevatedButton.styleFrom(
//                                                     backgroundColor: Colors.black,
//                                                     minimumSize: const Size.fromHeight(50), // NEW
//                                                   ),
//                                                   onPressed: ()
//                                                   {
//                                                     ref.doc(documentID).update(
//                                                         {
//                                                           'review': true,
//
//                                                         }).then((value){
//                                                       const Text('Update');
//                                                     }).onError((error, stackTrace){
//                                                       const Text('Error');
//                                                     });
//                                                   }, child: const Text("Ok",
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 23,
//                                                   // fontWeight: FontWeight.bold
//
//                                                 ),
//                                               )),
//
//                                             )
//                                           ]
//                                           else...[
//                                             Center(
//                                               child: ElevatedButton(
//                                                   style: ElevatedButton.styleFrom(
//                                                     backgroundColor: Colors.blueAccent,
//                                                     minimumSize: const Size.fromHeight(50), // NEW
//                                                   ),
//                                                   onPressed: (){
//                                                     ref.doc(documentID).update(
//                                                         {
//                                                           'review': false,
//                                                         }).then((value){
//                                                       const Text('Update');
//                                                     }).onError((error, stackTrace){
//                                                       const Text('Error');
//                                                     });
//                                                   }, child: const Text("Cancel",
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 23,
//                                                   // fontWeight: FontWeight.bold
//                                                 ),
//                                               )),
//                                             )
//                                           ]
//                                         ],
//                                       )
//                                   ),
//                                 ),
//                               ),
//                             );
//                           }
//                       )
//                   );
//                 }
//                 else
//                 {
//                   return Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: Center(child: Text('${widget.userName} did not lose any pet ',
//                       style: const TextStyle(
//                           fontSize: 30
//                       ),
//
//                     )),
//                   );
//                 }
//               }
//           ),
//         ],
//       ),
//
//     );
//   }
// }
