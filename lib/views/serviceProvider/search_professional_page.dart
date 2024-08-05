// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/constant/colors.dart';
// import 'package:petfindernetwork/views/serviceProvider/professional_list_specific_area.dart';
// import '../../model/city.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
//
// class SearchProfessionalPage extends StatefulWidget {
//   const SearchProfessionalPage({super.key,
//     required this.cityList,
//     required this.comingSoon,
//     required this.professional,
//   });
//   final List<City> cityList;
//   final bool comingSoon;
//   final String professional;
//
//   @override
//   State<SearchProfessionalPage> createState() => _SearchProfessionalPageState();
// }
//
// class _SearchProfessionalPageState extends State<SearchProfessionalPage> {
//   // var size,height,width;
//   final TextEditingController _controllerName = TextEditingController();
//   // List<UserProfileModel> _searchList = [];
//   // bool _isSearching = false;
//   String? cityName;
//   bool _isOK = false;
//   // static const List<String> listProfessionType = [
//   //   "Doctor",
//   //   "Trainer",
//   // ];
//   String? professionalType;
//    final List<City> _citySearchList = [];
//
//   @override
//   Widget build(BuildContext context) {
//    final size = MediaQuery.of(context).size;
//    var width = size.width;
//     // widget.comingSoon ? professionalType = widget.professional : professionalType = '';
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Search in your area"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 10, right: 10),
//               child: Card(
//                 elevation: 2,
//                 child: Container(
//                   padding: const EdgeInsets.all(8),
//                   width: width,
//                   decoration: BoxDecoration(
//                       color: Colors.grey.shade200, //<-- SEE HERE
//                       borderRadius: const BorderRadius.all
//                         (Radius.circular(10))
//                   ),
//                   child: DropdownButton<String>(
//                     value: widget.comingSoon ? professionalType = widget.professional : professionalType,
//                     isExpanded: true,
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         professionalType = newValue!;
//                                             });
//                     },
//                     hint: widget.comingSoon ? Text(widget.professional): const Text("Select Options",
//                     ),
//                     items: <String>[
//                       // 'Car', 'Train', 'Bus', 'Flight'
//                       "Doctor",
//                       "Trainer",
//                     ]
//                         .map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(
//                           value,
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ),
//             ),
//
//             // Padding(
//             //   padding: const EdgeInsets.only(left: 10, right: 10),
//             //   child: AppDropDownButton(
//             //     dropdownItems: listProfessionType,
//             //     width: width * 0.95 ,
//             //     height: 60,
//             //     onChange: (value)  {
//             //       if (value != null) {
//             //         setState(() {
//             //           professionalType = value;
//             //         });
//             //       }
//             //     },
//             //     value: professionalType,
//             //   ),
//             // ),
//
//             const SizedBox(height: 20,),
//             Padding(
//               padding: const EdgeInsets.only(left: 10, right: 10),
//               child: TextField
//                 (
//                 autofocus: true,
//                 controller: _controllerName,
//                 decoration:  const InputDecoration(
//                     hintText: 'Enter City Name',
//                   enabledBorder: OutlineInputBorder(
//                    borderRadius: BorderRadius.all(Radius.circular(12)),
//                   )
//                 ),
//                 style:  const TextStyle(
//                   fontSize: 16,
//                   letterSpacing: 1,
//                 ),
//
//                 onChanged:(val) async {
//                   _citySearchList.clear();
//                     for(var i in widget.cityList)
//                     {
//                       if(_controllerName.text.isNotEmpty){
//                         if(i.countryName.toLowerCase().contains(val.toLowerCase())
//                             || i.cityName.toLowerCase().contains(val.toLowerCase()))
//                         {
//                           _citySearchList.add(i);
//                         }
//                       }
//                       else
//                       {
//                         _citySearchList.clear();
//                         _isOK = false;
//                       }
//                         setState(() {
//                           _citySearchList;
//                         });
//                       }
//                     },
//               )
//             ),
//
//             if(_citySearchList.isNotEmpty)...[
//     Expanded(
//       child: ListView.builder(
//       itemCount: _citySearchList.length,
//       itemBuilder: (context, index) {
//       final city = _citySearchList[index];
//       return InkWell(
//         onTap: (){
//           setState(() {
//             _controllerName.text = city.toString();
//             _isOK = true;
//           });
//         },
//         child: SizedBox(
//           height: 65,
//           width: width,
//           child: ListTile(
//           title: Text(city.cityName),
//           subtitle: Text(city.countryName,
//           style: TextStyle(
//             color: AppColor.orange,
//               fontWeight: FontWeight.bold
//
//           ),
//           ),
//           // onTap: () {
//           //   close(context, city.toString());
//           // },
//           ),
//         ),
//       );
//       },
//       ),
//     )
//             ],
//
//             if(_isOK == true)...[
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 10, right: 10),
//                   child:
//                   ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         minimumSize: const Size.fromHeight(50), // NEW
//                       ),
//                       onPressed: ()
//                       {
//                         if(professionalType == null)
//                         {
//                           CommonShareWidget.showFlushBar(
//                               context: context,
//                               duration: 2,
//                               message: "Please select Professional Type");
//                         } else{
//                           Navigator.push(context, MaterialPageRoute(builder: (_)=>
//                               ProfessionlListSpecificArea(cityName: _controllerName.text, professionalType: professionalType.toString(),)));
//                         }
//
//
//                       }, child: const Text("Ok",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 23,
//                       // fontWeight: FontWeight.bold
//                     ),
//                   )),
//                 ),
//               )
//               // ElevatedButton(onPressed: (){
//               // }, child: Text("ok"))
//             ],
//             const SizedBox(height: 60,),
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Widget searchListShow(){
//   //   return ListView.builder(
//   //     itemCount: _citySearchList.length,
//   //     itemBuilder: (context, index) {
//   //       final city = _citySearchList[index];
//   //       return ListTile(
//   //         title: Text(city.cityName),
//   //         subtitle: Text(city.countryName),
//   //         // onTap: () {
//   //         //   close(context, city.toString());
//   //         // },
//   //       );
//   //     },
//   //   );
//   // }
// }
