import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Web Api/all_pet_screen_api.dart';
import '../Web_helper/list_pet_card.dart';


class UserPetBody extends StatefulWidget {
  const UserPetBody({super.key, required this.userId, required this.lostPet});
  final String userId;
  final bool lostPet;
  @override
  State<UserPetBody> createState() => _UserPetBodyState();
}

class _UserPetBodyState extends State<UserPetBody> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var width = size.width;
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      },),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: widget.lostPet ? AllPetScreenApi.userLostPet(widget.userId) : AllPetScreenApi.userFoundPet(widget.userId),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) return const Text('Some Error');
                  final data = snapshot.data?.docs;
                  if (data!.isNotEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10, width: 5,),
                         widget.lostPet ? const Text("Lost Pet",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            // color: Colors.blueAccent
                          ),
                        ) : const Text("Found Pet",
                           style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.bold,
                             // color: Colors.blueAccent
                           ),
                         ),
                        const SizedBox(height: 10,),
                        SizedBox(
                          height: 250,
                          width: 600,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              // shrinkWrap: true,
                              itemCount: snapshot.data?.docs.length,
                              itemBuilder: (context, index) {
                                dynamic val = snapshot.data?.docs[index];
                                // String url = val['profile_image_url'];
                                List<dynamic> urlList = val['image_url'];
                                String url = urlList.first.toString();
                                String documentID = val['docID'].toString();
                                return Padding(
                                    padding: const EdgeInsets.only(left: 10.0,
                                        bottom: 10.0),
                                    child: ListPetCard.userPetCard(
                                      context,
                                      width,
                                      url,
                                      val['pet_name'],
                                      val['pet_category'],
                                      val['description'],
                                      val['pet_gender'].toString(),
                                      val['pet_color'].toString(),
                                      val['pet_status'],
                                      val['review'],
                                      documentID,
                                    )
                                );
                              }
                          ),
                        ),
                      ],
                    );
                  }
                  else {
                    return const SizedBox();
                  }
                }
            ),
          ],
        ),
      ),
    );


  }
}
