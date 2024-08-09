import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:petfindernetwork/Web%20views/UnverifyUser.dart';
import 'package:provider/provider.dart';

import '../Web Api/all_user_screen_api.dart';
import '../Web Api/web_search_provider.dart';
import '../Web_helper/list_professional_card.dart';
import '../Web_helper/text_hepler.dart';

class UnVerifiedVetBody extends StatefulWidget {
  const UnVerifiedVetBody({super.key});

  @override
  State<UnVerifiedVetBody> createState() => _UnVerifiedVetBodyState();
}

class _UnVerifiedVetBodyState extends State<UnVerifiedVetBody> {
  String _searchKeyword = '';
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    SearchProvider searchProvider = Provider.of<SearchProvider>(context);
    _searchKeyword = searchProvider.searchKeyword;
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
                stream: AllUserScreenApi.unVerifiedVet(),
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
                      width: 400,
                      child: Scrollbar(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const UnverifyUser()));
                          },
                          child: ListView.builder(
                              itemCount: snapshot.data?.docs.length,
                              controller: _scrollController,
                              itemBuilder: (context, index) {
                                dynamic val = snapshot.data?.docs[index];
                                String imageUrl =
                                    val['profile_image_url'].toString();

                                if (_searchKeyword.isEmpty) {
                                  return ProfessionalCard
                                      .unVerifiedProfessionalCard(
                                    context,
                                    val['name'],
                                    val['professionalType'],
                                    val['address'],
                                    imageUrl,
                                    val['isIdVerified'],
                                    val['uid'],
                                    val['isIdRejected'],
                                    val['isDocVerified'],
                                    val['isDocRejected'],
                                    val['isProfessionalVerified'],
                                    phone: val['phone'],
                                    email: val['email'],
                                    idImageUrl: val['idImageUrl'] ?? '',
                                    professionalImageUrl:
                                        val['professionalImageUrl'] ?? '',
                                  );
                                } else if ((val['name']
                                        .toString()
                                        .toLowerCase()
                                        .contains(
                                            _searchKeyword.toLowerCase()) ||
                                    (val['email']
                                        .toString()
                                        .toLowerCase()
                                        .contains(
                                            _searchKeyword.toLowerCase())) ||
                                    (val['professionalType'])
                                        .toString()
                                        .toLowerCase()
                                        .contains(
                                            _searchKeyword.toLowerCase()))) {
                                  return ProfessionalCard
                                      .unVerifiedProfessionalCard(
                                    context,
                                    val['name'],
                                    val['professionalType'],
                                    val['address'],
                                    imageUrl,
                                    val['isIdVerified'],
                                    val['uid'],
                                    val['isIdRejected'],
                                    val['isDocVerified'],
                                    val['isDocRejected'],
                                    val['isProfessionalVerified'],
                                    phone: val['phone'],
                                    email: val['email'],
                                    idImageUrl: val['idImageUrl'] ?? '',
                                    professionalImageUrl:
                                        val['professionalImageUrl'] ?? '',
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              }),
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: ShowText.detailsText(
                        "UnVerified Veterinarian unavailable",
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
