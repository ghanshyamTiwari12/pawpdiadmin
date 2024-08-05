
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petfindernetwork/Web%20views/professional_appointment_detail_screen.dart';
import 'package:petfindernetwork/Web%20views/unverified_pet_walker.dart';
import 'package:petfindernetwork/Web%20views/unverified_professional_body.dart';
import 'package:petfindernetwork/Web%20views/unverified_trainer_body.dart';
import 'package:petfindernetwork/Web%20views/unverified_vet_body.dart';
import 'package:petfindernetwork/Web%20views/user_detail_screen.dart';
import 'package:petfindernetwork/Web%20views/user_list_body.dart';
import 'package:petfindernetwork/Web%20views/verified_pet_walker_body.dart';
import 'package:petfindernetwork/Web%20views/verified_professional_body.dart';
import 'package:petfindernetwork/Web%20views/verified_trainer_body.dart';
import 'package:petfindernetwork/Web%20views/verified_vet_body.dart';
import 'package:provider/provider.dart';
import '../Web Api/appointment_function.dart';
import '../Web Api/user_selected_provider.dart';
import '../Web Api/web_search_provider.dart';
import '../Web_helper/card_button.dart';
import '../Web_helper/drawer_card.dart';
import '../Web_helper/text_hepler.dart';
import '../Web_helper/colors.dart';
import 'deleted_user_body.dart';

class AllUserScreen extends StatefulWidget {
  const AllUserScreen({super.key});
  static const String id = "AllUserScreen";

  @override
  State<AllUserScreen> createState() => _AllUserScreenState();
}



class _AllUserScreenState extends State<AllUserScreen> {
  String? selectedScreen = '';
  bool _isSearching = false;
  int? _selectedItem = 0;
  bool _isUserSelected = false;
 String _userID = "";
  String _userName = '';
  bool _isprofessionalSelected = false;
  String? _searchKeyword ;

