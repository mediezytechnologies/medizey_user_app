import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/DoctorsByHealthCategoryScreen/doctors_by_health_caregory_screen.dart';

class HealthConcernWidget extends StatelessWidget {
  const HealthConcernWidget(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.healthCategoryId});

  final String imageUrl;
  final String title;
  final String healthCategoryId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DoctorsByHealthCatrgoryScreen(
                healthCategoryId: healthCategoryId, healthCategoryName: title),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FancyShimmerImage(
                  height: 70.h,
                  width: 70.w,
                  boxFit: BoxFit.fill,
                  errorWidget: const Image(
                      image: AssetImage("assets/icons/no image.png")),
                  imageUrl: imageUrl),
            ),
          ),
          const VerticalSpacingWidget(height: 5),
          Text(
            title,
            style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
