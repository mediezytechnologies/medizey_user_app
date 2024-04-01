import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/HospitalScreen/hospital_screen.dart';

class HospitalCardWidget extends StatelessWidget {
  const HospitalCardWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.address,
      required this.department,
      required this.doctorCount,
      required this.hospitalId,
      required this.hospitalLocation});

  final String image;
  final String name;
  final String address;
  final String department;
  final String doctorCount;
  final String hospitalId;
  final String hospitalLocation;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HospitalScreen(
                hospitalId: hospitalId,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: .5, color: kSubTextColor),
        ),
        child: Row(
          children: [
            FadedScaleAnimation(
              scaleDuration: const Duration(milliseconds: 400),
              fadeDuration: const Duration(milliseconds: 400),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FancyShimmerImage(
                    height: 100.h,
                    width: 100.w,
                    boxFit: BoxFit.cover,
                    errorWidget: const Image(
                      image: AssetImage("assets/icons/no image.png"),
                    ),
                    imageUrl: image),
              ),
            ),
            const HorizontalSpacingWidget(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 220.w,
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const VerticalSpacingWidget(height: 2),
                SizedBox(
                  width: 220.w,
                  child: Text(
                    "$address, $hospitalLocation",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: kSubTextColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const VerticalSpacingWidget(height: 2),
                SizedBox(
                  width: 220.w,
                  child: Text(
                    department,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: kSubTextColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const VerticalSpacingWidget(height: 2),
                Text(
                  "$doctorCount Doctors available",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: kSubTextColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
