import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';

import '../../../CommonWidgets/text_style_widget.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon,
      required this.onTapFunction});

  final String title;
  final String subTitle;
  final IconData icon;
  final Function onTapFunction;

  @override
  Widget build(BuildContext context) {
    return FadedScaleAnimation(
      scaleDuration: const Duration(milliseconds: 400),
      fadeDuration: const Duration(milliseconds: 400),
      child: InkWell(
        onTap: () {
          onTapFunction();
        },
        child: Container(
          decoration: BoxDecoration(
              color: kCardColor, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpacingWidget(height: 5),
                Text(
                  title,
                  style: black14B600,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const VerticalSpacingWidget(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text(
                        subTitle,
                        style: grey12B500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Icon(
                        icon,
                        color: kSubTextColor,
                        size: 20.sp,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
