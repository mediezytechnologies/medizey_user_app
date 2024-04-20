import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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

  @override
  void initState() {
    super.initState();
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
          //CupertinoDatePickerDemo()
           hasInternet ? const SplashScreen() : const InternetHandleScreen(),
        );
      },
    );
  }
}
