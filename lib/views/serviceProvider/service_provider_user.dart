//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/constant/colors.dart';
// import 'package:provider/provider.dart';
// import 'package:velocity_x/velocity_x.dart';
// import '../../admin/user_data.dart';
// import '../../constant/date_time.dart';
// import '../../model/book_service.dart';
// import '../../model/user_profile.dart';
// import '../loginSignUp/login.dart';
// import '../shareAbleWidget.dart/commonShareWidget.dart';
// import '../user/userProfile.dart';
//
// class ServiceProviderUser extends StatefulWidget {
//   const ServiceProviderUser({super.key});
//
//   @override
//   State<ServiceProviderUser> createState() => _ServiceProviderUserState();
// }
//
// class _ServiceProviderUserState extends State<ServiceProviderUser> {
//   // bool _isSearching = false;
//   final fireStore = FirebaseFirestore.instance.collection("appointment").snapshots();
//   CollectionReference ref = FirebaseFirestore.instance.collection('appointment');
//   final carouselStream =  FirebaseFirestore.instance.collection('carousel').snapshots();
//   final TextEditingController _reasonForCancelController =
//   TextEditingController();
//
//
//   List<BookServiceModel> _list = [];
//   UserProfileModel? userModel;
//
//   @override
//   void dispose() {
//     _reasonForCancelController.dispose();
//     _list.clear();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//    final size = MediaQuery.of(context).size;
//    var width = size.width;
//     return Scaffold(
//       body: NestedScrollView
//          (
//          floatHeaderSlivers: true,
//          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
//            SliverAppBar(
//              floating: true,
//              title: Row
//                (
//                mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: [
//                  const Text("Pet",
//                    style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                        color: Colors.black,
//                        // fontStyle: FontStyle.italic ,
//                        fontSize: 40
//                    ),
//                  ),
//                  const Text("finder",
//                    style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                        color: Colors.orange,
//                        // fontStyle: FontStyle.italic ,
//                        fontSize: 40
//                    ),
//                  ),
//                  const Spacer(),
//                  actionProfileButton(),
//                ],
//              ),
//              // actions: [
//              //   actionProfileButton(),
//              // ],
//            ),
//          ],
//          body: Padding(
//            padding: const EdgeInsets.only(top: 5.0, bottom: 2,
//                left: 10, right: 10 ),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: [
//                const SizedBox(height: 20,),
//                StreamBuilder<QuerySnapshot>(
//                  stream: carouselStream,
//                  builder: (BuildContext context, snapshot) {
//                    if(snapshot.data?.docs.length!= null ){
//                      return ListView.builder(
//                        itemCount: snapshot.data?.docs.length,
//                        shrinkWrap: true,
//                        physics: const NeverScrollableScrollPhysics(),
//                        itemBuilder: (context, index) {
//                          dynamic val = snapshot.data?.docs[index];
//                          List<dynamic> carouselImage = val['carousel'] ?? [] ;
//                          return Column(
//                            children: [
//                              if(carouselImage.isNotEmpty)...[
//                                CarouselSlider.builder(
//                                  itemCount: carouselImage.length,
//                                  itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
//                                    String imageUrl = carouselImage[itemIndex]['image'].toString();
//                                    return SizedBox(
//                                        width: width * 0.90,
//                                        height: 300,
//                                        child:
//                                        Image.network(imageUrl)
//                                    );
//                                  },
//                                  options: CarouselOptions(
//                                    autoPlay: true,
//                                    enlargeCenterPage: true,
//                                    viewportFraction: 0.9,
//                                    aspectRatio: 2.0,
//                                    initialPage: 0,
//                                  ),
//                                ),
//                              ],
//                              const SizedBox(height: 10,),
//                            ],
//                          );
//                        },
//                      );
//                    } else{
//                      return const SizedBox();
//                    }
//                  },
//                ),
//
//                // CarouselSlider.builder(
//                //   itemCount: 4,
//                //   itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
//                //     return
//                //       SizedBox(
//                //           width: width *0.95,
//                //           height: 400,
//                //           child: Column(
//                //             children: [
//                //               if(itemIndex == 1)...[
//                //                 Image.asset("assets/Veterinarians.jpg")
//                //               ] else if(itemIndex == 2)...[
//                //                 Image.asset("assets/traineres.jpg")
//                //               ]else if(itemIndex == 3)...[
//                //                 Image.asset("assets/lost found.jpg")
//                //               ] else...[
//                //                 Image.asset("assets/digital diary.jpg")
//                //               ]
//                //             ],
//                //           )
//                //       );
//                //   },
//                //   options: CarouselOptions(
//                //     autoPlay: false,
//                //     enlargeCenterPage: true,
//                //     viewportFraction: 0.9,
//                //     aspectRatio: 2.0,
//                //     initialPage: 0,
//                //   ),
//                // ),
//
//                StreamBuilder<QuerySnapshot>(
//                    stream: fireStore,
//                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot )
//                    {
//                      if(snapshot.connectionState == ConnectionState.waiting){
//                        return Center(child: CommonShareWidget.circularLoader());
//                      }
//                      if(snapshot.hasError){
//                        return const Center(child: Text('Some Error'));
//                      }
//                      final data = snapshot.data?.docs;
//                      _list = data?.map((e) => BookServiceModel.fromJson(e.data() as Map<String, dynamic>))
//                          .where((element) => (
//                          element.professionalID == UserProvider.userInfoModel?.uid
//                              && (element.orderApprove == false) &&
//                              (element.orderCancel == false || element.orderCancel == null) ) ).toList() ?? [];
//                      if (kDebugMode) {
//                        print("list of users of Professionals: ${_list.length}");
//                      }
//                      if(_list.isNotEmpty){
//                        return Expanded(
//                          child: ListView.builder(
//                              itemCount: _list.length,
//                              shrinkWrap: true,
//                              scrollDirection: Axis.vertical,
//                              // physics:  AlwaysScrollableScrollPhysics(),
//                              itemBuilder: (context, index){
//                                String date = _list[index].appointmentDate.toString();
//                                String time  = _list[index].appointmentTime.toString();
//                                String? appointmentDate = DateTimeClass.stringToddMMyyyy(date);
//                                String? appointmentTime = DateTimeClass.timeToHHMMA(time);
//                                return Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  mainAxisAlignment: MainAxisAlignment.start,
//                                  children: [
//                                    Padding(
//                                      padding: const EdgeInsets.only(top: 5.0, bottom: 2,
//                                          left: 10, right: 10 ),
//                                      child:
//                                      InkWell(
//                                        onTap: () async {
//                                          final userExit = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get();
//                                          if(!userExit.exists){
//                                            CommonShareWidget.goToAnotherPage(
//                                                nextPage: const LoginPage(), context: context);
//                                          }
//                                        },
//                                        child: Card(
//                                          elevation:5,
//                                          color: AppColor.orange,
//                                          child:
//                                          SizedBox(
//                                            height: 320,
//                                            width: width,
//                                            child: Padding(
//                                              padding: const EdgeInsets.all(20.0),
//                                              child: Column(
//                                                children: [
//                                                  Row(
//                                                    children: [
//                                                      const Text("Name: ", style:
//                                                      TextStyle(
//                                                          fontWeight: FontWeight.bold,
//                                                          fontSize: 20
//                                                      ) ,),
//                                                      Expanded(
//                                                        child: Text(_list[index].userName.toString(),
//                                                          maxLines: 1,
//                                                          overflow: TextOverflow.ellipsis,
//                                                          softWrap: true,
//                                                          style: const TextStyle(
//                                                              fontSize: 17
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    ],
//                                                  ),
//                                                  Row(
//                                                    children: [
//                                                      const Text("Visit ID: ", style:
//                                                      TextStyle(
//                                                          fontWeight: FontWeight.bold,
//                                                          fontSize: 20
//                                                      ) ,),
//                                                      Text(_list[index].appointmentID.toString(),
//                                                        maxLines: 1,
//                                                        overflow: TextOverflow.ellipsis,
//                                                        softWrap: true,
//                                                        style: const TextStyle(
//                                                            fontSize: 17
//                                                        ),
//                                                      ),
//                                                    ],
//                                                  ),
//                                                  Row(
//                                                    children: [
//                                                      const Text("Visit Date: ",
//                                                        style: TextStyle(
//                                                          fontWeight: FontWeight.bold,
//                                                          fontSize: 20
//                                                      ) ,),
//                                                      Text(appointmentDate!,
//                                                        maxLines: 1,
//                                                        overflow: TextOverflow.ellipsis,
//                                                        softWrap: true,
//                                                        style: const TextStyle(
//                                                            fontSize: 17
//                                                        ),
//                                                      ),
//                                                    ],
//                                                  ),
//                                                  Row(
//                                                    children: [
//                                                      const Text("Visit Time: ", style:
//                                                      TextStyle(
//                                                          fontWeight: FontWeight.bold,
//                                                          fontSize: 20
//                                                      ) ,),
//                                                      Text(appointmentTime!,
//                                                        maxLines: 1,
//                                                        overflow: TextOverflow.ellipsis,
//                                                        softWrap: true,
//                                                        style: const TextStyle(
//                                                            fontSize: 17
//                                                        ),
//                                                      ),
//                                                    ],
//                                                  ),
//                                                  Row(
//                                                    children: [
//                                                      const Text("Cause: ", style:
//                                                      TextStyle(
//                                                          fontWeight: FontWeight.bold,
//                                                          fontSize: 20
//                                                      ) ,),
//                                                      Expanded(
//                                                        child: Text(_list[index].description.toString(),
//                                                          maxLines: 1,
//                                                          overflow: TextOverflow.ellipsis,
//                                                          softWrap: true,
//                                                          style: const TextStyle(
//                                                              fontSize: 17
//                                                          ),
//                                                        ),
//                                                      ),
//                                                    ],
//                                                  ),
//
//                                                  const Row(
//                                                    children: [
//                                                      Text("Status: ", style:
//                                                      TextStyle(
//                                                          fontWeight: FontWeight.bold,
//                                                          fontSize: 20
//                                                      ) ,),
//                                                      Text("Pending",
//                                                        maxLines: 1,
//                                                        overflow: TextOverflow.ellipsis,
//                                                        softWrap: true,
//                                                        style: TextStyle(
//                                                            fontSize: 17
//                                                        ),
//                                                      ),
//                                                    ],
//                                                  ),
//
//                                                  const SizedBox(height: 20,),
//                                                  Row(
//                                                    mainAxisAlignment: MainAxisAlignment.center,
//                                                    children: [
//                                                      InkWell(
//                                                        onTap: () async {
//                                                          final userExit = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get();
//                                                          if(!userExit.exists){
//                                                            CommonShareWidget.goToAnotherPage(
//                                                                nextPage: const LoginPage(), context: context);
//                                                          }
//                                                          else {
//                                                            setState(()
//                                                            {
//                                                              ref.doc(_list[index].appointmentID.toString()).update(
//                                                                  {
//                                                                    "orderApprove": true,
//                                                                  }).then((value){
//                                                                const Text('Update');
//                                                              }).onError((error, stackTrace){
//                                                                const Text('Error');
//                                                              });
//                                                            }
//                                                            );
//                                                          }
//
//                                                        },
//                                                        child: Container(
//                                                          height: 70,
//                                                          width: 70,
//                                                          decoration:  BoxDecoration(
//                                                              color: AppColor.green,
//                                                              borderRadius: const BorderRadius.all(Radius.circular(35))
//                                                          ),
//                                                          child: Center(child: Text("Ok",
//                                                            style: TextStyle(
//                                                                color: AppColor.whiteColor,
//                                                                fontWeight: FontWeight.bold
//                                                            ),
//                                                          )),
//                                                        ),
//                                                      ),
//                                                      const SizedBox(width: 20,),
//                                                      Row(
//                                                        children: [
//                                                          InkWell(
//                                                            onTap: () async {
//                                                              final userExit = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get();
//                                                              if(!userExit.exists){
//                                                                CommonShareWidget.goToAnotherPage(
//                                                                    nextPage: const LoginPage(), context: context);
//                                                              }
//                                                              else
//                                                              {
//                                                                showDialog
//                                                                  (
//                                                                    context: context,
//                                                                    builder: (BuildContext context)
//                                                                    {
//                                                                      return AlertDialog(
//                                                                        // backgroundColor: Colors.blueAccent.withOpacity(0.3),
//                                                                        content: Container(
//                                                                          height: 150,
//                                                                          width: width,
//                                                                          decoration: const BoxDecoration(
//                                                                            // color: Colors.transparent.withOpacity(0.2),
//                                                                          ),
//                                                                          child: Column(
//                                                                            children: [
//                                                                              const Text("Do you want to Cancel?",
//                                                                                style: TextStyle(
//                                                                                    fontWeight: FontWeight.bold
//                                                                                ),
//                                                                              ),
//                                                                              const SizedBox(height: 05,),
//                                                                              TextField(
//                                                                                onChanged: (String value) {},
//                                                                                cursorColor: Colors.deepOrange,
//                                                                                controller: _reasonForCancelController,
//                                                                                keyboardType: TextInputType.text,
//                                                                                // validator: (value) {
//                                                                                //   return InputValidator.emptyTextvalidator(
//                                                                                //       value!, "Write Reason");
//                                                                                // },
//                                                                                decoration: const InputDecoration(
//                                                                                  hintText: "Enter Reason for cancel",
//                                                                                  prefixIcon: Icon(
//                                                                                    Icons.description,
//                                                                                    color: Colors.indigoAccent,
//                                                                                  ),
//                                                                                ),
//                                                                              ),
//
//                                                                              const SizedBox(height: 10,),
//                                                                              Row(
//                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                                children: [
//                                                                                  InkWell(
//                                                                                    onTap: ()  {
//                                                                                      canclReason(_list[index].appointmentID.toString());
//                                                                                      },
//                                                                                    child: Container(
//                                                                                      height: 35,
//                                                                                      width: 70,
//                                                                                      decoration: const BoxDecoration(
//                                                                                        color: Colors.green,
//                                                                                        borderRadius: BorderRadius.all(Radius.circular(25)),
//                                                                                      ),
//                                                                                      child: const Center(child: Text('Yes')),
//
//                                                                                    ),
//                                                                                  ),
//                                                                                  const SizedBox(width: 10,),
//                                                                                  InkWell(
//                                                                                    onTap: (){
//                                                                                      Navigator.of(context).pop();
//                                                                                    },
//                                                                                    child: Container(
//                                                                                      height: 40,
//                                                                                      width: 70,
//                                                                                      decoration: const BoxDecoration(
//                                                                                        color: Colors.red,
//                                                                                        borderRadius: BorderRadius.all(Radius.circular(25)),
//                                                                                      ),
//                                                                                      child: const Center(child: Text('No')),
//                                                                                    ),
//                                                                                  ),
//                                                                                ],
//                                                                              )
//                                                                            ],
//                                                                          ),
//                                                                        ),
//                                                                      );
//                                                                    }
//                                                                );
//                                                              }
//                                                            },
//                                                            child: Container(
//                                                              height: 70,
//                                                              width: 70,
//                                                              decoration: const BoxDecoration(
//                                                                  color: Colors.black,
//                                                                  borderRadius: BorderRadius.all(Radius.circular(35))
//                                                              ),
//                                                              child: const Center(child: Text("Cancel",
//                                                                maxLines: 1,
//                                                                overflow: TextOverflow.ellipsis,
//                                                                softWrap: true,
//                                                                style: TextStyle(
//                                                                    color: Colors.white,
//                                                                    fontWeight: FontWeight.bold
//                                                                ),
//                                                              )),
//                                                            ),
//                                                          ),
//                                                        ],
//                                                      ),
//                                                    ],
//                                                  )
//                                                ],
//                                              ),
//                                            ) ,
//                                          ),
//                                        ),
//                                      ),
//                                    )
//                                  ],
//                                );
//                              }
//                          ),
//                        );
//                      }
//                      else{
//                        return  const Column(
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: [
//                            SizedBox(height: 40,),
//                            Center(
//                              child: Text('No New appointment',
//                                maxLines: 1,
//                                overflow: TextOverflow.ellipsis,
//                                softWrap: true,
//                                style: TextStyle(
//                                    fontSize: 30
//                                ),
//                              ),
//                            ),
//                          ],
//                        );
//                      }
//                    }
//
//                )
//              ],
//            ),
//          ),
//            )
//
//
//
//
//     );
//   }
//
//   canclReason(String appointmentId){
//     if (validateReason() != true) {
//       return;
//     }
//       setState(()
//       {
//         ref.doc(appointmentId.toString()).update(
//             {
//               "orderCancel": true,
//               "cancelReason": _reasonForCancelController.text.trim(),
//
//             }).then((value){
//           const Text('Update');
//         }).onError((error, stackTrace){
//           const Text('Error');
//         });
//       }
//       );
//
//       Navigator.of(context).pop();
//
//
//   }
//
//  bool validateReason(){
//    FocusScope.of(context).unfocus();
//    bool isValid = false;
//     if(_reasonForCancelController.text.trim().isEmptyOrNull){
//       CommonShareWidget.showFlushBar(
//           context: context,
//           duration: 2,
//           message: "Please Write Reason");
//     } else{
//       isValid = true;
//     }
//
//     return isValid;
//   }
//
//   actionProfileButton() {
//     return Consumer<User?>(builder: (_, user, child) {
//       return IconButton(
//       icon: const Icon(Icons.person,
//       color: Colors.black,
//       ),
//       style: IconButton.styleFrom(
//       backgroundColor: AppColor.orange,
//       ),
//           onPressed: () {
//             if (user == null) {
//               CommonShareWidget.goToAnotherPage(
//                   nextPage: const LoginPage(), context: context);
//             } else {
//               CommonShareWidget.goToAnotherPage(
//                   nextPage: const UserProfile(), context: context);
//             }
//
//             //_scaffoldKey.currentState!.openEndDrawer();
//           });
//     });
//   }
//
// }
