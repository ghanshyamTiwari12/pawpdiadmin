// import 'package:flutter/material.dart';
// import 'lostFoundInput.dart';
//
// class LostFoundSubmit extends StatefulWidget {
//   const LostFoundSubmit({super.key});
//
//   @override
//   State<LostFoundSubmit> createState() => _LostFoundSubmitState();
// }
//
// class _LostFoundSubmitState extends State<LostFoundSubmit> {
//   @override
//   void dispose() {
//        super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Add new pet"),
//           bottom: const TabBar(
//             tabs: [
//               Padding(
//                 padding: EdgeInsets.all(12.0),
//                 child: Text("Found", style: TextStyle(fontSize: 18.0)),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(12.0),
//                 child: Text("Lost", style: TextStyle(fontSize: 18.0)),
//               )
//             ],
//           ),
//         ),
//         body: const TabBarView(
//           children: <Widget>[
//             LostFoundInput(false),
//             LostFoundInput(true),
//           ],
//         ),
//       ),
//     );
//   }
// }
