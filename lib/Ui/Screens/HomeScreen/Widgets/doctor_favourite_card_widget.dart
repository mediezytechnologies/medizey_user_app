// ignore_for_file: must_be_immutable
import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:mediezy_user/Model/Clinics/clinic_model.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/text_style.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/BookAppointmentScreen/book_appointment_screen.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/DoctorDetailsScreen/doctor_details_screen.dart';

class DoctorFavouriteCardWidget extends StatelessWidget {
  DoctorFavouriteCardWidget({
    super.key,
    required this.doctorId,
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
    required this.mainHospitalName,
    required this.specialisation,
    required this.location,
    required this.clinicList,
    required this.favourites,
  });

  final String doctorId;
  final String firstName;
  final String lastName;
  final String imageUrl;
  final String mainHospitalName;
  final String specialisation;
  final String location;
  final List<Clinics> clinicList;
  String? patientId;
  final Widget favourites;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width * .95,
          margin: EdgeInsets.fromLTRB(8.w, 0, 0.w, 4.h),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r), color: kCardColor),
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
                          height: size.height * .1,
                          width: size.width * .18,
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
                        width: size.width * .5,
                        child: Text(
                          "Dr.$firstName $lastName",
                          style: black13B500,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: size.width * .5,
                        child: Text(
                          specialisation,
                          style: grey11B400,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const HorizontalSpacingWidget(width: 2),
                      SizedBox(
                        width: size.width * .5,
                        child: Text(
                          mainHospitalName,
                          style: grey11B400,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const HorizontalSpacingWidget(width: 2),
                      Row(
                        children: [
                          Text("Location: ", style: grey11B400),
                          SizedBox(
                            width: size.width * .4,
                            child: Text(location,
                                style: black11B500,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const VerticalSpacingWidget(height: 10),
                  Text("Next available at", style: black14B600),
                ],
              ),
              const VerticalSpacingWidget(height: 2),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 1,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return clinicList[index].availableTokenCount == 0
                        ? clinicList[index].nextDateAvailableTokenTime == null
                            ? const SizedBox()
                            : Padding(
                                padding: EdgeInsets.only(bottom: 2.h),
                                child: Row(
                                  children: [
                                    Image(
                                      image: const AssetImage(
                                          "assets/icons/clinic_icon.png"),
                                      height: size.height * .05,
                                      width: size.width * .05,
                                      color: kTextColor,
                                    ),
                                    const HorizontalSpacingWidget(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("${clinicList[index].clinicName}",
                                            style: black12B500),
                                        Row(
                                          children: [
                                            Text("Next available : ",
                                                style: black12B500),
                                            Text(
                                                clinicList[index]
                                                            .nextDateAvailableTokenTime ==
                                                        null
                                                    ? "N/A"
                                                    : clinicList[index]
                                                        .nextDateAvailableTokenTime
                                                        .toString(),
                                                style: green12B500),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            clinicList[index]
                                                        .distanceFromClinic ==
                                                    null
                                                ? const SizedBox()
                                                : Row(
                                                    children: [
                                                      Text(
                                                          "${clinicList[index].distanceFromClinic.toString()} away",
                                                          style: black12B500),
                                                      const HorizontalSpacingWidget(
                                                          width: 80),
                                                    ],
                                                  ),
                                            GestureDetector(
                                              onTap: () {
                                                MapsLauncher.launchQuery(
                                                  clinicList[index]
                                                      .clinicAddress
                                                      .toString(),
                                                );
                                              },
                                              child: Wrap(
                                                children: [
                                                  Text('Get Location',
                                                      style: grey11B400),
                                                  const HorizontalSpacingWidget(
                                                      width: 5),
                                                  Icon(
                                                    IconlyLight.location,
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
                              )
                        : Row(
                            children: [
                              Image(
                                image: const AssetImage(
                                    "assets/icons/clinic_icon.png"),
                                height: size.height * .05,
                                width: size.width * .05,
                                color: kTextColor,
                              ),
                              const HorizontalSpacingWidget(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("${clinicList[index].clinicName} : ",
                                          style: black12B500),
                                      Text(
                                        "${clinicList[index].availableTokenCount} Slots available",
                                        style: TextStyle(
                                            color: clinicList[index]
                                                        .availableTokenCount ==
                                                    0
                                                ? kTextColor
                                                : kSecondaryColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.sp),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Next available token : ",
                                          style: black12B500),
                                      Text(
                                          clinicList[index]
                                                      .nextAvailableTokenTime ==
                                                  null
                                              ? "N/A"
                                              : clinicList[index]
                                                  .nextAvailableTokenTime
                                                  .toString(),
                                          style: black12B500),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      clinicList[index].distanceFromClinic ==
                                              null
                                          ? const SizedBox()
                                          : Row(
                                              children: [
                                                Text(
                                                    "${clinicList[index].distanceFromClinic.toString()} away",
                                                    style: black12B500),
                                                const HorizontalSpacingWidget(
                                                    width: 80),
                                              ],
                                            ),
                                      GestureDetector(
                                        onTap: () {
                                          MapsLauncher.launchQuery(
                                            clinicList[index]
                                                .clinicAddress
                                                .toString(),
                                          );
                                        },
                                        child: Wrap(
                                          children: [
                                            Text('Get Location',
                                                style: grey11B400),
                                            const HorizontalSpacingWidget(
                                                width: 5),
                                            Icon(
                                              IconlyLight.location,
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
                            patientId: patientId,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: size.height * 0.04,
                      width: size.width * .42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: kCardColor,
                        border: Border.all(color: kMainColor, width: 1.5.w),
                      ),
                      child: Center(
                        child: Text("View Profile", style: main12B600),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookAppointmentScreen(
                            clinicList: clinicList,
                            doctorId: doctorId,
                            doctorFirstName: firstName,
                            doctorSecondName: lastName,
                            patientId: patientId,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: size.height * 0.04,
                      width: size.width * .42,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: kMainColor),
                      child: Center(
                        child: Text("Book Clinic Visit", style: white12B600),
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
          child: favourites,
        ),
      ],
    );
  }
}
