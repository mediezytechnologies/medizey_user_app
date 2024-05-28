// ignore_for_file: deprecated_member_use, no_leading_underscores_for_local_identifiers, must_be_immutable
import 'dart:async';
import 'dart:developer';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mediezy_user/Model/Clinics/clinic_model.dart';
import 'package:mediezy_user/Model/GetTokens/GetTokenModel.dart';
import 'package:mediezy_user/Repository/Bloc/GetToken/get_token_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/internet_handle_screen.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/Widgets/cinic_widget.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/Widgets/token_card_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import '../../../Consts/text_style.dart';
import 'widget/calender_widget.dart';

class BookAppointmentScreen extends StatefulWidget {
  BookAppointmentScreen(
      {Key? key,
      required this.doctorId,
      required this.clinicList,
      required this.doctorFirstName,
      required this.doctorSecondName,
      this.patientId,
      this.resheduleType,
      this.normalResheduleTokenId})
      : super(key: key);

  final String doctorId;
  final String doctorFirstName;
  final String doctorSecondName;
  final List<Clinics> clinicList;
  String? patientId;
  String? resheduleType;
  String? normalResheduleTokenId;

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
  String selectedClinicConsutationFee = "";
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
    selectedClinicConsutationFee =
        widget.clinicList.first.consultationFee.toString();
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
    log("selected clinic id >>> ${selectedClinicId.toString()}");
    super.initState();
  }

  Future<void> _refreshData() async {
    BlocProvider.of<GetTokenBloc>(context).add(
      FetchToken(
        date: formatDate(),
        doctorId: widget.doctorId,
        hospitalId: selectedClinicId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
            return RefreshIndicator(
              onRefresh: _refreshData,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: FadedSlideAnimation(
                      beginOffset: const Offset(0, 0.3),
                      endOffset: const Offset(0, 0),
                      slideCurve: Curves.linearToEaseOut,
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
                                    widget.clinicList[index].clinicId
                                        .toString();
                                return InkWell(
                                  onTap: () {
                                    setState(
                                      () {
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
                                        selectedClinicConsutationFee = widget
                                            .clinicList[index].consultationFee
                                            .toString();
                                        BlocProvider.of<GetTokenBloc>(context)
                                            .add(
                                          FetchToken(
                                            date: formatDate(),
                                            doctorId: widget.doctorId,
                                            hospitalId: selectedClinicId,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: widget.clinicList[index]
                                              .clinicStartTime ==
                                          null
                                      ? const SizedBox()
                                      : ClinicWidget(
                                          isSelected: isSelected,
                                          clinicName: widget
                                              .clinicList[index].clinicName
                                              .toString(),
                                          clinicStartTime: widget
                                              .clinicList[index].clinicStartTime
                                              .toString(),
                                          clinicEndTime: widget
                                              .clinicList[index].clinicEndTime!
                                              .toString(),
                                          clinicAddress: widget
                                              .clinicList[index].clinicAddress
                                              .toString(),
                                          clinicLocation: widget
                                              .clinicList[index].clinicLocation
                                              .toString(),
                                          availableTokenCounts: widget
                                              .clinicList[index]
                                              .availableTokenCount
                                              .toString(),
                                        ),
                                );
                              },
                            ),
                            DatePickerDemoClass(
                              height: size.height * .15,
                              width: size.width * .15,
                              DateTime.now(),
                              initialSelectedDate: DateTime.now(),
                              selectionColor: kMainColor,
                              selectedTextColor: kCardColor,
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
                              dateTextStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width > 450 ? 10.sp : 16.sp),
                              dayTextStyle: TextStyle(
                                  fontSize: size.width > 450 ? 8.sp : 12.sp),
                              monthTextStyle: TextStyle(
                                  fontSize: size.width > 450 ? 8.sp : 12.sp),
                            ),
                            BlocBuilder<GetTokenBloc, GetTokenState>(
                              builder: (context, state) {
                                if (state is GetTokenLoading) {
                                  return SizedBox(
                                    height: size.height * .65,
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
                                          Image(
                                            image: const AssetImage(
                                                "assets/icons/no token.png"),
                                            height: size.height * .5,
                                          ),
                                          getTokenModel.message ==
                                                  "Doctor is on Leave"
                                              ? Text(
                                                  getTokenModel.message
                                                      .toString(),
                                                  style: black14B600)
                                              : const SizedBox(),
                                          const VerticalSpacingWidget(
                                              height: 10)
                                        ],
                                      ),
                                    );
                                  }
                                  //! shedule 1
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (getTokenModel.schedule?.schedule1
                                              ?.isNotEmpty ==
                                          true)
                                        Column(
                                          children: [
                                            const VerticalSpacingWidget(
                                                height: 10),
                                            Text("Schedule 1",
                                                style: black14B500),
                                            const VerticalSpacingWidget(
                                                height: 5),
                                          ],
                                        ),
                                      if (getTokenModel.schedule?.schedule1
                                              ?.isNotEmpty ==
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
                                              consultationFee:
                                                  selectedClinicConsutationFee,
                                              normalResheduleTokenId:
                                                  widget.normalResheduleTokenId,
                                              patientId: widget.patientId,
                                              resheduleType:
                                                  widget.resheduleType,
                                              clinicAddress:
                                                  selectedClinicAddress,
                                              clinicLocation:
                                                  selectedClinicLocation,
                                              clinicName: selectedClinicName,
                                              doctorFirstName:
                                                  widget.doctorFirstName,
                                              doctorSecondName:
                                                  widget.doctorSecondName,
                                              clinicId: selectedClinicId,
                                              date: selectedDate,
                                              tokenId: getTokenModel.schedule!
                                                  .schedule1![index].tokenId
                                                  .toString(),
                                              isReserved: getTokenModel
                                                  .schedule!
                                                  .schedule1![index]
                                                  .isReserved
                                                  .toString(),
                                              isTimeOut: getTokenModel.schedule!
                                                  .schedule1![index].isTimeout
                                                  .toString(),
                                              tokenNumber: getTokenModel
                                                  .schedule!
                                                  .schedule1![index]
                                                  .tokenNumber
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
                                              sheduleType: getTokenModel
                                                  .schedule!
                                                  .schedule1![index]
                                                  .scheduleType
                                                  .toString(),
                                              estimatedTime: getTokenModel
                                                  .schedule!
                                                  .schedule1![index]
                                                  .estimateStartTime
                                                  .toString(),
                                            );
                                          },
                                        ),
                                      //! shedule 2
                                      if (getTokenModel.schedule?.schedule2
                                              ?.isNotEmpty ==
                                          true)
                                        Column(
                                          children: [
                                            const VerticalSpacingWidget(
                                                height: 10),
                                            Text(
                                              "Schedule 2",
                                              style: black14B500,
                                            ),
                                            const VerticalSpacingWidget(
                                                height: 5),
                                          ],
                                        ),

                                      if (getTokenModel.schedule?.schedule2
                                              ?.isNotEmpty ==
                                          true)
                                        GridView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
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
                                              consultationFee:
                                                  selectedClinicConsutationFee,
                                              normalResheduleTokenId:
                                                  widget.normalResheduleTokenId,
                                              patientId: widget.patientId,
                                              resheduleType:
                                                  widget.resheduleType,
                                              clinicAddress:
                                                  selectedClinicAddress,
                                              clinicLocation:
                                                  selectedClinicLocation,
                                              clinicName: selectedClinicName,
                                              doctorFirstName:
                                                  widget.doctorFirstName,
                                              isReserved: getTokenModel
                                                  .schedule!
                                                  .schedule2![index]
                                                  .isReserved
                                                  .toString(),
                                              doctorSecondName:
                                                  widget.doctorSecondName,
                                              clinicId: selectedClinicId,
                                              date: selectedDate,
                                              tokenId: getTokenModel.schedule!
                                                  .schedule2![index].tokenId
                                                  .toString(),
                                              isTimeOut: getTokenModel.schedule!
                                                  .schedule2![index].isTimeout
                                                  .toString(),
                                              tokenNumber: getTokenModel
                                                  .schedule!
                                                  .schedule2![index]
                                                  .tokenNumber
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
                                              sheduleType: getTokenModel
                                                  .schedule!
                                                  .schedule2![index]
                                                  .scheduleType
                                                  .toString(),
                                              estimatedTime: getTokenModel
                                                  .schedule!
                                                  .schedule2![index]
                                                  .estimateStartTime
                                                  .toString(),
                                            );
                                          },
                                        ),
                                      //! shedule 3
                                      if (getTokenModel.schedule?.schedule3
                                              ?.isNotEmpty ==
                                          true)
                                        Column(
                                          children: [
                                            const VerticalSpacingWidget(
                                                height: 10),
                                            Text("Schedule 3",
                                                style: black14B500),
                                            const VerticalSpacingWidget(
                                                height: 5),
                                          ],
                                        ),
                                      if (getTokenModel.schedule?.schedule3
                                              ?.isNotEmpty ==
                                          true)
                                        GridView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
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
                                              consultationFee:
                                                  selectedClinicConsutationFee,
                                              normalResheduleTokenId:
                                                  widget.normalResheduleTokenId,
                                              patientId: widget.patientId,
                                              resheduleType:
                                                  widget.resheduleType,
                                              clinicAddress:
                                                  selectedClinicAddress,
                                              clinicLocation:
                                                  selectedClinicLocation,
                                              clinicName: selectedClinicName,
                                              doctorFirstName:
                                                  widget.doctorFirstName,
                                              doctorSecondName:
                                                  widget.doctorSecondName,
                                              clinicId: selectedClinicId,
                                              date: selectedDate,
                                              tokenId: getTokenModel.schedule!
                                                  .schedule3![index].tokenId
                                                  .toString(),
                                              isReserved: getTokenModel
                                                  .schedule!
                                                  .schedule3![index]
                                                  .isReserved
                                                  .toString(),
                                              isTimeOut: getTokenModel.schedule!
                                                  .schedule3![index].isTimeout
                                                  .toString(),
                                              tokenNumber: getTokenModel
                                                  .schedule!
                                                  .schedule3![index]
                                                  .tokenNumber
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
                                              sheduleType: getTokenModel
                                                  .schedule!
                                                  .schedule3![index]
                                                  .scheduleType
                                                  .toString(),
                                              estimatedTime: getTokenModel
                                                  .schedule!
                                                  .schedule3![index]
                                                  .estimateStartTime
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
                  ),
                );
              }),
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
