
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Web Api/all_pet_screen_api.dart';
import '../Web Api/web_search_provider.dart';
import '../Web_helper/list_pet_card.dart';
import '../Web_helper/text_hepler.dart';

class UnVerifiedFoundPetBody extends StatefulWidget {
  const UnVerifiedFoundPetBody({super.key});

  @override
  State<UnVerifiedFoundPetBody> createState() => _UnVerifiedFoundPetBodyState();
}

class _UnVerifiedFoundPetBodyState extends State<UnVerifiedFoundPetBody> {
  String _searchKeyword = '';
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    SearchProvider searchProvider = Provider.of<SearchProvider>(context);
    _searchKeyword = searchProvider.searchKeyword;

    final size = MediaQuery.of(context).size;
    var width = size.width;
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      },),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StreamBuilder(
                stream: AllPetScreenApi.unVerifiedFoundPet(),
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
                  if(data!.length > 0)
                  {
                    return SizedBox(
                      height: double.maxFinite,
                      width: 550 ,
                      child: Scrollbar(
                        child: ListView.builder(
                            itemCount: snapshot.data?.docs.length,
                            controller: _scrollController,
                            itemBuilder: (context, index) {
                              dynamic val = snapshot.data?.docs[index];
                              List<dynamic> urlList = val['image_url'];
                              String url = urlList.first.toString();
                              String documentID = val['docID'].toString();
                              if(_searchKeyword.isEmpty){
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

                              } else if((val['pet_name'].toString().toLowerCase().contains(_searchKeyword.toLowerCase()))
                                          || (val['pet_color'].toString().toLowerCase().contains(_searchKeyword.toLowerCase()))
                                          || (val['pet_category'].toString().toLowerCase().contains(_searchKeyword.toLowerCase()))
                                          ){
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
                              }
                              else {
                                return const SizedBox();
                              }
                            }
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: ShowText.detailsText("Verified Found Pet unavailable",
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
