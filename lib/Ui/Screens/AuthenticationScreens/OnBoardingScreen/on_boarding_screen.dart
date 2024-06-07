import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Screens/AuthenticationScreens/LoginScreen/login_screen.dart';
import '../../../Consts/app_colors.dart';
import '../../../Consts/text_style.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF279B8F),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (newIndex) {
              setState(() {
                currentPageIndex = newIndex;
              });
            },
            children: [
              _reusePage(
                  imagePath: 'assets/images/slide_screen_one.png',
                  mainText: 'Doctor Select',
                  subText:
                      'Easily search for your doctor without\nAny Complication'),
              _reusePage(
                  imagePath: 'assets/images/slide_screen_two.png',
                  mainText: 'Select Timeslot',
                  subText:
                      'Booking your prefered doctor appointment is\nJust a few steps away'),
              _reusePage(
                  imagePath: 'assets/images/slide_screen_three.png',
                  mainText: 'Estimate Time',
                  subText:
                      'No more sitting around for hours before\nYou can see your doctor'),
              _reusePage(
                  imagePath: 'assets/images/slide_screen_four.png',
                  mainText: 'Health Record',
                  subText:
                      'All health records - prescription/reports\nOrganized digitally'),
            ],
          ),
          Positioned(
            bottom: 45.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: kCardColor, size: 20.sp),
                  onPressed: currentPageIndex > 0
                      ? () => pageController.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.decelerate,
                          )
                      : null,
                  disabledColor: Colors.grey,
                ),
                const HorizontalSpacingWidget(width: 2),
                DotsIndicator(
                  position: currentPageIndex,
                  dotsCount: 4,
                  decorator: DotsDecorator(
                    spacing: EdgeInsets.symmetric(horizontal: 3.w),
                    color: Colors.white30,
                    activeColor: kCardColor,
                    size: const Size.square(10.0),
                    activeSize: const Size.square(10.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                ),
                const HorizontalSpacingWidget(width: 2),
                currentPageIndex == 3
                    ? IconButton(
                        icon: Icon(Icons.arrow_forward, color: kCardColor),
                        onPressed: () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (route) => false,
                        ),
                      )
                    : IconButton(
                        icon: Icon(Icons.arrow_forward,
                            color: kCardColor, size: 20.sp),
                        onPressed: () => pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.decelerate,
                        ),
                      ),
              ],
            ),
          ),
          Positioned(
            right: 15.w,
            top: 45.h,
            child: GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (conetxt) => const LoginScreen(),
                    ),
                    (route) => false);
              },
              child: Text("Skip>>", style: white14B500),
            ),
          )
        ],
      ),
    );
  }

  Widget _reusePage(
      {required String imagePath,
      required String mainText,
      required String subText}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.fill,
        ),
        const VerticalSpacingWidget(height: 10),
        Text(mainText, style: white30B),
        const VerticalSpacingWidget(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Text(
            subText,
            textAlign: TextAlign.center,
            style: white16B500,
          ),
        ),
      ],
    );
  }
}
