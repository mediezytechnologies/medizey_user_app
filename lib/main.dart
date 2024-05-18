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
import 'package:mediezy_user/ddd/infrastructure/demo_service/d.dart';
import 'package:mediezy_user/ddd/infrastructure/firebase_service/dd.dart';
import 'package:mediezy_user/firebase_options.dart';

import 'ddd/infrastructure/demo_service/emo.dart';
import 'ddd/infrastructure/firebase_service/firebase_auth_service.dart';
import 'ddd/infrastructure/firebase_service/notification_service.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
   log("its not working ");
  await Firebase.initializeApp();
   log("its not working ");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await configureInjection();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   

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
 // NotificationServices notificationServices = NotificationServices();
    NotificationServices notificationServices = NotificationServices();
final _messagingService =
      MessagingService(); 

  @override
  void initState() {
    super.initState();
    // notificationServices.requestNotificationPermisions();
    // notificationServices.isRefreshToken();
    // notificationServices.getDeviceToken().then((value) {
    //   log("not : $value");
    // });

    // notificationServices.forgroundMessage();
    // notificationServices.firebaseInit(context);
    // notificationServices.setupInteractMessage(context);

_messagingService
        .init(context); 

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
//LoginScreenGoogle()
              // LoginPageGoogle()
              //HomeScreenfireDemo()
              hasInternet ? const SplashScreen() : const InternetHandleScreen(),
        );
      },
    );
  }
}
