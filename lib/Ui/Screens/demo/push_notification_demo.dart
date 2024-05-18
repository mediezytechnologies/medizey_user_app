

import 'package:flutter/material.dart';
import 'package:mediezy_user/ddd/infrastructure/firebase_service/notification_service.dart';

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

    // notificationServices.requestNotificationPermisions();
    // notificationServices.forgroundMessage();
    // notificationServices.firebaseInit(context);
    // notificationServices.setupInteractMessage(context);
    // notificationServices.isRefreshToken();
    // notificationServices.getDeviceToken().then((value) {
    //   print(value);
    // });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Home Screen'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Home Screen',
              ),
            ],
          ),
        ));
  }
}