import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Web Api/all_user_screen_api.dart';
import '../Web Api/appointment_function.dart';
import '../Web Api/web_search_provider.dart';
import '../Web_helper/list_professional_card.dart';
import '../Web_helper/text_hepler.dart';

class VerifiedProfessionalBody extends StatefulWidget {
   const VerifiedProfessionalBody({super.key,});

 @override
  State<VerifiedProfessionalBody> createState() => _VerifiedProfessionalBodyState();
}

class _VerifiedProfessionalBodyState extends State<VerifiedProfessionalBody> {
  // bool _isSearching = false ;
  String _searchKeyword = '';

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SearchProvider searchProvider = Provider.of<SearchProvider>(context);
    // _isSearching = searchProvider.isSearching;
    _searchKeyword = searchProvider.searchKeyword;
    final ScrollController _scrollController = ScrollController();

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      },),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
                StreamBuilder  (
                stream: AllUserScreenApi.verifiedProfessional(),
                builder: (BuildContext context,
                    snapshot)
                {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(color: Colors.black,));
                  }
                  if (snapshot.hasError) {
                    return const Text('Some Error');
                  }
                  final data = snapshot.data?.docs;
                  if(data!.isNotEmpty)
                  {
                    return SizedBox(
                      height: double.maxFinite,
                      width: 400 ,
                      child: Scrollbar(
                        thumbVisibility: true,
                        trackVisibility: true,
                        child: ListView.builder(
                            itemCount: snapshot.data?.docs.length,
                            controller: _scrollController,

                            itemBuilder: (context, index) {
                              var val = snapshot.data?.docs[index].data() as Map<String, dynamic>;
                              String imageUrl = val['profile_image_url'].toString();

                              if(_searchKeyword.isEmpty)
                              {
                                return    ProfessionalCard.verifiedProfessionalCard(
                                        context,
                                        () async {
                                          await UserSelectionFunction.providerCall(val['uid'], val['name'], context );
                                        },
                                        val['name'],
                                        val['professionalType'],
                                        val['address'],
                                        imageUrl,
                                        val['idImageUrl'].toString(),
                                        val['isIdVerified'],
                                        val['uid'],
                                        val['isIdRejected'],
                                        val['professionalImageUrl'] ,
                                        val['isDocVerified'] ,
                                        val['isDocRejected'] ,
                                        phone: val['phone'],
                                        email: val['email']
                                    );
                              }
                               else if((val['name'].toString().toLowerCase().contains(_searchKeyword.toLowerCase())
                              || (val['email'].toString().toLowerCase().contains(_searchKeyword.toLowerCase()))
                              || (val['professionalType']).toString().toLowerCase().contains(_searchKeyword.toLowerCase())
                              )
                              ){
                                return ProfessionalCard.verifiedProfessionalCard(
                                    context,
                                        () async {
                                      await UserSelectionFunction.providerCall(val['uid'], val['name'], context );
                                    },
                                    val['name'],
                                    val['professionalType'],
                                    val['address'],
                                    imageUrl,
                                    val['idImageUrl'].toString(),
                                    val['isIdVerified'],
                                    val['uid'],
                                    val['isIdRejected'],
                                    val['professionalImageUrl'] ,
                                    val['isDocVerified'] ,
                                    val['isDocRejected'] ,
                                    phone: val['phone'],
                                    email: val['email']
                                );
                              }
                              else{
                                return const SizedBox();
                              }
                            }
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: ShowText.detailsText("Verified Professional unavailable",
                      fontWeight: FontWeight.bold,
                        fontSize: 20,
                      color: Colors.blueAccent
                    ),
                  );
                }
            ),

          ],
        ),
      ),
    );
  }



}
