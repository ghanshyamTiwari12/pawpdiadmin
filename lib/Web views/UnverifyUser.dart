import 'dart:developer';

import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petfindernetwork/Web_helper/colors.dart';
import 'package:petfindernetwork/Web_helper/text_hepler.dart';

class UnverifyUser extends StatefulWidget {
  final String? name;
  final String? professionalType;
  final String? address;
  final bool? isIdVerified;
  final String? uid;
  final bool? isIdRejected;
  final String? phone;
  final String? email;
  final String? idImageUrl;
  const UnverifyUser(
      {super.key,
      this.name,
      this.professionalType,
      this.address,
      this.isIdVerified,
      this.uid,
      this.isIdRejected,
      this.phone,
      this.email,
      this.idImageUrl});

  @override
  State<UnverifyUser> createState() => _UnverifyUserState();
}

class _UnverifyUserState extends State<UnverifyUser> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();
  int? _selectedItem = 0;
  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    // debugger();
    print(widget.name);
    print(widget.email);
    isSelect = 'active';
    isSelectMenu = 'Profile';
    super.initState();
  }

  final List<Menucard> _data = [
    Menucard(icon: Icons.person, tittle: 'active'),
    Menucard(icon: Icons.flag, tittle: 'flagged'),
    Menucard(icon: Icons.hide_source_sharp, tittle: 'hidden'),
    Menucard(icon: Icons.block, tittle: 'blocked'),
  ];
  String isSelect = '';
  String isSelectMenu = '';
  final List<Menucard> _menuList = [
    Menucard(icon: Icons.person, tittle: 'Profile'),
    Menucard(icon: Icons.chat, tittle: 'Chats'),
    Menucard(icon: Icons.thumb_up_alt_outlined, tittle: 'Like'),
    Menucard(icon: Icons.visibility_outlined, tittle: 'Visit'),
    Menucard(icon: Icons.thumb_down_alt_outlined, tittle: 'Dislike'),
  ];
  SampleItem? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   iconTheme: const IconThemeData(color: Colors.white),
        //   title: ShowText.detailsText("DASHBOARD", fontWeight: FontWeight.bold),
        //   backgroundColor: AppColor.orange,
        // ),
        // appBar: AppBar(
        //   title: Text("home"),
        //   centerTitle: true,
        // ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShowText.detailsText(widget.name.toString()),
                  const SizedBox(
                    height: 20,
                  ),
                  // SizedBox(
                  //   height: 100,
                  //   width: 300,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: _data.length,
                  //     itemBuilder: (context, index) {
                  //       return GestureDetector(
                  //         onTap: () {
                  //           setState(() {
                  //             isSelect = _data[index].tittle.toString();
                  //           });
                  //         },
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Container(
                  //                 height: 50,
                  //                 width: 50,
                  //                 decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(30),
                  //                     color: isSelect == _data[index].tittle
                  //                         ? AppColor.orange
                  //                         : const Color.fromARGB(
                  //                             255, 163, 160, 160)),
                  //                 child: Center(
                  //                   child: Icon(
                  //                     _data[index].icon,
                  //                     color: isSelect == _data[index].tittle
                  //                         ? AppColor.whiteColor
                  //                         : AppColor.blackColor,
                  //                   ),
                  //                 ),
                  //               ),
                  //               Text(
                  //                 _data[index].tittle.toString(),
                  //                 style: const TextStyle(fontSize: 13),
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  SizedBox(
                    height: 400,
                    width: 260,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _menuList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              // debugger();
                              isSelectMenu = _menuList[index].tittle.toString();

                              if (isSelectMenu == 'Profile') {
                                _selectedItem = 1;
                              } else if (isSelectMenu == 'Chats') {
                                _selectedItem = 2;
                              } else if (isSelectMenu == 'Like') {
                                _selectedItem = 3;
                              } else if (isSelectMenu == 'Visit') {
                                _selectedItem = 4;
                              } else if (isSelectMenu == 'Dislike') {
                                _selectedItem = 5;
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: isSelectMenu == _menuList[index].tittle
                                      ? AppColor.orange
                                      : AppColor.whiteColor),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        _menuList[index].icon,
                                        size: 20,
                                        color: isSelectMenu ==
                                                _menuList[index].tittle
                                            ? AppColor.whiteColor
                                            : Colors.black87,
                                      ),
                                      const SizedBox(width: 15),
                                      Text(
                                        _menuList[index].tittle.toString(),
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: isSelectMenu ==
                                                  _menuList[index].tittle
                                              ? AppColor.whiteColor
                                              : Colors.black87,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              Expanded(
                  flex: 1, child: selectedScreen(context, _selectedItem ?? 0)),
            ],
          ),
        ));
  }

  Profile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 130,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.orange),
                  borderRadius: BorderRadius.circular(10)),
              child: Stack(children: [
                Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQL9HaaTJSDJsT4iNusqiWXnEUelnan5lADZQ&s'),
                Positioned(
                  right: 10,
                  child: PopupMenuButton<SampleItem>(
                    shadowColor: Colors.orange,
                    iconColor: Colors.black,
                    initialValue: selectedItem,
                    onSelected: (SampleItem item) {
                      setState(() {
                        selectedItem = item;
                      });
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<SampleItem>>[
                      const PopupMenuItem<SampleItem>(
                        value: SampleItem.itemOne,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Approve'), Icon(Icons.check)],
                          ),
                        ),
                      ),
                      const PopupMenuItem<SampleItem>(
                        value: SampleItem.itemTwo,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Unreviewed'),
                              Icon(Icons.warning_amber_outlined)
                            ],
                          ),
                        ),
                      ),
                      const PopupMenuItem<SampleItem>(
                        value: SampleItem.itemThree,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Reject'),
                              Icon(Icons.highlight_remove_sharp)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),

            const SizedBox(width: 15),
            // Container(
            //   height: 80,
            //   width: 100,
            //   decoration: BoxDecoration(
            //       border: Border.all(color: AppColor.orange),
            //       borderRadius: BorderRadius.circular(10)),
            //   child: Image.network(
            //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQL9HaaTJSDJsT4iNusqiWXnEUelnan5lADZQ&s'),
            // )
          ],
        ),
        const Divider(),
        const Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.privacy_tip_outlined,
                    color: Colors.black87,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "User status",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
              Text(
                'active',
                style: const TextStyle(
                  fontSize: 12,
                  //color: Colors.black87,
                ),
              )
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.person_2_outlined,
                    color: Colors.black87,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Full name",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
              Text(
                widget.name.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  //color: Colors.black87,
                ),
              )
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.verified_user_outlined,
                    // Icons.privacy_tip_outlined,
                    color: Colors.black87,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Professional",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
              Text(
                widget.professionalType.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  // color: Colors.black87,
                ),
              )
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.email,
                    // Icons.privacy_tip_outlined,
                    color: Colors.black87,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Email ID",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
              Text(
                widget.email.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  // color: Colors.black87,
                ),
              )
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.phone,
                    // Icons.privacy_tip_outlined,
                    color: Colors.black87,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Phone No",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
              Text(
                widget.phone.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  // color: Colors.black87,
                ),
              )
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.black87,
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Location",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
              Text(
                widget.address.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  // color: Colors.black87,
                ),
              )
            ],
          ),
        ),
        const Divider(),
        // const Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: const Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Row(
        //         children: [
        //           Icon(
        //             Icons.phone,
        //             color: Colors.black87,
        //           ),
        //           SizedBox(width: 15),
        //           Text(
        //             "Phone Number",
        //             style: TextStyle(
        //               fontSize: 13,
        //               color: Colors.black87,
        //             ),
        //           )
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        // const Divider(),
        // const Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: const Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Row(
        //         children: [
        //           Icon(
        //             Icons.email_outlined,
        //             color: Colors.black87,
        //           ),
        //           SizedBox(width: 15),
        //           Text(
        //             "Email",
        //             style: TextStyle(
        //               fontSize: 13,
        //               color: Colors.black87,
        //             ),
        //           )
        //         ],
        //       ),
        //       Text('avadhworkzone@gmail.com')
        //     ],
        //   ),
        // ),
        // const Divider(),
        // const Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: const Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Row(
        //         children: [
        //           Icon(
        //             Icons.edit_outlined,
        //             color: Colors.black87,
        //           ),
        //           SizedBox(width: 15),
        //           Text(
        //             "Registration date",
        //             style: TextStyle(
        //               fontSize: 13,
        //               color: Colors.black87,
        //             ),
        //           )
        //         ],
        //       ),
        //       Text('2024-07-18 11:8AM')
        //     ],
        //   ),
        // ),
        // const Divider(),
        // const Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: const Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Row(
        //         children: [
        //           Icon(
        //             Icons.access_time,
        //             color: Colors.black87,
        //           ),
        //           SizedBox(width: 15),
        //           Text(
        //             "Last active",
        //             style: TextStyle(
        //               fontSize: 13,
        //               color: Colors.black87,
        //             ),
        //           )
        //         ],
        //       ),
        //       Text('a day ago')
        //     ],
        //   ),
        // ),
      ],
    );
  }

  chat() {
    return const Center(child: Text("Chats Empty"));
  }

  like() {
    return const Center(child: Text("Like Empty"));
  }

  visit() {
    return const Center(child: Text("Visit Empty"));
  }

  dislike() {
    return const Center(child: Text("Dislike Empty"));
  }

  Widget selectedScreen(context, int selectedIndex) {
    //debugger();
    switch (selectedIndex) {
      case 1:
        return Profile();

      case 2:
        return chat();
      case 3:
        return like();
      case 4:
        return visit();
      case 5:
        return dislike();

      default:
        return Profile();
    }
  }
}

class Menucard {
  String? tittle;
  IconData? icon;
  Menucard({this.tittle, this.icon});
}

enum SampleItem { itemOne, itemTwo, itemThree }
