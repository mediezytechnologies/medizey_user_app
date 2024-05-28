import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/text_style.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/AllRecordsScreen/all_records_screen.dart';

class GoToAllRecordWidget extends StatelessWidget {
  const GoToAllRecordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AllRecordsScreen(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        height: height * .09,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            FadedScaleAnimation(
              scaleDuration: const Duration(milliseconds: 400),
              fadeDuration: const Duration(milliseconds: 400),
              child: Image(
                image: const AssetImage("assets/icons/folder.png"),
                height: height * .40,
                width: width * .10,
              ),
            ),
            const HorizontalSpacingWidget(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("All health records", style: black14B600),
                SizedBox(
                  width: width * .8,
                  child: Text(
                    "Prescriptions, Lab report, Scanning report, Discharge summary",
                    style: grey12B500,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
