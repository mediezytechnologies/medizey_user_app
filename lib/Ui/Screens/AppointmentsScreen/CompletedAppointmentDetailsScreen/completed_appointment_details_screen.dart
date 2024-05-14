import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/GetAppointments/get_completed_appointments_model.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';

import '../../../CommonWidgets/text_style_widget.dart';
import '../../../CommonWidgets/row_text_widget.dart';
import 'widget/vitals_row_text_widget.dart';

class CompletedAppointmentDetailsScreen extends StatelessWidget {
  const CompletedAppointmentDetailsScreen({
    super.key,
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
  });

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appointment Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
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
                    padding: EdgeInsets.only(left: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: size.width * .5,
                          child: Text(
                            "Dr $doctorName",
                            style: black14B600,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: size.width * .5,
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
                              width: size.width * .55,
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
              Text("Additional Details", style: grey13B600),
              const VerticalSpacingWidget(height: 5),
              RowTextWidget(heading: "Appointment for", data: symptoms),
              const VerticalSpacingWidget(height: 5),
              reviewAfter == "null"
                  ? Container()
                  : Column(
                      children: [
                        RowTextWidget(
                          heading: "Review after",
                          data: "$reviewAfter days",
                        ),
                        const VerticalSpacingWidget(height: 5),
                      ],
                    ),
              whenItStart == "null"
                  ? Container()
                  : Column(
                      children: [
                        RowTextWidget(
                          heading: "When did start",
                          data: whenItsCome,
                        ),
                        const VerticalSpacingWidget(height: 5),
                      ],
                    ),
              whenItsCome == "null"
                  ? Container()
                  : Column(
                      children: [
                        RowTextWidget(
                          heading: "Intensity",
                          data: whenItStart,
                        ),
                        const VerticalSpacingWidget(height: 5),
                      ],
                    ),
              vitals.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Vitals : ", style: black13B500),
                        const VerticalSpacingWidget(height: 5),
                        ListView.builder(
                            itemCount: vitals.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 5.h),
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kCardColor,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        vitals[index].height == null
                                            ? const SizedBox()
                                            : VitalsRowTextWidget(
                                                heading: "Height",
                                                data:
                                                    "${vitals[index].height.toString()} cm",
                                              ),
                                        const HorizontalSpacingWidget(
                                            width: 10),
                                        vitals[index].weight == null
                                            ? const SizedBox()
                                            : VitalsRowTextWidget(
                                                heading: "Weight",
                                                data:
                                                    "${vitals[index].weight.toString()} kg",
                                              ),
                                        const HorizontalSpacingWidget(
                                            width: 10),
                                        vitals[index].heartRate == null
                                            ? const SizedBox()
                                            : VitalsRowTextWidget(
                                                heading: "Heartrate",
                                                data:
                                                    "${vitals[index].heartRate.toString()} BPM",
                                              ),
                                      ],
                                    ),
                                    const VerticalSpacingWidget(height: 5),
                                    Row(
                                      children: [
                                        vitals[index].temperature == null
                                            ? const SizedBox()
                                            : VitalsRowTextWidget(
                                                heading: "Temperature",
                                                data:
                                                    "${vitals[index].temperature.toString()} ${vitals[index].temperatureType.toString()}",
                                              ),
                                        const HorizontalSpacingWidget(width: 5),
                                        vitals[index].spo2 == null
                                            ? const SizedBox()
                                            : VitalsRowTextWidget(
                                                heading: "Temperature",
                                                data:
                                                    "${vitals[index].spo2.toString()} %",
                                              ),
                                        const HorizontalSpacingWidget(width: 5),
                                        vitals[index].sys == null &&
                                                vitals[index].dia == null
                                            ? const SizedBox()
                                            : VitalsRowTextWidget(
                                                heading: "BP",
                                                data:
                                                    "${vitals[index].sys ?? "N/A"} / ${vitals[index].dia ?? "N/A"}",
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ],
                    )
                  : Container(),
              prescriptions.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Medicines : ", style: black13B500),
                        const VerticalSpacingWidget(height: 5),
                        ListView.builder(
                            itemCount: prescriptions.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 5.h),
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kCardColor,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    prescriptions[index].medicalStoreName ==
                                            null
                                        ? const SizedBox()
                                        : Row(
                                            children: [
                                              Text("Medical store name :",
                                                  style: grey12B500),
                                              const HorizontalSpacingWidget(
                                                  width: 5),
                                              Text(
                                                  prescriptions[index]
                                                      .medicalStoreName
                                                      .toString(),
                                                  style: black13B500)
                                            ],
                                          ),
                                    const VerticalSpacingWidget(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Medicine Name :",
                                            style: grey12B500),
                                        Text("Dosage :", style: grey12B500)
                                      ],
                                    ),
                                    const VerticalSpacingWidget(height: 2),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            prescriptions[index]
                                                .medicineName
                                                .toString(),
                                            style: black13B500),
                                        Text(
                                            prescriptions[index]
                                                .dosage
                                                .toString(),
                                            style: black13B500)
                                      ],
                                    ),
                                    const VerticalSpacingWidget(height: 4),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Days :", style: grey12B500),
                                        Text("", style: black13B500)
                                      ],
                                    ),
                                    const VerticalSpacingWidget(height: 2),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            prescriptions[index]
                                                .noOfDays
                                                .toString(),
                                            style: black13B500),
                                        Text(
                                            prescriptions[index].type == 1
                                                ? "Before Food"
                                                : "After Food",
                                            style: black13B500)
                                      ],
                                    ),
                                    const VerticalSpacingWidget(height: 4),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Medicine taken :",
                                            style: grey12B500),
                                        Row(
                                          children: [
                                            prescriptions[index].morning == 1
                                                ? Text("Morning",
                                                    style: black13B500)
                                                : Container(),
                                            const HorizontalSpacingWidget(
                                                width: 5),
                                            prescriptions[index].noon == 1
                                                ? Text("Noon",
                                                    style: black13B500)
                                                : Container(),
                                            const HorizontalSpacingWidget(
                                                width: 5),
                                            prescriptions[index].night == 1
                                                ? Text("Night",
                                                    style: black13B500)
                                                : Container(),
                                          ],
                                        )
                                      ],
                                    ),
                                    const VerticalSpacingWidget(height: 2),
                                  ],
                                ),
                              );
                            }),
                      ],
                    )
                  : Container(),
              prescriptionImage == "null"
                  ? Container()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Prescription image : ", style: black13B500),
                        const VerticalSpacingWidget(height: 5),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FancyShimmerImage(
                                height: 400.h,
                                boxFit: BoxFit.cover,
                                errorWidget: const Image(
                                  image: AssetImage(
                                    "assets/icons/no image.png",
                                  ),
                                ),
                                imageUrl: prescriptionImage),
                          ),
                        ),
                        const VerticalSpacingWidget(height: 5),
                      ],
                    ),
              labTestName == "null"
                  ? Container()
                  : Column(
                      children: [
                        RowTextWidget(heading: "Lab test", data: labTestName),
                        const VerticalSpacingWidget(height: 5),
                      ],
                    ),
              labName == "null"
                  ? Container()
                  : Column(
                      children: [
                        RowTextWidget(heading: "Lab Name", data: labName),
                        const VerticalSpacingWidget(height: 5),
                      ],
                    ),
              scanningTestName == "null"
                  ? Container()
                  : Column(
                      children: [
                        RowTextWidget(
                            heading: "Scanning test", data: scanningCenterName),
                        const VerticalSpacingWidget(height: 5),
                      ],
                    ),
              scanningCenterName == "null"
                  ? Container()
                  : Column(
                      children: [
                        RowTextWidget(
                            heading: "Scanning center name",
                            data: scanningTestName),
                        const VerticalSpacingWidget(height: 5),
                      ],
                    ),
              note == "null"
                  ? Container()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Additional notes: ", style: grey12B500),
                        const VerticalSpacingWidget(height: 2),
                        Text(note, style: black13B500),
                      ],
                    ),
              const VerticalSpacingWidget(height: 5)
            ],
          ),
        ),
      ),
    );
  }
}
