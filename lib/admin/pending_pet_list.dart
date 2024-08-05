// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../Web_helper/colors.dart';
// import '../model/lost_found_item_info_model.dart';
// import '../model/user_profile.dart';
//
// class PendingPetList extends StatefulWidget {
//   const PendingPetList({super.key});
//   @override
//   State<PendingPetList> createState() => _PendingPetListState();
// }
//
// class _PendingPetListState extends State<PendingPetList> {
//   final fireStore =  FirebaseFirestore.instance.collection('lfPets').snapshots();
//   CollectionReference ref = FirebaseFirestore.instance.collection('lfPets');
//   // var size,height,width;
//   UserProfileModel? userProfileModel;
//   List<LostFoundPetInfoModel> _list = [];
//   final List<LostFoundPetInfoModel> _searchList = [];
//   bool _isSearching = false;
//   List <Map<String, dynamic>> userPetList = [];
//
//   @override
//   Widget build(BuildContext context) {
//    final size = MediaQuery.of(context).size;
//    var width = size.width;
//
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: _isSearching ? TextField
//           (
//           autofocus: true,
//           decoration: const InputDecoration(
//               hintText: 'Enter Pet Name',
//               border: InputBorder.none
//           ),
//           style: const TextStyle(
//             fontSize: 16,
//             letterSpacing: 1,
//           ),
//           onChanged:(val){
//             _searchList.clear();
//             for( var i in _list){
//               if(i.review == false){
//                 if(i.petName!.toLowerCase().contains(val.toLowerCase())){
//                   _searchList.add(i);
//                 }
//               }
//               setState(() {
//                 _searchList;
//               });
//             }
//           },
//
//         ): const Text("Pending Pet List"),
//
//         actions: [
//           IconButton(onPressed: (){
//             setState(() {
//               _isSearching = !_isSearching;
//               _searchList.clear();
//             });
//           }, icon:  Icon( _isSearching ? CupertinoIcons.clear_circled_solid :Icons.search)
//           ),
//         ],
//       ),
//
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           StreamBuilder<QuerySnapshot>(
//               stream: fireStore,
//               builder: (BuildContext context,
//                   AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting){
//                   return const CircularProgressIndicator();
//                 }
//
//                 if (snapshot.hasError) return const Text('Some Error');
//
//                 var listLength = snapshot.data!.docs.length;
//                 final data = snapshot.data?.docs;
//
//                 _list = data?.map((e) => LostFoundPetInfoModel.fromMap(e.data() as Map<String, dynamic>?)).toList() ?? [];
//
//                 List <Map<String, dynamic>> userPetList = [];
//                 for(int i = 0; i < listLength; i++ )
//                 {
//                   Map<String, dynamic> val1 = snapshot.data!.docs[i].data() as Map<String, dynamic>;
//                   if (val1['review'] == false)
//                   {
//                     debugPrint("----Pet Review: ${val1['review']} ");
//                     debugPrint("----Pet Category: ${val1['pet_category']} ");
//                     userPetList.add(val1);
//                   }
//                 }
//
//                 if(userPetList.isNotEmpty){
//                   return Expanded(
//                       child: ListView.builder(
//                           itemCount: _isSearching ? _searchList.length : userPetList.length,
//                           itemBuilder: (context, index) {
//                             dynamic val = userPetList[index];
//                             List<dynamic> urlList = val['image_url'];
//                             String url = urlList.first.toString();
//                             String documentID = val['docID'].toString();
//     if (_isSearching == true)
//     {
//       return Padding(
//         padding: const EdgeInsets.only(left: 20.0,
//           right: 20.0,),
//         child:
//
//         Card(
//           color: AppColor.orange,
//           child: Padding(
//             padding: const EdgeInsets.only(left: 12.0,
//                 right: 12.0, top: 12.0),
//             child: SizedBox(
//                 height: 310,
//                 width: width,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 200,
//                           width: width *0.30,
//                           child: Image.network(_searchList[index].petImageUrl!.first.toString(),
//                             height: 200,
//                             width: width *0.30,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         const SizedBox(width: 15,),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   const Text("Pet Name: ",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Text("${_searchList[index].petName}",
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       softWrap: true,
//                                       style: const TextStyle(
//                                         fontSize: 15,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   const Text("Category: ",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text("${_searchList[index].petCategory}",
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     softWrap: true,
//                                     style: const TextStyle(
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   const Text("Description: ",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Text("${_searchList[index].description}",
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       softWrap: true,
//                                       style: const TextStyle(
//                                         fontSize: 15,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   const Text("Gender: ",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text("${_searchList[index].petGender}",
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     softWrap: true,
//                                     style: const TextStyle(
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   const Text("Color: ",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Text("${_searchList[index].petColor}",
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       softWrap: true,
//                                       style: const TextStyle(
//                                         fontSize: 15,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   const Text("Status: ",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text("${_searchList[index].petStatus}",
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     softWrap: true,
//                                     style: const TextStyle(
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   const Text("Review: ",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text("${_searchList[index].review}",
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     softWrap: true,
//                                     style: const TextStyle(
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20,),
//                     Center(
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.black,
//                             minimumSize: const Size.fromHeight(50), // NEW
//                           ),
//                           onPressed: (){
//                             String searchDocumentID = _searchList[index].docID.toString();
//                             ref.doc(searchDocumentID).update(
//                                 {
//                                   'review': true,
//                                 }
//                             ).then((value){
//                               const Text('Update');
//                             }).onError((error, stackTrace){
//                               const Text('Error');
//                             });
//                             setState(() {
//                               _searchList;
//                               _searchList.clear();
//                             });
//                           }, child: const Text("Ok",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 23,
//                           // fontWeight: FontWeight.bold
//                         ),
//                       )),
//                     )
//                   ],
//                 )
//             ),
//           ),
//         ),
//       );
//
//     }
//     else
//     {
//       return Padding(
//         padding: const EdgeInsets.only(left: 20.0,
//           right: 20.0,),
//         child:
//         Card(
//           color: AppColor.orange,
//           child: Padding(
//             padding: const EdgeInsets.only(left: 12.0,
//                 right: 12.0, top: 12.0),
//             child: SizedBox(
//                 height: 310,
//                 width: width,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 200,
//                           width: width * 0.30,
//                           child: Image.network(url,
//                             height: 200,
//                             width: width * 0.30,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         const SizedBox(width: 15,),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Row(
//                                 children: [
//                                   const Text("Pet Name: ",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Text("${val['pet_name']}",
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       softWrap: true,
//                                       style: const TextStyle(
//                                         fontSize: 15,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   const Text("Category: ",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text("${val['pet_category']}",
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     softWrap: true,
//                                     style: const TextStyle(
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   const Text("Description: ",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Text("${val['description']}",
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       softWrap: true,
//                                       style: const TextStyle(
//                                         fontSize: 15,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   const Text("Gender: ",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text("${val['pet_gender']}",
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     softWrap: true,
//                                     style: const TextStyle(
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   const Text("Color: ",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Text("${val['pet_color']}",
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       softWrap: true,
//                                       style: const TextStyle(
//                                         fontSize: 15,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   const Text("Status: ",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text("${val['pet_status']}",
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     softWrap: true,
//                                     style: const TextStyle(
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 5,),
//                               Row(
//                                 children: [
//                                   const Text("Review: ",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text("${val['review']}",
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     softWrap: true,
//                                     style: const TextStyle(
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20,),
//                     Center(
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.black,
//                             minimumSize: const Size.fromHeight(50), // NEW
//                           ),
//                           onPressed: (){
//                             ref.doc(documentID).update(
//                                 {
//                                   'review': true,
//                                 }
//                             ).then((value){
//                               const Text('Update');
//                             }).onError((error, stackTrace){
//                               const Text('Error');
//                             });
//                           }, child: const Text("Ok",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 23,
//                           // fontWeight: FontWeight.bold
//                         ),
//                       )),
//                     )
//                   ],
//                 )
//             ),
//           ),
//         ),
//       );
//     }
//                           }
//                       )
//                   );
//                 }
//                 else
//                 {
//                   return const Padding(
//                       padding: EdgeInsets.all(20),
//                       child: Text("")
//                   );
//                 }
//               }
//           ),
//         ],
//       ),
//     );
//   }
// }
