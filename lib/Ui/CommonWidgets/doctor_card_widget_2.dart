import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:mediezy_user/Model/Clinics/clinic_model.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/BookAppointmentScreen/book_appointment_screen.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/DoctorDetailsScreen/doctor_details_screen.dart';

import '../../ddd/application/get_docters/get_docters_bloc.dart';
import '../../ddd/domain/core/di/injectable.dart';
import '../../ddd/domain/docters_model/model/clinic.dart';

class DoctorCardWidget2 extends StatelessWidget {
  const DoctorCardWidget2(
      {super.key,
      required this.doctorId,
      required this.firstName,
      required this.lastName,
      required this.imageUrl,
      required this.mainHospitalName,
      required this.specialisation,
      required this.location,
      required this.clinicList,
      required this.userAwayFrom,
      required this.favurates,
   });

  final String doctorId;
  final String firstName;
  final String lastName;
  final String imageUrl;
  final String mainHospitalName;
  final String specialisation;
  final String location;
  final List<Clinic> clinicList;
  final String userAwayFrom;
  final Widget favurates;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool allZero =
        clinicList.every((clinic) => clinic.availableTokenCount == 0);
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(8.w, 0, 8.w, 4.h),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: kCardColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  FadedScaleAnimation(
                    scaleDuration: const Duration(milliseconds: 400),
                    fadeDuration: const Duration(milliseconds: 400),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FancyShimmerImage(
                          height: 80.h,
                          width: 80.w,
                          boxFit: BoxFit.contain,
                          errorWidget: const Image(
                              image: AssetImage("assets/icons/no image.png")),
                          imageUrl: imageUrl),
                    ),
                  ),
                  const HorizontalSpacingWidget(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VerticalSpacingWidget(height: 2),
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          "Dr.$firstName $lastName",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          specialisation,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: kSubTextColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const HorizontalSpacingWidget(width: 2),
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          mainHospitalName,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: kSubTextColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const HorizontalSpacingWidget(width: 2),
                      Row(
                        children: [
                          Text(
                            "Location: ",
                            style: TextStyle(
                                fontSize: 12.sp, color: kSubTextColor),
                          ),
                          Text(
                            location,
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(
                                IconlyLight.location,
                                size: 14.sp,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              SizedBox(
                                width: size.width * 0.38,
                                child: RichText(
                                  text: TextSpan(
                                    text: userAwayFrom,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: kTextColor,
                                        fontWeight: FontWeight.w500),
                                    children: [
                                      TextSpan(
                                          text: ' away',
                                          style: TextStyle(
                                              color: kSubTextColor,
                                              fontWeight: FontWeight.normal),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {})
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => MapsLauncher.launchQuery(
                                'Welcare Hospital, Sahodaran Ayyappan Road, Vyttila'),
                            child: Wrap(
                              children: [
                                Text(
                                  'Get Location',
                                  style: TextStyle(
                                      fontSize: 12.sp, color: kSubTextColor),
                                ),
                                Icon(
                                  CupertinoIcons.map_pin,
                                  color: kSecondaryColor,
                                  size: 14.sp,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              allZero
                  ? const SizedBox()
                  : Column(
                      children: [
                        const VerticalSpacingWidget(height: 10),
                        Text(
                          "Next available at",
                          style: TextStyle(
                              color: kTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp),
                        ),
                      ],
                    ),
              const VerticalSpacingWidget(height: 2),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: clinicList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return clinicList[index].availableTokenCount == 0
                        ? const SizedBox()
                        : Row(
                            children: [
                              Image(
                                image: const AssetImage(
                                    "assets/icons/clinic_icon.png"),
                                height: 20.h,
                                width: 20.w,
                                color: kTextColor,
                              ),
                              const HorizontalSpacingWidget(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${clinicList[index].clinicName} : ",
                                        style: TextStyle(
                                            color: kTextColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13.sp),
                                      ),
                                      Text(
                                        "${clinicList[index].availableTokenCount} Slots available",
                                        style: TextStyle(
                                            color: clinicList[index]
                                                        .availableTokenCount ==
                                                    0
                                                ? kTextColor
                                                : const Color(0xFF55B79B),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13.sp),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Next available token : ",
                                        style: TextStyle(
                                            color: kTextColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13.sp),
                                      ),
                                      Text(
                                        clinicList[index]
                                                    .nextAvailableTokenTime ==
                                                null
                                            ? "N/A"
                                            : clinicList[index]
                                                .nextAvailableTokenTime
                                                .toString(),
                                        style: TextStyle(
                                            color: kTextColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13.sp),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          );
                  }),
              const VerticalSpacingWidget(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorDetailsScreen(
                            doctorId: doctorId,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: size.height * 0.04,
                      width: size.width * .42,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kCardColor,
                          border: Border.all(color: kMainColor, width: 1.5.w)),
                      child: Center(
                        child: Text(
                          "View Profile",
                          style: TextStyle(
                              color: kMainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => BookAppointmentScreen(
                      //       clinicList: clinicList,
                      //       doctorId: doctorId,
                      //       doctorFirstName: firstName,
                      //       doctorSecondName: lastName,
                      //     ),
                      //   ),
                      // );
                    },
                    child: Container(
                      height: size.height * 0.04,
                      width: size.width * .42,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kMainColor),
                      child: Center(
                        child: Text(
                          "Book Clinic Visit",
                          style: TextStyle(
                              color: kCardColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
            top: size.height * 0.02,
            right: size.width * 0.04,
            child:
            favurates,
             )
      ],
    );
  }
}
