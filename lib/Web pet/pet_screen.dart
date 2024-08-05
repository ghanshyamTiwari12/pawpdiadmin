
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petfindernetwork/Web%20pet/unverified_found_pet_body.dart';
import 'package:petfindernetwork/Web%20pet/unverified_lost_pet_body.dart';
import 'package:petfindernetwork/Web%20pet/verified_found_pet_body.dart';
import 'package:petfindernetwork/Web%20pet/verified_lost_pet_body.dart';
import 'package:provider/provider.dart';
import '../Web Api/appointment_function.dart';
import '../Web Api/user_selected_provider.dart';
import '../Web Api/web_search_provider.dart';
import '../Web_helper/card_button.dart';
import '../Web_helper/drawer_card.dart';
import '../Web_helper/text_hepler.dart';
import '../Web_helper/colors.dart';

class PetScreen extends StatefulWidget {
  const PetScreen({super.key});
  @override
  State<PetScreen> createState() => _PetScreenState();
}


class _PetScreenState extends State<PetScreen> {
  String? selectedScreen = '';
  bool _isSearching = false;
  // String? _searchKeyword ;
  int? _selectedItem = 0;
  bool _isUserSelected = false;
  String _userID = '';
  String _userName = '';
  bool _isprofessionalSelected = false;

  @override
  Widget build(BuildContext context) {
    SearchProvider searchProvider = Provider.of<SearchProvider>(context);
    _isSearching = searchProvider.isSearching;
    UserSelected userSelected = Provider.of<UserSelected>(context);
    _isUserSelected = userSelected.isUserSelected;
    _userID = userSelected.userID;
    _userName = userSelected.userName;
    _isprofessionalSelected = userSelected.isProfessionalSelected;
    _selectedItem = userSelected.selectedIndex;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
      AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        flexibleSpace: appBar() ,
        backgroundColor: AppColor.orange,
      ),
      body: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 5, ),
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
                    SelectionCard.menuCard(context, Icons.pets, "Unverified Lost Pet", 1,
                            (){
                          // Provider.of<UserSelectionFunction>(context, listen: false).userSelectionFalse(context);
                          selectedScreen = "Unverified Lost Pet";
                          Provider.of<UserSelected>(context, listen: false).selectedItem(1);
                          Provider.of<SearchProvider>(context, listen: false).searching(false);
                          Provider.of<SearchProvider>(context, listen: false).searchKeyClear();
                        }
                    ),
                    SelectionCard.menuCard(context, Icons.pets, "Verified Lost Pet", 2,
                            (){
                          // Provider.of<UserSelectionFunction>(context, listen: false).userSelectionFalse(context);
                          selectedScreen = "Verified Lost Pet";
                          Provider.of<UserSelected>(context, listen: false).selectedItem(2);
                          Provider.of<SearchProvider>(context, listen: false).searching(false);
                          Provider.of<SearchProvider>(context, listen: false).searchKeyClear();
                        }
                    ),
                    SelectionCard.menuCard(context, Icons.pets, "Unverified Found Pet", 3,
                            (){
                          // Provider.of<UserSelectionFunction>(context, listen: false).userSelectionFalse(context);
                          selectedScreen = "Unverified Found Pet";
                          Provider.of<UserSelected>(context, listen: false).selectedItem(3);
                          Provider.of<SearchProvider>(context, listen: false).searching(false);
                          Provider.of<SearchProvider>(context, listen: false).searchKeyClear();
                        }
                    ),
                    // InkWell(
                    //     onTap: (){
                    //       setState(() {
                    //         selectedScreen = "Unverified Found Pet";
                    //         selectedItem = 3;
                    //       });
                    //     },
                    //     child: const MenuCard(icon: Icons.account_circle, text: "Unverified Found Pet",)),

                    SelectionCard.menuCard(context, Icons.pets, "Verified Found Pet", 4,
                            (){
                          // Provider.of<UserSelectionFunction>(context, listen: false).userSelectionFalse(context);
                          selectedScreen = "Verified Found Pet";
                          Provider.of<UserSelected>(context, listen: false).selectedItem(4);
                          Provider.of<SearchProvider>(context, listen: false).searching(false);
                          Provider.of<SearchProvider>(context, listen: false).searchKeyClear();
                        }
                    ),
                    // InkWell(
                    //     onTap: (){
                    //       setState(() {
                    //         selectedScreen = "Verified Found Pet";
                    //         selectedItem = 4;
                    //       });
                    //
                    //     },
                    //     child: const MenuCard(icon: Icons.account_circle, text: "Verified Found Pet",)),
                  ],
                ),
              ),
              const SizedBox(width: 5,),
              petSelectedScreen(context, _selectedItem ?? 0 ),

            ],
          ),
        ),
      ),
    );
  }

  Widget petSelectedScreen(context, int selectedItem) {
    switch(selectedItem){
      case 1:
        return const UnverifiedLostPetBody();
      case 2:
        return const VerifiedLostPetBody();
      case 3:
        return const UnVerifiedFoundPetBody();
      case 4:
        return const VerifiedFoundPet();
      default:
        return const SizedBox();
    }
  }

  Widget appBar(){
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: SizedBox(
        // height: 200 ,
          width: MediaQuery.sizeOf(context).width,

          child: Row(
            children: [
              Center(
                child: ShowText.detailsText(
                    "Pet Screen",
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
                    hintText: 'Enter Name, Email or Profession',
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
