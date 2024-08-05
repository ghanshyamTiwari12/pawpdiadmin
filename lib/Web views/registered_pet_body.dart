import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petfindernetwork/Web_helper/list_pet_card.dart';
import '../Web Api/registered_pet_api.dart';

class RegisteredPetBody extends StatefulWidget {
  const RegisteredPetBody({super.key, required this.userId});
 final String userId;

  @override
  State<RegisteredPetBody> createState() => _RegisteredPetBodyState();
}

class _RegisteredPetBodyState extends State<RegisteredPetBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        StreamBuilder<QuerySnapshot>(
                stream: RegisteredPetApi.registeredPet(widget.userId),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasError) return const Text('Some Error');
                  final data = snapshot.data?.docs;
                  if (data!.isNotEmpty) {
                    return Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10, width: 5,),
                        const Text("Registered Pet",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          // color: Colors.blueAccent
                        ),
                        ),
                        const SizedBox(height: 10,),
                        ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                  },),
                          child: SizedBox(
                            height: 160,
                            width: 600,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                // shrinkWrap: true,
                                itemCount: snapshot.data?.docs.length,
                                itemBuilder: (context, index) {
                                  dynamic val = snapshot.data?.docs[index];
                                  String url = val['profile_image_url'];
                                  return Padding(
                                      padding: const EdgeInsets.only(left: 20.0,
                                          right: 20.0, bottom: 10.0),
                                      child: ListPetCard.registeredPetCard(
                                          300,
                                          url,
                                          val['pet_name'],
                                          val['pet_category'],
                                          val['pet_breed'],
                                          val['pet_gender'],
                                          val['dob']
                                      )
                                  );
                                }
                            ),
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
    );
  }
}