// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../bloc/checkbox_provider.dart';
// import '../constant/colors.dart';
// import '../model/user_profile.dart';
// import '../views/shareAbleWidget.dart/commonShareWidget.dart';
// import 'image_view_page.dart';
//
// class UnverifiedProfessionalList extends StatefulWidget {
//   const UnverifiedProfessionalList({super.key});
//   @override
//   State<UnverifiedProfessionalList> createState() => _UnverifiedProfessionalListState();
// }
//
// class _UnverifiedProfessionalListState extends State<UnverifiedProfessionalList> {
//
//   final fireStore =  FirebaseFirestore.instance.collection('users').snapshots();
//   CollectionReference ref = FirebaseFirestore.instance.collection('users');
//   List<UserProfileModel> _list = [];
//   final List<UserProfileModel> _searchList = [];
//   bool _isSearching = false;
//
//   @override
//   Widget build(BuildContext context)
//   {
//     final size = MediaQuery.of(context).size;
//     var width = size.width;
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: _isSearching ? TextField(
//           autofocus: true,
//           decoration:  const InputDecoration(
//               hintText: 'Enter Name, Email or Profession',
//               border: InputBorder.none
//           ),
//           maxLines: 1,
//           style:  const TextStyle(
//             fontSize: 16,
//             letterSpacing: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           onChanged:(val){
//             _searchList.clear();
//             for( var i in _list){
//               if(i.isDocVerified != true || i.isIdVerified != true){
//                 if(i.name!.toLowerCase().contains(val.toLowerCase())
//                     || i.email!.toLowerCase().contains(val.toLowerCase())
//                     || i.professionalType!.toLowerCase().contains(val.toLowerCase())
//                 ){
//                   _searchList.add(i);
//                 }
//               }
//
//               setState(() {
//                 _searchList;
//               });
//             }
//           },
//         ): const Text("Unverified Professional"),
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
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           StreamBuilder<QuerySnapshot>
//             (
//               stream: fireStore,
//               builder: (BuildContext context,
//                   AsyncSnapshot<QuerySnapshot> snapshot)
//               {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const CircularProgressIndicator();
//                 }
//                 if (snapshot.hasError) return const Text('Some Error');
//                 final data = snapshot.data?.docs;
//                 if (kDebugMode) {
//                   print('====Snapshot length : ${data?.length}');
//                 }
//                 // _list = data?.map((e) => UserProfileModel.fromJson(e.data() as Map<String, dynamic>)).where((element) =>
//                 // element.isProfessional == true
//                 //     && (element.isDocVerified == false || element.isDocVerified == null
//                 //       || element.isIdVerified == false || element.isIdVerified == null
//                 // )).toList() ?? [];
//
//                 _list = data?.map((e) => UserProfileModel.fromJson(e.data() as Map<String, dynamic>)).where((element) =>
//                 element.isProfessional == true
//                     && (element.isDocVerified != true || element.isIdVerified != true
//                 )).toList() ?? [];
//
//                 if (kDebugMode) {
//                   print('====_list length : ${_list.length}');
//                 }
//                 if(_list.isNotEmpty)
//                 {
//                   return Expanded(
//                       child: ListView.builder(
//                           itemCount: _isSearching ? _searchList.length : _list.length,
//                           itemBuilder: (context, index) {
//                             if(_isSearching == true){
//                               return Padding(
//                                 padding: const EdgeInsets.only(left: 20.0,
//                                     right: 20.0, bottom: 10.0),
//                                 child:
//                                 InkWell(
//                                   onTap: ()
//                                   {
//                                   },
//                                   child:
//                                   Card(
//                                     color: AppColor.orange,
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(12.0),
//                                       child: SizedBox(
//                                           height: 330,
//                                           width: width,
//                                           child: Column(
//                                             children: [
//                                               Row(
//                                                 mainAxisAlignment: MainAxisAlignment.start,
//                                                 children: [
//                                                   Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     children: [
//                                                       Row(
//                                                         children: [
//                                                           const Text("Name: ",
//                                                             style: TextStyle(
//                                                               fontSize: 18,
//                                                               fontWeight: FontWeight.bold,
//                                                             ),
//                                                           ),
//                                                           Text("${_searchList[index].name}",
//                                                             maxLines: 1,
//                                                             overflow: TextOverflow.ellipsis,
//                                                             softWrap: true,
//                                                             style: const TextStyle(
//                                                               fontSize: 15,
//                                                             ),
//                                                           ),
//                                                           const SizedBox(width: 20,),
//                                                           CircleAvatar(
//                                                             backgroundImage: NetworkImage(_searchList[index].profilephotoImageUrl.toString()),
//                                                             radius: 20,
//                                                           ),
//                                                         ],
//                                                       ),
//                                                       const SizedBox(height: 5,),
//                                                       Row(
//                                                         children: [
//                                                           const Text("Profession: ",
//                                                             style: TextStyle(
//                                                               fontSize: 18,
//                                                               fontWeight: FontWeight.bold,
//                                                             ),
//                                                           ),
//                                                           Text("${_searchList[index].professionalType}",
//                                                             maxLines: 1,
//                                                             overflow: TextOverflow.ellipsis,
//                                                             softWrap: true,
//                                                             style: const TextStyle(
//                                                               fontSize: 15,
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                       const SizedBox(height: 5,),
//                                                       Row(
//                                                         children: [
//                                                           const Text("Contact No: ",
//                                                             style: TextStyle(
//                                                               fontSize: 18,
//                                                               fontWeight: FontWeight.bold,
//                                                             ),
//                                                           ),
//                                                           Text("${_searchList[index].phone}",
//                                                             maxLines: 1,
//                                                             overflow: TextOverflow.ellipsis,
//                                                             softWrap: true,
//                                                             style: const TextStyle(
//                                                               fontSize: 15,
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                       const SizedBox(height: 5,),
//                                                       Row(
//                                                         children: [
//                                                           const Text("Email: ",
//                                                             style: TextStyle(
//                                                               fontSize: 18,
//                                                               fontWeight: FontWeight.bold,
//                                                             ),
//                                                           ),
//                                                           Text("${_searchList[index].email}",
//                                                             maxLines: 1,
//                                                             overflow: TextOverflow.ellipsis,
//                                                             softWrap: true,
//                                                             style: const TextStyle(
//                                                               fontSize: 15,
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                       const SizedBox(height: 5,),
//                                                       Row(
//                                                         children: [
//                                                           const Text("Address: ",
//                                                             style: TextStyle(
//                                                               fontSize: 18,
//                                                               fontWeight: FontWeight.bold,
//                                                             ),
//                                                           ),
//                                                           Text("${_searchList[index].address}",
//                                                             maxLines: 1,
//                                                             overflow: TextOverflow.ellipsis,
//                                                             softWrap: true,
//                                                             style: const TextStyle(
//                                                               fontSize: 15,
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                       const SizedBox(height: 10,),
//                                                       Row(
//                                                         children: [
//                                                           const Text("ID: ",
//                                                             style: TextStyle(
//                                                               fontSize: 18,
//                                                               fontWeight: FontWeight.bold,
//                                                             ),
//                                                           ),
//                                                           // Text("${_searchList[index].idType}",
//                                                           //   style: const TextStyle(
//                                                           //     fontSize: 15,
//                                                           //   ),
//                                                           // ),
//                                                           const SizedBox(width: 10,),
//                                                           InkWell(
//                                                             onTap: (){
//                                                               if( _searchList[index].idImageUrl != null){
//                                                                 String idUrl  =  _searchList[index].idImageUrl.toString();
//                                                                 Navigator.push(context, MaterialPageRoute(builder: (_) => ImageViewPage(imageUrl: idUrl,
//                                                                   idType: "Id Viewer",
//                                                                   userName: _searchList[index].name.toString(),
//                                                                   profession: _searchList[index].professionalType.toString(),
//                                                                 )));
//                                                               } else{
//                                                                 CommonShareWidget.showFlushBar(
//                                                                     context: context,
//                                                                     duration: 2,
//                                                                     message: "ID Is not Available");
//                                                               }
//                                                             },
//                                                             child: Container(
//                                                               height: 30,
//                                                               width: 30,
//                                                               decoration: BoxDecoration(
//                                                                   color: Colors.black54,
//                                                                   border: Border.all(
//                                                                       color: Colors.black
//                                                                   )
//                                                               ),
//                                                               child: _searchList[index].idImageUrl != null ? Image.network(_searchList[index].idImageUrl.toString(),
//                                                                 fit: BoxFit.fill,
//                                                               ) : const Icon(Icons.image,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           if(_searchList[index].idImageUrl != null)...[
//                                                             const SizedBox(width: 10,),
//                                                             Column(
//                                                               children: [
//                                                                 const Text("Yes"),
//                                                                 Checkbox(
//                                                                   value: _searchList[index].isIdVerified,
//                                                                   checkColor: Colors.white,
//                                                                   activeColor: Colors.green,
//                                                                   onChanged: (value) {
//
//                                                                     Provider.of<CheckBoxProvider>(context, listen: false).idVerifyCheckList(_searchList[index].uid.toString(), value! );
//                                                                     setState(() {
//                                                                       _searchList[index].isIdVerified = value;
//                                                                       _searchList[index].isIdRejected = false;
//                                                                       _searchList;
//                                                                     });
//                                                                     },
//                                                                 ),],
//                                                             ), //
//                                                             const SizedBox(width: 10,),
//                                                             Column(
//                                                               children: [
//                                                                 const Text("No"),
//                                                                 Checkbox(
//                                                                   value: _searchList[index].isIdRejected,
//                                                                   checkColor: Colors.white,
//                                                                   activeColor: Colors.red,
//                                                                   onChanged: (value) {
//                                                                     Provider.of<CheckBoxProvider>(context, listen: false).idRejectCheckList(_searchList[index].uid.toString(), value! );
//                                                                     setState(() {
//                                                                       _searchList[index].isIdRejected = value;
//                                                                       _searchList[index].isIdVerified = false;
//                                                                       _searchList;
//                                                                     });
//                                                                   },
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ]
//                                                         ],
//                                                       ),
//                                                       const SizedBox(height: 10,),
//                                                       Row(
//                                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                                         children: [
//                                                           const Text("Service ID: ",
//                                                             maxLines: 1,
//                                                             overflow: TextOverflow.ellipsis,
//                                                             softWrap: true,
//                                                             style: TextStyle(
//                                                               fontSize: 18,
//                                                               fontWeight: FontWeight.bold,
//                                                             ),
//                                                           ),
//                                                           // Text( "${_searchList[index].professionalType}",
//                                                           //   style: const TextStyle(
//                                                           //     fontSize: 15,
//                                                           //     // fontWeight: FontWeight.bold,
//                                                           //   ),
//                                                           // ),
//                                                           const SizedBox(width: 10,),
//                                                           InkWell(
//                                                             onTap: (){
//                                                               if(_searchList[index].professionalImageUrl != null){
//                                                                 String idUrl  =  _searchList[index].professionalImageUrl.toString();
//                                                                 Navigator.push(context, MaterialPageRoute(builder: (_) => ImageViewPage(imageUrl: idUrl,
//                                                                   idType: "Document Viewer",
//                                                                   userName: _searchList[index].name.toString(),
//                                                                   profession: _searchList[index].professionalType.toString()
//                                                                 )));
//                                                               } else{
//                                                                 CommonShareWidget.showFlushBar(
//                                                                     context: context,
//                                                                     duration: 2,
//                                                                     message: "Document Is not Available");
//                                                               }
//                                                             },
//                                                             child: Container(
//                                                               height: 30,
//                                                               width: 30,
//                                                               decoration: BoxDecoration(
//                                                                   color: Colors.black54,
//                                                                   border: Border.all(
//                                                                       color: Colors.black
//                                                                   )
//                                                               ),
//                                                               child:_searchList[index].professionalImageUrl != null ? Image.network(_searchList[index].professionalImageUrl.toString(),
//                                                                 fit: BoxFit.fill,
//                                                               ) : const Icon(Icons.image,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           // const SizedBox(width: 5,),
//                                                           if(_searchList[index].professionalImageUrl != null)...[
//                                                             Column(
//                                                               children: [
//                                                                 const Text("Yes"),
//                                                                 Checkbox(
//                                                                   value: _searchList[index].isDocVerified,
//                                                                   checkColor: Colors.white,
//                                                                   activeColor: Colors.green,
//                                                                   onChanged: (value) {
//                                                                     Provider.of<CheckBoxProvider>(context, listen: false).docVerifyCheckList(_searchList[index].uid.toString(), value! );
//                                                                     setState(() {
//                                                                       _searchList[index].isDocVerified = value;
//                                                                       _searchList[index].isDocRejected = false;
//                                                                       _searchList;
//                                                                     });
//                                                                     },
//                                                                 ),
//                                                               ],
//                                                             ), //
//                                                             const SizedBox(width: 5,),
//                                                             Column(
//                                                               children: [
//                                                                 const Text("No"),
//                                                                 Checkbox(
//                                                                   value:_searchList[index].isDocRejected,
//                                                                   checkColor: Colors.white,
//                                                                   activeColor: Colors.red,
//                                                                   onChanged: (value) {
//                                                                     Provider.of<CheckBoxProvider>(context, listen: false).docRejectedCheckList(_searchList[index].uid.toString(), value! );
//                                                                     setState(() {
//                                                                       _searchList[index].isDocRejected = value;
//                                                                       _searchList[index].isDocVerified = false;
//                                                                       _searchList;
//                                                                     });
//                                                                          },
//                                                                 ),
//                                                               ],
//                                                             ),// Checkbox
//                                                           ],
//                                                         ],
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ],
//                                               ),
//                                               const SizedBox(height: 10,),
//                                             ],
//                                           )
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             }
//                             else
//                             {
//                               return Padding(
//                                 padding: const EdgeInsets.only(left: 20.0,
//                                     right: 20.0, bottom: 10.0),
//                                 child: InkWell(
//                                   onTap: (){
//                                   },
//                                   child:
//                                   Card(
//                                     color: AppColor.orange,
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(12.0),
//                                       child: SizedBox(
//                                           height: 330,
//                                           width: width,
//                                           child: Column(
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   const Text("Name: ",
//                                                     style: TextStyle(
//                                                       fontSize: 18,
//                                                       fontWeight: FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                   Text("${_list[index].name}",
//                                                     maxLines: 1,
//                                                     overflow: TextOverflow.ellipsis,
//                                                     softWrap: true,
//                                                     style: const TextStyle(
//                                                       fontSize: 15,
//                                                       // fontWeight: FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                   const SizedBox(width: 20,),
//                                                   CircleAvatar(
//                                                     backgroundImage: NetworkImage(_list[index].profilephotoImageUrl.toString()),
//                                                     radius: 20,
//                                                   ),
//                                                 ],
//                                               ),
//                                               const SizedBox(height: 5,),
//                                               Row(
//                                                 children: [
//                                                   const Text("Profession: ",
//                                                     style: TextStyle(
//                                                       fontSize: 18,
//                                                       fontWeight: FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                   Text("${_list[index].professionalType}",
//                                                     maxLines: 1,
//                                                     overflow: TextOverflow.ellipsis,
//                                                     softWrap: true,
//                                                     style: const TextStyle(
//                                                       fontSize: 15,
//                                                       // fontWeight: FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               const SizedBox(height: 5,),
//                                               Row(
//                                                 children: [
//                                                   const Text("Contact No: ",
//                                                     style: TextStyle(
//                                                       fontSize: 18,
//                                                       fontWeight: FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                   Text("${_list[index].phone}",
//                                                     maxLines: 1,
//                                                     overflow: TextOverflow.ellipsis,
//                                                     softWrap: true,
//                                                     style: const TextStyle(
//                                                       fontSize: 15,
//                                                       // fontWeight: FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               const SizedBox(height: 5,),
//                                               Row(
//                                                 children: [
//                                                   const Text("Email: ",
//                                                     style: TextStyle(
//                                                       fontSize: 18,
//                                                       fontWeight: FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                   Text("${_list[index].email}",
//                                                     maxLines: 1,
//                                                     overflow: TextOverflow.ellipsis,
//                                                     softWrap: true,
//                                                     style: const TextStyle(
//                                                       fontSize: 15,
//                                                       // fontWeight: FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               const SizedBox(height: 5,),
//                                               Row(
//                                                 children: [
//                                                   const Text("Address: ",
//                                                     style: TextStyle(
//                                                       fontSize: 18,
//                                                       fontWeight: FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                   Text("${_list[index].address}",
//                                                     maxLines: 1,
//                                                     overflow: TextOverflow.ellipsis,
//                                                     softWrap: true,
//                                                     style: const TextStyle(
//                                                       fontSize: 15,
//                                                       // fontWeight: FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               const SizedBox(height: 05,),
//                                               Row(
//                                                 children: [
//                                                   const Text("ID: ",
//                                                     style: TextStyle(
//                                                       fontSize: 18,
//                                                       fontWeight: FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                   // Text("${_list[index].idType}",
//                                                   //   style: const TextStyle(
//                                                   //     fontSize: 15,
//                                                   //   ),
//                                                   // ),
//                                                   const SizedBox(width: 5,),
//                                                   InkWell(
//                                                     onTap: (){
//                                                       if( _list[index].idImageUrl != null)
//                                                       {
//                                                         String idUrl  =  _list[index].idImageUrl.toString();
//                                                         Navigator.push(context, MaterialPageRoute(builder: (_) =>
//                                                             ImageViewPage(imageUrl: idUrl,
//                                                           idType: "Id Viewer",
//                                                           userName: _list[index].name.toString(),
//                                                           profession: _list[index].professionalType.toString(),
//                                                         )));
//                                                       }
//                                                       else
//                                                       {
//                                                         CommonShareWidget.showFlushBar(
//                                                             context: context,
//                                                             duration: 2,
//                                                             message: "ID Is not Available");
//                                                       }
//                                                     },
//                                                     child: Container(
//                                                       height: 30,
//                                                       width: 30,
//                                                       decoration: BoxDecoration(
//                                                           color: Colors.black54,
//                                                           border: Border.all(
//                                                               color: Colors.black
//                                                           )
//                                                       ),
//                                                       child: _list[index].idImageUrl != null ?
//                                                       Image.network(_list[index].idImageUrl.toString(),
//                                                         fit: BoxFit.fill,
//                                                       ) : const Icon(Icons.image,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   if(_list[index].idImageUrl != null )...[
//                                                     const SizedBox(width: 10,),
//                                                     Column(
//                                                       children: [
//                                                         const Text("Yes"),
//                                                         Checkbox(
//                                                           value: _list[index].isIdVerified,
//                                                           checkColor: Colors.white,
//                                                           activeColor: Colors.green,
//                                                           onChanged: (value) {
//                                                             Provider.of<CheckBoxProvider>(context, listen: false).idVerifyCheckList(_list[index].uid.toString(), value! );
//                                                             },
//                                                         ),],
//                                                     ), //
//                                                     const SizedBox(width: 10,),
//                                                     Column(
//                                                       children: [
//                                                         const Text("No"),
//                                                         Checkbox(
//                                                           value: _list[index].isIdRejected,
//                                                           checkColor: Colors.white,
//                                                           activeColor: Colors.red,
//                                                           onChanged: (value) {
//                                                             Provider.of<CheckBoxProvider>(context, listen: false).idRejectCheckList(_list[index].uid.toString(), value! );
//                                                             },
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ]
//                                                 ],
//                                               ),
//                                               const SizedBox(height: 05,),
//                                               Row(
//                                                 children: [
//                                                   const Text("Service ID: ",
//                                                     style: TextStyle(
//                                                       fontSize: 20,
//                                                       fontWeight: FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                   // Text("${_list[index].professionalType}",
//                                                   //   style: const TextStyle(
//                                                   //     fontSize: 15,
//                                                   //     // fontWeight: FontWeight.bold,
//                                                   //   ),
//                                                   // ),
//                                                   // const SizedBox(width: 10,),
//                                                   InkWell(
//                                                     onTap: (){
//                                                       if( _list[index].professionalImageUrl != null)
//                                                                                                             {
//                                                         String idUrl  =  _list[index].professionalImageUrl.toString();
//                                                         Navigator.push(context, MaterialPageRoute(builder: (_) => ImageViewPage(imageUrl: idUrl,
//                                                           idType: "Document Viewer",
//                                                           userName: _list[index].name.toString(),
//                                                           profession: _list[index].professionalType.toString()
//                                                         )));
//                                                       } else
//                                                       {
//                                                         CommonShareWidget.showFlushBar(
//                                                             context: context,
//                                                             duration: 2,
//                                                             message: "Document Is not Available");
//                                                       }
//                                                     },
//                                                     child: Container(
//                                                       height: 30,
//                                                       width: 30,
//                                                       decoration: BoxDecoration(
//                                                           color: Colors.black54,
//                                                           border: Border.all(
//                                                               color: Colors.black
//                                                           )
//                                                       ),
//                                                       child: _list[index].professionalImageUrl != null ? Image.network(_list[index].professionalImageUrl.toString(),
//                                                         fit: BoxFit.fill,
//                                                       ) : const Icon(Icons.image,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   // const SizedBox(width: 5,),
//                                           if(_list[index].professionalImageUrl != null)...[
//                                             Column(
//                                               children: [
//                                                 const Text("Yes"),
//                                                 Checkbox(
//                                               value: _list[index].isDocVerified,
//                                               checkColor: Colors.white,
//                                               activeColor: Colors.green,
//                                               onChanged: (value) {
//                                                 Provider.of<CheckBoxProvider>(context, listen: false).docVerifyCheckList(_list[index].uid.toString(), value! );
//                                                 },
//                                                 ),
//                                               ],
//                                             ), //
//                                             const SizedBox(width: 5,),
//                                             Column(
//                                               children: [
//                                                 const Text("No"),
//                                                 Checkbox(
//                                               value: _list[index].isDocRejected,
//                                               checkColor: Colors.white,
//                                               activeColor: Colors.red,
//                                               onChanged: (value) {
//                                                 Provider.of<CheckBoxProvider>(context, listen: false).docRejectedCheckList(_list[index].uid.toString(), value! );
//                                                 },
//                                                 ),
//                                               ],
//                                             ),// Checkbox
//                                           ],],
//                                               ),
//                                             ],
//                                           )
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             }
//                           }
//                       )
//                   );
//                 }
//                 return const Center(
//                   child: Text('No User found',
//                       style: TextStyle(
//                           fontSize: 20
//                       )
//                   ),
//                 );
//               }
//           ),
//         ],
//       ),
//     );
//   }
// }
//
