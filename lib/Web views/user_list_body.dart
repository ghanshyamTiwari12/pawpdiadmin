import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:petfindernetwork/Web%20Api/all_user_screen_api.dart';
import 'package:provider/provider.dart';
import '../Web Api/appointment_function.dart';
import '../Web Api/web_search_provider.dart';
import '../Web_helper/user_card.dart';

class UserListBody extends StatefulWidget {
  const UserListBody({super.key});

  @override
  State<UserListBody> createState() => _UserListBodyState();
}


class _UserListBodyState extends State<UserListBody> {
  // bool _isSearching = false ;
  String _searchKeyword = '';
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    SearchProvider searchProvider = Provider.of<SearchProvider>(context);
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
                stream: AllUserScreenApi.getUser(),
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
                      width: 300 ,
                      child: Scrollbar(
                        thumbVisibility: true,
                        trackVisibility: true,
                        child: ListView.builder(
                            itemCount: snapshot.data?.docs.length,
                            controller: _scrollController,
                            itemBuilder: (context, index) {
                            dynamic val = snapshot.data?.docs[index];
                            String imageUrl = val['profile_image_url'].toString();
                            if(_searchKeyword.isEmpty){
                              return UserCard.userListCard(
                                  context,
                                  val['uid'],
                                  val['name'],
                                  val['address'],
                                  imageUrl,
                                      (){
                                        UserSelectionFunction.userSelectionProvider(val['uid'], val['name'], context);
                                  },
                                  email: val['email'],
                                  phone: val['phone']
                              );
                            }
                            else if((val['name'].toString().toLowerCase().contains(_searchKeyword.toLowerCase())
                                || (val['email'].toString().toLowerCase().contains(_searchKeyword.toLowerCase())))){
                              return UserCard.userListCard(
                                  context,
                                  val['uid'],
                                  val['name'],
                                  val['address'],
                                  imageUrl,
                                      (){
                                        UserSelectionFunction.userSelectionProvider(val['uid'], val['name'], context);
                                  },
                                  email: val['email'],
                                  phone: val['phone']
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
                  return const Center(
                    child: Text('No User found',
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
