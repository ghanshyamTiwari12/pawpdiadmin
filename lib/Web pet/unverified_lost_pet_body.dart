import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:petfindernetwork/Web%20views/UnverifyUser.dart';
import 'package:provider/provider.dart';
import '../Web Api/all_pet_screen_api.dart';
import '../Web Api/web_search_provider.dart';
import '../Web_helper/list_pet_card.dart';
import '../Web_helper/text_hepler.dart';

class UnverifiedLostPetBody extends StatefulWidget {
  const UnverifiedLostPetBody({super.key});

  @override
  State<UnverifiedLostPetBody> createState() => _UnverifiedLostPetBodyState();
}

class _UnverifiedLostPetBodyState extends State<UnverifiedLostPetBody> {
  String _searchKeyword = '';
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    SearchProvider searchProvider = Provider.of<SearchProvider>(context);
    _searchKeyword = searchProvider.searchKeyword;

    final size = MediaQuery.of(context).size;
    var width = size.width;
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StreamBuilder(
                stream: AllPetScreenApi.unVerifiedLostPet(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.black,
                    ));
                  }
                  if (snapshot.hasError) {
                    return const Text('Some Error');
                  }
                  final data = snapshot.data?.docs;
                  if (data!.length > 0) {
                    return SizedBox(
                      height: double.maxFinite,
                      width: 550,
                      child: Scrollbar(
                        child: ListView.builder(
                            itemCount: snapshot.data?.docs.length,
                            controller: _scrollController,
                            itemBuilder: (context, index) {
                              dynamic val = snapshot.data?.docs[index];
                              List<dynamic> urlList = val['image_url'];
                              String url = urlList.first.toString();
                              String documentID = val['docID'].toString();
                              if (_searchKeyword.isEmpty) {
                                return GestureDetector(
                                  onTap: () {
                                    //  Navigator.push(
                                    //         context,
                                    //         MaterialPageRoute(
                                    //             builder: (_) => UnverifyUser(
                                    //                   name: val['name'],
                                    //                   professionalType:
                                    //                       val['professionalType'],
                                    //                   address: val['address'],
                                    //                   idImageUrl: imageUrl,
                                    //                   isIdVerified:
                                    //                       val['isIdVerified'],
                                    //                   uid: val['uid'],
                                    //                   isIdRejected:
                                    //                       val['isIdRejected'],
                                    //                   phone: val['phone'],
                                    //                   email: val['email'],
                                    //                 )));
                                  },
                                  child: ListPetCard.petCard(
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
                                  ),
                                );
                              } else if ((val['pet_name']
                                      .toString()
                                      .toLowerCase()
                                      .contains(
                                          _searchKeyword.toLowerCase())) ||
                                  (val['pet_color']
                                      .toString()
                                      .toLowerCase()
                                      .contains(
                                          _searchKeyword.toLowerCase())) ||
                                  (val['pet_category']
                                      .toString()
                                      .toLowerCase()
                                      .contains(
                                          _searchKeyword.toLowerCase()))) {
                                return ListPetCard.petCard(
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
                                );
                              } else {
                                return const SizedBox();
                              }
                            }),
                      ),
                    );
                  }
                  return Center(
                    child: ShowText.detailsText(
                        "UnVerified Lost Pet unavailable",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blueAccent),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
