// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/text_style_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';

class ViewAllButtonWidget extends StatelessWidget {
  VoidCallback onTap;
  final String buttonText;
  ViewAllButtonWidget({
    Key? key,
    required this.onTap,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        height: height * 0.06,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kCardColor,
          border: Border.all(
            color: kBorderColor,
          ),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(buttonText, style: grey13B600),
            const HorizontalSpacingWidget(width: 5),
            Icon(
              size: 17.sp,
              CupertinoIcons.eye,
              color: kSubTextColor,
            )
          ],
        ),
      ),
    );
  }
}
