// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/constant/colors.dart';
// import 'package:provider/provider.dart';
//
// import '../../bloc/loader_provider.dart';
// import '../../repository/loginsignupRepo.dart';
//
//
//
// class UserEmailReverify extends StatefulWidget {
//   const UserEmailReverify({Key? key, required this.phone, required this.email}) : super(key: key);
//   final String email;
//   final String phone;
//   @override
//   State<UserEmailReverify> createState() => _UserEmailReverifyState();
// }
//
// class _UserEmailReverifyState extends State<UserEmailReverify> {
//   final _formKey = GlobalKey<FormState>();
//   late TextEditingController emailEditingController = TextEditingController();
//   final TextEditingController _controllerPassword = TextEditingController();
//   bool _loaderState = false;
//   bool passwordVisible = false;
//   bool checkCurrentuser = false;
//
//   @override
// void initState(){
//   super.initState();
//   // emailEditingController = widget.email.toString() as TextEditingController;
// }
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     var width = size.width;
//     LoaderProvider loaderProvider = Provider.of<LoaderProvider>(context);
//     _loaderState = loaderProvider.isLoading;
//     return Scaffold(
//       appBar: AppBar(),
//       body:
//       Column(
//         children: [
//           Form(
//             autovalidateMode: AutovalidateMode.always,
//             key: _formKey,
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   const SizedBox(
//                     height: kToolbarHeight,
//                   ),
//
//                   Text("Hi, Your Email Id:",
//                   style: TextStyle(
//                     fontSize: 25,
//                     color: AppColor.orange,
//                     fontWeight: FontWeight.bold
//                   ),
//                   ),
//                   const SizedBox(height: 10,),
//                   Text(widget.email,
//                   style: const TextStyle(
//                     fontSize: 17,
//                     fontWeight: FontWeight.bold
//                   ),
//                   ),
//                   const SizedBox(
//                     height: 50,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 32),
//                     child: Material(
//                       elevation: 2.0,
//                       borderRadius:
//                       const BorderRadius.all(Radius.circular(30)),
//                       child: TextField(
//                         onChanged: (String value) {},
//                         cursorColor: Colors.deepOrange,
//                         controller: _controllerPassword,
//                         keyboardType: TextInputType.visiblePassword,
//                         obscureText: passwordVisible,
//                         decoration:  InputDecoration(
//                             hintText: "Please Enter Password",
//                             prefixIcon: const Material(
//                               elevation: 0,
//                               borderRadius:
//                               BorderRadius.all(Radius.circular(30)),
//                               child: Icon(
//                                 Icons.lock,
//                                 color: Colors.green,
//                               ),
//                             ),
//                             suffixIcon: IconButton(
//                                 icon: Icon(
//                                   passwordVisible ? Icons.visibility_off : Icons.visibility,
//                                 ),
//                                 onPressed: (){
//                                   setState(() {
//                                     passwordVisible = !passwordVisible;
//                                   });
//                                 }
//                             ),
//                             border: InputBorder.none,
//                             contentPadding: const EdgeInsets.symmetric(
//                                 horizontal: 25, vertical: 13)),
//                       ),
//                     ),
//                   ),
//
//                   const SizedBox(
//                     height: 20.0,
//                   ),
//                   const SizedBox(
//                     height: 1.0,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Card(
//                         child: Container(
//                             height: 60,
//                             width: width /2,
//                             decoration: const BoxDecoration(
//                               borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                               color: Colors.black,
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(2.0),
//                               child: InkWell(
//                                 onTap: () async {
//
//                                     await Provider.of<LoginSignupRepo>(context,
//                                          listen: false)
//                                          .deleteUser(widget.email, _controllerPassword.text, context);
//
//                                 },
//                                 child:  Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     _loaderState ? const CircularProgressIndicator(color: Colors.white,):
//                                     const Text( "Submit",
//                                       style: TextStyle(
//                                           fontSize: 20,
//                                           color: Colors.white
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             )
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   const SizedBox(
//                     height: 30.0,
//                   ),
//                ],
//               ),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
