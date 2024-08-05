// import 'dart:developer';
// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:petfindernetwork/constant/colors.dart';
// import 'package:petfindernetwork/helper/app_dropdown_button.dart';
// import 'package:petfindernetwork/helper/image_picker_helper.dart';
// import 'package:petfindernetwork/model/lost_found_item_info_model.dart';
// import 'package:petfindernetwork/repository/cityListRepo.dart';
// import 'package:petfindernetwork/repository/loginsignupRepo.dart';
// import 'package:petfindernetwork/repository/lostfoundRepo.dart';
// import 'package:petfindernetwork/validator/inputValidator.dart';
// import 'package:petfindernetwork/views/lostFound/city_search_deligate.dart';
// import 'package:petfindernetwork/views/shareAbleWidget.dart/commonShareWidget.dart';
// // import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:provider/provider.dart';
// import 'package:velocity_x/velocity_x.dart';
//
// import '../../bloc/loader_provider.dart';
//
// class LostFoundInput extends StatefulWidget {
//   final bool isLost;
//   const LostFoundInput(this.isLost, {super.key});
//   @override
//   State<LostFoundInput> createState() => _LostFoundInputState();
// }
//
// class _LostFoundInputState extends State<LostFoundInput> {
//
//   final _formKey = GlobalKey<FormState>();
//   List<File> images = <File>[];
//   final TextEditingController _controllerPetName = TextEditingController();
//   final TextEditingController _controllerPetDescription =
//       TextEditingController();
//   final TextEditingController _controllerPetColor =
//   TextEditingController();
//   late LostFoundRepo _lostFoundRepo;
//   bool _loaderState = false;
//   List<String>? cities;
//   String? cityName;
//   String? petCategory;
//   String? petGender;
//   String? longitude;
//   String? latitude;
//   @override
//   void initState() {
//     _lostFoundRepo = LostFoundRepo();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     if (kDebugMode) {
//       print("====called disposed at lost found input page ");
//     }
//     _controllerPetName.dispose();
//     _controllerPetDescription.dispose();
//     _controllerPetColor.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     var  width = size.width;
//     LoaderProvider loaderProvider = Provider.of<LoaderProvider>(context);
//     _loaderState = loaderProvider.isLoading;
//     return Consumer<User?>(
//       builder: (_, user, child) {
//         return
//         //   _loaderState ? CommonShareWidget.circularLoader()
//         // :
//           SingleChildScrollView(
//             keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//             child: Form(
//               autovalidateMode: AutovalidateMode.always,
//               key: _formKey,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   children: <Widget>[
//                     const Padding(
//                       padding: EdgeInsets.all(20.0),
//                       child: Text(
//                         "Add information of your pet",
//                         style: TextStyle(
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 30),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text("Category"),
//                         AppDropDownButton(
//                           //width: double.infinity,
//                           height: 50,
//                           value: petCategory,
//                           onChange: (val) {
//                             setState(() {
//                               petCategory = val;
//                             });
//                           },
//                           dropdownItems: const [
//                             'Cat',
//                             'Dog',
//                             'Rabbit',
//                             'Bird',
//                             'Turtle',
//                             'Other'
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 12),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text("Gender"),
//                         AppDropDownButton(
//                           //width: double.infinity,
//                           height: 50,
//                           value: petGender,
//                           onChange: (val) {
//                             setState(() {
//                               petGender = val;
//                             });
//                           },
//                           dropdownItems: const [
//                             'Male',
//                             'Female',
//                                                       ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 12),
//                     TextFormField(
//                       onChanged: (String value) {},
//                       cursorColor: Colors.purple,
//                       controller: _controllerPetColor,
//                       keyboardType: TextInputType.text,
//                       validator: (value) {
//                         return InputValidator.emptyTextvalidator(
//                             value!, "pet color");
//                       },
//                       decoration: const InputDecoration(
//                         hintText: "Enter pet color",
//                         prefixIcon: Icon(
//                           Icons.info_outline,
//                           color: Colors.blueAccent,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     TextFormField(
//                       onChanged: (String value) {},
//                       cursorColor: Colors.purple,
//                       controller: _controllerPetName,
//                       keyboardType: TextInputType.text,
//                       validator: (value) {
//                         return InputValidator.emptyTextvalidator(
//                             value!, "pet name");
//                       },
//                       decoration: const InputDecoration(
//                         hintText: "Enter pet name",
//                         prefixIcon: Icon(
//                           Icons.info_outline,
//                           color: Colors.blueAccent,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     TextFormField
//                        (
//                       onChanged: (String value) {},
//                       cursorColor: Colors.deepOrange,
//                       controller: _controllerPetDescription,
//                       keyboardType: TextInputType.text,
//                       validator: (value) {
//                         return InputValidator.emptyTextvalidator(
//                             value!, "pet breed");
//                       },
//                       decoration: const InputDecoration(
//                         hintText: "Enter description (breed, state etc.)",
//                         prefixIcon: Icon(
//                           Icons.description,
//                           color: Colors.indigoAccent,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     // cities != null
//                     //     ?
//                     GestureDetector(
//                       onTap: () async
//                       {
//                         await selectCityName(context);
//                         // setState(() {
//                         //   _loaderState = true;
//                         // });
//                         // final cityList =
//                         //     await CityListRepo().fetchCityListFromCSV();
//                         // setState(() {
//                         //   _loaderState = false;
//                         // });
//                         // final result = await showSearch<String?>(
//                         //   context: context,
//                         //   delegate: CitySearchDeligate(cityList),
//                         // );
//                         // setState(() {
//                         //   cityName = result;
//                         // });
//                       },
//                       child: TextField(
//                         enabled: false,
//                         cursorColor: Colors.deepOrange,
//                         keyboardType: TextInputType.text,
//                         decoration: InputDecoration(
//                           hintText: cityName ?? "Select city",
//                           hintStyle: cityName != null
//                               ? const TextStyle(color: Colors.black87)
//                               : const TextStyle(color: Colors.black54),
//                           prefixIcon: const Icon(
//                             Icons.location_city,
//                             color: Colors.indigoAccent,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(
//                       height: 20.0,
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(left: 32.0),
//                       child: Row(
//                         children: <Widget>[
//                           Container(
//                             height: 60.0,
//                             width: 60.0,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.rectangle,
//                               border: Border.all(color: AppColor.blueColor),
//                               borderRadius: BorderRadius.circular(20.0),
//                             ),
//                             child: InkWell(
//                               highlightColor: Colors.amber,
//                               borderRadius: BorderRadius.circular(20.0),
//                               onTap: loadAssets,
//                               child: const Icon(Icons.add_a_photo),
//                             ),
//                           ),
//                           const SizedBox(width: 15.0),
//                           images.isEmpty
//                               ? Text(widget.isLost
//                                   ? 'Add clear image'
//                                   : 'Add clear image')
//                               : const SizedBox(),
//                           images.isNotEmpty
//                               ? Expanded(
//                                   child: SizedBox(
//                                     height: 60.0,
//                                     child: buildPhotoGridView(),
//                                   ),
//                                 )
//                               : Expanded(child: Container())
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 25.0,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Card(
//                           child: Container(
//                               height: 60,
//                               width: width /2,
//                               decoration: const BoxDecoration(
//                                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                                 color: Colors.black,
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(2.0),
//                                 child: InkWell(
//                                   onTap: (){
//                                     setState(() {
//                                       handleSubmit(user?.uid, context);
//
//                                     });
//                                   },
//                                   child:  Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       _loaderState ? const CircularProgressIndicator(color: Colors.white,):
//                                       const Text( "Submit",
//                                         style: TextStyle(
//                                             fontSize: 20,
//                                             color: Colors.white
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               )
//                           ),
//                         ),
//                         const SizedBox(height: 30,),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 35.0,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         // );
//       },
//     );
//   }
//
//   Widget buildPhotoGridView() {
//     return ListView(
//       scrollDirection: Axis.horizontal,
//       children: List.generate(images.length, (index) {
//         File asset = images[index];
//         return Card(
//           elevation: 3.0,
//           child: Stack(
//             children: <Widget>[
//               Image.file(
//                 asset,
//                 width: 60,
//                 height: 60,
//               ),
//               Align(
//                 alignment: Alignment.center,
//                 child: Container(
//                   color: AppColor.blackColor.withOpacity(0.2),
//                   child: Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: IconButton(
//                       icon: Icon(
//                         Icons.delete,
//                         color: AppColor.whiteColor,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           images.remove(asset);
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         );
//       }),
//     );
//   }
//
//   Future<void> loadAssets() async {
//     List<File> resultList = <File>[];
//     // String error = 'No Error Dectected';
//
//     try {
//       resultList = await ImagePickerHelper()
//           .pickMultipleImage(
//             imageQuality: 40,
//           )
//           .then(
//             (value) => value.map((e) => File(e.path)).toList(),
//           );
//     } on Exception catch (e) {
//       // error = e.toString();
//       log(e.toString());
//     }
//
//     if (!mounted) return;
//
//     setState(() {
//       images = resultList;
//       // _error = error;
//     });
//   }
//
//   handleSubmit(uid, context) async {
//     if (validateForm() != true) {
//       return;
//     }
//     Provider.of<LoaderProvider>(context, listen: false).loading(true);
//
//     // showHideLoading(true);
//     FocusScope.of(context).requestFocus(FocusNode());
//     List<String> imageUrl = await LoginSignupRepo()
//         .uploadPetImages(assets: images, id: uid)
//         .onError((error, stackTrace) => []);
//         if (imageUrl.isNotEmpty) {
//              await  Geolocator.requestPermission();
//         LocationPermission  permission = await Geolocator.checkPermission();
//       if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
//         if (kDebugMode) {
//           print('permission denied');
//         }
//         await  Geolocator.requestPermission();
//       } else{
//         Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
//         if (kDebugMode) {
//           print('Longitude---${currentPosition.longitude.toString()}');
//           print('Latitude---${currentPosition.latitude.toString()}');
//         }
//         longitude = currentPosition.longitude.toString();
//         latitude = currentPosition.latitude.toString();
//       }
//
//       if(longitude!= null && latitude!= null)
//       {
//         final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
//         var docref = await _lostFoundRepo.setLostFoundPetInfo(timestamp,
//           LostFoundPetInfoModel(
//             petName: _controllerPetName.text.capitalized,
//             description: _controllerPetDescription.text,
//             location: cityName ?? "",
//             petCategory: petCategory,
//             petColor: _controllerPetColor.text,
//             petGender: petGender,
//             petStatus: widget.isLost ? "lost" : "found",
//             petImageUrl: imageUrl,
//             longitude: longitude,
//             latitude: latitude,
//             postedId: uid,
//             docID: timestamp,
//             filterText: _controllerPetName.text.substring(0, 1).toUpperCase(),
//             success: false,
//             review: false,
//           ),
//         );
//         if (docref != null) {
//           Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//           // showHideLoading(false);
//           clearValue();
//           CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 3,
//             message: "Your request submitted",
//
//           );
//
//         } else {
//           Provider.of<LoaderProvider>(context, listen: false).loading(false);
//           // showHideLoading(false);
//           clearValue();
//           CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 3,
//             message: "Your request submitted",
//           );
//         }
//       } else{
//         Provider.of<LoaderProvider>(context, listen: false).loading(false);
//
//         // showHideLoading(false);
//         CommonShareWidget.showFlushBar(
//           context: context,
//           duration: 3,
//           message: "Please allow location",
//         );
//         // Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
//         // longitude = currentPosition.longitude.toString();
//         // latitude = currentPosition.latitude.toString();
//       }
//     }
//         else {
//       // showHideLoading(false);
//           Provider.of<LoaderProvider>(context, listen: false).loading(false);
//           CommonShareWidget.showFlushBar(
//           context: context, duration: 3, message: "Image upload failes");
//     }
//   }
//
//   // showHideLoading(bool status) {
//   //   if (mounted) {
//   //     setState(() {
//   //       _loaderState = status;
//   //     });
//   //   }
//   // }
//
//   clearValue() {
//
//     setState(() {
//       _controllerPetName.clear();
//       _controllerPetDescription.clear();
//       _controllerPetColor.clear();
//       images.clear();
//       petGender = null;
//       petCategory = null;
//       cityName = null;
//       _loaderState = false;
//     });
//     Provider.of<LoaderProvider>(context, listen: false).loading(_loaderState);
//   }
//
//  selectCityName(context) async {
//    setState(() {
//      _loaderState = true;
//    });
//    final cityList =
//        await CityListRepo().fetchCityListFromCSV();
//    setState(() {
//      _loaderState = false;
//    });
//    final result = await showSearch<String?>(
//      context: context,
//      delegate: CitySearchDeligate(cityList),
//    );
//    setState(() {
//      cityName = result;
//    });
//  }
//
//    bool validateForm() {
//     FocusScope.of(context).unfocus();
//     bool isValid = false;
//     if (_formKey.currentState!.validate()){
//       if (images.isEmpty) {
//         CommonShareWidget.showColorFlushBar(
//           context: context,
//           duration: 2,
//           message: "Please add image",
//           color: AppColor.orange,
//         );
//       } else if (petCategory == null) {
//         CommonShareWidget.showColorFlushBar(
//           context: context,
//           duration: 2,
//           message: "Enter pet category",
//           color: AppColor.orange,
//         );
//       } else if (cityName == null) {
//         CommonShareWidget.showColorFlushBar(
//           context: context,
//           duration: 2,
//           message: "Enter location",
//           color: AppColor.orange,
//         );
//       } else if ( petGender == null) {
//         CommonShareWidget.showColorFlushBar(
//           context: context,
//           duration: 2,
//           message: "Enter Gender",
//           color: AppColor.orange,
//         );}else if ( petGender == null) {
//         CommonShareWidget.showColorFlushBar(
//           context: context,
//           duration: 2,
//           message: "Enter Gender",
//           color: AppColor.orange,
//         );}
//       else {
//         isValid = true;
//       }
//     }
//     return isValid;
//   }
//
//   fetchcityList(context) async {
//     setState(() {
//       _loaderState = true;
//     });
//     final cityList =
//         await CityListRepo().fetchCityListFromCSV();
//     setState(() {
//       _loaderState = false;
//     });
//     final result = await showSearch<String?>(
//       context: context,
//       delegate: CitySearchDeligate(cityList),
//     );
//     setState(() {
//       cityName = result;
//     });
//   }
//
// }
