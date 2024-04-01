import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/Banner/banner_model.dart';
import 'package:mediezy_user/Repository/Bloc/banner/banner_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/QuestionnaireScreen/common_symptoms_screen.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_screen_loading_widgets.dart';

class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({super.key});

  @override
  State<QuestionnaireScreen> createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  late BannerModel bannerModel;
  String dropdownValue = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
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
                        "Hi there!",
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                      const VerticalSpacingWidget(height: 5),
                      Text(
                        "Ask Mediezy About What’s causing your symptoms and our doctor-certified symptom checker will help you start feeling better again!",
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 120.h,
              child: BlocBuilder<BannerBloc, BannerState>(
                builder: (context, state) {
                  if (state is BannerLoading) {
                    return homeBannerLoadingWidget();
                  }
                  if (state is BannerError) {
                    return const Center(
                      child: Image(
                        image: AssetImage(
                            "assets/images/something went wrong-01.png"),
                      ),
                    );
                  }
                  if (state is BannerLoaded) {
                    bannerModel =
                        BlocProvider.of<BannerBloc>(context).bannerModel;
                    return Swiper(
                      autoplay: true,
                      itemCount: bannerModel.bannerImages!.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 6.w, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FancyShimmerImage(
                              boxFit: BoxFit.contain,
                              errorWidget: const Image(
                                  image:
                                      AssetImage("assets/icons/no image.png")),
                              imageUrl: bannerModel.bannerImages![index],
                            ),
                          ),
                        );
                      }),
                      pagination: SwiperPagination(
                        alignment: Alignment.bottomCenter,
                        builder: DotSwiperPaginationBuilder(
                            color: Colors.grey[200],
                            activeColor: Colors.red[400],
                            size: 8.sp,
                            activeSize: 8.sp),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
            const VerticalSpacingWidget(height: 10),
            const Row(
              children: [
                Image(
                  height: 20,
                  image: AssetImage(
                    "assets/icons/user.png",
                  ),
                ),
                HorizontalSpacingWidget(width: 5),
                Text(
                  "Who Is the assessment for?",
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
            const VerticalSpacingWidget(height: 10),
            SizedBox(
              height: 40.h,
              child: TextFormField(
                autofocus: true,
                cursorColor: kMainColor,
                controller: nameController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Patient name is missing";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 14.sp, color: kSubTextColor),
                    hintText: "Enter Name",
                    filled: true,
                    fillColor: kCardColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h)),
              ),
            ),
            const VerticalSpacingWidget(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 40.h,
                  width: 100.w,
                  child: TextFormField(
                    cursorColor: kMainColor,
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    maxLength: 3,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 2) {
                        return "Age is missing";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        counterText: "",
                        hintStyle:
                            TextStyle(fontSize: 14.sp, color: kSubTextColor),
                        hintText: "25 age",
                        filled: true,
                        fillColor: kCardColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 15.h)),
                  ),
                ),
                // const HorizontalSpacingWidget(width: 5),
                Container(
                  height: 40.h,
                  width: 120.w,
                  color: kCardColor,
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Male', 'Female', 'Other']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(value),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4cb499),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Text(
                          "Add Member",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const VerticalSpacingWidget(height: 150),
            CommonButtonWidget(title: "Submit", onTapFunction: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const CommonSymptomsScreen()));
            })
          ],
        ),
      ),
    );
  }
}
