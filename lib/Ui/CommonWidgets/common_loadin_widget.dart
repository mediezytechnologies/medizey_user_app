import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:shimmer/shimmer.dart';


//* loading doctor card
Widget doctorCardLoadingWidget() {
  return Shimmer.fromColors(
    baseColor: kShimmerBaseColor,
    highlightColor: kShimmerHighlightColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalSpacingWidget(height: 5),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          width: double.infinity,
          height: 200.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const VerticalSpacingWidget(height: 5),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          width: double.infinity,
          height: 200.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const VerticalSpacingWidget(height: 5),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          width: double.infinity,
          height: 200.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const VerticalSpacingWidget(height: 5),
      ],
    ),
  );
}
