// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/bloc/itemBloc.dart';
// import 'package:petfindernetwork/constant/colors.dart';
// import 'package:petfindernetwork/model/lost_found_item_info_model.dart';
// import 'package:petfindernetwork/repository/searchItemRepo.dart';
// import 'package:petfindernetwork/views/lostFound/coomonWidget/lostFoundCommonWidget.dart';
// import 'package:petfindernetwork/views/lostFound/itemDetailpage.dart';
// import 'package:petfindernetwork/views/shareAbleWidget.dart/commonShareWidget.dart';
// import 'package:provider/provider.dart';
//
// class SearchPetMain extends StatefulWidget {
//   const SearchPetMain({super.key});
//
//   @override
//   State<SearchPetMain> createState() => _SearchPetMainState();
// }
// class _SearchPetMainState extends State<SearchPetMain> {
//   List<DocumentSnapshot> queryResultSet = [];
//   List<DocumentSnapshot> tempSearchStore = [];
//   late List<LostFoundPetInfoModel> _lostFoundPetInfoModell;
//   late SearchPetRepo _searchPetRepo;
//   late PetBloc petBloc;
//   late CommonLostFoundWidget _commonLostFoundWidget;
//   @override
//   void initState() {
//     _searchPetRepo = SearchPetRepo();
//     petBloc = PetBloc("");
//     // _searchBloc.listentChangeofData();
//     super.initState();
//   }
//
//   initiateSearch(String? value) {
//     if (value != null || value!.isEmpty) {
//       setState(() {
//         queryResultSet = [];
//         tempSearchStore = [];
//       });
//     }
//
//     var capitalizedValue = (value.length >= 2)
//         ? value.substring(0, 1).toUpperCase() + value.substring(1)
//         : value;
//     if (queryResultSet.isEmpty && value.length == 1) {
//       _searchPetRepo.searchByProductName(value).then((QuerySnapshot docs) {
//         for (int i = 0; i < docs.docs.length; ++i) {
//           queryResultSet.add(docs.docs[i]);
//         }
//       });
//     } else {
//       tempSearchStore = [];
//       for (var element in queryResultSet) {
//         if (element['pet_name'].toString().startsWith(capitalizedValue)) {
//           setState(() {
//             tempSearchStore.add(element);
//           });
//         }
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColor.lightGreen,
//         title: Row(
//           children: <Widget>[
//             const Icon(Icons.search),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 2.0),
//                 child: TextField(
//                   onChanged: (val) {
//                     initiateSearch(val);
//                   },
//                   decoration: InputDecoration(
//                       contentPadding: const EdgeInsets.only(left: 2.0),
//                       hintText: "Search pet",
//                       hintStyle: TextStyle(color: AppColor.whiteColor),
//                       border: InputBorder.none),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Container(
//         child: buildFilteredPetsWidget(),
//       ),
//     );
//   }
//
//   buildFilteredPetsWidget() {
//     _lostFoundPetInfoModell = tempSearchStore
//         .map((e) => LostFoundPetInfoModel.fromDocumentSnapshot(e as DocumentSnapshot<Map<String, dynamic>>))
//         .toList();
//     return ListView.builder(
//         itemCount: _lostFoundPetInfoModell.length,
//         itemBuilder: (context, index) {
//           var data = _lostFoundPetInfoModell[index];
//           _commonLostFoundWidget = CommonLostFoundWidget(data, false);
//           return _commonLostFoundWidget.buildPetTile(context, () {
//             CommonShareWidget.goToAnotherPage(
//                 nextPage: StreamProvider<DocumentSnapshot<Map<String, dynamic>?>?>(
//                     create: (BuildContext context) {
//                       return petBloc.getSinglePetStream(data.docID);
//                     },
//                     initialData: null,
//                     child: const PetDetailPage(matchPet: true,
//                                             // petDetails: data,
//                     )),
//                 context: context);
//           });
//         });
//   }
// }
