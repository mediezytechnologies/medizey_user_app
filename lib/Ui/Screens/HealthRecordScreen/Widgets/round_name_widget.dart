import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';

class RoundNameWidget extends StatelessWidget {
  const RoundNameWidget(
      {super.key,
      required this.containerColor,
      required this.textColor,
      required this.patientName,
      required this.patientFirstLetter,
      required this.patientSecondLetter});

  final Color containerColor;
  final Color textColor;
  final String patientName;
  final String patientFirstLetter;
  final String patientSecondLetter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FadedScaleAnimation(
          scaleDuration: const Duration(milliseconds: 400),
          fadeDuration: const Duration(milliseconds: 400),
          child: Container(
            margin: EdgeInsets.only(right: 4.w),
            height: 39.h,
            width: 39.w,
            decoration: BoxDecoration(
              color: containerColor,
              shape: BoxShape.circle,
              border: Border.all(color: kMainColor),
            ),
            child: Center(
              child: Text(
                "$patientFirstLetter$patientSecondLetter",
                style: TextStyle(
                  color: textColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 35.w,
          child: Text(
            patientName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: kTextColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
