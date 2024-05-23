
import 'dart:async';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/internet_handle_screen.dart';
import 'package:mediezy_user/Ui/Consts/app_theme_style.dart';
import 'package:mediezy_user/Ui/Consts/bloc_providers.dart';
import 'package:mediezy_user/Ui/Screens/AuthenticationScreens/SplashScreen/splash_screen.dart';
import 'package:mediezy_user/ddd/domain/core/di/injectable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mediezy_user/firebase_options.dart';

import 'ddd/infrastructure/firebase_service/dd.dart';
import 'ddd/infrastructure/firebase_service/notification_service.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
   log("its not working ");
  await Firebase.initializeApp();
   log("its not working ");
}
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async {
//   await Firebase.initializeApp();
// }


Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await configureInjection();
  await GetStorage.init();
  
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: const Mediezy(),
    ),
  );
}

class Mediezy extends StatefulWidget {
  const Mediezy({super.key});

  @override
  State<Mediezy> createState() => _MediezyState();
}

class _MediezyState extends State<Mediezy> {
  late StreamSubscription<ConnectivityResult> subscription;
   bool hasInternet = false;
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
   
      notificationServices.requestNotificationPermisions();
       notificationServices.firebaseInit(context);
    notificationServices.isRefreshToken();
    notificationServices.getDeviceToken().then((value) {
      log("not : $value");
    });

    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      handleConnectivityChange(result);
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  void handleConnectivityChange(ConnectivityResult result) {
    setState(() {
      hasInternet = result != ConnectivityResult.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mediezy User',
             theme: appThemeStyle(context),
          home:
        //  HomeScreenD()
          hasInternet ? const SplashScreen() : const InternetHandleScreen(),
        );
      },
    );
  }
}
