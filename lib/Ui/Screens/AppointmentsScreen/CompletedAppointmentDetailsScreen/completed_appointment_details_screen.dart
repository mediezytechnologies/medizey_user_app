import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/GetAppointments/get_completed_appointments_model.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';

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
                    child: Image.network(
                      doctorImage,
                      height: 120.h,
                      width: 100.w,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Dr.$doctorName",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const VerticalSpacingWidget(height: 5),
                        Text(
                          clinicName.toString(),
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: kSubTextColor),
                        ),
                        const VerticalSpacingWidget(height: 5),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  tokenDate,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: kTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " | ",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: kTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  tokenTime,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: kTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const VerticalSpacingWidget(height: 5),
                        Row(
                          children: [
                            Text(
                              "For : ",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: kSubTextColor),
                            ),
                            Text(
                              patientName,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: kTextColor,
                                fontWeight: FontWeight.bold,
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
              const VerticalSpacingWidget(height: 10),
              Text(
                "Additional Details",
                style: TextStyle(
                  fontSize: 15.sp,
                  color: kSubTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const VerticalSpacingWidget(height: 10),
              Row(
                children: [
                  Text(
                    "Appointment For: ",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: kTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    symptoms,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: kTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const VerticalSpacingWidget(height: 5),
              reviewAfter == "null"
                  ? Container()
                  : Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Review after: ",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: kTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "$reviewAfter days",
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: kTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const VerticalSpacingWidget(height: 5),
                      ],
                    ),
              whenItStart == "null"
                  ? Container()
                  : Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "When did start : ",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: kTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              whenItsCome,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: kTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const VerticalSpacingWidget(height: 5),
                      ],
                    ),
              whenItsCome == "null"
                  ? Container()
                  : Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Intensity : ",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: kTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              whenItStart,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: kTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const VerticalSpacingWidget(height: 5),
                      ],
                    ),
              vitals.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Vitals : ",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: kTextColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                                            : Row(
                                                children: [
                                                  Text(
                                                    "Height :",
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: kTextColor,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  const HorizontalSpacingWidget(
                                                      width: 4),
                                                  Text(
                                                    "${vitals[index].height.toString()} Cm",
                                                    style: TextStyle(
                                                      fontSize: 13.sp,
                                                      color: kTextColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                ],
                                              ),
                                        const HorizontalSpacingWidget(
                                            width: 10),
                                        vitals[index].weight == null
                                            ? const SizedBox()
                                            : Row(
                                                children: [
                                                  Text(
                                                    "Weight :",
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: kTextColor,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  const HorizontalSpacingWidget(
                                                      width: 4),
                                                  Text(
                                                    "${vitals[index].weight.toString()} Kg",
                                                    style: TextStyle(
                                                      fontSize: 13.sp,
                                                      color: kTextColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                ],
                                              ),
                                        const HorizontalSpacingWidget(
                                            width: 10),
                                        vitals[index].heartRate == null
                                            ? const SizedBox()
                                            : Row(
                                                children: [
                                                  Text(
                                                    "Heartrate :",
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: kTextColor,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  const HorizontalSpacingWidget(
                                                      width: 4),
                                                  Text(
                                                    "${vitals[index].heartRate.toString()} Bpm",
                                                    style: TextStyle(
                                                      fontSize: 13.sp,
                                                      color: kTextColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                ],
                                              ),
                                      ],
                                    ),
                                    const VerticalSpacingWidget(height: 5),
                                    Row(
                                      children: [
                                        vitals[index].temperature == null
                                            ? const SizedBox()
                                            : Row(
                                                children: [
                                                  Text(
                                                    "Temperature :",
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: kTextColor,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  const HorizontalSpacingWidget(
                                                      width: 4),
                                                  Text(
                                                    vitals[index]
                                                        .temperature
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 13.sp,
                                                      color: kTextColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const HorizontalSpacingWidget(
                                                      width: 2),
                                                  Text(
                                                    vitals[index]
                                                        .temperatureType
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 13.sp,
                                                      color: kTextColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                        const HorizontalSpacingWidget(width: 5),
                                        vitals[index].spo2 == null
                                            ? const SizedBox()
                                            : Row(
                                                children: [
                                                  Text(
                                                    "Spo2 :",
                                                    style: TextStyle(
                                                      fontSize: 13.sp,
                                                      color: kTextColor,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  const HorizontalSpacingWidget(
                                                      width: 4),
                                                  Text(
                                                    "${vitals[index].spo2.toString()} %",
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: kTextColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                ],
                                              ),
                                        const HorizontalSpacingWidget(width: 5),
                                        Row(
                                          children: [
                                            Text(
                                              "Bp :",
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                color: kTextColor,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            const HorizontalSpacingWidget(
                                                width: 4),
                                            Text(
                                              "${vitals[index].sys ?? "N/A"} / ${vitals[index].dia ?? "N/A"}",
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                color: kTextColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
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
                        Text(
                          "Medicines : ",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: kTextColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                                              Text(
                                                "Medical store name :",
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: kTextColor,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const HorizontalSpacingWidget(
                                                  width: 5),
                                              Text(
                                                prescriptions[index]
                                                    .medicalStoreName
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: kTextColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                            ],
                                          ),
                                    const VerticalSpacingWidget(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Medicine Name :",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: kTextColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          "Dosage :",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: kTextColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
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
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            color: kTextColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          prescriptions[index]
                                              .dosage
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            color: kTextColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                    const VerticalSpacingWidget(height: 4),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Days :",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: kTextColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          "",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: kTextColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
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
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            color: kTextColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          prescriptions[index].type == 1
                                              ? "Before Food"
                                              : "After Food",
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            color: kTextColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                    const VerticalSpacingWidget(height: 4),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Medicine taken :",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: kTextColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            prescriptions[index].morning == 1
                                                ? Text(
                                                    "Morning",
                                                    style: TextStyle(
                                                      fontSize: 15.sp,
                                                      color: kTextColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                : Container(),
                                            const HorizontalSpacingWidget(
                                                width: 5),
                                            prescriptions[index].noon == 1
                                                ? Text(
                                                    "Noon",
                                                    style: TextStyle(
                                                      fontSize: 15.sp,
                                                      color: kTextColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                : Container(),
                                            const HorizontalSpacingWidget(
                                                width: 5),
                                            prescriptions[index].night == 1
                                                ? Text(
                                                    "Night",
                                                    style: TextStyle(
                                                      fontSize: 15.sp,
                                                      color: kTextColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
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
                        Text(
                          "Prescription image : ",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: kTextColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                        Row(
                          children: [
                            Text(
                              "Lab test: ",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: kTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              labTestName,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: kTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const VerticalSpacingWidget(height: 5),
                      ],
                    ),
              labName == "null"
                  ? Container()
                  : Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Lab Name: ",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: kTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              labName,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: kTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const VerticalSpacingWidget(height: 5),
                      ],
                    ),
              scanningTestName == "null"
                  ? Container()
                  : Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Scanning test: ",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: kTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              scanningCenterName,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: kTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const VerticalSpacingWidget(height: 5),
                      ],
                    ),
              scanningCenterName == "null"
                  ? Container()
                  : Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Scanning center name: ",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: kTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              scanningTestName,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: kTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const VerticalSpacingWidget(height: 5),
                      ],
                    ),
              note == "null"
                  ? Container()
                  : Row(
                      children: [
                        Text(
                          "Additional notes: ",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: kTextColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          note,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: kTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
