// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mediezy_user/Ui/CommonWidgets/bottom_navigation_control_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';

class BookingConfirmationScreen extends StatefulWidget {
  const BookingConfirmationScreen(
      {super.key,
      required this.name,
      required this.mobileNo,
      required this.gender,
      required this.age,
      required this.tokenNo,
      required this.appointmentTime,
      required this.appointmentDate,
      required this.doctorFirstName,
      required this.doctorSecondName,
      required this.clinicName,
      required this.location,
      required this.address,
      required this.estimatedTime});

  final String name;
  final String mobileNo;
  final String gender;
  final String age;
  final String tokenNo;
  final String appointmentTime;
  final String appointmentDate;
  final String doctorFirstName;
  final String doctorSecondName;
  final String clinicName;
  final String location;
  final String address;
  final String estimatedTime;

  @override
  State<BookingConfirmationScreen> createState() =>
      _BookingConfirmationScreenState();
}

class _BookingConfirmationScreenState extends State<BookingConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavigationControlWidget(),
          ),
        );
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Booking Successfull"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          margin: const EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: const Color(0xFFe3e4e5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Lottie.asset("assets/animations/success.json",
                    height: 140.h),
              ),
              const VerticalSpacingWidget(height: 5),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const VerticalSpacingWidget(height: 2),
                    Text(
                      "Estimated arrival time",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    const VerticalSpacingWidget(height: 2),
                    Text(
                      widget.estimatedTime,
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: kMainColor),
                    ),
                  ],
                ),
              ),
              const VerticalSpacingWidget(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Patient Name",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                            color: kSubTextColor),
                      ),
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: kTextColor),
                      ),
                      const VerticalSpacingWidget(height: 2),
                      Text(
                        "Mobile No",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                            color: kSubTextColor),
                      ),
                      Text(
                        widget.mobileNo,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: kTextColor),
                      ),
                      const VerticalSpacingWidget(height: 2),
                      Text(
                        "Age&Gender",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                            color: kSubTextColor),
                      ),
                      const VerticalSpacingWidget(height: 2),
                      Text(
                        "${widget.age} ${widget.gender}",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: kTextColor),
                      ),
                    ],
                  ),
                  Container(
                    height: 140.h,
                    width: 1.w,
                    color: kSubTextColor,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 35.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                          color: kMainColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Token No: ${widget.tokenNo}",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: kCardColor),
                          ),
                        ),
                      ),
                      const VerticalSpacingWidget(height: 2),
                      Text(
                        "Appointment Time",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                            color: kSubTextColor),
                      ),
                      Text(
                        widget.appointmentTime,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: kTextColor),
                      ),
                      const VerticalSpacingWidget(height: 2),
                      Text(
                        "Appointment Date",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                            color: kSubTextColor),
                      ),
                      Text(
                        DateFormat('dd-MM-yyyy')
                            .format(DateTime.parse(widget.appointmentDate)),
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: kTextColor),
                      ),
                    ],
                  ),
                ],
              ),
              const VerticalSpacingWidget(height: 5),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Appointment For",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
              const VerticalSpacingWidget(height: 5),
              Text(
                "Doctor Name",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: kSubTextColor),
              ),
              Text(
                "Dr ${widget.doctorFirstName} ${widget.doctorSecondName}",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: kTextColor),
              ),
              const VerticalSpacingWidget(height: 2),
              Text(
                "Clinic Name",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: kSubTextColor),
              ),
              Text(
                widget.clinicName,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: kTextColor),
              ),
              const VerticalSpacingWidget(height: 2),
              Text(
                "Location",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: kSubTextColor),
              ),
              Text(
                "${widget.address}, ${widget.location}",
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: kTextColor),
              ),
              const VerticalSpacingWidget(height: 10),
              CommonButtonWidget(
                  title: "Done",
                  onTapFunction: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) =>
                              const BottomNavigationControlWidget(),
                        ),
                        (route) => false);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
