// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/admin/user_found_pet.dart';
// import 'package:petfindernetwork/admin/user_lost_pet.dart';
// import 'package:petfindernetwork/admin/users_registered_pet.dart';
// import '../Web_helper/colors.dart';
//
// class UserPetListPage extends StatefulWidget {
//   const UserPetListPage({super.key, required this.uid, required this.userName
//   });
//   final String uid;
//   final String userName;
//   @override
//   State<UserPetListPage> createState() => _UserPetListPageState();
// }
//
// class _UserPetListPageState extends State<UserPetListPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Pet Details of ${widget.userName}"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Center(
//
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Card(
//                 elevation: 1.0,
//                 color: Colors.black,
//                 child: Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: ListTile(
//                     leading: const Icon(
//                       Icons.note_alt_outlined,
//                       color: Colors.white,
//                     ),
//                     title: Text(
//                       "Registered Pet",
//                       style: TextStyle(
//                         color: AppColor.whiteColor,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (_) =>
//                         UsersRegisteredPet(uid: widget.uid, userName: widget.userName,)));
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 25,),
//               Card(
//                 elevation: 1.0,
//                 color: AppColor.green,
//                 child: Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: ListTile(
//                     leading: const Icon(
//                       Icons.logout,
//                       color:
//                       Colors.white,
//                     ),
//                     title: Text(
//                       "Lost Pet",
//                       style: TextStyle(
//                         color: AppColor.whiteColor,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     onTap: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (_) =>
//                       UserLostPetList(userUid: widget.uid, userName: widget.userName,)));
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 25,),
//               Card(
//                 elevation: 1.0,
//                 color: Colors.black,
//                 child: Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: ListTile(
//                     leading: const Icon(
//                       Icons.note_alt_outlined,
//                       color: Colors.white,
//                     ),
//                     title: Text(
//                       "Found Pet",
//                       style: TextStyle(
//                         color: AppColor.whiteColor,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (_) => UserFoundPetList(userUid: widget.uid, userName: widget.userName,)));
//                                           },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
