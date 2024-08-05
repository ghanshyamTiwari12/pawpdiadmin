import 'package:flutter/material.dart';
import 'package:petfindernetwork/Web_helper/text_hepler.dart';
import 'package:provider/provider.dart';

import '../Web Api/user_selected_provider.dart';
import 'colors.dart';

class UserCard{

  static Widget userListCard
      (
      context,
      String uid,
      String name,
      String address,
      String imageUrl,
    VoidCallback? callback,
      {String email= '', String phone = ''}
      )
  {
    UserSelected userSelected = Provider.of<UserSelected>(context);
   String _userID = userSelected.userID;
    return InkWell(
      onTap: callback,
      splashColor: AppColor.orange,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0,
            right: 20.0, bottom: 10.0),
        child: Card(
          color: _userID == uid ? Colors.black38 : AppColor.orange,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ShowText.detailsText("Name:", fontWeight: FontWeight.bold,),
                              const SizedBox(width: 3,),
                              Expanded(
                                child: ShowText.detailsText(name),
                              ),
                              CircleAvatar(
                                backgroundImage: NetworkImage(imageUrl.toString()),
                                radius: 20,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5,),
                          email.isEmpty ? Row(
                            children: [
                              ShowText.detailsText("Contact No: ", fontWeight: FontWeight.bold,),
                              ShowText.detailsText(phone),
                            ],
                          ) :
                          Row(
                            children: [
                              ShowText.detailsText("Email: ", fontWeight: FontWeight.bold,),
                              Expanded(
                                child: ShowText.detailsText(email),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            children: [
                              ShowText.detailsText("Address: ", fontWeight: FontWeight.bold,),
                              Expanded(
                                  child: ShowText.detailsText(address)
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );

  }

  static Widget deletedUserCard(
      String name,
      String address,
      String reason,
      {String email= '', String phone = ''}

      ){
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,
          right: 20.0, bottom: 10.0),
      child: Card(
        color: AppColor.orange,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ShowText.detailsText("Name:", fontWeight: FontWeight.bold,),
                            const SizedBox(width: 3,),
                            Expanded(
                              child: ShowText.detailsText(name),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          children: [
                            ShowText.detailsText("Address: ", fontWeight: FontWeight.bold,),
                            Expanded(
                                child: ShowText.detailsText(address)
                            ),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        email.isEmpty ? Row(
                          children: [
                            ShowText.detailsText("Contact No: ", fontWeight: FontWeight.bold,),
                            ShowText.detailsText(phone),
                          ],
                        ) :
                        Row(
                          children: [
                            ShowText.detailsText("Email: ", fontWeight: FontWeight.bold,),
                            Expanded(
                              child: ShowText.detailsText(email),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          children: [
                            ShowText.detailsText("Reason: ", fontWeight: FontWeight.bold,),
                            Expanded(
                                child: ShowText.detailsText(reason)
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );

  }
}