  @override
  void initState(){
    super.initState();
    // Provider.of<UserSelected>(context, listen: false).selectedItem(0);
  }
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
    _searchKeyword = searchProvider.searchKeyword;

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
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:
            Row(

              children: [
                SizedBox(
                  // height: 400,
                  width: 200,
                  child:  ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                    },),
                    child: SingleChildScrollView(
                      child:
                      Column
                        (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                        SelectionCard.menuCard(context, Icons.account_circle, "Users", 1,
                            (){
                              // Provider.of<UserSelectionFunction>(context, listen: false).userSelectionFalse(context);
                              selectedScreen = "Users";
                              Provider.of<UserSelected>(context, listen: false).selectedItem(1);
                              Provider.of<SearchProvider>(context, listen: false).searching(false);
                              Provider.of<SearchProvider>(context, listen: false).searchKeyClear();
                              Provider.of<UserSelected>(context, listen: false).userSelected(false);
                              Provider.of<UserSelected>(context, listen: false).selectedUserId("0");
                              Provider.of<UserSelected>(context, listen: false).professionalSelected(false);
                            }
                        ),
                         SelectionCard.menuCard(context, Icons.account_circle, "Deleted Users",2,
                           (){
                         // Provider.of<UserSelectionFunction>(context, listen: false).userSelectionFalse(context);
                         selectedScreen = "Deleted Users";
                         Provider.of<UserSelected>(context, listen: false).selectedItem(2);
                         Provider.of<SearchProvider>(context, listen: false).searching(false);
                         Provider.of<SearchProvider>(context, listen: false).searchKeyClear();
                         Provider.of<UserSelected>(context, listen: false).userSelected(false);
                         Provider.of<UserSelected>(context, listen: false).selectedUserId("0");
                         Provider.of<UserSelected>(context, listen: false).professionalSelected(false);
                         }
                         ),
                          SelectionCard.menuCard(context, Icons.account_circle, "Verified Professional",3,
                                  (){
                                selectedScreen = "Verified Professional";
                                Provider.of<UserSelected>(context, listen: false).selectedItem(3);
                                Provider.of<SearchProvider>(context, listen: false).searching(false);
                                Provider.of<SearchProvider>(context, listen: false).searchKeyClear();

                                Provider.of<UserSelected>(context, listen: false).userSelected(false);
                                Provider.of<UserSelected>(context, listen: false).selectedUserId("0");
                                Provider.of<UserSelected>(context, listen: false).professionalSelected(false);
                              }
                          ),
                          SelectionCard.menuCard(context, Icons.account_circle, "Unverified Professional",4,
                                  (){
                                selectedScreen = "Unverified Professional";
                                Provider.of<UserSelected>(context, listen: false).selectedItem(4);
                                Provider.of<SearchProvider>(context, listen: false).searching(false);
                                Provider.of<SearchProvider>(context, listen: false).searchKeyClear();
                                Provider.of<UserSelected>(context, listen: false).userSelected(false);
                                Provider.of<UserSelected>(context, listen: false).selectedUserId("0");
                                Provider.of<UserSelected>(context, listen: false).professionalSelected(false);
                              }
                          ),

                          SelectionCard.menuCard(context, Icons.account_circle, "Unverified Veterinarian",5,
                                  (){
                                // Provider.of<UserSelectionFunction>(context, listen: false).userSelectionFalse(context);
                                selectedScreen = "Unverified Veterinarian";
                                Provider.of<UserSelected>(context, listen: false).selectedItem(5);
                                Provider.of<SearchProvider>(context, listen: false).searching(false);
                                Provider.of<SearchProvider>(context, listen: false).searchKeyClear();
                                Provider.of<UserSelected>(context, listen: false).userSelected(false);
                                Provider.of<UserSelected>(context, listen: false).selectedUserId("0");
                                Provider.of<UserSelected>(context, listen: false).professionalSelected(false);
                              }
                          ),

                          SelectionCard.menuCard(context, Icons.account_circle, "Verified Veterinarian",6,
                                  (){
                                // Provider.of<UserSelectionFunction>(context, listen: false).userSelectionFalse(context);
                                selectedScreen = "Verified Veterinarian";
                                Provider.of<UserSelected>(context, listen: false).selectedItem(6);
                                Provider.of<SearchProvider>(context, listen: false).searching(false);
                                Provider.of<SearchProvider>(context, listen: false).searchKeyClear();
                                Provider.of<UserSelected>(context, listen: false).userSelected(false);
                                Provider.of<UserSelected>(context, listen: false).selectedUserId("0");
                                Provider.of<UserSelected>(context, listen: false).professionalSelected(false);
                              }
                          ),

                          SelectionCard.menuCard(context, Icons.account_circle, "Unverified Trainer",7,
                                  (){
                                // Provider.of<UserSelectionFunction>(context, listen: false).userSelectionFalse(context);
                                selectedScreen = "Unverified Trainer";
                                Provider.of<UserSelected>(context, listen: false).selectedItem(7);
                                Provider.of<SearchProvider>(context, listen: false).searching(false);
                                Provider.of<SearchProvider>(context, listen: false).searchKeyClear();
                                Provider.of<UserSelected>(context, listen: false).userSelected(false);
                                Provider.of<UserSelected>(context, listen: false).selectedUserId("0");
                                Provider.of<UserSelected>(context, listen: false).professionalSelected(false);
                              }
                          ),
                          SelectionCard.menuCard(context, Icons.account_circle, "Verified Trainer",8,
                                  (){
                                // Provider.of<UserSelectionFunction>(context, listen: false).userSelectionFalse(context);
                                selectedScreen = "Verified Trainer";
                                Provider.of<UserSelected>(context, listen: false).selectedItem(8);
                                Provider.of<UserSelected>(context, listen: false).userSelected(false);
                                Provider.of<SearchProvider>(context, listen: false).searchKeyClear();
                                Provider.of<SearchProvider>(context, listen: false).searching(false);
                                Provider.of<UserSelected>(context, listen: false).professionalSelected(false);
                              }


                          ),
                          SelectionCard.menuCard(context, Icons.account_circle, "Unverified Pet Walker",9,
                                  (){
                                // Provider.of<UserSelectionFunction>(context, listen: false).userSelectionFalse(context);
                                selectedScreen = "Unverified Pet Walker";
                                Provider.of<UserSelected>(context, listen: false).selectedItem(9);
                                Provider.of<SearchProvider>(context, listen: false).searching(false);
                                Provider.of<SearchProvider>(context, listen: false).searchKeyClear();
                                Provider.of<UserSelected>(context, listen: false).userSelected(false);
                                Provider.of<UserSelected>(context, listen: false).selectedUserId("0");
                                Provider.of<UserSelected>(context, listen: false).professionalSelected(false);
                              }
                          ),
                          SelectionCard.menuCard(context, Icons.account_circle, "Verified Pet Walker",10,
                                  (){
                                // Provider.of<UserSelectionFunction>(context, listen: false).userSelectionFalse(context);
                                selectedScreen = "Verified Pet Walker";
                                Provider.of<UserSelected>(context, listen: false).selectedItem(10);
                                Provider.of<SearchProvider>(context, listen: false).searching(false);
                                Provider.of<SearchProvider>(context, listen: false).searchKeyClear();
                                Provider.of<UserSelected>(context, listen: false).userSelected(false);
                                Provider.of<UserSelected>(context, listen: false).selectedUserId("0");
                                Provider.of<UserSelected>(context, listen: false).professionalSelected(false);
                              }
                          ),
                          SelectionCard.menuCard(context, Icons.account_circle, "Unverified Groomer",11,
                                  (){
                                // Provider.of<UserSelectionFunction>(context, listen: false).userSelectionFalse(context);
                                selectedScreen = "Unverified Groomer";
                                Provider.of<UserSelected>(context, listen: false).selectedItem(11);
                                Provider.of<SearchProvider>(context, listen: false).searching(false);
                                Provider.of<SearchProvider>(context, listen: false).searchKeyClear();
                                Provider.of<UserSelected>(context, listen: false).userSelected(false);
                                Provider.of<UserSelected>(context, listen: false).selectedUserId("0");
                                Provider.of<UserSelected>(context, listen: false).professionalSelected(false);
                              }
                          ),
                          SelectionCard.menuCard(context, Icons.account_circle, "Verified Groomer",12,
                                  (){
                                // Provider.of<UserSelectionFunction>(context, listen: false).userSelectionFalse(context);
                                selectedScreen = "Verified Groomer";
                                Provider.of<UserSelected>(context, listen: false).selectedItem(12);
                                Provider.of<SearchProvider>(context, listen: false).searching(false);
                                Provider.of<SearchProvider>(context, listen: false).searchKeyClear();
                                Provider.of<UserSelected>(context, listen: false).userSelected(false);
                                Provider.of<UserSelected>(context, listen: false).selectedUserId("0");
                                Provider.of<UserSelected>(context, listen: false).professionalSelected(false);
                              }
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5,),
                userSelectedScreen(context, _selectedItem ?? 0 ),
                const SizedBox(width: 5,),
                _isUserSelected ? UserDetailsScreen(userID: _userID,) : const SizedBox(),
                _isprofessionalSelected ? ProfessionalDetailScreen(userID: _userID) : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget userSelectedScreen(context, int selectedIndex) {
    switch(selectedIndex){
      case 1:
        return const UserListBody();
      case 2:
        return const DeletedUserBody();
      case 3:
        return const VerifiedProfessionalBody();
      case 4:
        return const UnverifiedProfessionalBody();
      case 5:
        return const UnVerifiedVetBody();
      case 6:
        return const VerifiedVetBody();
      case 7:
        return const UnVerifiedTrainerBody();
      case 8:
        return const VerifiedTrainerBody();
      case 9:
        return const UnverifiedPetWalkerBody(professionalType: 'Pet Walker',);
      case 10:
        return const VerifiedPetWalkerBody(professionalType: 'Pet Walker',);
      case 11:
        return const UnverifiedPetWalkerBody(professionalType: 'Groomer',);
      case 12:
        return const VerifiedPetWalkerBody(professionalType: 'Groomer',);
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
                  "All User",
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
            ) : const SizedBox(width: 0,),
            SizedBox(width: MediaQuery.sizeOf(context).width * 0.13,),
            _isUserSelected ? ShowText.detailsText(
                "                   $_userName",
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ) : const SizedBox(width: 0,),
            _isprofessionalSelected ? ShowText.detailsText(
                _userName,
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ) : const SizedBox(width: 0,),
            const Spacer(),
            _isSearching ?
            Container(
              height: 40,
              width: 220,
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
