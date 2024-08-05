
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Web Api/appointment_function.dart';
import '../Web Api/user_selected_provider.dart';
import '../Web Api/web_search_provider.dart';
import '../Web pet/unverified_found_pet_body.dart';
import '../Web pet/verified_found_pet_body.dart';
import '../Web_helper/card_button.dart';
import '../Web_helper/drawer_card.dart';
import '../Web_helper/text_hepler.dart';
import '../Web_helper/colors.dart';

class FoundPetScreen extends StatefulWidget {
  const FoundPetScreen({super.key});

  @override
  State<FoundPetScreen> createState() => _FoundPetScreenState();
}

class _FoundPetScreenState extends State<FoundPetScreen> {
  String? selectedScreen = '';
  String? _searchKeyword ;
  int? _selectedItem = 0;
  bool _isSearching = false;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState(){
    // Provider.of<UserSelected>(context, listen: false).selectedItem(0);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    UserSelected userSelected = Provider.of<UserSelected>(context);
    SearchProvider searchProvider = Provider.of<SearchProvider>(context);
    _searchKeyword = searchProvider.searchKeyword;
    _isSearching = searchProvider.isSearching;
    _selectedItem = userSelected.selectedIndex;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
      AppBar(
        // automaticallyImplyLeading: false,
        toolbarHeight: 80,
        flexibleSpace: appBar() ,
        backgroundColor: AppColor.orange,
      ),
      body: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 5, ),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  // height: 400,
                  width: 200,
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      SelectionCard.menuCard(context, Icons.pets, "Verified Found Pet", 1,
                              (){
                            // Provider.of<UserSelectionFunction>(context, listen: false).userSelectionFalse(context);
                            selectedScreen = "Verified Found Pet";
                            Provider.of<UserSelected>(context, listen: false).selectedItem(1);
                            Provider.of<SearchProvider>(context, listen: false).searching(false);
                            Provider.of<SearchProvider>(context, listen: false).searchKeyClear();

                              }
                      ),
                      SelectionCard.menuCard(context, Icons.pets, "Unverified Found Pet", 2,
                              (){
                            // Provider.of<UserSelectionFunction>(context, listen: false).userSelectionFalse(context);
                            selectedScreen = "Unverified Found Pet";
                            Provider.of<UserSelected>(context, listen: false).selectedItem(2);
                            Provider.of<SearchProvider>(context, listen: false).searching(false);
                            Provider.of<SearchProvider>(context, listen: false).searchKeyClear();
                          }
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5,),
                foundPetSelectedScreen(context, _selectedItem ?? 0 ),
              ],
            ),
          ),
        ),
      ),
    );

  }

  Widget foundPetSelectedScreen(context, int selectedScreen) {
    switch(selectedScreen){
      case 1:
        return const VerifiedFoundPet();
      case 2:
        return const UnVerifiedFoundPetBody();
      default:
        return const SizedBox();
    }
  }

  Widget appBar(){

    return Padding(
      padding: const EdgeInsets.only(left: 50.0),
      child: SizedBox(
        // height: 200 ,
          width: MediaQuery.sizeOf(context).width,

          child: Row(

            children: [
              Center(
                child: ShowText.detailsText(
                    "Found Pet",
                    // color: AppColor.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(width: MediaQuery.sizeOf(context).width * 0.20,),
              selectedScreen!.isNotEmpty ? ShowText.detailsText(
                  selectedScreen!,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ) : const SizedBox(),

              const Spacer(),
              _isSearching ?
              Container(
                height: 40,
                width: 300,
                decoration: const BoxDecoration(
                    color: Colors.white
                ),
                child: TextField
                  (
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: 'Enter Name, Category or color',
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                      color: Colors.black
                  ),
                  onChanged:(val){
                    Provider.of<SearchProvider>(context, listen: false).searchValueKeyword(val);
                  },
                ),
              ): const SizedBox(),

              const Spacer(),
              selectedScreen!.isNotEmpty ? actionSearchButton() : const SizedBox(),


            ],
          )
      ),
    );
  }

  actionSearchButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          InkWell(
              onTap:()  {
                Provider.of<SearchProvider>(context, listen: false).searching(!_isSearching);
                if(_isSearching == true){
                  Provider.of<SearchProvider>(context, listen: false).searchKeyClear();

                }
                else{
                  Provider.of<UserSelectionFunction>(context, listen: false).userSelectionFalse(context);
                }
              },
              child: _isSearching ? CardButton(icons: CupertinoIcons.clear_circled_solid, color: AppColor.orange)
                  : CardButton(icons: Icons.search, color: AppColor.orange)
          ),
          const Text("Search",
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ],
      ),
    );
  }

}
