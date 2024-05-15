import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Model/GetAppointments/get_completed_appointments_model.dart';
import '../../../CommonWidgets/text_style_widget.dart';
import '../../../CommonWidgets/vertical_spacing_widget.dart';
import '../../../Consts/app_colors.dart';
import '../../AppointmentsScreen/CompletedAppointmentDetailsScreen/completed_appointment_details_screen.dart';
import '../../../CommonWidgets/row_text_widget.dart';

class OnceCompletedWidget extends StatelessWidget {
  const OnceCompletedWidget(
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
      required this.whenItsCome,
      required this.checkInTime,
      required this.checkOutTime});

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
  final String checkInTime;
  final String checkOutTime;

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
        padding:
            EdgeInsets.only(top: 8.0.h, bottom: 5.0.h, left: 8.w, right: 10.w),
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * .65,
                        child: Text(
                          "Dr. $doctorName",
                          style: black14B600,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                          width: size.width * .65,
                          child: Text(clinicName, style: grey12B500)),
                      SizedBox(
                          width: size.width * .65,
                          child: Text("$patientName for $symptoms",
                              style: grey12B500)),
                      SizedBox(
                        width: size.width * .65,
                        child: Row(
                          children: [
                            Text("$tokenDate | ", style: black12B500),
                            Text(tokenTime, style: black12B500),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * .65,
                        child: Row(
                          children: [
                            Text("check in time : ", style: grey12B500),
                            Text(checkInTime, style: black12B500),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * .65,
                        child: Row(
                          children: [
                            Text("check out time : ", style: grey12B500),
                            Text(checkInTime, style: black12B500),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            labTestName == "null"
                ? const SizedBox()
                : scanningTestName == "null"
                    ? const SizedBox()
                    : RowTextWidget(
                        heading: "Scanning", data: scanningTestName),
            const VerticalSpacingWidget(height: 2),
          ],
        ),
      ),
    );
  }
}
