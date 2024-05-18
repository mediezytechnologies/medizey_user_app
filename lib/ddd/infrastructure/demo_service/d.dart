import 'package:flutter/material.dart';

import '../firebase_service/notification_service.dart';

class HomeScreenfireDemo extends StatefulWidget {
  const HomeScreenfireDemo({super.key,});



  @override
  State<HomeScreenfireDemo> createState() => _HomeScreenfireDemoState();
}

class _HomeScreenfireDemoState extends State<HomeScreenfireDemo> {

  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();

    notificationServices.requestNotificationPermisions();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isRefreshToken();
    notificationServices.getDeviceToken().then((value) {
      print(value);
    });


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