import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:shimmer/shimmer.dart';

//* health concern
Widget healthConcernLoadingWidget() {
  return Shimmer.fromColors(
    baseColor: kShimmerBaseColor,
    highlightColor: kShimmerHighlightColor,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 70.w,
                height: 75.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: 70.w,
                height: 75.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: 70.w,
                height: 75.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: 70.w,
                height: 75.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          const VerticalSpacingWidget(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 70.w,
                height: 75.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: 70.w,
                height: 75.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: 70.w,
                height: 75.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                width: 70.w,
                height: 75.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

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

//* home banner loading
Widget homeBannerLoadingWidget() {
  return Shimmer.fromColors(
    baseColor: kShimmerBaseColor,
    highlightColor: kShimmerHighlightColor,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Container(
        width: double.infinity,
        height: 100.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
