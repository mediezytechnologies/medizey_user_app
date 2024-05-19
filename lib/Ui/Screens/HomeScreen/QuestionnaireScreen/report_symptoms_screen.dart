import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/AllDoctorsNearYouScreen/all_doctors_near_you_screen.dart';

class ReportSymptomsScreen extends StatefulWidget {
  const ReportSymptomsScreen({super.key});

  @override
  State<ReportSymptomsScreen> createState() => _ReportSymptomsScreenState();
}

class _ReportSymptomsScreenState extends State<ReportSymptomsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Container(
                  decoration: BoxDecoration(
                    color: kCardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(Icons.file_present),
                        const HorizontalSpacingWidget(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Report Systems",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.sp),
                            ),
                            const Text("Age : ${25}  |  Male"),
                          ],
                        ),
                        const HorizontalSpacingWidget(width: 140),
                        const Icon(Icons.keyboard_arrow_up),
                      ],
                    ),
                  ),
                ),
              ),
              const VerticalSpacingWidget(height: 20),
              Card(
                child: Container(
                  decoration: BoxDecoration(
                    color: kCardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image(
                                  height: 15.h,
                                  image: const AssetImage(
                                      "assets/icons/check 1.png")),
                              const HorizontalSpacingWidget(width: 5),
                              Text(
                                "Headache",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const VerticalSpacingWidget(height: 5),
                          Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Association : Vomiting"),
                                Text("Duration : Less than one day"),
                                Text("Quality : Dull or vague"),
                                Text("Severity : Moderate"),
                                Text("Side : One side"),
                                Text("Site : Forehead"),
                              ],
                            ),
                          ),
                          const VerticalSpacingWidget(height: 10),
                          Row(
                            children: [
                              Image(
                                  height: 15.h,
                                  image: const AssetImage(
                                      "assets/icons/check 1.png")),
                              const HorizontalSpacingWidget(width: 5),
                              Text(
                                "Vomiting",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const VerticalSpacingWidget(height: 5),
                          Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Exposure : Recent travel to disease prevalent area"),
                                Text("Type : Yellowish green tinged"),
                              ],
                            ),
                          ),
                          const VerticalSpacingWidget(height: 10),
                          Row(
                            children: [
                              Image(
                                  height: 15.h,
                                  image: const AssetImage(
                                      "assets/icons/check 1.png")),
                              const HorizontalSpacingWidget(width: 5),
                              Text(
                                "Stuffy nose",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const VerticalSpacingWidget(height: 10),
                          Row(
                            children: [
                              Image(
                                  height: 15.h,
                                  image: const AssetImage(
                                      "assets/icons/check 1.png")),
                              const HorizontalSpacingWidget(width: 5),
                              Text(
                                "Vomiting Sensation",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      )),
                ),
              ),
              Card(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kCardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Row(
                      children: [
                        const Icon(Icons.file_present),
                        const HorizontalSpacingWidget(width: 5),
                        Text(
                          "Medical History",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.sp),
                        ),
                        const HorizontalSpacingWidget(width: 140),
                        const Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ),
              ),
              const VerticalSpacingWidget(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Disclaimer",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          "This report is meant for information purposes only, intended to help you understand the probable conditions based on your reported details. it neither substitutes any counselling, diagnosis and/or medical  treatment by a registered medical practitioner nor shall be used for any such purposes.")
                    ],
                  ),
                ),
              ),
              const VerticalSpacingWidget(height: 10),
              CommonButtonWidget(
                  title: "Book Appointment",
                  onTapFunction: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AllDoctorNearYouScreen()),
                    );
                  }),
              const VerticalSpacingWidget(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
