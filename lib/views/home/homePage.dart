//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:petfindernetwork/constant/colors.dart';
// import 'package:petfindernetwork/pushNotificationFunction/notificationFunction.dart';
// import 'package:petfindernetwork/repository/loginsignupRepo.dart';
// import 'package:petfindernetwork/views/chat/myChatList.dart';
// import 'package:petfindernetwork/views/home/sidebar.dart';
// import 'package:petfindernetwork/views/loginSignUp/login.dart';
// import 'package:petfindernetwork/views/lostFound/founditemList.dart';
// import 'package:petfindernetwork/views/lostFound/lostItemList.dart';
// import 'package:petfindernetwork/views/lostFound/lostfoundsubmit.dart';
// import 'package:petfindernetwork/views/shareAbleWidget.dart/commonShareWidget.dart';
// import 'package:provider/provider.dart';
// import '../../admin/preference.dart';
// import '../../admin/user_data.dart';
// import '../../admin/users_list.dart';
// import '../../admin/users_pet_list.dart';
// import '../serviceProvider/service_completed.dart';
// import '../serviceProvider/service_provider_user.dart';
// import '../serviceProvider/professional_user_page.dart';
// import '../serviceProvider/service_inprocess.dart';
//
// //import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// // const String AD_MOB_APP_ID = 'ca-app-pub-8532139344201808~2693280906';
// // const String AD_MOB_TEST_DEVICE = 'test_device_id - run ad then check device logs for value';
// // const String AD_MOB_AD_ID = 'ca-app-pub-8532139344201808/5562986828';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   final List<Widget> _children = [
//   if (UserProvider.userInfoModel?.isAdmin == true)... [
//       const UsersList(),
//       const UsersPetList(),
//       // const ProfessionalUsersList(),
//       const MyChatList(),
//     ] else if (UserProvider.userInfoModel?.isProfessional == true)... [
//         const ServiceProviderUser(),
//        const ServiceInProcess(),
//         const ServiceCompleted(),
//         const MyChatList(),
//       ]else...[
//         const ProfessionalUserPage(),
//         const FoundPetList(),
//         const LostPetList(),
//         const LostFoundSubmit(),
//         const MyChatList(),
//       ]
//   // else...[
//   //       // Center(child: CommonShareWidget.circularLoader())
//   //     ]
//     //UserProfile()
//   ];
//   static int _currentIndex = 0;
//
//   //BannerAd? _bottomBannerAd;
//   // BannerAd myBanner = BannerAd(
//   //   // Replace the testAdUnitId with an ad unit id from the AdMob dash.
//   //   // https://developers.google.com/admob/android/test-ads
//   //   // https://developers.google.com/admob/ios/test-ads
//   //   request: AdRequest(),
//   //   adUnitId: adUnitId,
//   //   size: AdSize.banner,
//   //   listener: BannerAdListener(
//   //       // (MobileAdEvent event) {
//   //       //   print("BannerAd event is $event");
//   //       // },
//   //       ),
//   // );
//
//   // InterstitialAd myInterstitial = InterstitialAd(
//   //   // Replace the testAdUnitId with an ad unit id from the AdMob dash.
//   //   // https://developers.google.com/admob/android/test-ads
//   //   // https://developers.google.com/admob/ios/test-ads
//   //   adUnitId: InterstitialAd.testAdUnitId,
//   //   targetingInfo: targetingInfo,
//   //   listener: (MobileAdEvent event) {
//   //     print("InterstitialAd event is $event");
//   //   },
//   // );
//
//   // InterstitialAd? myInterstitialAd;
//   // BannerAd createBannerAd() {
//   //   return new BannerAd(
//   //     size: AdSize.banner,
//   //     adUnitId: AD_MOB_AD_ID,
//   //     request: AdRequest(),
//   //     listener: BannerAdListener(),
//   //   );
//   // }
//
//   // showBannerAd() {
//   //   _bottomBannerAd ??= createBannerAd();
//   //   _bottomBannerAd!.load();
//   // }
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   // _bottomBannerAd = createBannerAd();
//   //   // InterstitialAd.load(
//   //   //   adUnitId: AD_MOB_AD_ID,
//   //   //   request: AdRequest(),
//   //   //   adLoadCallback: InterstitialAdLoadCallback(
//   //   //     onAdLoaded: (ad) {
//   //   //       myInterstitialAd = ad;
//   //   //     },
//   //   //     onAdFailedToLoad: (error) {
//   //   //       print('InterstitialAd failed to load: $error');
//   //   //     },
//   //   //   ),
//   //   // );
//   // }
//
//   @override
//   void initState() {
//     super.initState();
//
//     updateUserInfo();
//   }
//
//   @override
//   void didChangeDependencies() {
//     Provider.of<LoginSignupRepo>(context, listen: false)
//         .getUser()
//         .then((value) {
//       if (value != null) {
//         registerNotification(value.uid, context);
//         configLocalNotification();
//       }
//     });
//     super.didChangeDependencies();
//   }
//
//   @override
//   void dispose() {
//     //_bannerAd?.dispose();
//     //_bottomBannerAd.dispose();
//     // Preferences.clearData();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<User?>(
//       builder: (_, user, child) {
//         return Scaffold(
//           key: _scaffoldKey,
//           body: _children[_currentIndex],
//           bottomNavigationBar:
//             NavigationBarTheme(
//             data: NavigationBarThemeData(
//             labelTextStyle: MaterialStateProperty.all(
//             const TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//         ),
//         )),
//             child: NavigationBar
//             (
//             backgroundColor: AppColor.green.withOpacity(0.6),
//             selectedIndex: _currentIndex,
//               onDestinationSelected: (index)
//               {
//               setState  (()   {
//                 if(UserProvider.userInfoModel?.uid == null){
//                     CommonShareWidget.goToAnotherPage(
//                         nextPage:  const LoginPage(), context: context);
//                 }
//                 else{
//
//                   if ((FirebaseAuth.instance.currentUser?.emailVerified ?? false) ||
//                       FirebaseAuth.instance.currentUser?.phoneNumber != null)
//                   {
//                           if(UserProvider.userInfoModel?.isAdmin == true ){
//                             _currentIndex = index;
//                             if (kDebugMode) {
//                               print("admin check current index ${UserProvider.userInfoModel?.isAdmin}");
//                             }
//                           } else{
//                             if(UserProvider.userInfoModel?.isProfessional == true ){
//                               _currentIndex = index;
//                               if (kDebugMode) {
//                                 print("admin check current index ${UserProvider.userInfoModel?.isAdmin}");
//                               }
//                             } else if (UserProvider.userInfoModel?.isProfessional == false) {
//                               _currentIndex = index;
//
//                             }
//                             else{
//                               CommonShareWidget.goToAnotherPage(
//                                   nextPage: const LoginPage(), context: context);
//                               // Center(child: CommonShareWidget.circularLoader());
//                             }
//                           }
//                   }
//                   else {
//                     CommonShareWidget.goToAnotherPage(
//                         nextPage: const LoginPage(), context: context);
//                     // CommonShareWidget.goToAnotherPage(
//                     //     nextPage: const UserProfile(), context: context);
//                   }
//                 }
//               });
//             },
//             destinations: [
//               if(UserProvider.userInfoModel?.isAdmin == true)...[
//                 NavigationDestination(
//                   icon: const Icon(Icons.man),
//                   selectedIcon: Icon(Icons.manage_accounts,
//                     color: AppColor.orange,
//                     size: 35.0,
//                     shadows: const <Shadow>[
//                       Shadow(color: Colors.black, blurRadius: 5.0, offset: Offset(3, 3))
//                     ],
//                   ),
//                   label: "User",
//                 ),
//                 NavigationDestination(
//                   icon:const Icon(Icons.pets),
//                   selectedIcon:  Icon(Icons.reviews,
//                     color: AppColor.orange,
//                     size: 35.0,
//                     shadows: const <Shadow>[
//                       Shadow(color: Colors.black, blurRadius: 5.0, offset: Offset(3, 3))
//                     ],
//                   ),
//                   label: "Pet List",
//                 ),
//                  NavigationDestination(
//                   icon: const Icon(Icons.person_outline),
//                   selectedIcon: Icon(Icons.person,
//                     color: AppColor.orange,
//                     size: 35.0,
//                     shadows: const <Shadow>[
//                       Shadow(color: Colors.black, blurRadius: 5.0, offset: Offset(3, 3))
//                     ],
//                   ),
//                   label: "Professionals",
//                 ),
//                 //  NavigationDestination(
//                 //   icon: const Icon(Icons.chat_outlined),
//                 //   selectedIcon: Icon(Icons.chat,
//                 //     color: AppColor.orange,
//                 //     size: 35.0,
//                 //     shadows: const <Shadow>[
//                 //       Shadow(color: Colors.black, blurRadius: 5.0, offset: Offset(3, 3))
//                 //     ],
//                 //   ),
//                 //   label: "Chat",
//                 // ),
//               ]
//               else...[
//                 if(UserProvider.userInfoModel?.isProfessional == true)
//                   ...
//                   [
//                      NavigationDestination(
//                       icon: const Icon(Icons.calendar_month),
//                       selectedIcon: Icon(Icons.calendar_month,
//                         color: AppColor.orange,
//                         size: 35.0,
//                         shadows: const <Shadow>[
//                           Shadow(color: Colors.black, blurRadius: 5.0, offset: Offset(3, 3))
//                         ],
//                       ),
//                       label: "Appointment",
//                     ),
//                      NavigationDestination(
//                       icon: const Icon(Icons.circle_outlined),
//                       selectedIcon: Icon(
//                         Icons.circle_outlined,
//                         color: AppColor.orange,
//                         size: 35.0,
//                         shadows: const <Shadow>[
//                           Shadow(color: Colors.black, blurRadius: 5.0, offset: Offset(3, 3))
//                         ],
//                       ),
//                       label: "InProcess",
//                     ),
//                     NavigationDestination(
//                       icon: const Icon(Icons.check_circle),
//                       selectedIcon: Icon(Icons.check_circle,
//                         color: AppColor.orange,
//                         size: 35.0,
//                         shadows: const <Shadow>[
//                           Shadow(color: Colors.black, blurRadius: 5.0, offset: Offset(3, 3))
//                         ],
//                       ),
//                       label: "Completed",
//                     ),
//                      NavigationDestination(
//                       icon: const Icon(Icons.chat_outlined),
//                       selectedIcon: Icon(Icons.chat,
//                         color: AppColor.orange,
//                         size: 35.0,
//                         shadows: const <Shadow>[
//                           Shadow(color: Colors.black, blurRadius: 5.0, offset: Offset(3, 3))
//                         ],
//                       ),
//                       label: "Chat",
//                     ),
//
//                   ]
//                 else if(UserProvider.userInfoModel?.isProfessional == false ||
//                     UserProvider.userInfoModel?.isProfessional == null
//                 )...[
//                    NavigationDestination(
//                     icon: const Icon(Icons.person_outline,
//                       color: Colors.black ,
//                     ),
//                     selectedIcon: Icon(Icons.person,
//                       color: AppColor.orange,
//                       size: 35.0,
//                       shadows: const <Shadow>[
//                         Shadow(color: Colors.black, blurRadius: 5.0, offset: Offset(3, 3))
//                       ],
//                     ),
//                     label: "Services",
//                   ),
//                    NavigationDestination(
//                     icon: const Icon(Icons.pets_outlined),
//                     selectedIcon: Icon(Icons.pets,color: AppColor.orange,
//                       size: 35.0,
//                       shadows: const <Shadow>[
//                         Shadow(color: Colors.black, blurRadius: 5.0, offset: Offset(3, 3))
//                       ],
//                     ),
//                     label: "Found",
//                   ),
//                    NavigationDestination(
//                     icon: const Icon(Icons.cruelty_free_outlined),
//                     selectedIcon: Icon(Icons.cruelty_free, color: AppColor.orange,
//                       size: 35.0,
//                       shadows: const <Shadow>[
//                         Shadow(color: Colors.black, blurRadius: 5.0, offset: Offset(3, 3))
//                       ],
//                     ),
//                     label: "Lost",
//                   ),
//                    NavigationDestination(
//                     icon: const Icon(Icons.add_circle_outline),
//                     selectedIcon: Icon(Icons.add_circle, color: AppColor.orange,
//                       size: 35.0,
//                       shadows: const <Shadow>[
//                         Shadow(color: Colors.black, blurRadius: 5.0, offset: Offset(3, 3))
//                       ],
//                     ),
//                     label: "Add",
//                   ),
//                    NavigationDestination(
//                     icon: const Icon(Icons.chat_outlined),
//                     selectedIcon: Icon(Icons.chat, color: AppColor.orange,
//                       size: 35.0,
//                       shadows: const <Shadow>[
//                         Shadow(color: Colors.black, blurRadius: 5.0, offset: Offset(3, 3))
//                       ],
//                     ),
//                     label: "Chat",
//                   ),
//                 ] else...[
//                       const Center(child: Text("Error"))
//                   ]
//               ]
//             ],
//           ),
//             ),//
//              endDrawer: SideBar(user: user),
//         );
//       },
//     );
//   }
//
//   Future<void> updateUserInfo() async {
//       final String?  uid = await FirebaseAuth.instance.currentUser?.uid;
//       if(uid != null ){
//         final userData = await FirebaseFirestore.instance.collection("users").doc(uid).get();
//         if(userData.exists){
//           await Preferences.saveUserData(userData.data());
//         }
//         else {
//
//         }
//       }
//
//
//         // else{
//         //   Provider.of<LoginSignupRepo>(context,
//         //       listen: false)
//         //       .logout()
//         //       .then((value) {
//         //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) =>
//         //     const LoginPage() ), (route) => false);
//         //   });
//         // }
//
//       }
//
//
//       // final userExistId = await FirebaseFirestore.instance.collection('users').doc(uid).get();
//
//       // if(!userData.exists)
//       // {
//       //   Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginPage()));
//       // }
//   //     if(FirebaseAuth.instance.currentUser!.emailVerified &&
//   //         FirebaseAuth.instance.currentUser?.phoneNumber != null){
//   //       await Preferences.saveUserData(userData.data());
//   //
//   //     if (kDebugMode) {
//   //       print("user id in updateUserInfo--$uid");
//   //     }
//   //
//   // }
//   //     else{
//   //       Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginPage()));
//   //
//   //     }
//
//
//
//   void onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
// }