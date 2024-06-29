import 'dart:developer';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mediezy_user/Ui/CommonWidgets/bottom_navigation_control_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../ddd/application/location_controller/locationcontroller.dart';
import '../../../../ddd/application/notification_token/notificatio_token_bloc.dart';
import '../OnBoardingScreen/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> checkuserlogin() async {
    BlocProvider.of<NotificatioTokenBloc>(context)
        .add(const NotificatioTokenEvent.started());
    final preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');

    Future.delayed(
      const Duration(seconds: 3),
      () async {
        if (token == null) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
              (route) => false);
        } else {
          Future.delayed(const Duration(seconds: 1))
              .then((value) => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => BottomNavigationControlWidget(
                      selectedIndex: 0,
                    ),
                  ),
                  (route) => false));
          BlocProvider.of<NotificatioTokenBloc>(context).add(
            const NotificatioTokenEvent.started(),
          );
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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: FadedSlideAnimation(
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child: Image.asset(
                "assets/images/sp1.jpg",
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
