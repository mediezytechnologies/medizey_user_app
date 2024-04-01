import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/DoctorsByHealthCategoryScreen/doctors_by_health_caregory_screen.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen(
      {super.key,
      required this.articleTitle,
      required this.articleImage,
      required this.articleDescription,
      required this.authorName,
      required this.authorImage,
      required this.categoryName,
      required this.categoryId});

  final String articleTitle;
  final String articleImage;
  final String articleDescription;
  final String authorName;
  final String authorImage;
  final String categoryName;
  final String categoryId;

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                children: [
                  const VerticalSpacingWidget(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadedScaleAnimation(
                      scaleDuration: const Duration(milliseconds: 400),
                      fadeDuration: const Duration(milliseconds: 400),
                      child: Image(
                        image: NetworkImage(widget.articleImage),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const VerticalSpacingWidget(height: 10),
                  Text(
                    widget.articleTitle,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                  ),
                  const VerticalSpacingWidget(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFe3f9ff),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          widget.categoryName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF54a4bb),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage(widget.authorImage),
                          ),
                          const HorizontalSpacingWidget(width: 5),
                          Text(
                            widget.authorName,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const VerticalSpacingWidget(height: 10),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      widget.articleDescription,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const VerticalSpacingWidget(height: 70),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10.h,
            left: 10.w,
            right: 10.w,
            child: CommonButtonWidget(
              title: "Book Appointment Now",
              onTapFunction: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return DoctorsByHealthCatrgoryScreen(
                    healthCategoryId: widget.categoryId,
                    healthCategoryName: widget.categoryName,
                  );
                }));
              },
            ),
          )
        ],
      ),
    );
  }
}
