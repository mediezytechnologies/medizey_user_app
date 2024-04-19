import 'dart:developer';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediezy_user/Ui/CommonWidgets/bottom_navigation_control_widget.dart';
import 'package:mediezy_user/Ui/Screens/AuthenticationScreens/LoginScreen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../ddd/application/location_controller/locationcontroller.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> checkuserlogin() async {
    final preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');

    Future.delayed(
      const Duration(seconds: 3),
      () async{
        if (token == null) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false);
        } else {
            
          Future.delayed(Duration(seconds: 1)).then((value) =>
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) =>
                          const BottomNavigationControlWidget()),
                  (route) => false));
          locationController.fetchCountry();
         
          log("code${locationController.postCode.value}");
          //   Future.delayed(Duration(seconds: 2)).then((value) => PostCodeService.witnessService(locationController.postCode.value));
        }
      },
    );
  }

  final locationController = Get.put(LocationController());
  @override
  void initState() {
    checkuserlogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadedSlideAnimation(
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/splash_screen.jpg",
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      ),
    );
  }
}
