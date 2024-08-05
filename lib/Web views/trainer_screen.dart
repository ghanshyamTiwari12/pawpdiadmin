import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petfindernetwork/Web%20views/professional_appointment_detail_screen.dart';
import 'package:petfindernetwork/Web%20views/unverified_trainer_body.dart';
import 'package:petfindernetwork/Web%20views/verified_trainer_body.dart';
import 'package:provider/provider.dart';
import '../Web Api/appointment_function.dart';
import '../Web Api/user_selected_provider.dart';
import '../Web Api/web_search_provider.dart';
import '../Web_helper/card_button.dart';
import '../Web_helper/drawer_card.dart';
import '../Web_helper/text_hepler.dart';
import '../Web_helper/colors.dart';

class TrainerScreen extends StatefulWidget {
  const TrainerScreen({super.key});
  @override
  State<TrainerScreen> createState() => _TrainerScreenState();
}

class _TrainerScreenState extends State<TrainerScreen> {
  String? selectedScreen = '';
  bool _isSearching = false;
  String? _searchKeyword ;
  int? _selectedItem = 0;
  String _userID = '';
  String _userName = '';
  bool _isprofessionalSelected = false;
  @override
  void initState(){
    // Provider.of<UserSelected>(context, listen: false).professionalSelected(false);
    // Provider.of<UserSelected>(context, listen: false).selectedItem(0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SearchProvider searchProvider = Provider.of<SearchProvider>(context);
    _searchKeyword = searchProvider.searchKeyword;
    _isSearching = searchProvider.isSearching;
    UserSelected userSelected = Provider.of<UserSelected>(context);
    _userID = userSelected.userID;
    _userName = userSelected.userName;
    _isprofessionalSelected = userSelected.isProfessionalSelected;
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

                    SelectionCard.menuCard(context, Icons.account_circle, "Verified Trainer",1,
                            (){
                          selectedScreen = "Verified Trainer";
                          Provider.of<UserSelected>(context, listen: false).selectedItem(1);
                          Provider.of<SearchProvider>(context, listen: false).searching(false);
                          Provider.of<SearchProvider>(context, listen: false).searchKeyClear();
                          Provider.of<UserSelected>(context, listen: false).userSelected(false);
                          Provider.of<UserSelected>(context, listen: false).selectedUserId("0");
                          Provider.of<UserSelected>(context, listen: false).professionalSelected(false);
                        }
                    ),
                    SelectionCard.menuCard(context, Icons.account_circle, "Unverified Trainer",2,
                            (){
                          selectedScreen = "Unverified Trainer";
                          Provider.of<UserSelected>(context, listen: false).selectedItem(2);
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
              const SizedBox(width: 5,),
              trainerSelectedScreen(context, _selectedItem ?? 0 ),
              _isprofessionalSelected ? ProfessionalDetailScreen(userID: _userID) : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }



  Widget trainerSelectedScreen(context, int selectedScreen) {
    switch(selectedScreen){
      case 1:
        return const VerifiedTrainerBody();
      case 2:
        return const UnVerifiedTrainerBody();
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
                    "Trainer",
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

              SizedBox(width: MediaQuery.sizeOf(context).width * 0.13,),
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
;
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
