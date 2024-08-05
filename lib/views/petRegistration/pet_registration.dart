//
//
//
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../bloc/date_time_provider.dart';
// import '../../constant/colors.dart';
// import '../../constant/date_time.dart';
// import '../../helper/image_picker_helper.dart';
// import '../../model/pet_registration_model.dart';
// import '../../repository/loginsignupRepo.dart';
// import '../../repository/pet_register_repo.dart';
// import '../loginSignUp/login_with_email.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
//
// class PetRegistration extends StatefulWidget {
//   const PetRegistration({super.key, required this.uid});
//     final String uid;
//   @override
//   State<PetRegistration> createState() => _PetRegistrationState();
// }
//
// class _PetRegistrationState extends State<PetRegistration> {
//
//   final TextEditingController _controllerName = TextEditingController();
//   final TextEditingController _controllerBreed = TextEditingController();
//   final TextEditingController _controllerYear = TextEditingController();
//   final TextEditingController _controllerMonth = TextEditingController();
//
//   final _formKey = GlobalKey<FormState>();
//   File? _imageProfile;
//   bool _loaderState = false;
//   String? petCategory;
//   String? petGender;
//   String? petSize;
//   String error = "";
//   late PetRegisterRepo _petRegisterRepo;
//   String? selectedDate;
//   String? dropdownValue;
//
//   @override
//   void initState() {
//     _petRegisterRepo = PetRegisterRepo();
//     super.initState();
//   }
//   @override
//   void dispose() {
//     _controllerName.dispose();
//     _controllerBreed.dispose();
//     _controllerYear.dispose();
//     _controllerMonth.dispose();
//     _imageProfile = null;
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     var width = size.width;
//     ImagePickerHelper  imageProvider = Provider.of<ImagePickerHelper>(context);
//     _imageProfile = imageProvider.imageProfile;
//     DateTimeProvider provider = Provider.of<DateTimeProvider>(context);
//     selectedDate = provider.selectedDate;
//
//     if (kDebugMode) {
//       print("imageProfile---- ${_imageProfile.toString()}");
//     }
//     return     Scaffold(
//       body: SingleChildScrollView(
//           child: Form(
//             autovalidateMode: AutovalidateMode.always,
//             key: _formKey,
//             child: Column(
//               children: <Widget>[
//                 Stack(
//                   children: <Widget>[
//
//                     ClipPath(
//                       clipper: WaveClipper2(),
//                       child: Container(
//                         width: double.infinity,
//                         height: 300,
//                         decoration: const BoxDecoration(
//                           gradient: LinearGradient(
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                             colors: [
//                               Color.fromRGBO(83, 160, 136, 1),
//                               Colors.orange,
//                             ],
//                           ),
//                         ),
//                         child: const Column(),
//                       ),
//                     ),
//                     ClipPath(
//                       clipper: WaveClipper3(),
//                       child: Container(
//                         width: double.infinity,
//                         height: 300,
//                         decoration: const BoxDecoration(
//                           gradient: LinearGradient(begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                             colors: [
//                               Color.fromRGBO(252,161,95,1.00),
//                               Color.fromRGBO(252,161,95,1.00),
//                             ],
//                           ),
//                         ),
//                         child: const Column(),
//                       ),
//                     ),
//                     ClipPath(
//                       clipper: WaveClipper1(),
//                       child: Container(
//                         width: double.infinity,
//                         height: 300,
//                         decoration: const BoxDecoration(
//                           gradient: LinearGradient(begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                             colors: [
//                               Color.fromRGBO(252,161,95,1.00),
//                               Colors.purple,
//                             ],
//                           ),
//                         ),
//                         child:  Column(
//                           children: <Widget>[
//                             const SizedBox(
//                               height: 40,
//                             ),
//                             Row(
//                               children: [
//                                 const SizedBox(width: 15),
//                                 const SizedBox(height: 15,),
//                                 InkWell(
//                                   onTap: (){
//                                     Navigator.pop(context);
//                                   },
//                                   child: Container(
//                                    height: 30,
//                                    width: 30,
//                                     decoration: const BoxDecoration(
//                                       color: Colors.black,
//                                       borderRadius: BorderRadius.all(Radius.circular(15))
//                                     ),
//                                     child: const Icon(Icons.arrow_back_ios, color: Colors.white,),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             const Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text("Register Your Pet ",
//                                   style: TextStyle(
//                                     // fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                       // fontStyle: FontStyle.italic ,
//                                       fontSize: 25
//                                   ),
//                                 ),
//                                 Icon(
//                                   Icons.pets_outlined,
//                                   color: Colors.white,
//                                   size: 60,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 32),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text("Category"),
//                       Card(
//                         elevation: 2,
//                         child: Container(
//                           padding: const EdgeInsets.all(8),
//                           width: width *0.5,
//                           decoration: BoxDecoration(
//                               color: Colors.grey.shade200, //<-- SEE HERE
//                               borderRadius: const BorderRadius.all
//                                 (Radius.circular(10))
//                           ),
//                           child: DropdownButton<String>(
//                             value: petCategory,
//                             isExpanded: true,
//                             onChanged: (String? newValue) {
//                               setState(() {
//                                 petCategory = newValue!;
//                               });
//                             },
//                             hint: const Text("Select Options",
//                             ),
//                             items: <String>[
//                               // 'Car', 'Train', 'Bus', 'Flight'
//                               'Cat',
//                               'Dog',
//                               'Rabbit',
//                               'Bird',
//                               'Turtle',
//                               'Other'
//                             ]
//                                 .map<DropdownMenuItem<String>>((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Text(
//                                   value,
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                       ),
//
//                       // Container(
//                       //   child: AppDropDownButton(
//                       //     //width: double.infinity,
//                       //     height: 50,
//                       //     value: petCategory,
//                       //     onChange: (val) {
//                       //       setState(() {
//                       //         petCategory = val;
//                       //       });
//                       //     },
//                       //     dropdownItems: const [
//                       //       'Cat',
//                       //       'Dog',
//                       //       'Rabbit',
//                       //       'Bird',
//                       //       'Turtle',
//                       //       'Other'
//                       //     ],
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 32),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text("Gender"),
//                       Card(
//                         elevation: 2,
//                         child: Container(
//                           padding: const EdgeInsets.all(8),
//                           width: width *0.5,
//                           decoration: BoxDecoration(
//                               color: Colors.grey.shade200, //<-- SEE HERE
//                               borderRadius: const BorderRadius.all
//                                 (Radius.circular(10))
//                           ),
//                           child: DropdownButton<String>(
//                             value: petGender,
//                             isExpanded: true,
//                             onChanged: (String? newValue) {
//                               setState(() {
//                                 petGender = newValue!;
//                               });
//                             },
//                             hint: const Text("Select Options",
//                             ),
//                             items: <String>[
//                               'Male',
//                               'Female',
//                               'Neutered'
//                             ]
//                                 .map<DropdownMenuItem<String>>((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Text(
//                                   value,
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                       ),
//
//                       // AppDropDownButton(
//                       //   //width: double.infinity,
//                       //   height: 50,
//                       //   value: petGender,
//                       //   onChange: (val) {
//                       //     setState(() {
//                       //       petGender = val;
//                       //     });
//                       //   },
//                       //   dropdownItems: const [
//                       //     'Male',
//                       //     'Female',
//                       //     'Neutered'
//                       //   ],
//                       // ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10.0,
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 32),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text("Pet Size"),
//                       Card(
//                         elevation: 2,
//                         child: Container(
//                           padding: const EdgeInsets.all(8),
//                           width: width *0.5,
//                           decoration: BoxDecoration(
//                               color: Colors.grey.shade200, //<-- SEE HERE
//                               borderRadius: const BorderRadius.all
//                                 (Radius.circular(10))
//                           ),
//                           child: DropdownButton<String>(
//                             value: petSize,
//                             isExpanded: true,
//                             onChanged: (String? newValue) {
//                               setState(() {
//                                 petSize = newValue!;
//                               });
//                             },
//                             hint: const Text("Select Options",
//                             ),
//                             items: <String>[
//                               'Small',
//                               'Medium',
//                               'Large'
//                             ]
//                                 .map<DropdownMenuItem<String>>((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Text(
//                                   value,
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                       ),
//
//                       // AppDropDownButton(
//                       //   //width: double.infinity,
//                       //   height: 50,
//                       //   value: petSize,
//                       //   onChange: (val) {
//                       //     setState(() {
//                       //       petSize = val;
//                       //     });
//                       //   },
//                       //   dropdownItems: const [
//                       //     'Small',
//                       //     'Medium',
//                       //     'Large'
//                       //   ],
//                       // ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10.0,
//                 ),
//                 Padding(
//                   padding:
//                   const EdgeInsets.only( left: 30, right: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text('Select D.O.B.'),
//                       // const SizedBox(width: 20,),
//                       const Spacer(),
//                       InkWell(
//                         onTap: (){
//                               Provider.of<DateTimeProvider>(context, listen: false).selectPetDobDate(context);
//                         },
//                         child: Card(
//                           elevation: 2,
//                           child: Container(
//                             padding: const EdgeInsets.all(8),
//                             width: width *0.51,
//                             height: 60,
//                             decoration: BoxDecoration(
//                                 color: Colors.grey.shade200, //<-- SEE HERE
//                                 borderRadius: const BorderRadius.all
//                                   (Radius.circular(10))
//                             ),
//                               child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                                   child: Text(
//                                       DateTimeClass.stringToddMMyyyy(selectedDate) ??
//                                           "Select Date"),
//                                 ),
//                               ),
//                           ),
//                         ),
//                       ),
//                       // SecondaryButton(
//                       //   width:
//                       //   MediaQuery.of(context).size.width / 2,
//                       //   child: Align(
//                       //     alignment: Alignment.centerLeft,
//                       //     child: Padding(
//                       //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                       //       child: Text(
//                       //           DateTimeClass.stringToddMMyyyy(selectedDate) ??
//                       //               "Select Date"),
//                       //     ),
//                       //   ),
//                       //   onTap: () {
//                       //     // selectDate(context);
//                       //     Provider.of<DateTimeProvider>(context, listen: false).selectPetDobDate(context);
//                       //
//                       //   },
//                       // ),
//
//                   //     SizedBox(
//                   // width: 80,
//                   //       child: Material(
//                   //         elevation: 2.0,
//                   //         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                   //         child: TextFormField(
//                   //           onChanged: (String value) {},
//                   //           cursorColor: Colors.deepOrange,
//                   //           controller: _controllerYear,
//                   //           keyboardType: TextInputType.number,
//                   //           // validator: (value) {
//                   //           //   return InputValidator.emptyTextvalidator(
//                   //           //       value!, "Year");
//                   //           // },
//                   //           maxLength: 2,
//                   //           decoration: const InputDecoration(
//                   //               hintText: "Year",
//                   //               counterText: "",
//                   //               border: InputBorder.none,
//                   //               contentPadding: EdgeInsets.symmetric(
//                   //                   horizontal: 13, vertical: 13)
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ),
//                       const SizedBox(width: 20,),
//                       // SizedBox(
//                       //   width: 80,
//                       //   child: Material(
//                       //     elevation: 2.0,
//                       //     borderRadius: const BorderRadius.all(Radius.circular(10)),
//                       //     child: TextFormField(
//                       //       onChanged: (String value) {},
//                       //       cursorColor: Colors.deepOrange,
//                       //       controller: _controllerMonth,
//                       //       keyboardType: TextInputType.number,
//                       //       // validator: (value) {
//                       //       //   return InputValidator.emptyTextvalidator(
//                       //       //       value!, "Month");
//                       //       // },
//                       //       maxLength: 2,
//                       //       decoration: const InputDecoration(
//                       //           hintText: "Month",
//                       //           counterText: "",
//                       //           border: InputBorder.none,
//                       //           contentPadding: EdgeInsets.symmetric(
//                       //               horizontal: 13, vertical: 13)
//                       //       ),
//                       //     ),
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10.0,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 32),
//                   child: Material(
//                     elevation: 2.0,
//                     color: Colors.grey.shade200,
//                     borderRadius: const BorderRadius.all(Radius.circular(30)),
//                     child: TextFormField(
//                       onChanged: (String value) {},
//                       cursorColor: Colors.deepOrange,
//                       controller: _controllerName,
//                       keyboardType: TextInputType.text,
//                       // validator: (value) {
//                       //   return InputValidator.emptyTextvalidator(
//                       //       value!, "pet Name");
//                       // },
//                       decoration:  InputDecoration(
//                           hintText: "Enter pet name",
//                           prefixIcon: Material(
//                             elevation: 0,
//                             color: Colors.grey.shade200,
//                             borderRadius: const BorderRadius.all(Radius.circular(30)),
//                             child: const Icon(
//                               Icons.pets,
//                               color: Colors.blueAccent,
//                             ),
//                           ),
//                           border: InputBorder.none,
//                           contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 25, vertical: 13)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 32),
//                   child:
//                   Material(
//                     elevation: 2.0,
//                     color: Colors.grey.shade200,
//                     borderRadius: const BorderRadius.all(Radius.circular(30)),
//                     child: TextFormField(
//                       onChanged: (String value) {},
//                       cursorColor: Colors.deepOrange,
//                       controller: _controllerBreed,
//                       keyboardType: TextInputType.text,
//                       // validator: (value) {
//                       //   return InputValidator.emptyTextvalidator(
//                       //       value!, "breed");
//                       // },
//                       decoration:  InputDecoration(
//                           hintText: "Enter Breed",
//                           prefixIcon: Material(
//                             elevation: 0,
//                             color: Colors.grey.shade200,
//                             borderRadius: const BorderRadius.all(Radius.circular(30)),
//                             child: const Icon(
//                               Icons.pets_rounded,
//                               color: Colors.blueAccent,
//                             ),
//                           ),
//                           border: InputBorder.none,
//                           contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 25, vertical: 13)),
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(
//                   height: 30.0,
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(left: 32.0),
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                           height: 60.0,
//                           width: 60.0,
//                           decoration: BoxDecoration(
//                               shape: BoxShape.rectangle,
//                               border: Border.all(color: AppColor.blackColor),
//                               borderRadius: BorderRadius.circular(15.0)),
//                           child: InkWell(
//                             child: _imageProfile == null
//                                 ? const Icon(Icons.add_a_photo)
//                                 : ClipRRect(
//                               borderRadius: BorderRadius.circular(15.0),
//                               child: Image.file(
//                                 _imageProfile!,
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                             onTap: () => ImagePickerHelper().getImage(true, context)
//                                 // getImage(true),
//                           )),
//                       const SizedBox(
//                         width: 15.0,
//                       ),
//                       const Text('Add profile photo')
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20.0,
//                 ),
//
//                 // CommonShareWidget.signInUpbutton("Register", () {
//                 //   handleSubmit(widget.uid, context);
//                 // }, context),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Card(
//                       child: Container(
//                           height: 60,
//                           width: width /2,
//                           decoration: const BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                             color: Colors.black,
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(2.0),
//                             child: InkWell(
//                               onTap: (){
//
//                                 handleSubmit(widget.uid, context);
//                               },
//                               child:  Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   _loaderState ? const CircularProgressIndicator(color: Colors.white,):
//                                   const Text( "Register",
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         color: Colors.white
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           )
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 45.0,
//                 ),
//
//               ],
//
//             ),
//           ),
//         ),
//       // ),
//     );
//
//   }
//
//   bool validateForm() {
//     FocusScope.of(context).unfocus();
//     bool isValid = false;
//     if (_formKey.currentState!.validate()) {
//       if (_imageProfile == null) {
//         CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 2,
//             message: "please add profile image");
//       }
//       else if(petCategory == null ){
//         CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 2,
//             message: "please add pet category");
//         // String? petGender;
//         // String? petSize;
//       }
//       else if(petGender == null ){
//         CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 2,
//             message: "please add pet gender");
//         // String? petSize;
//       }
//       else if(petSize == null ){
//         CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 2,
//             message: "please add pet size");
//       }
//       else if(_controllerName.text.trim().isEmpty ){
//         CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 2,
//             message: "please enter pet name");
//       }
//       else if(_controllerBreed.text.trim().isEmpty ){
//         CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 2,
//             message: "please enter breed name");
//       } else if (selectedDate == null) {
//         CommonShareWidget.showFlushBar(
//             context: context,
//             duration: 2,
//             message: "Please select Date");
//       }
//         else {
//           isValid = true;
//         }
//       // else if(_controllerYear.text.trim().isEmpty ){
//       //   CommonShareWidget.showFlushBar(
//       //       context: context,
//       //       duration: 2,
//       //       message: "please enter Year",
//       //       // color:  AppColor.orange
//       //   );
//       // }
//       // else if(_controllerMonth.text.trim().isEmpty ){
//       //   CommonShareWidget.showColorFlushBar(
//       //       context: context,
//       //       duration: 2,
//       //       message: "Please enter Month",
//       //       color:  AppColor.orange
//       //   );
//       // }
//       // else if(_controllerYear.text.isNotEmpty ||  _controllerMonth.text.isNotEmpty ){
//       //   int petYear = int.parse(_controllerYear.text.toString());
//       //   int petMonth = int.parse(_controllerMonth.text.toString());
//       //   if(petYear > 20){
//       //     CommonShareWidget.showFlushBar(
//       //         context: context,
//       //         duration: 2,
//       //         message: "Year should be less then or equal to 20");
//       //   }else if(petMonth > 11){
//       //     CommonShareWidget.showFlushBar(
//       //         context: context,
//       //         duration: 2,
//       //         message: "Month should be less then 12");
//       //   }else if(petMonth == 0 && petYear == 0){
//       //     CommonShareWidget.showFlushBar(
//       //         context: context,
//       //         duration: 2,
//       //         message: "Both year and month should not be zero");
//       //   }
//       //   else {
//       //     isValid = true;
//       //   }
//       //      }
//
//     }
//    if (kDebugMode) {
//      print('=====isValid---$isValid');
//    }
//     return isValid;
//   }
//
//   Future<void> handleSubmit(uid, context) async {
//       if (validateForm() != true) {
//         return;
//       }
//       setState(() {
//         showHideLoading(true);
//       });
//     FocusScope.of(context).requestFocus(FocusNode());
//     String imageUrl = await LoginSignupRepo()
//         .uploadImage(_imageProfile!, widget.uid);
//     if (imageUrl.isNotEmpty) {
//       final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
//      var data =  await _petRegisterRepo.setRegisteredPet(timestamp,
//         PetRegistrationModel(
//                id: timestamp,
//                userUid: widget.uid,
//           petCategory: petCategory,
//           petGender: petGender,
//           petSize: petSize,
//           dob: selectedDate.toString(),
//           petName: _controllerName.text,
//           petBreed: _controllerBreed.text,
//           profilephotoImageUrl: imageUrl ,
//                  ),
//       );
//       if (data != null) {
//         showHideLoading(false);
//         setState(() {
//
//         });
//         clearValue();
//         CommonShareWidget.showFlushBar(
//           context: context,
//           duration: 3,
//           message: "Your request submitted",
//         );
// // Navigator.pop(context);
//       } else {
//         showHideLoading(false);
//          clearValue();
//         CommonShareWidget.showFlushBar(
//           context: context,
//           duration: 3,
//           message: "Your request submitted",
//         );
//         // Navigator.pop(context);
//
//       }
//     }
//     else {
//       showHideLoading(false);
//       CommonShareWidget.showFlushBar(
//           context: context, duration: 3, message: "Data upload failes");
//     }
//   }
//
//
//
//   showHideLoading(bool status) {
//     if (mounted) {
//       setState(() {
//         _loaderState = status;
//       });
//     }
//   }
//
//   clearValue() {
//     setState(() {
//       _controllerBreed.clear();
//       _controllerName.clear();
//       _controllerMonth.clear();
//       _controllerYear.clear();
//       petCategory= null;
//       petGender= null;
//       petSize= null;
//       _imageProfile = null;
//       selectedDate = null;
//       // selectedTime = null;
//       Provider.of<DateTimeProvider>(context, listen: false).clearFunction(selectedDate ?? '', '');
//       Provider.of<ImagePickerHelper>(context, listen: false).imageClear();
//     });
//   }
// }
