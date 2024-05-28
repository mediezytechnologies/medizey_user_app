import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';

import '../../../../Consts/text_style.dart';
import '../../../../CommonWidgets/vertical_spacing_widget.dart';

class DoctorDetailsSecondWidget extends StatelessWidget {
  const DoctorDetailsSecondWidget({super.key, required this.about});

  final String about;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: kCardColor,
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("About", style: grey13B400),
          const VerticalSpacingWidget(height: 5),
          Text(about, style: black12B500),
          const VerticalSpacingWidget(height: 5),
        ],
      ),
    );
  }
}
