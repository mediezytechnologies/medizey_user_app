import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
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

Widget feedBackLoadingWidget() {
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
          height: 160.h,
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

Widget chatUserLoadingWidget() {
  return Shimmer.fromColors(
    baseColor: kShimmerBaseColor,
    highlightColor: kShimmerHighlightColor,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          width: 250.w,
          height: 45.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const HorizontalSpacingWidget(width: 5),
        Container(
          height: 45.h,
          width: 45.w,
          decoration: BoxDecoration(
            color: kMainColor,
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image(
                image: const AssetImage("assets/icons/profile pic.png"),
                color: kCardColor,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget chatBotLoadingWidget() {
  return Shimmer.fromColors(
    baseColor: kShimmerBaseColor,
    highlightColor: kShimmerHighlightColor,
    child: Column(
      children: [
        const VerticalSpacingWidget(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 45.h,
              width: 45.w,
              decoration: BoxDecoration(
                color: kMainColor,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image(
                    image: const AssetImage("assets/icons/profile pic.png"),
                    color: kCardColor,
                  ),
                ),
              ),
            ),
            const HorizontalSpacingWidget(width: 5),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              width: 250.w,
              height: 45.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
