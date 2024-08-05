// import 'dart:io';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:petfindernetwork/bloc/chatBloc.dart';
// import 'package:petfindernetwork/model/chatModelMessage.dart';
// import 'package:petfindernetwork/repository/chatFirebaseProvider.dart';
// import 'package:petfindernetwork/views/chat/fullscreen_image.dart';
// import 'package:petfindernetwork/views/shareAbleWidget.dart/commonShareWidget.dart';
// import 'package:provider/provider.dart';
// import '../../helper/image_picker_helper.dart';
//
// class ChatBoard extends StatefulWidget {
//   final String? userId;
//   final String? clientId;
//   final String? totalDocId;
//   const ChatBoard({
//     super.key,
//     required this.userId,
//     required this.clientId,
//     this.totalDocId,
//   });
//   @override
//   State<ChatBoard> createState() => _ChatBoardState();
// }
//
// class _ChatBoardState extends State<ChatBoard> {
//   final TextEditingController _controllerText = TextEditingController();
//   String? chatDocId;
//   late List<ChatModelMessage> chatDataModel;
//   late File imageFile;
//   String imageUrl = '';
//   bool _loaderState = false;
//   late ChatFireBaseRepository _chatFireBaseRepository;
//   ScrollController controller = ScrollController();
//   late ChatBloc _chatBloc;
//   @override
//   void initState() {
//     _chatFireBaseRepository = ChatFireBaseRepository();
//     if (widget.totalDocId == null) {
//       setState(() {
//         chatDocId = _chatFireBaseRepository.chatMessageEndPoint(
//             widget.userId!, widget.clientId!);
//       });
//     } else {
//       setState(() {
//         chatDocId = widget.totalDocId;
//       });
//     }
//     if (chatDocId != null) {
//       _chatBloc = ChatBloc();
//       _chatBloc.fetchInitialChatList(chatDocId);
//       controller.addListener(_scrollListener);
//       _chatBloc.listentChangeofData(chatDocId);
//     }
//     super.initState();
//   }
//
//   @override
//   void dispose(){
//     controller.dispose();
//     _chatBloc.dispose();
//     _controllerText.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return chatDocId != null
//         ? Scaffold(
//             appBar: AppBar(title: const Text('chat')),
//             body: _loaderState ? CommonShareWidget.circularLoader()
//                 : StreamProvider<DocumentSnapshot?>(
//                 create: (_) => _chatFireBaseRepository
//                     .getchatRoomCreatedOrnotStream(chatDocId),
//                 initialData: null,
//                 child: Consumer<DocumentSnapshot?>(
//                   builder: (BuildContext context, DocumentSnapshot? value,
//                       Widget? child) {
//                     if (value == null) {
//                       return Center(
//                         child: CommonShareWidget.circularLoader(),
//                       );
//                     }
//                     return value.exists
//                         ? Column(
//                             children: <Widget>[
//                               Expanded(
//                                 child: StreamBuilder<List<DocumentSnapshot>?>(
//                                   stream: _chatBloc.chattream,
//                                   builder: (context, snapshot) {
//                                     if (!snapshot.hasData) {
//                                       return const Center(
//                                           //  child: CommonShareWidget.showLoader(),
//                                           );
//                                     }
//                                     if (snapshot.data!.isEmpty) {
//                                       return const Center(
//                                           child: Text('Start new conversation',
//                                               style:
//                                                   TextStyle(fontSize: 20.0)));
//                                     }
//                                     chatDataModel = snapshot.data!
//                                         .map((doc) =>
//                                             ChatModelMessage.fromDocumentSnap(
//                                                 doc))
//                                         .toList();
//
//                                     // List<Widget> messages = chatDataModel
//                                     //     .map((doc) => Message(
//                                     //           text: doc.message,
//                                     //           me: false,
//                                     //           // me: doc.senderId == widget.userId
//                                     //           //     ? true
//                                     //           //     : false,
//                                     //           docType: doc.docId,
//                                     //           documentReference:
//                                     //               doc.documentReference,
//                                     //         ))
//                                     //     .toList();
//                                     return ListView.builder(
//                                       itemCount: chatDataModel.length,
//                                       shrinkWrap: true,
//                                       reverse: true,
//                                       controller: controller,
//                                       itemBuilder: (_, index) {
//                                         ChatModelMessage doc =
//                                             chatDataModel[index];
//                                         return Message(
//                                           text: doc.message,
//                                           me: doc.senderId == widget.userId
//                                               ? true
//                                               : false,
//                                           docType: doc.docId,
//                                           documentReference:
//                                               doc.documentReference,
//                                         );
//                                       },
//                                     );
//                                   },
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(12.0),
//                                 child: Row(
//                                   children: <Widget>[
//                                     Expanded(
//                                       child: TextFormField(
//                                         controller: _controllerText,
//                                         decoration: const InputDecoration(
//                                           hintText: 'Your message...',
//                                           fillColor: Color(0xfff0f0f0),
//                                           filled: true,
//                                           border: InputBorder.none,
//                                         ),
//                                       ),
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(Icons.image_outlined),
//                                       onPressed: () {
//                                         getImage();
//                                       },
//                                     ),
//                                     CircleAvatar(
//                                       radius: 22,
//                                       backgroundColor: Colors.blueAccent,
//                                       child: IconButton(
//                                         icon: const Icon(
//                                           Icons.send,
//                                           color: Colors.white,
//                                         ),
//                                         onPressed: () {
//                                           if (_controllerText.text.isNotEmpty) {
//                                             sendMessage(1, _controllerText.text,
//                                                 _controllerText.text);
//                                           } else {
//                                             CommonShareWidget.showFlushBar(
//                                               context: context,
//                                               duration: 2,
//                                               message: "please enter some text",
//                                             );
//                                           }
//                                         },
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               const SizedBox(height: 60,)
//                             ],
//                           )
//                         : Center(
//                             child: TextButton(
//                               onPressed: () {
//                                 _chatFireBaseRepository.createChatRoomOfTwoUser(
//                                     chatDocId, widget.userId, widget.clientId);
//                               },
//                               child: const Text(
//                                 'Tap to Start new conversation',
//                                 style: TextStyle(
//                                   fontSize: 20.0,
//                                 ),
//                               ),
//                             ),
//                           );
//                   },
//                 ),
//               ),
//             // ),
//           )
//         :
//     Scaffold(
//             body: Center(
//               child: CommonShareWidget.circularLoader(),
//             ),
//           );
//   }
//
//   Future<void> getImage() async {
//     final pickedimageFile = await ImagePickerHelper()
//         .pickImage(source: ImageSource.gallery, imageQuality: 40);
//
//     if (pickedimageFile != null) {
//       imageFile = File(pickedimageFile.path);
//       if (mounted) {
//         setState(() {
//           _loaderState = true;
//         });
//       }
//       uploadFile();
//     }
//   }
//
//   Future<void> uploadFile() async {
//     String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//     Reference reference =
//         FirebaseStorage.instance.ref().child(widget.userId!).child(fileName);
//     UploadTask uploadTask = reference.putFile(imageFile);
//     TaskSnapshot storageTaskSnapshot = await uploadTask;
//     storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
//       imageUrl = downloadUrl;
//       sendMessage(2, imageUrl, 'sent a photo');
//       if (mounted) {
//         setState(() {
//           _loaderState = false;
//         });
//       }
//     }, onError: (err) {
//       CommonShareWidget.showFlushBar(
//           context: context, duration: 2, message: "file is not an image");
//     });
//   }
//
//   void sendMessage(int messageType, message, lastmessage) {
//     _controllerText.clear();
//     _chatFireBaseRepository
//         .sendChatMessage(
//       documentId: chatDocId,
//       modelMessage: ChatModelMessage(
//         docId: messageType,
//         senderId: widget.userId,
//         receiverId: widget.clientId,
//         message: message,
//         timeStamp: FieldValue.serverTimestamp(),
//       ),
//     )!
//         .then((onValue) {
//       _chatFireBaseRepository.setLastMessage(chatDocId, lastmessage);
//     });
//   }
//
//   void _scrollListener() {
//     if (controller.offset >= controller.position.maxScrollExtent &&
//         !controller.position.outOfRange) {
//       _chatBloc.fetchPreviousChatList(chatDocId);
//     }
//   }
// }
//
// class Message extends StatelessWidget {
//   final String? text;
//   final bool me;
//   final int? docType;
//   final DocumentReference? documentReference;
//   const Message(
//       {super.key,
//       required this.text,
//       required this.me,
//       required this.docType,
//       required this.documentReference});
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: me ? Alignment.centerRight : Alignment.centerLeft,
//       child: docType == 1
//           ? Container(
//               padding: const EdgeInsets.all(5.0),
//               margin: const EdgeInsets.all(4),
//               decoration: BoxDecoration(
//                 color: me ? Colors.blue.shade100 : Colors.amber.shade100,
//                 borderRadius: me
//                     ? const BorderRadius.only(
//                         topLeft: Radius.circular(25),
//                         topRight: Radius.circular(25),
//                         bottomLeft: Radius.circular(25),
//                         bottomRight: Radius.zero,
//                       )
//                     : const BorderRadius.only(
//                         topLeft: Radius.circular(25),
//                         topRight: Radius.circular(25),
//                         bottomLeft: Radius.zero,
//                         bottomRight: Radius.circular(25),
//                       ),
//                 // elevation: 6.0,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Text(
//                   text!,
//                   style: const TextStyle(fontSize: 15),
//                 ),
//               ),
//             )
//           : Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: InkWell(
//                 child: Hero(
//                   tag: '$text',
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(8.0),
//                     child: CachedNetworkImage(
//                       placeholder: (context, url) => Container(
//                         width: 200.0,
//                         height: 200.0,
//                         padding: const EdgeInsets.all(70.0),
//                         decoration: BoxDecoration(
//                           color: Colors.blue.shade50,
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: const CircularProgressIndicator(
//                           valueColor:
//                               AlwaysStoppedAnimation<Color>(Colors.blueAccent),
//                         ),
//                       ),
//                       errorWidget: (context, url, error) => const Material(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(8.0),
//                         ),
//                         clipBehavior: Clip.hardEdge,
//                         child: Icon(Icons.broken_image),
//                       ),
//                       imageUrl: text!,
//                       width: 200.0,
//                       height: 200.0,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 onTap: () {
//                   if (text != null && text!.isNotEmpty) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => FullScreenImage(
//                           imageUrl: text!,
//                         ),
//                       ),
//                     );
//
//                     //Navigator.of(context).push(
//                     // MaterialPageRoute(
//                     //    builder: (context) => FullScreenImage(
//                     //       imageProvider: CachedNetworkImageProvider(text),
//                     //       docRef: documentReference,
//                     //       imageUrl: text,
//                     //       isMe:me
//                     //     ),
//                     //   )
//                     //);
//
//                     // Navigator.push(
//                     //     context,
//                     //     CupertinoPageRoute(
//                     //       builder: (context) => FullScreenImage(
//                     //         imageProvider: CachedNetworkImageProvider(text),
//                     //         docRef: documentReference,
//                     //         imageUrl: text,
//                     //       ),
//                     //     ));
//                   }
//                 },
//               ),
//             ),
//     );
//   }
// }
