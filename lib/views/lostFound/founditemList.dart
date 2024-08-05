// import 'dart:developer';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/bloc/itemBloc.dart';
// import 'package:petfindernetwork/model/lost_found_item_info_model.dart';
// import 'package:petfindernetwork/views/shareAbleWidget.dart/commonShareWidget.dart';
// import 'package:provider/provider.dart';
// import '../../constant/colors.dart';
// import '../loginSignUp/login_with_email.dart';
// import '../user/userProfile.dart';
// import 'coomonWidget/lostFoundCommonWidget.dart';
// import 'itemDetailpage.dart';
//
// class FoundPetList extends StatefulWidget {
//   const FoundPetList({super.key});
//
//   @override
//   State<FoundPetList> createState() => _FoundPetListState();
// }
//
// class _FoundPetListState extends State<FoundPetList> {
//
//   ScrollController controller = ScrollController();
//   late PetBloc petBloc;
//   late CommonLostFoundWidget _commonLostFoundWidget;
//   late Stream<List<DocumentSnapshot>?> stream;
//   List<LostFoundPetInfoModel> _foundPetList = [];
//   final List<LostFoundPetInfoModel> _searchList = [];
//   bool _isSearching = false;
//    late CommonLostFoundWidget _searchFoundWidget;
//   late LostFoundPetInfoModel lostFoundPetInfoModel;
//   late LostFoundPetInfoModel foundPetInfoModel;
//   @override
//   void initState() {
//
//     petBloc = PetBloc("found");
//     petBloc.fetchFirstList();
//     controller.addListener(_scrollListener);
//     petBloc.listentChangeofData();
//     stream = petBloc.petStream;
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     petBloc.dispose();
//     controller.dispose();
//     petBloc.documentList?.clear();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     appBar: AppBar(
//         title: _isSearching ?
//         TextField
//           (
//           autofocus: true,
//           decoration: const InputDecoration(
//               hintText: 'Search by name/category/color ',
//             hintStyle: TextStyle(color: Colors.black,
//                 fontWeight: FontWeight.bold
//             ),
//               border: InputBorder.none,
//                   ),
//           style: const TextStyle(
//             fontSize: 16,
//             letterSpacing: 1,
//           ),
//           onChanged:(val){
//             _searchList.clear();
//             for( var i in _foundPetList){
//               if(i.petName!.toLowerCase().contains(val.toLowerCase()) ||
//               i.petCategory!.toLowerCase().contains(val.toLowerCase())
//               || i.petColor!.toLowerCase().contains(val.toLowerCase())
//               )
//               {
//                  _searchList.add(i);
//                               }
//               setState(() {
//                 _searchList;
//                 // print("found pet length in search ${_searchList.first.petName}");
//               });
//             }
//           },
//         )
//             : const Text("Found a pet"),
//         actions: <Widget>[
//           actionSearchButton(),
//           // actionProfileButton(),
//           // const SizedBox(width: 15),
//         ],
//       ),
//       body: StreamBuilder<List<DocumentSnapshot>?>(
//         stream: stream,
//         builder: (BuildContext context, snapshot) {
//           if (snapshot.data != null)
//           {
//             log(snapshot.data!.length.toString());
//             final data = snapshot.data;
//
//             _foundPetList = data?.map((e) => LostFoundPetInfoModel.fromMap(e.data() as Map<String, dynamic>?)).toList() ?? [];
//                   return ListView.builder(
//               itemCount: _isSearching ?  _searchList.length : _foundPetList.length,
//               shrinkWrap: true,
//               controller: controller,
//               itemBuilder: (context, index) {
//                 _isSearching ? (_searchFoundWidget = CommonLostFoundWidget(_searchList[index], false)): (_commonLostFoundWidget =
//                      CommonLostFoundWidget(_foundPetList[index], false));
//                 return _isSearching  ? _searchFoundWidget.buildPetTile
//                   (
//                   context,
//                       ()
//                   {
//                     CommonShareWidget.goToAnotherPage(
//                       checkLogin: true,
//                       nextPage: StreamProvider<
//                           DocumentSnapshot<Map<String, dynamic>?>?>(
//                         create: (BuildContext context) {
//                           return petBloc
//                               .getSinglePetStream(_searchList[index].docID);
//                         },
//                         initialData: null,
//                         child: const PetDetailPage(matchPet: false,
//                           // petDetails: lostFoundPetInfoModel,
//                         ),
//                       ),
//                       context: context,
//                     ).then(
//                           (value) => setState(
//                             () {
//                           stream = petBloc.petStream;
//                         },
//                       ),
//                     );
//                   },
//                 ) :
//
//                 _commonLostFoundWidget.buildPetTile
//                   (
//                   context,
//                       ()
//                   {
//                     CommonShareWidget.goToAnotherPage(
//                       checkLogin: true,
//                       nextPage: StreamProvider<
//                           DocumentSnapshot<Map<String, dynamic>?>?>(
//                         create: (BuildContext context) {
//                           return petBloc
//                               .getSinglePetStream(_foundPetList[index].docID);
//                         },
//                         initialData: null,
//                         child: const PetDetailPage(matchPet: false,
//                                                     // petDetails: lostFoundPetInfoModel,
//                         ),
//                       ),
//                       context: context,
//                     ).then(
//                           (value) => setState(
//                             () {
//                           stream = petBloc.petStream;
//                         },
//                       ),
//                     );
//                   },
//                 );
//               },
//             );
//
//
//           }
//           else {
//             return const Center(child: Text("No Found Pet",
//               style: TextStyle(
//                 fontSize: 25,
//
//               ),
//             )
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   void _scrollListener() {
//     if (controller.offset >= controller.position.maxScrollExtent &&
//         !controller.position.outOfRange) {
//       petBloc.fetchNextMovies();
//     }
//   }
//
//   actionSearchButton() {
//     return Padding(
//       padding: const EdgeInsets.only(right: 10.0),
//       child: InkWell(
//         onTap:() async {
//           setState(() {
//             _isSearching = !_isSearching;
//             _searchList.clear();
//           });
//           // checkUser(context, false, "no");
//         },
//         child: Card(
//           elevation: 6,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(22.0), //<-- SEE HERE
//           ),
//           child: Container(
//             height: 45,
//             width: 45,
//             decoration: BoxDecoration(color: AppColor.orange,
//                 borderRadius: const BorderRadius.all(Radius.circular(22))
//
//             ),
//             child: Center(
//                 child: Icon( _isSearching ? CupertinoIcons.clear_circled_solid :Icons.search)
//             ),
//           ),
//         ),
//       ),
//     );
//
//
//     // IconButton(
//       //   onPressed: () {
//       //     setState(() {
//       //       _isSearching = !_isSearching;
//       //       _searchList.clear();
//       //     });
//       //   },
//       //   icon:  Icon( _isSearching ? CupertinoIcons.clear_circled_solid :Icons.search)
//       //
//       //
//       //   );
//   }
//
//   actionProfileButton() {
//     return Consumer<User?>(builder: (_, user, child) {
//       return IconButton(
//           icon: const Icon(Icons.person),
//           style: IconButton.styleFrom(
//             backgroundColor: Colors.blue.shade50,
//           ),
//           onPressed: () {
//             if (user == null) {
//               CommonShareWidget.goToAnotherPage(
//                   nextPage: const LoginWithEmail(), context: context);
//             } else {
//               CommonShareWidget.goToAnotherPage(
//                   nextPage: const UserProfile(), context: context);
//             }
//             //_scaffoldKey.currentState!.openEndDrawer();
//           });
//     });
//   }
// }
