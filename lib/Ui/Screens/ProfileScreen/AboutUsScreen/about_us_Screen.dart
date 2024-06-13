// ignore_for_file: file_names

import 'dart:developer';

import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  // String _version = '';
  // Future<void> _loadVersionInfo() async {
  //   final packageInfo = await PackageInfo.fromPlatform();
  //   setState(() {
  //     _version = packageInfo.version;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // _loadVersionInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Welcome to Mediezy technologys, where health meets technology to empower individuals on their wellness journey. We are a dedicated team of healthcare professionals, technologists, and enthusiasts united by a common goal: to revolutionize healthcare accessibility and empower users to take control of their well-being",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: kTextColor),
              ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Center(
              //     child: Text(
              //       'App Version: $_version',
              //       style: red10B600,
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
