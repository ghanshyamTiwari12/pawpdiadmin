// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/bloc/digital_diary_api.dart';
// import 'package:petfindernetwork/views/digital_diary/pet_digital_diary.dart';
// import 'package:petfindernetwork/views/digital_diary/pet_show_diary.dart';
// import 'package:petfindernetwork/views/shareAbleWidget.dart/commonShareWidget.dart';
// import '../../constant/colors.dart';
//
// class PetDiaryList extends StatefulWidget {
//   const PetDiaryList({super.key, required this.userUid});
//   final String userUid;
//   @override
//   State<PetDiaryList> createState() => _PetDiaryListState();
// }
//
// class _PetDiaryListState extends State<PetDiaryList> {
//   // final fireStore =  FirebaseFirestore.instance.collection('registeredPet').snapshots();
//   CollectionReference ref = FirebaseFirestore.instance.collection('registeredPet');
//   // List <Map<String, dynamic>> userPetList = [];
//   bool petDelete = false;
//   @override
//   void initState(){
//     super.initState();
//   }
//   @override
//   void dispose() {
//     // disposePetDiaryList();
//     if (kDebugMode) {
//       // print("dispose pet diary list ${userPetList.length}");
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     var height = size.height;
//     var width = size.width;
//
//     return Scaffold(
//         appBar: AppBar(
//         automaticallyImplyLeading: false,
//         flexibleSpace: _appBar(height, width),
//     ),
//
//     body: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//          StreamBuilder<QuerySnapshot>(
//         stream: DigitalDiaryApi.userPetDiary(widget.userUid),
//         builder: (BuildContext context,
//         AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return  Center(child: CommonShareWidget.circularLoader());
//         }
//
//         if (snapshot.hasError) return const Text('Some Error');
//            if(snapshot.data!.docs.length > 0)
//            {
//              return Expanded(
//                  child: ListView.builder(
//                      itemCount: snapshot.data?.docs.length,
//                      itemBuilder: (context, index) {
//                        dynamic petList = snapshot.data?.docs[index];
//                        String url = petList["profile_image_url"];
//                        return Padding(
//                          padding: const EdgeInsets.only(left: 20.0,
//                              right: 20.0, bottom: 10.0),
//                          child: Card(
//                            color: AppColor.orange,
//                            child: Padding(
//                              padding: const EdgeInsets.all(12.0),
//                              child: SizedBox(
//                                  // height: 140,
//                                  height: petDelete ? 180 : 140,
//                                  width: width,
//                                  child: Column(
//                                    crossAxisAlignment: CrossAxisAlignment.center,
//                                    mainAxisAlignment: MainAxisAlignment.start,
//                                    children: [
//                                      const SizedBox(height: 15,),
//                                      Row(
//                                        mainAxisAlignment: MainAxisAlignment.start,
//                                        crossAxisAlignment: CrossAxisAlignment.center,
//                                        children: [
//                                          Card(
//                                            color: Colors.transparent,
//                                            shape: RoundedRectangleBorder( //<-- SEE HERE
//                                              borderRadius: BorderRadius.circular(25.0), //<-- SEE HERE
//                                            ),
//                                            elevation: 5,
//                                            child: CircleAvatar(
//                                              backgroundImage: CachedNetworkImageProvider(url),
//                                              radius: 25,
//                                            ),
//                                          ),
//                                          const SizedBox(width: 15,),
//                                          Expanded(
//                                            child: Column(
//                                              crossAxisAlignment: CrossAxisAlignment.start,
//                                              children: [
//                                                Text("${petList['pet_name']}",
//                                                  maxLines: 1,
//                                                  overflow: TextOverflow.ellipsis,
//                                                  softWrap: true,
//                                                  style: const TextStyle(
//                                                    fontSize: 16,
//                                                    fontWeight: FontWeight.bold,
//                                                  ),
//                                                ),
//                                                const SizedBox(height: 5,),
//                                                Text("${petList['pet_category']}",
//                                                  maxLines: 1,
//                                                  overflow: TextOverflow.ellipsis,
//                                                  softWrap: true,
//                                                  style: const TextStyle(
//                                                    fontSize: 16,
//                                                    // fontWeight: FontWeight.bold,
//                                                  ),
//                                                )
//                                              ],
//                                            ),
//                                          ),
//                                          const Spacer(),
//                                          Column(
//                                            children: [
//                                              // ElevatedButton(
//                                              //     onPressed: petDelete ? null : showPetDiary(widget.userUid,
//                                              //         petList['pet_name'],
//                                              //         url,
//                                              //         petList['id'],
//                                              //       context
//                                              //     ),
//                                              //     child: Text("Add Activity")),
//                                              InkWell(
//                                                onTap: (){
//                                                  !petDelete ?
//                                                  Navigator.push(context, MaterialPageRoute(builder: (_) =>
//                                                      PetDigitalDiary(uid: widget.userUid, petName: petList['pet_name'], petImage: url, petID: petList['id'] ,),
//                                                  )): const SizedBox();
//                                                },
//                                                child: Card(
//                                                  color: Colors.transparent,
//                                                  shape: RoundedRectangleBorder( //<-- SEE HERE
//                                                    borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
//                                                  ),
//
//                                                  elevation: 5,
//                                                  child: Container(
//                                                      height: 40,
//                                                      width: 120,
//                                                      decoration: BoxDecoration(
//                                                        color: petDelete ? Colors.black.withOpacity(0.0) : Colors.black.withOpacity(0.7),
//                                                        borderRadius: const BorderRadius.all(Radius.circular(20)),
//                                                      ),
//                                                      child: const Center(child: Text("Add Activity",
//                                                        style: TextStyle(
//                                                            color: Colors.white
//                                                        ),
//                                                      ))
//                                                    // Icon(Icons.arrow_circle_right, color: AppColor.green, size: 51,),
//                                                  ),
//                                                ),
//
//
//                                                //         Container(
//                                                //         height: 50,
//                                                //         width: 50,
//                                                //         decoration: const BoxDecoration(
//                                                //           color: Colors.white,
//                                                //           borderRadius: BorderRadius.all(Radius.circular(25)),
//                                                //         ),
//                                                //         child: Icon(Icons.add_circle,
//                                                //           color: AppColor.green, size: 51,),
//                                                // ),
//                                              ),
//                                              const SizedBox(height: 10,),
//                                              InkWell(
//                                                onTap: (){
//                                                  !petDelete ?
//
//                                                  Navigator.push(context, MaterialPageRoute(builder: (_) =>
//                                                      PetShowDigitalDiary(
//                                                          uid: widget.userUid,
//                                                          petName: petList['pet_name'],
//                                                          petImage: url,
//                                                          petID: petList['id'],
//                                                          petGender: petList['pet_gender'],
//                                                          petBreed: petList['pet_breed'],
//                                                          petCategory: petList['pet_category'],
//                                                          petExitID: widget.userUid + petList['id'],
//                                                          dob: petList['dob'],
//                                                          // H2eHVesAleasoATFrgzhULKr7An21707287145305
//                                                      ))): const SizedBox();
//                                                  // print("petlist id ${petList['id']}");
//                                                  // print("petexit id ${widget.userUid+ petList['id']}");
//                                                },
//                                                child:
//                                                Card(
//                                                  color: Colors.transparent,
//                                                  shape: RoundedRectangleBorder( //<-- SEE HERE
//                                                    borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
//
//                                                  ),
//
//                                                  elevation: 5,
//                                                  child: Container(
//                                                      height: 40,
//                                                      width: 120,
//                                                      decoration: BoxDecoration(
//                                                        color: petDelete ? Colors.black.withOpacity(0.0) : Colors.black.withOpacity(0.7),
//                                                        borderRadius: const BorderRadius.all(Radius.circular(20)),
//                                                      ),
//                                                      child: const Center(child: Text("Show Activity",
//                                                        style: TextStyle(
//                                                            color: Colors.white
//                                                        ),
//                                                      ))
//                                                    // Icon(Icons.arrow_circle_right, color: AppColor.green, size: 51,),
//                                                  ),
//                                                ),
//                                              ),
//                                            ],
//                                          )
//                                        ],
//                                      ),
//                                      const SizedBox(height: 10,),
//                                      petDelete ? Row(
//                                        mainAxisAlignment: MainAxisAlignment.center,
//                                        children: [
//                                          InkWell(
//                                            onTap: (){
//                                             DigitalDiaryApi.userRegisteredPetDelete( petList['id'], widget.userUid);
//                                            },
//                                            child: Card(
//                                              shape: RoundedRectangleBorder( //<-- SEE HERE
//                                                borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
//                                              ),
//
//                                              elevation: 3,
//                                              child: Container(
//                                                  height: 40,
//                                                  width: 120,
//                                                  decoration: const BoxDecoration(
//                                                    color: Colors.red,
//                                                    borderRadius: BorderRadius.all(Radius.circular(20)),
//                                                  ),
//                                                  child: const Center(child: Text("Delete",
//                                                    style: TextStyle(
//                                                        color: Colors.white
//                                                    ),
//                                                  ))
//                                                // Icon(Icons.arrow_circle_right, color: AppColor.green, size: 51,),
//                                              ),
//                                            ),
//                                          ),
//                                        ],
//                                      ) : const SizedBox()
//                                    ],
//                                  )
//                              ),
//                            ),
//                          ),
//                        );
//                      }
//                  )
//              );
//            }
//            else
//            {
//              return Center(
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: [
//                    SizedBox(height: height *0.30,),
//                    const Text("Please Register Your Pet",
//                      style: TextStyle(
//                        fontSize: 25,
//                          color: Colors.blueAccent
//                      ),
//                    ),
//                  ],
//                ),
//              );
//            }
//         }
//         ),
//       ],
//     ),
//     );
//   }
//
//
// Widget _appBar(var height, var width){
//   return Container(
//     padding: const EdgeInsets.only(left: 35, top: 25, right: 5, bottom: 3),
//     height: height,
//     width: width,
//     decoration: const BoxDecoration(
//       // color: AppColor.blueColor,
//       shape: BoxShape.rectangle,
//     ),
//     child: Center(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.  start,
//         children: [
//           InkWell(
//               onTap: (){
//                 Navigator.pop(context);
//               },
//               child: const Icon(Icons.arrow_back)),
//           SizedBox(width: width *0.2,),
//           const Text('My Pet',
//             style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 30,
//                 // fontWeight: FontWeight.bold
//             ),
//           ),
//       const Spacer(),
//     Padding(
//       padding: const EdgeInsets.only(right: 25 ),
//       child: InkWell(
//         onTap: (){
//             setState(() {
//               petDelete = !petDelete;
//             });
//         },
//         child: Card(
//           color: Colors.transparent,
//           shape: RoundedRectangleBorder( //<-- SEE HERE
//             borderRadius: BorderRadius.circular(40.0), //<-- SEE HERE
//           ),
//           elevation: 5,
//           child: Container(
//                   height: 50,
//                   width: 50,
//                   decoration:  BoxDecoration(
//                     color: AppColor.orange,
//                     borderRadius: const BorderRadius.all(Radius.circular(25)),
//                   ),
//                   child: Center(child:
//                   petDelete ? const Icon(Icons.close) :
//                   const Icon(Icons.delete)),
//                   ),
//         ),
//       ),
//     ),
//
//         ],
//       ),
//     ),
//   );
// }
//
//
// }
//
