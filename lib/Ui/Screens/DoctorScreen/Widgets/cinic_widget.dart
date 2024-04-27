import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';

class ClinicWidget extends StatelessWidget {
  const ClinicWidget(
      {super.key,
      required this.isSelected,
      required this.clinicName,
      required this.clinicStartTime,
      required this.clinicEndTime,
      required this.clinicAddress,
      required this.clinicLocation,
      required this.availableTokenCounts});
  final bool isSelected;
  final String clinicName;
  final String clinicStartTime;
  final String clinicEndTime;
  final String clinicAddress;
  final String clinicLocation;
  final String availableTokenCounts;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      padding: const EdgeInsets.all(4),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? kMainColor : const Color(0xFFEAF3F8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  clinicName,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : kTextColor,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      clinicStartTime,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: isSelected ? Colors.white : kTextColor,
                      ),
                    ),
                    Text(
                      " - ",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: isSelected ? Colors.white : kTextColor,
                      ),
                    ),
                    Text(
                      clinicEndTime,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: isSelected ? Colors.white : kTextColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200.w,
                  child: Text(
                    "$clinicAddress $clinicLocation ",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: isSelected ? Colors.white : kTextColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      availableTokenCounts,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : kTextColor,
                      ),
                    ),
                    const HorizontalSpacingWidget(width: 2),
                    Text(
                      "slots available",
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: isSelected ? Colors.white : kTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
