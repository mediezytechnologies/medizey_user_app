import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../CommonWidgets/horizontal_spacing_widget.dart';
import '../../../../CommonWidgets/vertical_spacing_widget.dart';
import '../../../../Consts/app_colors.dart';
import '../../../../Consts/text_style.dart';

class ScanLabWidget extends StatelessWidget {
  const ScanLabWidget({
    super.key,
    required this.labOrScanCenterName,
    required this.testNames,
    required this.labOrScan,
    required this.testLabOrScan,
  });

  final String labOrScanCenterName;
  final List<String> testNames;
  final String labOrScan;
  final String testLabOrScan;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labOrScanCenterName == "null"
              ? const SizedBox()
              : Row(
                  children: [
                    Text("$labOrScan : ", style: grey12B500),
                    SizedBox(
                      width: size.width * .5,
                      child: Text(labOrScanCenterName,
                          style: black13B500,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
          Text("$testLabOrScan : ", style: grey12B500),
          const VerticalSpacingWidget(height: 2),
          ListView.builder(
              itemCount: testNames.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(6),
                  margin: EdgeInsets.only(bottom: 4.h),
                  decoration: BoxDecoration(
                    color: kScaffoldColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      Text("${index + 1}.", style: grey12B500),
                      const HorizontalSpacingWidget(width: 5),
                      Text(testNames[index], style: black13B500),
                    ],
                  ),
                );
              }),
          const VerticalSpacingWidget(height: 5),
        ],
      ),
    );
  }
}
