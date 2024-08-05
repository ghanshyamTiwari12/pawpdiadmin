// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/bloc/userPostedItemBloc.dart';
// import 'package:petfindernetwork/model/lost_found_item_info_model.dart';
// import 'package:petfindernetwork/views/lostFound/coomonWidget/lostFoundCommonWidget.dart';
//
// class UserPostedPet extends StatefulWidget {
//   final String uid;
//   const UserPostedPet(this.uid, {super.key});
//   @override
//   State<UserPostedPet> createState() => _UserPostedPetState();
// }
//
// class _UserPostedPetState extends State<UserPostedPet> {
//   ScrollController controller = ScrollController();
//   late UserPostedPetBloc userPetBloc;
//   late CommonLostFoundWidget _commonLostFoundWidget;
//   @override
//   void initState() {
//     userPetBloc = UserPostedPetBloc();
//     userPetBloc.fetchFirstList(widget.uid);
//     controller.addListener(_scrollListener);
//     // userPetBloc.listentChangeofData(widget.uid);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Posted pet'),
//       ),
//       body: StreamBuilder<List<DocumentSnapshot<Map<String, dynamic>?>>?>(
//         stream: userPetBloc.petStream,
//         builder: (BuildContext context, snapshot) {
//           if (snapshot.data != null) {
//             return ListView.builder(
//               itemCount: snapshot.data?.length ?? 0,
//               shrinkWrap: true,
//               controller: controller,
//               itemBuilder: (context, index) {
//                 LostFoundPetInfoModel lostFoundPetInfoModel =
//                     LostFoundPetInfoModel.fromDocumentSnapshot(
//                         snapshot.data![index]);
//                 _commonLostFoundWidget =
//                     CommonLostFoundWidget(lostFoundPetInfoModel, true);
//                 return _commonLostFoundWidget.buildPetTile(context, null
//
//                     //         () {
//                     //   CommonShareWidget.goToAnotherPage(
//                     //       nextPage: StreamProvider<DocumentSnapshot?>(
//                     //           initialData: null,
//                     //           create: (BuildContext context) {
//                     //             return userPetBloc.getSinglePetStream(
//                     //                 lostFoundPetInfoModel.docID);
//                     //           },
//                     //           child: PetDetailpage(
//                     //             // petDetails: lostFoundPetInfoModel,
//                     //           )),
//                     //       context: context);
//                     // }
//
//                     );
//               },
//             );
//           } else {
//             return const Center();
//           }
//         },
//       ),
//     );
//   }
//
//   void _scrollListener() {
//     if (controller.offset >= controller.position.maxScrollExtent &&
//         !controller.position.outOfRange) {
//       userPetBloc.fetchNextMovies(widget.uid);
//     }
//   }
// }
