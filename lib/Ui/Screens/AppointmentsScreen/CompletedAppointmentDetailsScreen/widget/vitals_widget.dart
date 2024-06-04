import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../CommonWidgets/horizontal_spacing_widget.dart';
import '../../../../CommonWidgets/vertical_spacing_widget.dart';
import '../../../../Consts/app_colors.dart';
import 'vitals_row_text_widget.dart';

class VitalsWidget extends StatelessWidget {
  const VitalsWidget(
      {super.key,
      required this.height,
      required this.weight,
      required this.heartRate,
      required this.temperature,
      required this.temperatureType,
      required this.spo2,
      required this.sys,
      required this.dia});

  final String height;
  final String weight;
  final String heartRate;
  final String temperature;
  final String temperatureType;
  final String spo2;
  final String sys;
  final String dia;

  @override
  Widget build(BuildContext context) {
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
          Row(
            children: [
              height == 'null'
                  ? const SizedBox()
                  : Row(
                      children: [
                        VitalsRowTextWidget(
                          heading: "Height",
                          data: "$height cm",
                        ),
                        const HorizontalSpacingWidget(width: 10),
                      ],
                    ),
              weight == 'null'
                  ? const SizedBox()
                  : Row(
                      children: [
                        VitalsRowTextWidget(
                          heading: "Weight",
                          data: "$weight kg",
                        ),
                        const HorizontalSpacingWidget(width: 10),
                      ],
                    ),
              heartRate == 'null'
                  ? const SizedBox()
                  : VitalsRowTextWidget(
                      heading: "Heartrate",
                      data: "$heartRate BPM",
                    ),
            ],
          ),
          const VerticalSpacingWidget(height: 5),
          Row(
            children: [
              temperature == 'null'
                  ? const SizedBox()
                  : Row(
                      children: [
                        VitalsRowTextWidget(
                          heading: "Temperature",
                          data: "$temperature $temperatureType",
                        ),
                        const HorizontalSpacingWidget(width: 5),
                      ],
                    ),
              spo2 == 'null'
                  ? const SizedBox()
                  : Row(
                      children: [
                        VitalsRowTextWidget(
                          heading: "Temperature",
                          data: "$spo2 %",
                        ),
                        const HorizontalSpacingWidget(width: 5),
                      ],
                    ),
              sys == 'null' && dia == 'null'
                  ? const SizedBox()
                  : VitalsRowTextWidget(
                      heading: "BP",
                      data:
                          "${sys == 'null' ? 'N/A' : sys} / ${dia == 'null' ? 'N/A' : dia}",
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
