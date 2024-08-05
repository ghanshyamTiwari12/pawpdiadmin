// import 'dart:convert';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:petfindernetwork/Web_helper/loginsignupRepo.dart';
// import 'package:provider/provider.dart';
//
// final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
//
// void registerNotification(currentUserId, context) {
//   firebaseMessaging.requestPermission();
//   FirebaseMessaging.onMessage.listen((event) {
//     var message = event.data;
//     showNotification(message['notification']);
//     Provider.of<LoginSignupRepo>(context, listen: false).logout().then((value) {
//       Navigator.of(context).popUntil(ModalRoute.withName('/'));
//     });
//   });
//   // firebaseMessaging.
//   // firebaseMessaging.(onMessage: (Map<String, dynamic> message) {
//   //   // print('onMessage: $message');
//
//   //   return;
//   // }, onResume: (Map<String, dynamic> message) {
//   //   // print('onResume: $message');
//   //   return;
//   // }, onLaunch: (Map<String, dynamic> message) {
//   //   //  print('onLaunch: $message');
//   //   return;
//   // });
//
//   firebaseMessaging.getToken().then((token) {
//     // print('token: $token');
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(currentUserId)
//         .update({'pushToken': token});
//   }).catchError((err) {
//     debugPrint(err.message.toString());
//     // Fluttertoast.showToast(msg: err.message.toString());
//   });
// }
//
// void configLocalNotification() {
//   var initializationSettingsAndroid =
//       const AndroidInitializationSettings('@mipmap/ic_launcher');
//   var initializationSettingsIOS = const DarwinInitializationSettings();
//   var initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//     iOS: initializationSettingsIOS,
//   );
//   flutterLocalNotificationsPlugin.initialize(initializationSettings);
// }
//
// void showNotification(message) async {
//   var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//     'com.hernestinc.petfinder',
//     'Found It',
//     channelDescription: '',
//     playSound: true,
//     enableVibration: true,
//     importance: Importance.max,
//     priority: Priority.high,
//   );
//   var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
//   var platformChannelSpecifics = NotificationDetails(
//     android: androidPlatformChannelSpecifics,
//     iOS: iOSPlatformChannelSpecifics,
//   );
//   await flutterLocalNotificationsPlugin.show(
//     0,
//     message['title'].toString(),
//     message['body'].toString(),
//     platformChannelSpecifics,
//     payload: json.encode(message),
//   );
// }
//
//  void scheduleNotification(String title, String body) async{
//   AndroidNotificationDetails androidNotificationDetails =
//       const AndroidNotificationDetails('com.hernestinc.petfinder', 'Found It',
//       importance: Importance.max,
//         priority: Priority.high,
//       );
//   NotificationDetails notificationDetails = NotificationDetails(
//     android: androidNotificationDetails
//   );
//
// await flutterLocalNotificationsPlugin.periodicallyShow(
//     0,
//     title,
//     body,
//     RepeatInterval.everyMinute,
//     notificationDetails);
//
//  }
