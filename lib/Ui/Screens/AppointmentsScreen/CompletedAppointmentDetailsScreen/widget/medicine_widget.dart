import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../CommonWidgets/horizontal_spacing_widget.dart';
import '../../../../Consts/text_style.dart';
import '../../../../CommonWidgets/vertical_spacing_widget.dart';
import '../../../../Consts/app_colors.dart';

class MedicineWidget extends StatelessWidget {
  const MedicineWidget(
      {super.key,
      required this.medicalStoreName,
      required this.medicineName,
      required this.dosage,
      required this.foodType,
      required this.intervel,
      required this.intervelSection,
      required this.noOfDays,
      required this.morning,
      required this.noon,
      required this.evening,
      required this.night});

  final String medicalStoreName;
  final String medicineName;
  final String dosage;
  final int foodType;
  final String intervel;
  final String intervelSection;
  final String noOfDays;
  final int morning;
  final int noon;
  final int evening;
  final int night;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: kCardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          medicalStoreName == 'null'
              ? const SizedBox()
              : Row(
                  children: [
                    Text("Medical store name : ", style: grey12B500),
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
          Row(
            children: [
              Text("Medicine Name : ", style: grey12B500),
              SizedBox(
                width: size.width * .60,
                child: Text(
                  medicineName,
                  style: black13B500,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const VerticalSpacingWidget(height: 2),
          Row(
            children: [
              Text("Dosage : ", style: grey12B500),
              dosage == 'null'
                  ? const SizedBox()
                  : Text(dosage, style: black13B500),
              Text(
                  foodType == 0
                      ? ""
                      : foodType == 1
                          ? " - After food"
                          : (foodType == 2)
                              ? " - Before food"
                              : (foodType == 3)
                                  ? " - With food"
                                  : " - If required",
                  style: black13B500)
            ],
          ),
          const VerticalSpacingWidget(height: 2),
          Row(
            children: [
              Text("Medicine taken : ", style: grey12B500),
              Row(
                children: [
                  morning == 1
                      ? Row(
                          children: [
                            Text("Morning", style: black13B500),
                            const HorizontalSpacingWidget(width: 5),
                          ],
                        )
                      : const SizedBox(),
                  noon == 1
                      ? Row(
                          children: [
                            Text("Noon", style: black13B500),
                            const HorizontalSpacingWidget(width: 5),
                          ],
                        )
                      : const SizedBox(),
                  evening == 1
                      ? Row(
                          children: [
                            Text("Evening", style: black13B500),
                            const HorizontalSpacingWidget(width: 5),
                          ],
                        )
                      : const SizedBox(),
                  night == 1
                      ? Text("Night", style: black13B500)
                      : const SizedBox(),
                ],
              )
            ],
          ),
          const VerticalSpacingWidget(height: 2),
          intervel == 'null'
              ? const SizedBox()
              : Column(
                  children: [
                    Row(
                      children: [
                        Text("Intervel : ", style: grey12B500),
                        Text("$intervel $intervelSection", style: black13B500),
                      ],
                    ),
                    const VerticalSpacingWidget(height: 2),
                  ],
                ),
          Row(
            children: [
              Text("Days : ", style: grey12B500),
              Text(noOfDays, style: black13B500),
            ],
          ),
          const VerticalSpacingWidget(height: 2),
        ],
      ),
    );
  }
}
