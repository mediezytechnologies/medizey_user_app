import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:shimmer/shimmer.dart';

//* up coming appointments
Widget upComingAppointmentsLoadingWidget() {
  return Shimmer.fromColors(
    baseColor: kShimmerBaseColor,
    highlightColor: kShimmerHighlightColor,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150.w,
                height: 18.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: 80.w,
                height: 18.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          const VerticalSpacingWidget(height: 5),
          Container(
            width: double.infinity,
            height: 170.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const VerticalSpacingWidget(height: 5),
        ],
      ),
    ),
  );
}

//* doctor card home screen
Widget doctorCardMainLoadingWidget() {
  return Shimmer.fromColors(
    baseColor: kShimmerBaseColor,
    highlightColor: kShimmerHighlightColor,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpacingWidget(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150.w,
                height: 18.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          const VerticalSpacingWidget(height: 5),
          Container(
            width: double.infinity,
            height: 170.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const VerticalSpacingWidget(height: 5),
        ],
      ),
    ),
  );
}

//* home banner loading
Widget homeBannerLoadingWidget() {
  return Shimmer.fromColors(
    baseColor: kShimmerBaseColor,
    highlightColor: kShimmerHighlightColor,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Container(
        width: double.infinity,
        height: 90.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

Widget doctorNearYouLoadingWidget(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  return Shimmer.fromColors(
    baseColor: kShimmerBaseColor,
    highlightColor: kShimmerHighlightColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 200,
          height: 18.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const VerticalSpacingWidget(height: 5),
        Row(
          children: [
            const HorizontalSpacingWidget(width: 5),
            Container(
              width: 140.w,
              height: 205.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const HorizontalSpacingWidget(width: 5),
            Container(
              width: 140.w,
              height: 205.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const HorizontalSpacingWidget(width: 5),
            Container(
              width: 140.w,
              height: 205.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const HorizontalSpacingWidget(width: 5),
          ],
        ),
        const VerticalSpacingWidget(height: 5),
        Container(
          height: height * 0.06,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    ),
  );
}

Widget hospitalsLoadingWidget(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  return Shimmer.fromColors(
    baseColor: kShimmerBaseColor,
    highlightColor: kShimmerHighlightColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 250.w,
          height: 18.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const VerticalSpacingWidget(height: 5),
        Container(
          width: double.infinity,
          height: 100.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const VerticalSpacingWidget(height: 5),
        Container(
          width: double.infinity,
          height: 100.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const VerticalSpacingWidget(height: 5),
        Container(
          height: height * 0.06,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    ),
  );
}
