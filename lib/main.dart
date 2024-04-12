import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/Consts/app_theme_style.dart';
import 'package:mediezy_user/Ui/Consts/bloc_providers.dart';
import 'package:mediezy_user/Ui/Screens/AuthenticationScreens/SplashScreen/splash_screen.dart';
import 'package:mediezy_user/Ui/Screens/demo/l.dart';
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

class Mediezy extends StatelessWidget {
  const Mediezy({super.key});

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
          theme: appThemeStyle(),
          home:  SplashScreen(),
        );
      },
    );
  }
}
