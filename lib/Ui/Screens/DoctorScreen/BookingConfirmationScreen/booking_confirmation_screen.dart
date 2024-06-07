// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mediezy_user/Ui/CommonWidgets/bottom_navigation_control_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import '../../../Consts/text_style.dart';

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
      required this.consultationFee,
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
  final String consultationFee;

  @override
  State<BookingConfirmationScreen> createState() =>
      _BookingConfirmationScreenState();
}

class _BookingConfirmationScreenState extends State<BookingConfirmationScreen> {
  final ScrollController _scrollController = ScrollController();

  bool isQuestionClicked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _ensureScrolling();
    });
  }

  void _ensureScrolling() async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (_scrollController.hasClients) {
      await Future.delayed(const Duration(milliseconds: 300));
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    } else {
      // Try again if clients are not yet attached
      await Future.delayed(const Duration(milliseconds: 300));
      _ensureScrolling();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                BottomNavigationControlWidget(selectedIndex: 0),
          ),
        );
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Booking Successful"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Lottie.asset(
                        "assets/animations/success.json",
                        height: size.height * .18,
                      ),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          Row(
                            children: [
                              Text("Estimated\narrival time",
                                  style: black13B500),
                              const HorizontalSpacingWidget(width: 5),
                              Text(widget.estimatedTime, style: main17),
                            ],
                          )
                        ],
                      ),
                    ),
                    const VerticalSpacingWidget(height: 10),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Patient name", style: grey12B500),
                            SizedBox(
                                width: size.width * .30,
                                child: Text(
                                  widget.name,
                                  style: black12B600,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                )),
                            const VerticalSpacingWidget(height: 2),
                            Text("Age&Gender", style: grey12B500),
                            const VerticalSpacingWidget(height: 2),
                            Text("${widget.age} ${widget.gender}",
                                style: black12B600),
                            Text("Appointment time", style: grey12B500),
                            Text(widget.appointmentTime, style: black12B600),
                            Text("Appointment date", style: grey12B500),
                            Text(
                                DateFormat('dd-MM-yyyy').format(
                                    DateTime.parse(widget.appointmentDate)),
                                style: black12B600),
                          ],
                        ),
                        const HorizontalSpacingWidget(width: 40),
                        Container(
                          height: 140.h,
                          width: 1.w,
                          color: kSubTextColor,
                        ),
                        const HorizontalSpacingWidget(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Doctor name", style: grey12B500),
                            SizedBox(
                                width: size.width * .45,
                                child: Text(
                                  "Dr ${widget.doctorFirstName} ${widget.doctorSecondName}",
                                  style: black12B600,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                )),
                            const VerticalSpacingWidget(height: 2),
                            Text("Consultation fee", style: grey12B500),
                            Text("₹ ${widget.consultationFee}",
                                style: black12B600),
                            const VerticalSpacingWidget(height: 2),
                            Text("Clinic name", style: grey12B500),
                            SizedBox(
                                width: size.width * .45,
                                child: Text(widget.clinicName,
                                    style: black12B600)),
                            const VerticalSpacingWidget(height: 2),
                            Text("Location", style: grey12B500),
                            SizedBox(
                              width: size.width * .45,
                              child: Text(widget.location,
                                  style: black12B600,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Note : ", style: red11B600),
                        const HorizontalSpacingWidget(width: 5),
                        Expanded(
                          child: Text(
                              "You should arrive at ${widget.estimatedTime} or the live estimated arrival time provided on the homepage.If you failed to do so,you will have to wait for a long time.",
                              style: red11B600),
                        )
                      ],
                    ),
                    const VerticalSpacingWidget(height: 5),
                  ],
                ),
              ),
              const Image(
                image: AssetImage("assets/images/confirm_screen_image.jpg"),
              ),
              const VerticalSpacingWidget(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Need help with other issues", style: black14B600),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                isQuestionClicked = !isQuestionClicked;
                              });
                            },
                            child: const Icon(Icons.keyboard_arrow_down))
                      ],
                    ),
                    isQuestionClicked
                        ? Column(
                            children: [
                              Theme(
                                data: Theme.of(context)
                                    .copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                  tilePadding: EdgeInsets.zero,
                                  childrenPadding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  title: Text(
                                      'If am not able to visit the doctor?',
                                      style: black14B600),
                                  children: [
                                    Text(
                                      'If you are unable to visit the doctor, you should reschedule the appointment ATLEAST 5 hours before the scheduled time to allow others to book   THAT slot. Otherwise, the booking may be lost.',
                                      style: grey12B500,
                                    ),
                                  ],
                                ),
                              ),
                              Theme(
                                data: Theme.of(context)
                                    .copyWith(dividerColor: Colors.transparent),
                                child: ExpansionTile(
                                  tilePadding: EdgeInsets.zero,
                                  childrenPadding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  title: Text(
                                      'What happens when I arrive late?',
                                      style: black14B600),
                                  children: [
                                    Text(
                                      'You will have to wait a long time if you fail to arrive on time because the rest of the slots are scheduled for others.',
                                      style: grey12B500,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              const VerticalSpacingWidget(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: CommonButtonWidget(
                    widget: Text("Done", style: white13B700),
                    onTapFunction: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) =>
                                BottomNavigationControlWidget(selectedIndex: 0),
                          ),
                          (route) => false);
                    }),
              ),
              const VerticalSpacingWidget(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
