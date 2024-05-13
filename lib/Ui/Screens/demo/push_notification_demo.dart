import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mediezy_user/ddd/infrastructure/notification_service.dart';

class DemoPushNotification extends StatefulWidget {
  const DemoPushNotification({super.key});

  @override
  State<DemoPushNotification> createState() => _DemoPushNotificationState();
}

class _DemoPushNotificationState extends State<DemoPushNotification> {
  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    super.initState();
  notificationServices.requesttNotificationPermission();
    notificationServices.forgoundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.isRefreshToken();
    notificationServices.getDiviceToken().then((value) {
      log(value);
    });
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Notification Service"),
      ),
      body: Column(children: [
        Text("Demo Notification Service")
      ],),
    );
  }
}
