// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/admin/pending_pet_list.dart';
// import 'package:petfindernetwork/admin/reviewd_pet_list.dart';
//
// class UsersPetList extends StatefulWidget {
//   const UsersPetList({super.key});
//
//   @override
//   State<UsersPetList> createState() => _UsersPetListState();
// }
//
// class _UsersPetListState extends State<UsersPetList> {
//   @override
//   Widget build(BuildContext context) {
//     return      DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Users Pet List"),
//           bottom: const TabBar(
//             tabs: [
//               Padding(
//                 padding: EdgeInsets.all(12.0),
//                 child: Text("Reviewed Pet", style: TextStyle(fontSize: 18.0)),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(12.0),
//                 child: Text("Pending Pet", style: TextStyle(fontSize: 18.0)),
//               )
//             ],
//           ),
//         ),
//         body: const TabBarView(
//           children: <Widget>[
//             ReviewdPetList(),
//             PendingPetList(),
//           ],
//         ),
//       ),
//     );
//
//   }
// }
