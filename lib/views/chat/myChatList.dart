// // ignore_for_file: no_leading_underscores_for_local_identifiers
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shimmer/shimmer.dart';
// import '../../constant/colors.dart';
// import '../../model/last_message_chat_model.dart';
// import '../../model/user_profile.dart';
// import '../../repository/chatFirebaseProvider.dart';
// import '../../repository/userRepo.dart';
// import '../searchItem/searchItemMain.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
// import 'chatBoard.dart';
//
// class MyChatList extends StatefulWidget {
//   const MyChatList({super.key});
//
//   @override
//   State<MyChatList> createState() => _MyChatListState();
// }
//
// class _MyChatListState extends State<MyChatList> {
//   late ChatFireBaseRepository _chatFireBaseRepository;
//   late List<LastMessageChatModel> _chatlastModelMessage;
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   void initState() {
//     _chatFireBaseRepository = ChatFireBaseRepository();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<User?>(
//       builder: (_, user, child) => user != null
//           ? Scaffold(
//               appBar: AppBar(title: const Text("Chat")),
//               body: StreamBuilder<QuerySnapshot>(
//                 stream: _chatFireBaseRepository.getMychat(user.uid),
//                 builder: (BuildContext context, snapshot) {
//                   if (!snapshot.hasData) {
//                     return Center(
//                       child: CommonShareWidget.circularLoader(),
//                     );
//                   }
//                   // if (snapshot.data.documents.isEmpty){
//                   //   return Center(
//                   //       child: Text("You don't have an active chat yet"),
//                   //     );
//                   // }
//
//                   _chatlastModelMessage = snapshot.data!.docs
//                       .map((e) => LastMessageChatModel.fromDocumentSnap(e))
//                       .toList();
//                   return _chatlastModelMessage.length > 0 ?
//                     ListView.builder(
//                     itemCount: _chatlastModelMessage.length,
//                     shrinkWrap: true,
//                     itemBuilder: (_, index) {
//                       var data = _chatlastModelMessage[index];
//                       final id = data.connectedUserIds![0] == user.uid
//                           ? data.connectedUserIds![1]
//                           : data.connectedUserIds![0];
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 5.0,
//                           vertical: 2,
//                         ),
//                         child: Card(
//                           elevation: 2.0,
//                           child: FutureBuilder<DocumentSnapshot>(
//                               future: UserRepo.getUserProfileDocument(id),
//                               builder: (context, snapshot) {
//                                 if (!snapshot.hasData) {
//                                   return const SizedBox.shrink();
//                                 }
//                                 UserProfileModel _userModel =
//                                     UserProfileModel.fromDocumentSnap(
//                                         snapshot.data as DocumentSnapshot<
//                                             Map<String, dynamic>>);
//                                 return ListTile(
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(12)),
//                                   leading: data.connectedUserIds!.isEmpty
//                                       ? CircleAvatar(
//                                           backgroundColor: AppColor.lightGreen,
//                                           child: const Icon(Icons.broken_image),
//                                         )
//                                       : buildChattingUserProfileImage(
//                                           _userModel),
//                                   title: Text(_userModel.name ?? ''),
//                                   subtitle: Text(
//                                     data.lastMessage!,
//                                     maxLines: 2,
//                                     overflow: TextOverflow.ellipsis,
//                                     //    maxLines: 2,
//                                   ),
//                                   trailing: Text(CommonShareWidget.timeAgo(
//                                           data.timeStamp ?? Timestamp.now()) ??
//                                       ''),
//                                   onTap: () {
//                                     if (data.connectedUserIds!.isNotEmpty) {
//                                       if (data.connectedUserIds![0] ==
//                                           user.uid) {
//                                         CommonShareWidget.goToAnotherPage(
//                                             nextPage: ChatBoard(
//                                                 clientId:
//                                                     data.connectedUserIds![1],
//                                                 userId: user.uid),
//                                             context: context);
//                                       }
//                                       if (data.connectedUserIds![1] ==
//                                           user.uid) {
//                                         CommonShareWidget.goToAnotherPage(
//                                           nextPage: ChatBoard(
//                                             clientId: data.connectedUserIds![0],
//                                             userId: user.uid,
//                                           ),
//                                           context: context,
//                                         );
//                                       }
//                                     }
//                                   },
//                                 );
//                               }),
//                         ),
//                       );
//                     },
//                   ) : const Center(child: Text("You have no Chat",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.blueAccent
//                     // fontWeight: FontWeight.bold,
//                   ),
//
//                   )) ;
//                 },
//               ),
//             )
//           :
//       Scaffold(
//               body: Center(
//                 child: CommonShareWidget.circularLoader(),
//               ),
//             ),
//     );
//   }
//
//   actionSearchButton() {
//     return IconButton(
//         icon: const Icon(Icons.search),
//         onPressed: () {
//           CommonShareWidget.goToAnotherPage(
//               context: context, nextPage: const SearchPetMain());
//         });
//   }
//
//   actionProfileButton(
//     user,
//   ) {
//     return IconButton(
//         icon: const Icon(Icons.dashboard),
//         onPressed: () {
//           _scaffoldKey.currentState!.openEndDrawer();
//         });
//   }
//
//   buildChattingUserProfileImage(UserProfileModel userModel) {
//     return CommonShareWidget.imageNetwork(
//       height: 60.0,
//       width: 60.0,
//       shape: const CircleBorder(),
//       imageurl: userModel.profilephotoImageUrl,
//     );
//   }
// }
//
// class CircularLoadingImage extends StatelessWidget {
//   const CircularLoadingImage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return CircleAvatar(
//       backgroundColor: AppColor.whiteColor,
//       child: Shimmer.fromColors(
//           baseColor: Colors.grey[300]!,
//           highlightColor: Colors.grey[100]!,
//           enabled: true,
//           child: const SizedBox()),
//     );
//   }
// }
