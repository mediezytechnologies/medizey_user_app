import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../CommonWidgets/horizontal_spacing_widget.dart';
import '../../../../Consts/app_colors.dart';
import '../../../../Consts/text_style.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: kCardColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              bottomLeft: Radius.circular(10.r),
              bottomRight: Radius.circular(10.r),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            width: size.width * 0.7,
            decoration: BoxDecoration(
              color: kSubMainColor,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: kBorderColor),
            ),
            child: Center(
              child: Text(text, style: white13B500),
            ),
          ),
        ),
        const HorizontalSpacingWidget(width: 8),
        Container(
          height: size.width * .11,
          width: size.width * .11,
          decoration: BoxDecoration(
            color: kSubMainColor,
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: const AssetImage("assets/icons/profile pic.png"),
                color: kCardColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
