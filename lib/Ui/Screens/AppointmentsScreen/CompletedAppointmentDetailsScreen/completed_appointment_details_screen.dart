import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/GetAppointments/get_completed_appointments_model.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import '../../../Consts/text_style.dart';
import '../../../CommonWidgets/row_text_widget.dart';
import 'widget/image_view_widget.dart';
import 'widget/medicine_widget.dart';
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
                        ListView.builder(
                            itemCount: prescriptions.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return MedicineWidget(
                                medicalStoreName: prescriptions[index]
                                    .medicalStoreName
                                    .toString(),
                                medicineName: prescriptions[index]
                                    .medicineName
                                    .toString(),
                                dosage: prescriptions[index].dosage.toString(),
                                intervel:
                                    prescriptions[index].interval.toString(),
                                intervelSection:
                                    prescriptions[index].timeSection.toString(),
                                noOfDays:
                                    prescriptions[index].noOfDays.toString(),
                                morning: prescriptions[index].morning!,
                                noon: prescriptions[index].noon!,
                                evening: prescriptions[index].evening!,
                                night: prescriptions[index].night!,
                                foodType: prescriptions[index].type!,
                              );
                            }),
                      ],
                    )
                  : Container(),
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
                            heading: "Scanning test", data: scanningTestName),
                        const VerticalSpacingWidget(height: 5),
                      ],
                    ),
              scanningCenterName == "null"
                  ? Container()
                  : Column(
                      children: [
                        RowTextWidget(
                            heading: "Scanning center name",
                            data: scanningCenterName),
                        const VerticalSpacingWidget(height: 5),
                      ],
                    ),
              note == "null"
                  ? Container()
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Additional notes : ", style: grey12B500),
                        const VerticalSpacingWidget(height: 2),
                        Expanded(
                          child: Text(note, style: black13B500),
                        ),
                      ],
                    ),
              prescriptionImage == "null"
                  ? Container()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                  height: size.height * .4,
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
              const VerticalSpacingWidget(height: 5)
            ],
          ),
        ),
      ),
    );
  }
}
