import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';

class CommonButtonWidget extends StatelessWidget {
  const CommonButtonWidget(
      {super.key, required this.widget, required this.onTapFunction});

  final Widget widget;
  final Function onTapFunction;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onTapFunction();
      },
      child: Container(
        height: size.height * .06,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: widget,
        ),
      ),
    );
  }
}
