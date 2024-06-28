import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Consts/text_style.dart';
import 'horizontal_spacing_widget.dart';

class LocationCardWidget extends StatelessWidget {
  const LocationCardWidget({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(color: color, width: 1.w),
      ),
      child: Wrap(
        children: [
          Text('Location', style: grey11B400),
          const HorizontalSpacingWidget(width: 5),
          Icon(
            IconlyLight.location,
            color: color,
            size: 14.sp,
          )
        ],
      ),
    );
  }
}
