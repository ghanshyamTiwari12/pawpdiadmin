
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Web Api/all_user_screen_api.dart';
import '../Web Api/web_search_provider.dart';
import '../Web_helper/user_card.dart';

class DeletedUserBody extends StatefulWidget {
  const DeletedUserBody({super.key});

  @override
  State<DeletedUserBody> createState() => _DeletedUserBodyState();
}

class _DeletedUserBodyState extends State<DeletedUserBody> {
  String _searchKeyword = '';

  @override
  Widget build(BuildContext context) {
    SearchProvider searchProvider = Provider.of<SearchProvider>(context);
    final ScrollController _scrollController = ScrollController();

    _searchKeyword = searchProvider.searchKeyword;
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
                stream: AllUserScreenApi.deletedUser(),
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
                      width: 400 ,
                      child: Scrollbar(
                        thumbVisibility: true,
                        trackVisibility: true,
                        child: ListView.builder(
                            itemCount: snapshot.data?.docs.length,
                            controller: _scrollController,
                            itemBuilder: (context, index) {
                              dynamic val = snapshot.data?.docs[index];
                              if(_searchKeyword.isEmpty){
                                return UserCard.deletedUserCard(
                                    val['name'],
                                    val['address'],
                                    val['reason'],
                                    email: val['email'],
                                    phone: val['phone']
                                );
                              }
                              else if((val['name'].toString().toLowerCase().contains(_searchKeyword.toLowerCase())
                                  || (val['email'].toString().toLowerCase().contains(_searchKeyword.toLowerCase())))){
                                return UserCard.deletedUserCard(
                                    val['name'],
                                    val['address'],
                                    val['reason'],
                                    email: val['email'],
                                    phone: val['phone']
                                );
                              } else{
                                return const SizedBox();
                              }

                            }
                        ),
                      ),
                    );
                  }
                  return const Center(
                    child: Text('No Deleted User found',
                        style: TextStyle(
                            fontSize: 20
                        )
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
