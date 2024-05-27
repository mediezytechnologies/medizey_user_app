import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/GetAppointments/get_completed_appointments_model.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/AppointmentsScreen/CompletedAppointmentDetailsScreen/completed_appointment_details_screen.dart';
import '../../../CommonWidgets/text_style_widget.dart';

class CompletedAppointmentCardWidget extends StatelessWidget {
  const CompletedAppointmentCardWidget(
      {super.key,
      required this.doctorName,
      required this.doctorImage,
      required this.clinicName,
      required this.symptoms,
      required this.tokenDate,
      required this.tokenTime,
      required this.patientName,
      required this.note,
      required this.labTestName,
      required this.labName,
      required this.prescriptionImage,
      required this.prescriptions,
      required this.reviewAfter,
      required this.vitals,
      required this.scanningCenterName,
      required this.scanningTestName,
      required this.whenItStart,
      required this.whenItsCome});

  final String doctorName;
  final String doctorImage;
  final String clinicName;
  final String symptoms;
  final String tokenDate;
  final String tokenTime;
  final String patientName;
  final String note;
  final String labTestName;
  final String labName;
  final String prescriptionImage;
  final List<DoctorMedicines> prescriptions;
  final String reviewAfter;
  final List<Vitals> vitals;
  final String scanningCenterName;
  final String scanningTestName;
  final String whenItStart;
  final String whenItsCome;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CompletedAppointmentDetailsScreen(
              prescriptions: prescriptions,
              clinicName: clinicName,
              doctorImage: doctorImage,
              doctorName: doctorName,
              labName: labName,
              labTestName: labTestName,
              note: note,
              patientName: patientName,
              prescriptionImage: prescriptionImage,
              symptoms: symptoms,
              tokenDate: tokenDate,
              tokenTime: tokenTime,
              reviewAfter: reviewAfter,
              vitals: vitals,
              scanningCenterName: scanningCenterName,
              scanningTestName: scanningTestName,
              whenItStart: whenItStart,
              whenItsCome: whenItsCome,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(8.w, 4.h, 8.w, 4.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: kCardColor),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 0),
              child: Row(
                children: [
                  FadedScaleAnimation(
                    scaleDuration: const Duration(milliseconds: 400),
                    fadeDuration: const Duration(milliseconds: 400),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FancyShimmerImage(
                          height: size.height * .15,
                          width: size.width * .2,
                          boxFit: BoxFit.contain,
                          errorWidget: const Image(
                            image: AssetImage("assets/icons/no data.png"),
                          ),
                          imageUrl: doctorImage),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VerticalSpacingWidget(height: 10),
                        SizedBox(
                          width: size.width * .65,
                          child: Text(
                            "Dr $doctorName",
                            style: black14B600,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: size.width * .65,
                          child: Text(
                            clinicName,
                            style: grey12B500,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: size.width * .65,
                          child: Text(
                            symptoms,
                            style: grey12B500,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
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
                        Row(
                          children: [
                            Text(
                              "For : ",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: kSubTextColor),
                            ),
                            SizedBox(
                              width: size.width * .55,
                              child: Text(
                                patientName,
                                style: black12B500,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 5.w, 5.h),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "View More",
                  style: main15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
