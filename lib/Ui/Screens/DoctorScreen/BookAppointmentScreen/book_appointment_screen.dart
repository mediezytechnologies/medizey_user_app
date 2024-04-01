// ignore_for_file: deprecated_member_use, no_leading_underscores_for_local_identifiers
import 'dart:async';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mediezy_user/Model/Clinics/clinic_model.dart';
import 'package:mediezy_user/Model/GetTokens/GetTokenModel.dart';
import 'package:mediezy_user/Repository/Bloc/GetClinic/get_clinic_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetToken/get_token_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/internet_handle_screen.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/Widgets/token_card_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({
    Key? key,
    required this.doctorId,
    required this.clinicList,
    required this.doctorFirstName,
    required this.doctorSecondName,
  }) : super(key: key);

  final String doctorId;
  final String doctorFirstName;
  final String doctorSecondName;
  final List<Clinics> clinicList;

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  DateTime selectedDate = DateTime.now();
  late GetTokenModel getTokenModel;
  String selectedClinicId = "";
  String selectedClinicName = "";
  String selectedClinicAddress = "";
  String selectedClinicLocation = "";

  bool isClicked = false;
  late StreamSubscription<ConnectivityResult> subscription;

  void handleConnectivityChange(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
    } else {}
  }

  @override
  void initState() {
    selectedClinicId = widget.clinicList.first.clinicId.toString();
    selectedClinicName = widget.clinicList.first.clinicName.toString();
    selectedClinicAddress = widget.clinicList.first.clinicAddress.toString();
    selectedClinicLocation = widget.clinicList.first.clinicLocation.toString();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      handleConnectivityChange(result);
    });
    BlocProvider.of<GetTokenBloc>(context).add(
      FetchToken(
        date: formatDate(),
        doctorId: widget.doctorId,
        hospitalId: widget.clinicList.first.clinicId.toString(),
      ),
    );
    BlocProvider.of<GetClinicBloc>(context)
        .add(FetchClinicByDoctorIdEvent(doctorId: widget.doctorId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Date & Time"),
        centerTitle: true,
      ),
      body: StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          final connectivityResult = snapshot.data;
          if (connectivityResult == ConnectivityResult.none) {
            return const InternetHandleScreen();
          } else {
            return FadedSlideAnimation(
              beginOffset: const Offset(0, 0.3),
              endOffset: const Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VerticalSpacingWidget(height: 10),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: widget.clinicList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          bool isSelected = selectedClinicId ==
                              widget.clinicList[index].clinicId.toString();
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedClinicId = widget
                                    .clinicList[index].clinicId
                                    .toString();
                                selectedClinicName = widget
                                    .clinicList[index].clinicName
                                    .toString();
                                selectedClinicAddress = widget
                                    .clinicList[index].clinicAddress
                                    .toString();
                                selectedClinicLocation = widget
                                    .clinicList[index].clinicLocation
                                    .toString();
                                BlocProvider.of<GetTokenBloc>(context).add(
                                  FetchToken(
                                    date: formatDate(),
                                    doctorId: widget.doctorId,
                                    hospitalId: selectedClinicId,
                                  ),
                                );
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 5.h),
                              padding: const EdgeInsets.all(4),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isSelected
                                    ? kMainColor
                                    : const Color(0xFFEAF3F8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          widget.clinicList[index].clinicName
                                                  ?.toString() ??
                                              "N/A",
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold,
                                            color: isSelected
                                                ? Colors.white
                                                : kTextColor,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              widget.clinicList[index]
                                                      .clinicStartTime
                                                      ?.toString() ??
                                                  "N/A",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: isSelected
                                                    ? Colors.white
                                                    : kTextColor,
                                              ),
                                            ),
                                            Text(
                                              " - ",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: isSelected
                                                    ? Colors.white
                                                    : kTextColor,
                                              ),
                                            ),
                                            Text(
                                              widget.clinicList[index]
                                                      .clinicEndTime
                                                      ?.toString() ??
                                                  "N/A",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: isSelected
                                                    ? Colors.white
                                                    : kTextColor,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 200.w,
                                          child: Text(
                                            "${widget.clinicList[index].clinicAddress.toString()} ${widget.clinicList[index].clinicLocation.toString()} ",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: isSelected
                                                  ? Colors.white
                                                  : kTextColor,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              widget.clinicList[index]
                                                  .availableTokenCount
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                color: isSelected
                                                    ? Colors.white
                                                    : kTextColor,
                                              ),
                                            ),
                                            const HorizontalSpacingWidget(
                                                width: 2),
                                            Text(
                                              "slots available",
                                              style: TextStyle(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w400,
                                                color: isSelected
                                                    ? Colors.white
                                                    : kTextColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      EasyDateTimeLine(
                        initialDate: selectedDate,
                        disabledDates: _getDisabledDates(),
                        onDateChange: (date) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(date);
                          setState(() {
                            selectedDate = date;
                          });
                          BlocProvider.of<GetTokenBloc>(context).add(
                            FetchToken(
                              date: formattedDate,
                              doctorId: widget.doctorId,
                              hospitalId: selectedClinicId,
                            ),
                          );
                        },
                        activeColor: kMainColor,
                        dayProps: EasyDayProps(
                          height: 80.h,
                          width: 65.w,
                          activeDayNumStyle: TextStyle(
                            color: kCardColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                          activeDayStrStyle: TextStyle(
                            color: kCardColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                          activeMothStrStyle: TextStyle(
                            color: kCardColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                          todayHighlightStyle:
                              TodayHighlightStyle.withBackground,
                          todayHighlightColor: const Color(0xffE1ECC8),
                          borderColor: kMainColor,
                        ),
                      ),
                      BlocBuilder<GetTokenBloc, GetTokenState>(
                        builder: (context, state) {
                          if (state is GetTokenLoading) {
                            return SizedBox(
                              height: 200.h,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: kMainColor,
                                ),
                              ),
                            );
                          }
                          if (state is GetTokenError) {
                            return Center(
                              child: Image(
                                image: const AssetImage(
                                    "assets/images/something went wrong-01.png"),
                                height: 200.h,
                                width: 200.w,
                              ),
                            );
                          }
                          if (state is GetTokenLoaded) {
                            getTokenModel =
                                BlocProvider.of<GetTokenBloc>(context)
                                    .getTokenModel;
                            if (getTokenModel.schedule == null) {
                              return Center(
                                child: Column(
                                  children: [
                                    const VerticalSpacingWidget(height: 10),
                                    Image(
                                      image: const AssetImage(
                                          "assets/icons/no token.png"),
                                      height: 250.h,
                                      width: 250.w,
                                    ),
                                    Text(
                                      getTokenModel.message.toString(),
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              );
                            }
                            //! shedule 1
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (getTokenModel
                                        .schedule?.schedule1?.isNotEmpty ==
                                    true)
                                  const Column(
                                    children: [
                                      VerticalSpacingWidget(height: 10),
                                      Text(
                                        "Schedule 1",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      VerticalSpacingWidget(height: 5),
                                    ],
                                  ),
                                if (getTokenModel
                                        .schedule?.schedule1?.isNotEmpty ==
                                    true)
                                  GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: getTokenModel
                                        .schedule!.schedule1!.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      crossAxisCount: 5,
                                      mainAxisExtent: 78,
                                    ),
                                    itemBuilder: (context, index) {
                                      return TokenCardWidget(
                                        clinicAddress: selectedClinicAddress,
                                        clinicLocation: selectedClinicLocation,
                                        clinicName: selectedClinicName,
                                        doctorFirstName: widget.doctorFirstName,
                                        doctorSecondName:
                                            widget.doctorSecondName,
                                        clinicId: selectedClinicId,
                                        date: selectedDate,
                                        isReserved: getTokenModel.schedule!
                                            .schedule1![index].isReserved
                                            .toString(),
                                        isTimeOut: getTokenModel.schedule!
                                            .schedule1![index].isTimeout
                                            .toString(),
                                        tokenNumber: getTokenModel.schedule!
                                            .schedule1![index].tokenNumber
                                            .toString(),
                                        isBooked: getTokenModel.schedule!
                                            .schedule1![index].isBooked
                                            .toString(),
                                        doctorId: widget.doctorId,
                                        formatedTime: getTokenModel
                                            .schedule!
                                            .schedule1![index]
                                            .formattedStartTime
                                            .toString(),
                                        sheduleType: getTokenModel.schedule!
                                            .schedule1![index].scheduleType
                                            .toString(),
                                        estimatedTime: getTokenModel.schedule!
                                            .schedule1![index].estimateStartTime
                                            .toString(),
                                      );
                                    },
                                  ),

                                //! shedule 2
                                if (getTokenModel
                                        .schedule?.schedule2?.isNotEmpty ==
                                    true)
                                  const Column(
                                    children: [
                                      VerticalSpacingWidget(height: 10),
                                      Text(
                                        "Schedule 2",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      VerticalSpacingWidget(height: 5),
                                    ],
                                  ),

                                if (getTokenModel
                                        .schedule?.schedule2?.isNotEmpty ==
                                    true)
                                  GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    shrinkWrap: true,
                                    itemCount: getTokenModel
                                        .schedule!.schedule2!.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      crossAxisCount: 5,
                                      mainAxisExtent: 70,
                                    ),
                                    itemBuilder: (context, index) {
                                      return TokenCardWidget(
                                        clinicAddress: selectedClinicAddress,
                                        clinicLocation: selectedClinicLocation,
                                        clinicName: selectedClinicName,
                                        doctorFirstName: widget.doctorFirstName,
                                        isReserved: getTokenModel.schedule!
                                            .schedule2![index].isReserved
                                            .toString(),
                                        doctorSecondName:
                                            widget.doctorSecondName,
                                        clinicId: selectedClinicId,
                                        date: selectedDate,
                                        isTimeOut: getTokenModel.schedule!
                                            .schedule2![index].isTimeout
                                            .toString(),
                                        tokenNumber: getTokenModel.schedule!
                                            .schedule2![index].tokenNumber
                                            .toString(),
                                        isBooked: getTokenModel.schedule!
                                            .schedule2![index].isBooked
                                            .toString(),
                                        doctorId: widget.doctorId,
                                        formatedTime: getTokenModel
                                            .schedule!
                                            .schedule2![index]
                                            .formattedStartTime
                                            .toString(),
                                        sheduleType: getTokenModel.schedule!
                                            .schedule2![index].scheduleType
                                            .toString(),
                                        estimatedTime: getTokenModel.schedule!
                                            .schedule2![index].estimateStartTime
                                            .toString(),
                                      );
                                    },
                                  ),

                                //! shedule 3
                                if (getTokenModel
                                        .schedule?.schedule3?.isNotEmpty ==
                                    true)
                                  const Column(
                                    children: [
                                      VerticalSpacingWidget(height: 10),
                                      Text(
                                        "Schedule 3",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      VerticalSpacingWidget(height: 5),
                                    ],
                                  ),

                                if (getTokenModel
                                        .schedule?.schedule3?.isNotEmpty ==
                                    true)
                                  GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    shrinkWrap: true,
                                    itemCount: getTokenModel
                                        .schedule!.schedule3!.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      crossAxisCount: 5,
                                      mainAxisExtent: 70,
                                    ),
                                    itemBuilder: (context, index) {
                                      return TokenCardWidget(
                                        clinicAddress: selectedClinicAddress,
                                        clinicLocation: selectedClinicLocation,
                                        clinicName: selectedClinicName,
                                        doctorFirstName: widget.doctorFirstName,
                                        doctorSecondName:
                                            widget.doctorSecondName,
                                        clinicId: selectedClinicId,
                                        date: selectedDate,
                                        isReserved: getTokenModel.schedule!
                                            .schedule3![index].isReserved
                                            .toString(),
                                        isTimeOut: getTokenModel.schedule!
                                            .schedule3![index].isTimeout
                                            .toString(),
                                        tokenNumber: getTokenModel.schedule!
                                            .schedule3![index].tokenNumber
                                            .toString(),
                                        isBooked: getTokenModel.schedule!
                                            .schedule3![index].isBooked
                                            .toString(),
                                        doctorId: widget.doctorId,
                                        formatedTime: getTokenModel
                                            .schedule!
                                            .schedule3![index]
                                            .formattedStartTime
                                            .toString(),
                                        sheduleType: getTokenModel.schedule!
                                            .schedule3![index].scheduleType
                                            .toString(),
                                        estimatedTime: getTokenModel.schedule!
                                            .schedule3![index].estimateStartTime
                                            .toString(),
                                      );
                                    },
                                  ),
                                const VerticalSpacingWidget(height: 10),
                              ],
                            );
                          }
                          return Container(
                            color: Colors.yellow,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  List<DateTime> _getDisabledDates() {
    DateTime currentDate = DateTime.now();
    List<DateTime> disabledDates = [];
    for (int month = 1; month <= currentDate.month; month++) {
      int lastDay = month < currentDate.month ? 31 : currentDate.day;

      for (int day = 1; day < lastDay; day++) {
        disabledDates.add(DateTime(currentDate.year, month, day));
      }
    }
    return disabledDates;
  }

  String formatDate() {
    return DateFormat('yyyy-MM-dd').format(selectedDate);
  }
}
