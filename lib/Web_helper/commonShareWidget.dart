import 'package:another_flushbar/flushbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petfindernetwork/Web_helper/colors.dart';
import 'package:petfindernetwork/Web_helper/assets.gen.dart';
import 'package:petfindernetwork/Web_helper/inputValidator.dart';
import 'package:petfindernetwork/views/loginSignUp/login.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../Web_login/web_login.dart';

class CommonShareWidget {

  static Widget signInUpbutton(title, VoidCallback callback, context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        // width: MediaQuery.of(context).size.width * 0.15,

        child: Center(child: Text(title)),
      ),
    );
  }

  static Widget flatTextButtonLogInUp(
      title, buttonText, VoidCallback callback) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(color: AppColor.blackColor),
        ),
        const SizedBox(
          width: 5.0,
        ),
        InkWell(
          onTap: callback,
          child: Text(
            buttonText,
            style: TextStyle(
              color: AppColor.blackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  static Widget textWidget(controller, hintext, int pos, keyBoard, isobsecure,
      [errortext]) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextFormField(
        keyboardType: keyBoard,
        obscureText: isobsecure,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintext,
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.blackColor)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.blackColor)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.blackColor)),
        ),
        validator: (value) {
          switch (pos) {
            case 1:
              return InputValidator.isEmail(value!);
            case 2:
              return InputValidator.passWordValidation(value!);
            case 3:
              return InputValidator.validateMobile(value!);
            default:
              return InputValidator.emptyTextvalidator(value!, errortext);
          }
        },
      ),
    );
  }

  static showFlushBar(
      {String? title, String? message, required context, required duration}) {
    Flushbar(
      title: title,
      message: message,
      duration: Duration(seconds: duration),
      backgroundColor: AppColor.orange,
    ).show(context);
  }

  static showColorFlushBar(
      {String? title, String? message, required context, required duration, required color}) {
    Flushbar(
      title: title,
      message: message,
      duration: Duration(seconds: duration),
      backgroundColor: color ,
    ).show(context);
  }

  static Widget circularLoader() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: 300,
          height: 100 ,
          decoration: BoxDecoration(
            color: AppColor.orangeWithOpacity,
            borderRadius: const BorderRadius.all(Radius.circular(30))
          ),
          child: const Column(
            children: [
              SizedBox(height: 10,),
              Text("In Progress",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 10,),
              CircularProgressIndicator(
                color: Colors.black,
              )

            ],
          ),
        ),
      ),
    );
  }


  static Future buildErrorDialog(BuildContext context, message) {
    FocusScope.of(context).requestFocus(FocusNode());
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: const Text('Error Message'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        );
      },
      context: context,
    );
  }

  static Widget imageNetwork({
    required imageurl,
    height,
    width,
    borderadius,
    elevationCard,
    shape,
    BoxFit? fit,
  })
  {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderadius ?? 0.0),
        child: Card(
          shape: shape,
          clipBehavior: Clip.antiAlias,
          elevation: elevationCard ?? 0.0,
          child: CachedNetworkImage(
            fit: fit ?? BoxFit.cover,
            imageUrl: imageurl,
            placeholder: (_, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              enabled: true,
              child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.white),
            ),
            // errorWidget: (context, url, error) => Icon(Icons.broken_image),
            errorWidget: (context, url, error) => Assets.images.logo.image(),

          ),
        ),
      ),
    );
  }

  static String? timeAgo(dynamic serverTimeStamp) {
    if (serverTimeStamp != null) {
      final currentTime = DateTime.now();
      // Timestamp? timestamp;
      if (serverTimeStamp is Timestamp) {
        final difference = currentTime.difference(serverTimeStamp.toDate());
        return timeago.format(currentTime.subtract(difference));
      }
    }
    return null;
  }

  // static Future<dynamic> goToAnotherPage({
  //   required Widget nextPage,
  //   required context,
  //   bool checkLogin = false,
  // }) {
  //   late Widget next;
  //   if (!checkLogin) {
  //     next = nextPage;
  //   } else {
  //     final isLoggedIn = Provider.of<User?>(context, listen: false) != null;
  //     next = isLoggedIn ? nextPage : const WebLogin();
  //   }
  //   return Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (BuildContext context) => next,
  //     ),
  //   );
  // }
  //

  static showHideLoading(bool status) {
    return status;
    }

}
