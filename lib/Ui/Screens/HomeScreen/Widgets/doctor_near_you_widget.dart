// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/DoctorDetailsScreen/doctor_details_screen.dart';

import '../../../CommonWidgets/text_style_widget.dart';

class DoctorNearYouWidget extends StatefulWidget {
  const DoctorNearYouWidget(
      {Key? key,
      required this.doctorId,
      required this.firstName,
      required this.lastName,
      required this.imageUrl,
      required this.location,
      required this.specialisation,
      required this.favouriteStatus,
      required this.docterDistance,
      required this.favourites})
      : super(key: key);

  final String doctorId;
  final String firstName;
  final String lastName;
  final String imageUrl;
  final String location;
  final String specialisation;
  final int favouriteStatus;
  final String docterDistance;
  final Widget favourites;

  @override
  State<DoctorNearYouWidget> createState() => _DoctorNearYouWidgetState();
}

class _DoctorNearYouWidgetState extends State<DoctorNearYouWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              width: size.width * .335,
              decoration: BoxDecoration(
                color: kCardColor,
                borderRadius: BorderRadius.circular(8.r),
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
                        borderRadius: BorderRadius.circular(10.r),
                        child: FancyShimmerImage(
                            height: size.height * .12,
                            width: size.width * .32,
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
                      style: black13B500,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: Text(
                      widget.specialisation,
                      style: grey11B400,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: Text(
                      widget.location,
                      style: grey11B400,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  widget.docterDistance == 'null'
                      ? const SizedBox()
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Row(
                            children: [
                              Icon(
                                IconlyLight.location,
                                size: 14.sp,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: widget.docterDistance,
                                  style: black11B500,
                                  children: [
                                    TextSpan(
                                        text: ' away',
                                        style: grey10B400,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {})
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                ],
              ),
            ),
          ),
          Positioned(
            right: size.width * 0.04,
            top: size.height * 0.019,
            child: widget.favourites,
          )
        ],
      ),
    );
  }
}