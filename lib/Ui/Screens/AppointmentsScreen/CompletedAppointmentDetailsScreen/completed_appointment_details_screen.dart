import 'dart:io';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/GetAppointments/get_completed_appointments_model.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import '../../../CommonWidgets/horizontal_spacing_widget.dart';
import '../../../Consts/app_colors.dart';
import '../../../Consts/text_style.dart';
import 'widget/additional_card_widget.dart';
import 'widget/image_view_widget.dart';
import 'widget/medicine_widget.dart';
import 'widget/review_after_note_widget.dart';
import 'widget/scan_lab_widget.dart';
import 'widget/user_section_widget.dart';
import 'widget/vitals_widget.dart';

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
    required this.medicalStoreName,
  });

  final String doctorName;
  final String doctorImage;
  final String clinicName;
  final String symptoms;
  final String tokenDate;
  final String tokenTime;
  final String patientName;
  final String note;
  final String labName;
  final String prescriptionImage;
  final List<DoctorMedicines> prescriptions;
  final String reviewAfter;
  final List<Vitals> vitals;
  final String scanningCenterName;
  final String whenItStart;
  final String whenItsCome;
  final List<String> labTestName;
  final List<String> scanningTestName;
  final String medicalStoreName;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Platform.isIOS
          ? SizedBox(
              height: size.height * 0.038,
              width: double.infinity,
            )
          : const SizedBox(),
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
              UserSectionWidget(
                  size: size,
                  doctorImage: doctorImage,
                  doctorName: doctorName,
                  clinicName: clinicName,
                  tokenDate: tokenDate,
                  tokenTime: tokenTime,
                  patientName: patientName),
              const VerticalSpacingWidget(height: 5),
              Text("Additional Details", style: grey13B600),
              const VerticalSpacingWidget(height: 5),
              AdditionalCardWidget(
                  size: size,
                  symptoms: symptoms,
                  whenItsCome: whenItsCome,
                  whenItStart: whenItStart),
              vitals.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VerticalSpacingWidget(height: 5),
                        Text("Vitals : ", style: black13B500),
                        const VerticalSpacingWidget(height: 5),
                        ListView.builder(
                            itemCount: vitals.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return VitalsWidget(
                                dia: vitals[index].dia.toString(),
                                heartRate: vitals[index].heartRate.toString(),
                                height: vitals[index].height.toString(),
                                spo2: vitals[index].spo2.toString(),
                                sys: vitals[index].sys.toString(),
                                temperature:
                                    vitals[index].temperature.toString(),
                                temperatureType:
                                    vitals[index].temperatureType.toString(),
                                weight: vitals[index].weight.toString(),
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
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: kCardColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Medical store name : ",
                                      style: grey12B500),
                                  const HorizontalSpacingWidget(width: 5),
                                  SizedBox(
                                    width: size.width * .50,
                                    child: Text(
                                      medicalStoreName,
                                      style: black13B500,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                              const VerticalSpacingWidget(height: 2),
                              ListView.builder(
                                  itemCount: prescriptions.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return MedicineWidget(
                                      medicineName: prescriptions[index]
                                          .medicineName
                                          .toString(),
                                      dosage: prescriptions[index]
                                          .dosage
                                          .toString(),
                                      intervel: prescriptions[index]
                                          .interval
                                          .toString(),
                                      intervelSection: prescriptions[index]
                                          .timeSection
                                          .toString(),
                                      noOfDays: prescriptions[index]
                                          .noOfDays
                                          .toString(),
                                      morning: prescriptions[index].morning!,
                                      noon: prescriptions[index].noon!,
                                      evening: prescriptions[index].evening!,
                                      night: prescriptions[index].night!,
                                      foodType: prescriptions[index].type!,
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Container(),
              const VerticalSpacingWidget(height: 5),
              labTestName.isEmpty
                  ? const SizedBox()
                  : Column(
                      children: [
                        ScanLabWidget(
                          labOrScanCenterName: labName,
                          labOrScan: "Lab name",
                          testLabOrScan: "Lab tests",
                          testNames: labTestName,
                        ),
                        const VerticalSpacingWidget(height: 5),
                      ],
                    ),
              scanningTestName.isEmpty
                  ? const SizedBox()
                  : Column(
                      children: [
                        ScanLabWidget(
                          labOrScanCenterName: scanningCenterName,
                          labOrScan: "Scanning center name",
                          testLabOrScan: "Scan tests",
                          testNames: scanningTestName,
                        ),
                        const VerticalSpacingWidget(height: 5),
                      ],
                    ),
              ReviewAfterAndNoteWidget(reviewAfter: reviewAfter, note: note),
              prescriptionImage == "null"
                  ? Container()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VerticalSpacingWidget(height: 5),
                        Text("Prescription image : ", style: black13B500),
                        const VerticalSpacingWidget(height: 5),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ImageViewWidget(image: prescriptionImage),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: FancyShimmerImage(
                                  height: size.height * .2,
                                  boxFit: BoxFit.cover,
                                  errorWidget: const Image(
                                    image: AssetImage(
                                      "assets/icons/no image.png",
                                    ),
                                  ),
                                  imageUrl: prescriptionImage),
                            ),
                          ),
                        ),
                        const VerticalSpacingWidget(height: 5),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
