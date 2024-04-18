// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';

class HeadingViewAllWidget extends StatelessWidget {
  VoidCallback onTap;
  final String title;
  HeadingViewAllWidget({Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: kSubTextColor),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            "View all",
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: kMainColor),
          ),
        ),
      ],
    );
  }
}
