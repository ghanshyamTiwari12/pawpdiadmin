import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:petfindernetwork/Web_helper/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Preferences {
  const Preferences._();

  static late SharedPreferences preferences;
  static const keyUserData = "userData";
  static const keyFcmToken = "fcmToken";
  static const keyThemeMode = "themeMode";
  static const keyLocale = "locale";

  static Future<void> initPreferences() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveFcmToken(String? fcmToken) async {
    return await preferences.setString(keyFcmToken, fcmToken!);
  }

  static String? getFcmToken() {

    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   print('Got a message whilst in the foreground!');
    //   print('Message data: ${message.data}');
    //
    //   if (message.notification != null) {
    //     print('Message also contained a notification: ${message.notification}');
    //   }
    // });

    return preferences.getString(keyFcmToken);


  }

  static Future<bool> saveThemeMode(String? themeMode) async {
    return await preferences.setString(keyThemeMode, themeMode!);
  }



  static Future<bool> saveLocale(String? locale) async {
    return await preferences.setString(keyLocale, locale ?? 'en');
  }

  static Locale getLocale() {
    String? value = preferences.getString(keyLocale);
    return Locale(value ?? 'en');
  }

  static Future<bool> saveUserData(Map<String, dynamic>? userData) async {
    UserProvider().setUserData(userData);
    return await preferences.setString(keyUserData, json.encode(userData));
  }

  static Future<bool> updateUserData(Map<String, dynamic>? newData) async {
    final Map<String, dynamic> userData = getUserData() ?? {};
    newData?.forEach((key, value) {
      userData[key] = value;
    });
    UserProvider().setUserData(userData);
    return await preferences.setString(keyUserData, json.encode(userData));
  }

  static Map<String, dynamic>? getUserData() {
    final String? value = preferences.getString(keyUserData);
    if (kDebugMode) {
      print('======keyUserData---${keyUserData.toString()}');
    }

    return value != null ? json.decode(value) : null;
  }



  static Future<bool> clearData() async => await preferences.clear();




// Future<void> saveHistory()async{
//   await preferences.setStringList(key, value);
// }
//
// void getHistory()async{
//   preferences.getStringList(key);
// }
}
