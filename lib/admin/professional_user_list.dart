// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/admin/unverified_professionals_list.dart';
// import 'package:petfindernetwork/admin/verified_professional_list.dart';
//
// class ProfessionalUsersList extends StatefulWidget {
//   const ProfessionalUsersList({super.key});
//
//   @override
//   State<ProfessionalUsersList> createState() => _ProfessionalUsersListState();
// }
//
// class _ProfessionalUsersListState extends State<ProfessionalUsersList> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Professionals List"),
//           bottom: const TabBar(
//             tabs: [
//               Padding(
//                 padding: EdgeInsets.all(12.0),
//                 child: Text("Verified", style: TextStyle(fontSize: 18.0)),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(12.0),
//                 child: Text("Unverified", style: TextStyle(fontSize: 18.0)),
//               )
//             ],
//           ),
//         ),
//         body: const TabBarView(
//           children: <Widget>[
//             VerifiedProfessionalList(),
//             UnverifiedProfessionalList(),
//           ],
//         ),
//       ),
//     );
//   }
// }
