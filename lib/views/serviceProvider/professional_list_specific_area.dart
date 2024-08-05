// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/views/serviceProvider/service_provider.dart';
//
// import '../../constant/colors.dart';
// import '../../model/user_profile.dart';
//
// class ProfessionlListSpecificArea extends StatefulWidget {
//   const ProfessionlListSpecificArea({super.key, required this.cityName, required this.professionalType});
// final String cityName;
// final String professionalType;
//   @override
//   State<ProfessionlListSpecificArea> createState() => _ProfessionlListSpecificAreaState();
// }
//
// class _ProfessionlListSpecificAreaState extends State<ProfessionlListSpecificArea> {
//   final firestore = FirebaseFirestore.instance.collection("users").snapshots();
// List<UserProfileModel> _list = [];
//
//   @override
//   Widget build(BuildContext context) {
//   final  size = MediaQuery.of(context).size;
//   var    width = size.width;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Your Search list"),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//         StreamBuilder<QuerySnapshot>(stream: firestore,
//             builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if(snapshot.connectionState == ConnectionState.waiting){
//             return const CircularProgressIndicator();
//           }
//           if(snapshot.hasError){
//             return const Text('Some Error');
//           }
//           final data = snapshot.data?.docs;
//           _list = data?.map((e) => UserProfileModel.fromJson(e.data() as Map<String, dynamic>))
//               .where((element) => element.isProfessional == true &&
//               (element.location == widget.cityName && element.professionalType == widget.professionalType)
//
//           ) .toList() ?? [];
//
//           if(_list.isNotEmpty){
//                 return Expanded(child: ListView.builder(
//                     itemCount: _list.length,
//                     itemBuilder: (context, index)
//                     {
//                       var ratingAverage = _list[index].average;
//                   return Column(
//                     children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
//                       child: InkWell(
//                         onTap: (){
//                           Navigator.push(context, MaterialPageRoute(builder: (_) =>
//                               ServiceProviderInfo(serviceProvideruserID: _list[index].uid.toString(),)
//                           ));
//                         },
//                         child: Card(
//                           color: AppColor.orange.withOpacity(0.7),
//
//                           child: Container(
//                             height: 150,
//                             width: width ,
//                             decoration: const BoxDecoration(
//                               borderRadius: BorderRadius.all(Radius.circular(20)),
//                               // color: Colors.blueAccent.withOpacity(0.2),
//                             ),
//                             child: Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 2, right: 5, top:2, bottom: 2 ),
//                                   child: Container(
//                                     height: 180,
//                                     width: 130,
//                                     decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                         image: CachedNetworkImageProvider(_list[index].profilephotoImageUrl.toString(),),
//                                         fit: BoxFit.fill
//                                       ),
//                                       borderRadius: const BorderRadius.all(Radius.circular(10))
//                                     ),
//                                   ),
//                                 ),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     const SizedBox(height: 10),
//                                     Text(_list[index].name.toString(),
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       softWrap: true,
//                                     style: const TextStyle(
//                                       fontSize: 17,
//                                       fontWeight: FontWeight.bold
//                                     ),
//                                     ),
//                                     const SizedBox(height: 5),
//                                     Text(_list[index].location.toString(),
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       softWrap: true,
//                                       style: const TextStyle(
//                                           fontSize: 15,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 5),
//                                     Row(
//                                       children: [
//                                         Container(
//                                           height: 40,
//                                           width: 70,
//                                           decoration: const BoxDecoration(
//                                               color: Colors.green,
//                                               borderRadius: BorderRadius.all(Radius.circular(10))
//                                           ),
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Row(
//                                               mainAxisAlignment: MainAxisAlignment.start,
//                                               crossAxisAlignment: CrossAxisAlignment.center,
//                                               children: [
//                                                 const Icon(Icons.star,
//                                                 color: Colors.white,
//                                                   size: 20.0,
//                                                 ),
//                                                 const SizedBox(width: 3,),
//                                                 if(ratingAverage == null)...[
//                                                   const Text("0",
//                                                     style: TextStyle(
//                                                         fontWeight: FontWeight.bold,
//                                                         color: Colors.white,
//                                                         fontSize: 15
//                                                     ),
//                                                   )
//                                                 ] else...[
//                                                   Text(_list[index].average!.toStringAsFixed(1),
//                                                     style: const TextStyle(
//                                                         fontWeight: FontWeight.bold,
//                                                         color: Colors.white,
//                                                         fontSize: 15
//                                                     ),
//                                                   )
//                                                 ]
//                                               ],
//                                             ),
//                                           )
//                                         ),
//                                       ],
//                                     )
//
//                                   ],
//                                 ),
//                               )
//
//
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//
//
//                     ],
//                   );
//
//                 }
//                 ));
//           }
//           else{
//             return   const Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 100,),
//                 Center(
//                   child: Text('No Service in your area',
//                       style: TextStyle(
//                           fontSize: 25
//                       )
//                   ),
//                 ),
//               ],
//             );
//           }
//
//             }
//             )
//
//         ],
//       ),
//     );
//   }
// }
