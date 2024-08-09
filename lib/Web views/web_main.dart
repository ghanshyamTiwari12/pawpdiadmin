import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:petfindernetwork/Web%20pet/unverified_found_pet_body.dart';
import 'package:petfindernetwork/Web%20pet/unverified_lost_pet_body.dart';
import 'package:petfindernetwork/Web%20views/all_users.dart';
import 'package:petfindernetwork/Web%20views/found_pet_screen.dart';
import 'package:petfindernetwork/Web%20views/lost_pet_screen.dart';
import 'package:petfindernetwork/Web%20views/pet_walker_screen.dart';
import 'package:petfindernetwork/Web%20views/professional_screen.dart';
import 'package:petfindernetwork/Web%20views/trainer_screen.dart';
import 'package:petfindernetwork/Web%20views/unverified_pet_walker.dart';
import 'package:petfindernetwork/Web%20views/unverified_professional_body.dart';
import 'package:petfindernetwork/Web%20views/unverified_trainer_body.dart';
import 'package:petfindernetwork/Web%20views/unverified_vet_body.dart';
import 'package:petfindernetwork/Web%20views/user_list_body.dart';
import 'package:petfindernetwork/Web%20views/vet_screen.dart';
import 'package:petfindernetwork/Web_helper/dashboard_card_two.dart';
import 'package:petfindernetwork/Web_helper/colors.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../Web Api/dashboard_screen_api.dart';
import '../Web Api/user_selected_provider.dart';
import '../Web Api/web_search_provider.dart';
import '../Web pet/pet_screen.dart';
import '../Web_helper/dashboard_card_one.dart';
import '../Web_helper/drawer_card.dart';
import '../Web_helper/text_hepler.dart';
import '../Web_login/web_login.dart';
import '../Web_helper/loginsignupRepo.dart';

class WebDashboardScreen extends StatefulWidget {
  const WebDashboardScreen({super.key});
  static const String id = "webmain";

  @override
  State<WebDashboardScreen> createState() => _WebDashboardScreenState();
}

class _WebDashboardScreenState extends State<WebDashboardScreen> {
  int totalUser = 0;
  int totalprofessional = 0;
  int deletedUsers = 0;
  int totalLostpet = 0;
  int totalFoundpet = 0;
  int verifiedProfessional = 0;
  int allVet = 0;
  int allTrainer = 0;
  int allPetWalker = 0;
  int allGroomer = 0;
  int verifiedVet = 0;
  int verifiedTrainer = 0;
  int verifiedPetWalker = 0;
  int verifiedGroomer = 0;
  int verifiedLostPet = 0;
  int veriredFoundPet = 0;
  String? selectedScreen = '';
  String? unverifyselectedScreen = 'Veterinarian';

