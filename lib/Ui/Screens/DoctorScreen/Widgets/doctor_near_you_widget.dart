import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/DoctorDetailsScreen/doctor_details_screen.dart';

class DoctorNearYouWidget extends StatefulWidget {
  const DoctorNearYouWidget(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.imageUrl,
      required this.location,
      required this.doctorId,
      required this.specialisation,
      required this.favouriteStatus});

  final String doctorId;
  final String firstName;
  final String lastName;
  final String imageUrl;
  final String location;
  final String specialisation;
  final int favouriteStatus;

  @override
  State<DoctorNearYouWidget> createState() => _DoctorNearYouWidgetState();
}

class _DoctorNearYouWidgetState extends State<DoctorNearYouWidget> {
  bool isClicked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorDetailsScreen(
              doctorId: widget.doctorId,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 8.w, 0),
            child: Container(
              height: 185.h,
              width: 130.w,
              decoration: BoxDecoration(
                color: kCardColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FadedScaleAnimation(
                      scaleDuration: const Duration(milliseconds: 400),
                      fadeDuration: const Duration(milliseconds: 400),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: FancyShimmerImage(
                            height: 110.h,
                            width: 110.w,
                            boxFit: BoxFit.contain,
                            errorWidget: const Image(
                              image: AssetImage("assets/icons/no image.png"),
                            ),
                            imageUrl: widget.imageUrl),
                      ),
                    ),
                  ),
                  const VerticalSpacingWidget(height: 2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: Text(
                      "Dr ${widget.firstName} ${widget.lastName}",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: kTextColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: SizedBox(
                      width: 120.w,
                      child: Text(
                        widget.specialisation,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: kSubTextColor),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: SizedBox(
                      width: 120.w,
                      child: Text(
                        widget.location,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: kSubTextColor),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
