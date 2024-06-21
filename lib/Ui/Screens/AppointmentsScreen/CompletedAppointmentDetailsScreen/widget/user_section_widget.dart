import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../CommonWidgets/vertical_spacing_widget.dart';
import '../../../../Consts/app_colors.dart';
import '../../../../Consts/text_style.dart';

class UserSectionWidget extends StatelessWidget {
  const UserSectionWidget({
    super.key,
    required this.size,
    required this.doctorImage,
    required this.doctorName,
    required this.clinicName,
    required this.tokenDate,
    required this.tokenTime,
    required this.patientName,
  });

  final Size size;
  final String doctorImage;
  final String doctorName;
  final String clinicName;
  final String tokenDate;
  final String tokenTime;
  final String patientName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          FadedScaleAnimation(
            scaleDuration: const Duration(milliseconds: 400),
            fadeDuration: const Duration(milliseconds: 400),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FancyShimmerImage(
                  height: size.height * .13,
                  width: size.width * .32,
                  boxFit: BoxFit.contain,
                  errorWidget: const Image(
                    image: AssetImage("assets/icons/no data.png"),
                  ),
                  imageUrl: doctorImage),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: size.width * .45,
                  child: Text(
                    "Dr $doctorName",
                    style: black14B600,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: size.width * .45,
                  child: Text(
                    clinicName,
                    style: grey12B500,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const VerticalSpacingWidget(height: 5),
                Row(
                  children: [
                    Row(
                      children: [
                        Text("$tokenDate | ", style: black12B500),
                        Text(tokenTime, style: black12B500),
                      ],
                    ),
                  ],
                ),
                const VerticalSpacingWidget(height: 5),
                Row(
                  children: [
                    Text("For: ", style: grey12B500),
                    SizedBox(
                      width: size.width * .45,
                      child: Text(
                        patientName,
                        style: black12B500,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const VerticalSpacingWidget(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}