  @override
  void initState() {
    // Provider.of<UserSelected>(context, listen: false).selectedItem(0);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          Provider.of<DashboardScreenApi>(context, listen: false).allUser();
          Provider.of<DashboardScreenApi>(context, listen: false)
              .allProfessional();
          Provider.of<DashboardScreenApi>(context, listen: false).delUsers();
          Provider.of<DashboardScreenApi>(context, listen: false).allLostPet();
          Provider.of<DashboardScreenApi>(context, listen: false)
              .allFoundtPet();
          Provider.of<DashboardScreenApi>(context, listen: false)
              .reviewedProfessional();
          Provider.of<DashboardScreenApi>(context, listen: false).allVet();
          Provider.of<DashboardScreenApi>(context, listen: false).allTrainer();
          Provider.of<DashboardScreenApi>(context, listen: false)
              .allPetWalker();
          Provider.of<DashboardScreenApi>(context, listen: false).allGroomer();
          Provider.of<DashboardScreenApi>(context, listen: false)
              .totalVerifiedVet();
          Provider.of<DashboardScreenApi>(context, listen: false)
              .totalVerifiedTrainer();
          Provider.of<DashboardScreenApi>(context, listen: false)
              .totalVerifiedPetWalker();
          Provider.of<DashboardScreenApi>(context, listen: false)
              .totalVerifiedGroomer();
          Provider.of<DashboardScreenApi>(context, listen: false)
              .reviewedLostPet();
          Provider.of<DashboardScreenApi>(context, listen: false)
              .reviewedFoundtPet();
        }
      });
    });
    super.initState();
  }

  int? _selectedItem = 0;
  //String unverifyTittle ='Veterinarian';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var width = size.width;
    DashboardScreenApi dashboardProvider =
        Provider.of<DashboardScreenApi>(context);
    totalUser = dashboardProvider.totalUsers;
    totalprofessional = dashboardProvider.totalProfessional;
    deletedUsers = dashboardProvider.deletedUsers;
    totalLostpet = dashboardProvider.totalLostPet;
    totalFoundpet = dashboardProvider.totalFoundtPet;
    verifiedProfessional = dashboardProvider.verifiedProfessional;
    allVet = dashboardProvider.totalVet;
    allTrainer = dashboardProvider.totalTrainer;
    allPetWalker = dashboardProvider.totalPetWalker;
    allGroomer = dashboardProvider.totalGroomer;
    verifiedVet = dashboardProvider.verifiedVet;
    verifiedTrainer = dashboardProvider.verifiedTrainer;
    verifiedPetWalker = dashboardProvider.verifiedPetWalker;
    verifiedGroomer = dashboardProvider.verifiedGroomer;
    verifiedLostPet = dashboardProvider.verifiedLostPet;
    veriredFoundPet = dashboardProvider.verifiedFoundtPet;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: ShowText.detailsText("DASHBOARD", fontWeight: FontWeight.bold),
          backgroundColor: AppColor.orange,
        ),
        drawer: Drawer(
          // width: MediaQuery.of(context).size.width / 1.6,
          // color: AppColor.whiteColor,
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Image.asset(
                  "assets/images/Pawpdi.png",
                ),
              ),
              SelectionCard.menuCard(context, Icons.account_circle, "Users", 1,
                  () {
                Provider.of<UserSelected>(context, listen: false)
                    .selectedItem(0);
                Provider.of<UserSelected>(context, listen: false)
                    .userSelected(false);
                Provider.of<UserSelected>(context, listen: false)
                    .professionalSelected(false);
                Provider.of<SearchProvider>(context, listen: false)
                    .searching(false);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AllUserScreen()));
              }),
              SelectionCard.menuCard(context, Icons.pets, "Pets", 2, () {
                Provider.of<UserSelected>(context, listen: false)
                    .selectedItem(0);
                Provider.of<UserSelected>(context, listen: false)
                    .userSelected(false);
                Provider.of<UserSelected>(context, listen: false)
                    .professionalSelected(false);
                Provider.of<SearchProvider>(context, listen: false)
                    .searching(false);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PetScreen()));
              }),
              SelectionCard.menuCard(context, Icons.logout, "Log Out", 3, () {
                Provider.of<UserSelected>(context, listen: false)
                    .selectedItem(0);
                Provider.of<UserSelected>(context, listen: false)
                    .userSelected(false);
                Provider.of<UserSelected>(context, listen: false)
                    .professionalSelected(false);
                Provider.of<SearchProvider>(context, listen: false)
                    .searching(false);
                Provider.of<LoginSignupRepo>(context, listen: false)
                    .logout()
                    .then((value) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const WebLogin()),
                      (route) => false);
                });
              }),
            ],
          ),
        ),
        body: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: Text(
                        unverifyselectedScreen.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )),
                      SizedBox(
                          width: 300,
                          //color: AppColor.blackColor,
                          child: unverifySelectedScreen(
                              context, _selectedItem ?? 0)),
                    ],
                  ),
                ),
              ),
              //Expanded(child: Text('helo')),
              SizedBox(
                width: width * 0.05,
              ),
              Expanded(
                //flex: 1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  Provider.of<UserSelected>(context,
                                          listen: false)
                                      .professionalSelected(false);
                                  Provider.of<UserSelected>(context,
                                          listen: false)
                                      .userSelected(false);
                                  Provider.of<UserSelected>(context,
                                          listen: false)
                                      .selectedItem(0);
                                  Provider.of<SearchProvider>(context,
                                          listen: false)
                                      .searching(false);
                                  unverifyselectedScreen = "Veterinarian";
                                  _selectedItem = 1;
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (_) => const VetScreen()));
                                },
                                child: DashBoardCardOne(
                                  startColor: HexColor("#66BB6A"),
                                  endColor: HexColor("#81C784"),
                                  cardTitle: 'Veterinarian',
                                  value1: verifiedVet,
                                  value2: allVet - verifiedVet,
                                  total: allVet,
                                  title1: 'Verified',
                                  title2: 'Unverified',
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  Provider.of<UserSelected>(context,
                                          listen: false)
                                      .professionalSelected(false);
                                  Provider.of<UserSelected>(context,
                                          listen: false)
                                      .userSelected(false);
                                  Provider.of<UserSelected>(context,
                                          listen: false)
                                      .selectedItem(0);
                                  Provider.of<SearchProvider>(context,
                                          listen: false)
                                      .searching(false);

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (_) =>
                                  //             const TrainerScreen()));
                                  unverifyselectedScreen = "Trainer";
                                  _selectedItem = 2;
                                },
                                child: DashBoardCardOne(
                                  startColor: HexColor("#FFA726"),
                                  endColor: HexColor("#FFB74D"),
                                  cardTitle: 'Trainer',
                                  value1: verifiedTrainer,
                                  value2: allTrainer - verifiedTrainer,
                                  total: allTrainer,
                                  title1: 'Verified',
                                  title2: 'Unverified',
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  Provider.of<UserSelected>(context,
                                          listen: false)
                                      .professionalSelected(false);
                                  Provider.of<UserSelected>(context,
                                          listen: false)
                                      .userSelected(false);
                                  Provider.of<UserSelected>(context,
                                          listen: false)
                                      .selectedItem(0);
                                  Provider.of<SearchProvider>(context,
                                          listen: false)
                                      .searching(false);

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (_) => const PetWalkerScreen(
                                  //               professionalType: 'Pet Walker',
                                  //             )));
                                  unverifyselectedScreen = "Pet Walker";
                                  _selectedItem = 3;
                                },
                                child: DashBoardCardOne(
                                  startColor: HexColor("#FFA07A"),
                                  endColor: HexColor("#FFA07A"),
                                  cardTitle: 'Pet Walker',
                                  value1: verifiedPetWalker,
                                  value2: allPetWalker - verifiedPetWalker,
                                  total: allPetWalker,
                                  title1: 'Verified',
                                  title2: 'Unverified',
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  Provider.of<UserSelected>(context,
                                          listen: false)
                                      .professionalSelected(false);
                                  Provider.of<UserSelected>(context,
                                          listen: false)
                                      .userSelected(false);
                                  Provider.of<UserSelected>(context,
                                          listen: false)
                                      .selectedItem(0);
                                  Provider.of<SearchProvider>(context,
                                          listen: false)
                                      .searching(false);

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (_) => const PetWalkerScreen(
                                  //             professionalType: "Groomer")));
                                  unverifyselectedScreen = "Groomer";
                                  _selectedItem = 4;
                                },
                                child: DashBoardCardOne(
                                  startColor: HexColor("#FFB6C1"),
                                  endColor: HexColor("#FFB6C1"),
                                  cardTitle: 'Groomer',
                                  value1: verifiedGroomer,
                                  value2: allGroomer - verifiedGroomer,
                                  total: allGroomer,
                                  title1: 'Verified',
                                  title2: 'Unverified',
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // SizedBox(
                            //   width: width * 0.20,
                            // ),
                            InkWell(
                                onTap: () {
                                  Provider.of<UserSelected>(context,
                                          listen: false)
                                      .selectedItem(0);
                                  Provider.of<SearchProvider>(context,
                                          listen: false)
                                      .searching(false);
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (_) =>
                                  //             const LostPetScreen()));
                                  unverifyselectedScreen = "Lost Pet";
                                  _selectedItem = 5;
                                },
                                child: DashBoardCardOne(
                                  startColor: HexColor("#90EE90"),
                                  endColor: HexColor("#90EE90"),
                                  cardTitle: 'Lost Pet',
                                  value1: verifiedLostPet,
                                  value2: totalLostpet - verifiedLostPet,
                                  total: totalLostpet,
                                  title1: 'Reviewed',
                                  title2: 'Unreviewed',
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  Provider.of<UserSelected>(context,
                                          listen: false)
                                      .selectedItem(0);
                                  Provider.of<SearchProvider>(context,
                                          listen: false)
                                      .searching(false);
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (_) =>
                                  //             const FoundPetScreen()));
                                  unverifyselectedScreen = "Found Pet";
                                  _selectedItem = 6;
                                },
                                child: DashBoardCardOne(
                                  startColor: HexColor("#FAFAD2"),
                                  endColor: HexColor("#FAFAD2"),
                                  cardTitle: 'Found Pet',
                                  value1: veriredFoundPet,
                                  value2: totalFoundpet - veriredFoundPet,
                                  total: totalFoundpet,
                                  title1: 'Reviewed',
                                  title2: 'Unreviewed',
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () async {
                                  await Provider.of<UserSelected>(context,
                                          listen: false)
                                      .professionalSelected(false);
                                  Provider.of<UserSelected>(context,
                                          listen: false)
                                      .selectedItem(0);
                                  Provider.of<UserSelected>(context,
                                          listen: false)
                                      .userSelected(false);
                                  Provider.of<SearchProvider>(context,
                                          listen: false)
                                      .searching(false);

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (_) =>
                                  //             const AllUserScreen()));
                                  unverifyselectedScreen = "Users";
                                  _selectedItem = 7;
                                },
                                child: DashBoardCardOne(
                                  startColor: HexColor("#F08080"),
                                  endColor: HexColor("#F08080"),
                                  cardTitle: 'Users',
                                  value1: totalprofessional,
                                  value2: deletedUsers,
                                  total: totalUser,
                                  title1: 'Professional',
                                  title2: 'Deleted',
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Provider.of<UserSelected>(context,
                                        listen: false)
                                    .selectedItem(1);
                                Provider.of<UserSelected>(context,
                                        listen: false)
                                    .userSelected(false);
                                Provider.of<UserSelected>(context,
                                        listen: false)
                                    .professionalSelected(false);
                                Provider.of<SearchProvider>(context,
                                        listen: false)
                                    .searching(false);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const ProfessionalScreen()));
                              },
                              child: DashBoardCardTwo(
                                  startColor: HexColor("#ADD8E6"),
                                  endColor: HexColor("#ADD8E6"),
                                  cardTitle: "Professional",
                                  title1: "Total:",
                                  title2: "Verified:",
                                  title3: "Unverified:",
                                  title4: "Veterinarian:",
                                  title5: "Trainer:",
                                  value1: totalprofessional,
                                  value2: verifiedProfessional,
                                  value3:
                                      totalprofessional - verifiedProfessional,
                                  value4: allVet,
                                  value5: allTrainer),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget drawerSelectedScreen(context, int selectedIndex) {
    switch (selectedIndex) {
      case 1:
        return const UserListBody();
      case 2:
        return const PetScreen();
      case 3:
        return const WebLogin();
      default:
        return const SizedBox();
    }
  }

  Widget unverifySelectedScreen(context, int selectedIndex) {
    //debugger();
    switch (selectedIndex) {
      case 1:
        return const UnVerifiedVetBody();
      case 2:
        return const UnVerifiedTrainerBody();
      case 3:
        return const UnverifiedPetWalkerBody(
          professionalType: 'Pet Walker',
        );
      case 4:
        return const UnverifiedPetWalkerBody(professionalType: 'Groomer');
      case 5:
        return const UnverifiedLostPetBody();
      case 6:
        return const UnVerifiedFoundPetBody();
      case 7:
        return const UnVerifiedTrainerBody();
      default:
        return const UnVerifiedVetBody();
    }
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
