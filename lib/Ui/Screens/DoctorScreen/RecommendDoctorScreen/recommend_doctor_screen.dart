import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Repository/Bloc/DoctorRecommend/doctor_recommend_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/bottom_navigation_control_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';

class RecommendedDoctorScreen extends StatefulWidget {
  const RecommendedDoctorScreen({super.key});

  @override
  State<RecommendedDoctorScreen> createState() =>
      _RecommendedDoctorScreenState();
}

class _RecommendedDoctorScreenState extends State<RecommendedDoctorScreen> {
  final TextEditingController doctorNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController clinicNameController = TextEditingController();
  final TextEditingController specializationController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recommend Doctor"),
        centerTitle: true,
      ),
      body: BlocListener<DoctorRecommendBloc, DoctorRecommendState>(
        listener: (context, state) {
          if (state is DoctorRecommendError) {
            return GeneralServices.instance
                .showErrorMessage(context, state.errorMessage);
          }
          if (state is DoctorRecommendLoaded) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const BottomNavigationControlWidget(),
                ),
                (route) => false);
            GeneralServices.instance.showToastMessage(state.successMesseage);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpacingWidget(height: 10),
                Text(
                  "Dotor name",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                      color: kSubTextColor),
                ),
                VerticalSpacingWidget(height: 5.h),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextFormField(
                    style: TextStyle(fontSize: 13.sp, color: kTextColor),
                    cursorColor: kMainColor,
                    controller: doctorNameController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: 13.sp, color: kSubTextColor),
                      hintText: "Enter doctor name",
                      filled: true,
                      fillColor: kCardColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                    ),
                  ),
                ),
                const VerticalSpacingWidget(height: 10),
                Text(
                  "Location",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                      color: kSubTextColor),
                ),
                VerticalSpacingWidget(height: 5.h),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextFormField(
                    style: TextStyle(fontSize: 13.sp, color: kTextColor),
                    cursorColor: kMainColor,
                    controller: locationController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: 13.sp, color: kSubTextColor),
                      hintText: "Enter loaction",
                      filled: true,
                      fillColor: kCardColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                    ),
                  ),
                ),
                const VerticalSpacingWidget(height: 10),
                Text(
                  "Clinic name",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                      color: kSubTextColor),
                ),
                VerticalSpacingWidget(height: 5.h),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextFormField(
                    style: TextStyle(fontSize: 13.sp, color: kTextColor),
                    cursorColor: kMainColor,
                    controller: clinicNameController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: 13.sp, color: kSubTextColor),
                      hintText: "Enter clinic name",
                      filled: true,
                      fillColor: kCardColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                    ),
                  ),
                ),
                const VerticalSpacingWidget(height: 10),
                Text(
                  "Specialization",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                      color: kSubTextColor),
                ),
                VerticalSpacingWidget(height: 5.h),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextFormField(
                    style: TextStyle(fontSize: 13.sp, color: kTextColor),
                    cursorColor: kMainColor,
                    controller: specializationController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: 13.sp, color: kSubTextColor),
                      hintText: "Enter specialization",
                      filled: true,
                      fillColor: kCardColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                    ),
                  ),
                ),
                const VerticalSpacingWidget(height: 10),
                Text(
                  "Phone number",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                      color: kSubTextColor),
                ),
                VerticalSpacingWidget(height: 5.h),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextFormField(
                    maxLength: 10,
                    style: TextStyle(fontSize: 13.sp, color: kTextColor),
                    cursorColor: kMainColor,
                    controller: phoneNumberController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      counterText: "",
                      hintStyle:
                          TextStyle(fontSize: 13.sp, color: kSubTextColor),
                      hintText: "Enter phone number",
                      filled: true,
                      fillColor: kCardColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                    ),
                  ),
                ),
                const VerticalSpacingWidget(height: 50),
                CommonButtonWidget(
                    title: "Done",
                    onTapFunction: () {
                      if (doctorNameController.text.isEmpty) {
                        GeneralServices.instance
                            .showErrorMessage(context, "Fill doctor name");
                      } else if (locationController.text.isEmpty) {
                        GeneralServices.instance
                            .showErrorMessage(context, "Fill location");
                      } else {
                        BlocProvider.of<DoctorRecommendBloc>(context).add(
                          AddDoctorRecommentationEvent(
                              doctorName: doctorNameController.text,
                              location: locationController.text,
                              clinicName: clinicNameController.text,
                              specialization: specializationController.text,
                              phoneNumber: phoneNumberController.text),
                        );
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    doctorNameController.dispose();
    locationController.dispose();
    clinicNameController.dispose();
    specializationController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }
}
