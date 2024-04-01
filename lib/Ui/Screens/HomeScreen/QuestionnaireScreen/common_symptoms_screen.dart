import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/QuestionnaireScreen/symptoms_view_screen.dart';

class CommonSymptomsScreen extends StatefulWidget {
  const CommonSymptomsScreen({super.key});

  @override
  State<CommonSymptomsScreen> createState() => _CommonSymptomsScreenState();
}

class _CommonSymptomsScreenState extends State<CommonSymptomsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Container(
                width: double.infinity,
                color: kCardColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi Rahul, let’s get started.",
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                      const VerticalSpacingWidget(height: 5),
                      Text(
                        "Please Pick a symptom that is troubling you the most",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const VerticalSpacingWidget(height: 5),
            Container(
              height: 45.h,
              decoration: BoxDecoration(
                color: kCardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: const Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    HorizontalSpacingWidget(width: 5),
                    Text(
                      "Search your symptoms",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            const VerticalSpacingWidget(height: 5),
            Text(
              "Common Symptoms",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
            ),
            const VerticalSpacingWidget(height: 10),
            GridView.builder(
                itemCount: 8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    childAspectRatio: .75),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SymptomsViewScreen()));
                        },
                        child: Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(images[index]),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }

  List images = [
    "assets/images/questionnaire/symptoms-01.jpg",
    "assets/images/questionnaire/symptoms-02.jpg",
    "assets/images/questionnaire/symptoms-03.jpg",
    "assets/images/questionnaire/symptoms-04.jpg",
    "assets/images/questionnaire/symptoms-05.jpg",
    "assets/images/questionnaire/symptoms-06.jpg",
    "assets/images/questionnaire/symptoms-07.jpg",
    "assets/images/questionnaire/symptoms-08.jpg",
  ];
}
