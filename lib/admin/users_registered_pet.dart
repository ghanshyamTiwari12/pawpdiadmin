// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../Web_helper/colors.dart';
//
//
// class UsersRegisteredPet extends StatefulWidget {
//   const UsersRegisteredPet({super.key, required this.uid, required this.userName});
//   final String uid;
//   final String userName;
//
//   @override
//   State<UsersRegisteredPet> createState() => _UsersRegisteredPetState();
// }
//
// class _UsersRegisteredPetState extends State<UsersRegisteredPet> {
//   final fireStore =  FirebaseFirestore.instance.collection('registeredPet').snapshots();
//   CollectionReference ref = FirebaseFirestore.instance.collection('registeredPet');
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     var width = size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("${widget.userName} Pet List"),
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
//                   if ("${val1['userUid']}" == widget.uid){
//                     userPetList.add(val1);
//                   }
//                 }
//                 if(userPetList.isNotEmpty){
//                   return Expanded(
//                       child: ListView.builder(
//                           itemCount: userPetList.length,
//                           itemBuilder: (context, index) {
//                             dynamic val = userPetList[index];
//                             String url = userPetList[index]['profile_image_url'];
//                             return Padding(
//                               padding: const EdgeInsets.only(left: 20.0,
//                                   right: 20.0, bottom: 10.0),
//                               child:
//
//                               Card(
//                                 color: AppColor.orange,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(12.0),
//                                   child: SizedBox(
//                                       height: 180,
//                                       width: width,
//                                       child: Column(
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             children: [
//                                               CircleAvatar(
//                                                 backgroundImage: NetworkImage(url),
//                                                 radius: 50,
//                                               ),
//                                               const SizedBox(width: 15,),
//                                               Column(
//                                                 crossAxisAlignment: CrossAxisAlignment.start,
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
//                                                       const Text("Breed: ",
//                                                         style: TextStyle(
//                                                           fontSize: 20,
//                                                           fontWeight: FontWeight.bold,
//                                                         ),
//                                                       ),
//                                                       Text("${val['pet_breed']}",
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
//                                                       const Text("Age: ",
//                                                         style: TextStyle(
//                                                           fontSize: 20,
//                                                           fontWeight: FontWeight.bold,
//                                                         ),
//                                                       ),
//                                                       Text("${val['pet_year']} Year, ${val['pet_month']} Month ",
//                                                         style: const TextStyle(
//                                                           fontSize: 20,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                           const SizedBox(height: 10,),
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
//                   return const Center(child: Text('No Registered Pet',
//                     style: TextStyle(
//                         fontSize: 30
//                     ),
//
//                   ));
//                 }
//               }
//           ),
//         ],
//       ),
//
//     );
//   }
// }
