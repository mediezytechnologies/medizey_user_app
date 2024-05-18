// import 'dart:developer';
// import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:mediezy_user/Ui/Screens/ProfileScreen/SavedDoctorsScreen/saved_doctors_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class NotificationServices {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;

//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   Future<String> getDeviceToken() async {
//     final preferences = await SharedPreferences.getInstance();
//     String? token = await messaging.getToken();
//     log("FCM Token: $token");
//     if (token != null) {
//       await preferences.setString('fcmToken', token);
//       return token;
//     } else {
//       throw Exception("Failed to get FCM token");
//     }
//   }

//   void isRefreshToken() {
//     messaging.onTokenRefresh.listen((token) async {
//       log('Token Refreshed: $token');
//       final preferences = await SharedPreferences.getInstance();
//       await preferences.setString('fcmToken', token);
//     });
//   }

//   Future<void> requestNotificationPermissions() async {
//     if (Platform.isIOS) {
//       await messaging.requestPermission(
//         alert: true,
//         announcement: true,
//         badge: true,
//         carPlay: true,
//         criticalAlert: true,
//         provisional: true,
//         sound: true,
//       );
//     }

//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: true,
//       criticalAlert: true,
//       provisional: true,
//       sound: true,
//     );

//     switch (settings.authorizationStatus) {
//       case AuthorizationStatus.authorized:
//         log('User granted permissions');
//         break;
//       case AuthorizationStatus.provisional:
//         log('User granted provisional permissions');
//         break;
//       default:
//         log('User denied permissions');
//         break;
//     }
//   }

//   Future<void> foregroundMessage() async {
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }

//   void firebaseInit(BuildContext context) {
//     FirebaseMessaging.onMessage.listen((message) {
//       debugPrint('Got a message whilst in the foreground!');
//       debugPrint('Message data: ${message.notification?.title}');

//       RemoteNotification? notification = message.notification;
//       if (notification != null) {
//         log("Notification title: ${notification.title}");
//         log("Notification body: ${notification.body}");
//         log("Data: ${message.data}");

//         if (Platform.isIOS) {
//           foregroundMessage();
//         }

//         if (Platform.isAndroid) {
//           initLocalNotifications(context, message);
//           showNotification(message);
//         }
//       }
//     });
//   }

//   Future<void> initLocalNotifications(BuildContext context, RemoteMessage message) async {
//     const androidInitSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
//     const iosInitSettings = DarwinInitializationSettings();

//     final initSettings = InitializationSettings(android: androidInitSettings, iOS: iosInitSettings);

//     await _flutterLocalNotificationsPlugin.initialize(
//       initSettings,
//       onDidReceiveNotificationResponse: (payload) {
//         handleMessage(context, message);
//       },
//     );
//   }

//   void handleMessage(BuildContext context, RemoteMessage message) {
//     log('Handling message');

//     String? messageType = message.data['type'];
//     if (messageType != null) {
//       log('Message type: $messageType');
//       log('Message data: ${message.data}');

//       Widget screen;

//       switch (messageType) {
//         case 'text':
//           screen = SavedDoctorsScreen();
//           break;
//         case 'chat':
//           screen = ProfileScreen(); // Replace with the actual screen for chat
//           break;
//         default:
//           log('Unknown message type: $messageType');
//           return;
//       }

//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => screen),
//       );
//     }
//   }

//   Future<void> showNotification(RemoteMessage message) async {
//     if (message.notification?.android == null) return;

//     AndroidNotificationChannel androidNotificationChannel = AndroidNotificationChannel(
//       message.notification!.android!.channelId ?? 'default_channel_id',
//       message.notification!.android!.channelId ?? 'default_channel_name',
//       importance: Importance.max,
//       showBadge: true,
//       playSound: true,
//     );

//     AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
//       androidNotificationChannel.id,
//       androidNotificationChannel.name,
//       channelDescription: 'Flutter Notifications',
//       importance: Importance.max,
//       priority: Priority.high,
//       playSound: true,
//       ticker: 'ticker',
//     );

//     const darwinNotificationDetails = DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//     );

//     NotificationDetails notificationDetails = NotificationDetails(
//       android: androidNotificationDetails,
//       iOS: darwinNotificationDetails,
//     );

//     await _flutterLocalNotificationsPlugin.show(
//       0,
//       message.notification?.title ?? 'Notification',
//       message.notification?.body ?? '',
//       notificationDetails,
//     );
//   }

//   Future<void> setupInteractMessage(BuildContext context) async {
//     RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
//     if (initialMessage != null) {
//       handleMessage(context, initialMessage);
//     }

//     FirebaseMessaging.onMessageOpenedApp.listen((message) {
//       handleMessage(context, message);
//     });
//   }
// }