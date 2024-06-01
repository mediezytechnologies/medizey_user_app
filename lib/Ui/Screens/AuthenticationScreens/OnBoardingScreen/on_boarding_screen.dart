import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Consts/app_colors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  Widget _reusePage(int index, BuildContext context, String buttonName,
      String title, String subTitle, String imagePath) {
    return Column(
      children: [
        const Spacer(flex: 1),
        SizedBox(
          height: 325.h,
          width: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          title,
          style: TextStyle(
              color: kTextColor,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 5.h),
        Container(
          width: 375.w,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
                color: kSubTextColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
        ),
        GestureDetector(
          onTap: () {
            //* index is 0-2
            if (index < 3) {
              //* animation
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
              );
            } else {
              //* jump to signin page
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/sign_in", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            height: 50.h,
            width: 325.w,
            decoration: BoxDecoration(
              color: kMainColor,
              borderRadius: BorderRadius.all(
                Radius.circular(15.w),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 2,
                  spreadRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
        const Spacer(flex: 3)
      ],
    );
  }
}
