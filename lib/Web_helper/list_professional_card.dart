

import 'package:flutter/material.dart';
import 'package:petfindernetwork/Web_helper/text_hepler.dart';
import 'package:provider/provider.dart';

import '../Web Api/user_selected_provider.dart';
import '../Web views/image_view_page.dart';
import '../Web Api/checkbox_provider.dart';
import 'colors.dart';
import 'commonShareWidget.dart';

class ProfessionalCard {


  static Widget unVerifiedProfessionalCard(
      context,
      String name,
      String profession, String address, String iamgeUrl,

      bool isIdVerified,
      String uid,
      bool isIdRejected,
      bool isDocVerified,
      bool isDocRejected,
      bool isProfessionalVerified,
      {String email= '', String phone = '', String idImageUrl = '',
        String professionalImageUrl = '',
      }
      )
  {
    return
      Padding(
        padding: const EdgeInsets.only(left: 20.0,
            right: 20.0, bottom: 10.0),
        child: Card(
          color: AppColor.orange,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    ShowText.detailsText("Name:", fontWeight: FontWeight.bold,),
                    Expanded(
                      child: ShowText.detailsText(name),
                    ),
                    const SizedBox(width: 20,),
                    CircleAvatar(
                      backgroundImage: NetworkImage(iamgeUrl.toString()),
                      radius: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    ShowText.detailsText("Profession: ", fontWeight: FontWeight.bold,),
                    Expanded(
                      child: ShowText.detailsText(profession),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
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
                ),
                const SizedBox(height: 05,),
                Row(
                  children: [
                    ShowText.detailsText("ID: ", fontWeight: FontWeight.bold,),
                    const SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        idImageUrl.isEmpty ?
                        CommonShareWidget.showFlushBar(
                            context: context,
                            duration: 2,
                            message: "ID Is not Available") :
                        Navigator.push(context, MaterialPageRoute(builder: (_) =>
                            ImageViewPage(imageUrl: idImageUrl,
                              idType: "Id Viewer",
                              userName: name,
                              profession: profession,
                            )));
                      },
                      child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              border: Border.all(
                                  color: Colors.black
                              )
                          ),
                          child: idImageUrl.isEmpty ?  const Icon(Icons.image,
                          ) :
                          Image.network(idImageUrl,
                            fit: BoxFit.fill,
                          )
                      ),
                    ),
                    if(idImageUrl.isNotEmpty)...[
                      const SizedBox(width: 10,),
                      Column(
                        children: [
                          const Text("Yes"),
                          Checkbox(
                            value: isIdVerified,
                            checkColor: Colors.white,
                            activeColor: Colors.green,
                            onChanged: (value) {

                              Provider.of<CheckBoxProvider>(context, listen: false).idVerifyCheckList(uid.toString(), value!, isDocVerified  );
                            },
                          ),],
                      ), //
                      const SizedBox(width: 10,),
                      Column(
                        children: [
                          const Text("No"),
                          Checkbox(
                            value: isIdRejected,
                            checkColor: Colors.white,
                            activeColor: Colors.red,
                            onChanged: (value) {
                              Provider.of<CheckBoxProvider>(context, listen: false).idRejectCheckList(uid.toString(), value! );
                            },
                          ),
                        ],
                      ),
                    ]
                  ],
                ),
                const SizedBox(height: 05,),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ShowText.detailsText("Service ID: ", fontWeight: FontWeight.bold,),
                    InkWell(
                      onTap: (){
                        professionalImageUrl.isEmpty ?
                        CommonShareWidget.showFlushBar(
                            context: context,
                            duration: 2,
                            message: "Document Is not Available") :

                        Navigator.push(context, MaterialPageRoute(builder: (_) =>
                            ImageViewPage(imageUrl: professionalImageUrl,
                                idType: "Document Viewer",
                                userName: name,
                                profession: profession
                            )));
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            border: Border.all(
                                color: Colors.black
                            )
                        ),
                        child: professionalImageUrl.isNotEmpty ? Image.network(professionalImageUrl,
                          fit: BoxFit.fill,
                        ) : const Icon(Icons.image,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    if(professionalImageUrl.isNotEmpty)...[
                      Column(
                        children: [
                          const Text("Yes"),
                          Checkbox(
                            value: isDocVerified,
                            checkColor: Colors.white,
                            activeColor: Colors.green,
                            onChanged: (value) {

                              Provider.of<CheckBoxProvider>(context, listen: false).docVerifyCheckList(uid.toString(), value!, isIdVerified);

                            },
                          ),
                        ],
                      ), //
                      // const SizedBox(width: 3,),
                      Column(
                        children: [
                          const Text("No"),
                          Checkbox(
                            value: isDocRejected,
                            checkColor: Colors.white,
                            activeColor: Colors.red,
                            onChanged: (value) {
                              Provider.of<CheckBoxProvider>(context, listen: false).docRejectedCheckList(uid.toString(), value! );
                            },
                          ),
                        ],
                      ),// Checkbox
                    ],
                  ],
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),


        ),
      );

  }


  static Widget verifiedProfessionalCard(
      context,
      VoidCallback? callback,
      String name,
      String profession,
      String address,
      String imageUrl,
      String idImageUrl,
      bool isIdVerified,
      String uid,
      bool isIdRejected,
      String professionalImageUrl,
      bool isDocVerified,
      bool isDocRejected,

      {String email= '', String phone = ''} )
  {

    UserSelected userSelected = Provider.of<UserSelected>(context);
    String _userID = userSelected.userID;

    return   InkWell(
      onTap: callback,
      splashColor: AppColor.orange,
      child: Card(
          color: _userID == uid ? Colors.black38 : AppColor.orange,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    ShowText.detailsText("Name:", fontWeight: FontWeight.bold,),
                    Expanded(
                      child: ShowText.detailsText(name),
                    ),
                    const SizedBox(width: 20,),
                    CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl.toString()),
                      radius: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    ShowText.detailsText("Profession: ", fontWeight: FontWeight.bold,),
                    Expanded(
                      child: ShowText.detailsText(profession),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
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
                ),
                const SizedBox(height: 05,),
                Row(
                  children: [
                    ShowText.detailsText("ID: ", fontWeight: FontWeight.bold,),
                    const SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) =>
                            ImageViewPage(imageUrl: idImageUrl,
                              idType: "Id Viewer",
                              userName: name,
                              profession: profession,
                            )));
                      },
                      child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              border: Border.all(
                                  color: Colors.black
                              )
                          ),
                          child: Image.network(idImageUrl,
                            fit: BoxFit.fill,
                          )
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      children: [
                        // const Text("Yes"),
                        ShowText.detailsText("Yes:"),

                        Checkbox(
                          value: isIdVerified,
                          checkColor: Colors.white,
                          activeColor: Colors.green,
                          onChanged: (value) {
                            Provider.of<CheckBoxProvider>(context, listen: false).idVerifyCheckList(uid.toString(), value!,isDocVerified );
                          },
                        ),],
                    ), //
                    const SizedBox(width: 10,),
                    Column(
                      children: [
                        // const Text("No"),
                        ShowText.detailsText("No:",),
                        Checkbox(
                          value: isIdRejected,
                          checkColor: Colors.white,
                          activeColor: Colors.red,
                          onChanged: (value) {
                            Provider.of<CheckBoxProvider>(context, listen: false).idRejectCheckList(uid.toString(), value! );
                          },
                        ),
                      ],
                    ),

                  ],
                ),
                const SizedBox(height: 05,),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ShowText.detailsText("Service ID: ", fontWeight: FontWeight.bold,),
                    InkWell(
                      onTap: (){
                        // String idUrl  =  _list[index].professionalImageUrl.toString();
                        Navigator.push(context, MaterialPageRoute(builder: (_) =>
                            ImageViewPage(imageUrl: professionalImageUrl,
                                idType: "Document Viewer",
                                userName: name,
                                profession: profession
                            )));
                      },
                      child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              border: Border.all(
                                  color: Colors.black
                              )
                          ),
                          child: Image.network(professionalImageUrl,
                            fit: BoxFit.fill,
                          )
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Column(
                      children: [
                        const Text("Yes"),
                        Checkbox(
                          value: isDocVerified,
                          checkColor: Colors.white,
                          activeColor: Colors.green,
                          onChanged: (value) {
                            Provider.of<CheckBoxProvider>(context, listen: false).docVerifyCheckList(uid.toString(), value!, isIdVerified);
                            },
                        ),
                      ],
                    ), //
                    // const SizedBox(width: 3,),
                    Column(
                      children: [
                        const Text("No"),
                        Checkbox(
                          value: isDocRejected,
                          checkColor: Colors.white,
                          activeColor: Colors.red,
                          onChanged: (value) {
                            Provider.of<CheckBoxProvider>(context, listen: false).docRejectedCheckList(uid.toString(), value! );
                          },
                        ),
                      ],
                    ),// Checkbox

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