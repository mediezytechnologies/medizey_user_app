import 'dart:developer';
import 'dart:io';

import 'package:analyzer/dart/ast/token.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationPlugin =
      FlutterLocalNotificationsPlugin();

  Future<String> getDiviceToken() async {
    String? token = await messaging.getToken();
    log("not tok : $token");
    return token!;
  }

  void isRefreshToken() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      log("token reseved");
      log("token reseved $event");
    });
  }

  void requesttNotificationPermission() async {
    if (Platform.isIOS) {
      await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true,
      );
    }
    NotificationSettings notificationSettings =
        await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      log("user is alredy granded permission");
    } else if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log("user is alredy granded provisional  permission");
    } else {
      log("user has denied permission");
    }
  }

  //forground//===
  Future forgoundMessage() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android!;

      log("notification tite: ${notification!.title}");
      log("notification tite: ${notification.body}");
      log("data : ${notification.body.toString()}");
      if (Platform.isIOS) {
        forgoundMessage();
      }
      if (Platform.isAndroid) {
        initLocalNotifications(context, message);
        showNotifications(message);
      }
    });
  }

  void initLocalNotifications(
      BuildContext context, RemoteMessage message) async {
    var androidInitSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosnitSettings = const DarwinInitializationSettings();
    var initSettings = InitializationSettings(
        android: androidInitSettings, iOS: iosnitSettings);
    await flutterLocalNotificationPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (details) {
        handleMessage(context, message);
      },
    );
  }

  void handleMessage(BuildContext context, RemoteMessage message) {
    log('handle message functon');
    if (message.data['type'] == 'text') {
      //redirect to new screen
    }
  }

  Future<void> showNotifications(RemoteMessage message) async {
    AndroidNotificationChannel androidNotificationChannel =
        AndroidNotificationChannel(
            message.notification!.android!.channelId.toString(),
            message.notification!.android!.channelId.toString(),
            importance: Importance.max,
            showBadge: true,
            playSound: true);

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      androidNotificationChannel.id.toString(),
      androidNotificationChannel.name.toString(),
      channelDescription: "Flutter Notifications",
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      ticker: 'tiker',
      sound: androidNotificationChannel.sound,
    );

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
            presentAlert: true, presentBadge: true, presentSound: true);
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);
    Future.delayed(Duration.zero, () {
      flutterLocalNotificationPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    });
  }

  Future<void> setupInteractMessages(BuildContext context) async {
    //when app is terminated//
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }
}
