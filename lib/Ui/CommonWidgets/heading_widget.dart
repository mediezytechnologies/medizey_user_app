import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 16.sp, fontWeight: FontWeight.w500, color: kSubTextColor),
    );
  }
}
