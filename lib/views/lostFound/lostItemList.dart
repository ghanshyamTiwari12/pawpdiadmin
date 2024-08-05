// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../bloc/itemBloc.dart';
// import '../../constant/colors.dart';
// import '../../model/lost_found_item_info_model.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
// import 'coomonWidget/lostFoundCommonWidget.dart';
// import 'itemDetailpage.dart';
//
// class LostPetList extends StatefulWidget {
//   const LostPetList({super.key});
//   @override
//   State<LostPetList> createState() => _LostPetListState();
// }
//
// class _LostPetListState extends State<LostPetList> {
//   ScrollController controller = ScrollController();
//   late PetBloc petBloc;
//   late CommonLostFoundWidget _commonLostFoundWidget;
//   List<LostFoundPetInfoModel> _lostPetList = [];
//   final List<LostFoundPetInfoModel> _searchList = [];
//   bool _isSearching = false;
//   // late LostFoundPetInfoModel lostFoundPetInfoModel;
//   // late LostFoundPetInfoModel lostPetInfoModel;
//   late CommonLostFoundWidget _searchlostWidget;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:
//       AppBar(
//         title: _isSearching ?
//         TextField
//           (
//           autofocus: true,
//           decoration: const InputDecoration(
//             hintText: 'Search by name/category/color ',
//             hintStyle: TextStyle(color: Colors.black,
//                 fontWeight: FontWeight.bold
//             ),
//             border: InputBorder.none,
//           ),
//           style: const TextStyle(
//             fontSize: 16,
//             letterSpacing: 1,
//           ),
//           onChanged:(val){
//             _searchList.clear();
//             for( var i in _lostPetList){
//               if(i.petName!.toLowerCase().contains(val.toLowerCase()) ||
//               i.petCategory!.toLowerCase().contains(val.toLowerCase())
//                   || i.petColor!.toLowerCase().contains(val.toLowerCase())
//               )
//               {
//                 _searchList.add(i);
//               }
//               setState(() {
//                 _searchList;
//                 // print("found pet length in search ${_searchList.first.petName}");
//               });
//             }
//           },
//         )
//             : const Text("Lost a pet"),
//         actions: <Widget>[
//           actionSearchButton(),
//           // actionProfileButton(),
//           // const SizedBox(width: 15),
//         ],
//       ),
//
//       body: StreamBuilder<List<DocumentSnapshot>?>(
//         stream: stream,
//         builder: (BuildContext context, snapshot) {
//           if (snapshot.data != null) {
//             final data = snapshot.data;
//             _lostPetList = data?.map((e) => LostFoundPetInfoModel.fromMap(e.data() as Map<String, dynamic>?)).toList() ?? [];
//             return ListView.builder(
//               itemCount: _isSearching ?  _searchList.length : _lostPetList.length,
//               shrinkWrap: true,
//               controller: controller,
//               itemBuilder: (context, index) {
//                 _isSearching ? (_searchlostWidget = CommonLostFoundWidget(_searchList[index], false)):
//                 (_commonLostFoundWidget =
//                     CommonLostFoundWidget(_lostPetList[index], false));
//                  return _isSearching ? _searchlostWidget.buildPetTile(context, ()
//                  {
//                    CommonShareWidget.goToAnotherPage(
//                      checkLogin: true,
//                      nextPage: StreamProvider<DocumentSnapshot<Map<String, dynamic>?>?>(
//                        create: (BuildContext context) {
//                          return petBloc
//                              .getSinglePetStream(_searchList[index].docID);
//                        },
//                        initialData: null,
//                        child: const PetDetailPage(matchPet: false,
//                          // petDetails: lostFoundPetInfoModel,
//                        ),
//                      ),
//                      context: context,
//                    ).then((value) => setState(() {
//                      stream = petBloc.petStream;
//                    }));
//                    // CommonShareWidget.goToAnotherPage(
//                    //     nextPage: Provider<LostFoundItemInfoModel>(
//                    //         create: (_) => lostFoundItemInfoModel,
//                    //         child: ItemDetailpage()),
//                    //     context: context);
//                  })
//                      : _commonLostFoundWidget.buildPetTile(context, () {
//                    CommonShareWidget.goToAnotherPage(
//                      checkLogin: true,
//                      nextPage: StreamProvider<DocumentSnapshot<Map<String, dynamic>?>?>(
//                        create: (BuildContext context) {
//                          return petBloc
//                              .getSinglePetStream(_lostPetList[index].docID);
//                        },
//                        initialData: null,
//                        child: const PetDetailPage(matchPet: false,
//                          // petDetails: lostFoundPetInfoModel,
//                        ),
//                      ),
//                      context: context,
//                    ).then((value) => setState(() {
//                      stream = petBloc.petStream;
//                    }));
//                    // CommonShareWidget.goToAnotherPage(
//                    //     nextPage: Provider<LostFoundItemInfoModel>(
//                    //         create: (_) => lostFoundItemInfoModel,
//                    //         child: ItemDetailpage()),
//                    //     context: context);
//                  });
//
//               },
//             );
//           }
//           else {
//             return const Center(child:
//             Text("No Lost Pet",
//             style: TextStyle(
//               fontSize: 25,
//             ),
//             )
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   late Stream<List<DocumentSnapshot>?>? stream;
//
//   @override
//   void initState() {
//     petBloc = PetBloc("lost");
//     petBloc.fetchFirstList();
//     controller.addListener(_scrollListener);
//     petBloc.listentChangeofData();
//     stream = petBloc.petStream;
//     super.initState();
//   }
//   @override
//   void dispose() {
//     petBloc.dispose();
//     controller.dispose();
//     petBloc.documentList?.clear();
//     super.dispose();
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
//     // return IconButton(
//     //     onPressed: () {
//     //       setState(() {
//     //         _isSearching = !_isSearching;
//     //         _searchList.clear();
//     //       });
//     //     },
//     //     icon:  Icon( _isSearching ? CupertinoIcons.clear_circled_solid :Icons.search)
//     //
//     //         );
//   }
//
// }
