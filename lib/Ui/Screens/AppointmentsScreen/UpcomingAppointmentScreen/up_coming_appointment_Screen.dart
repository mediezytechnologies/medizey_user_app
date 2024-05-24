// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/GetAppointments/get_upcoming_appointments_model.dart';
import 'package:mediezy_user/Repository/Bloc/GetAppointment/GetUpcomingAppointment/get_upcoming_appointment_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/AppointmentsScreen/Widgets/appointment_card_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/AllDoctorsNearYouScreen/all_doctors_near_you_screen.dart';

import '../../../CommonWidgets/text_style_widget.dart';

class UpComingAppointmentScreen extends StatefulWidget {
  const UpComingAppointmentScreen({super.key});

  @override
  State<UpComingAppointmentScreen> createState() =>
      _UpComingAppointmentScreenState();
}

class _UpComingAppointmentScreenState extends State<UpComingAppointmentScreen> {
  late GetUpComingAppointmentsModel getUpComingAppointmentsModel;
  late Timer pollingTimer;

  @override
  void initState() {
    BlocProvider.of<GetUpcomingAppointmentBloc>(context)
        .add(FetchUpComingAppointments());
    startPolling();
    super.initState();
  }

  void startPolling() async {
    pollingTimer = Timer.periodic(const Duration(seconds: 15), (timer) {
      BlocProvider.of<GetUpcomingAppointmentBloc>(context)
          .add(FetchUpComingAppointments());
    });
  }

  void stopPolling() {
    pollingTimer.cancel();
  }

  @override
  void dispose() {
    stopPolling();
    super.dispose();
  }

  Future<void> _refreshData() async {
    BlocProvider.of<GetUpcomingAppointmentBloc>(context)
        .add(FetchUpComingAppointments());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: BlocBuilder<GetUpcomingAppointmentBloc,
                  GetUpcomingAppointmentState>(
                builder: (context, state) {
                  if (state is GetUpComingAppointmentLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: kMainColor,
                      ),
                    );
                  }
                  // if (state is GetUpComingAppointmentError) {
                  //   return SizedBox(
                  //     child: Center(
                  //       child: Image(
                  //         image: const AssetImage(
                  //             "assets/images/something went wrong-01.png"),
                  //         height: 200.h,
                  //         width: 200.w,
                  //       ),
                  //     ),
                  //   );
                  // }
                  if (state is GetUpComingAppointmentLoaded) {
                    if (state.isLoaded) {
                      getUpComingAppointmentsModel =
                          BlocProvider.of<GetUpcomingAppointmentBloc>(context)
                              .getUpComingAppointmentsModel;
                      return getUpComingAppointmentsModel
                                      .upcomingAppointments ==
                                  null ||
                              getUpComingAppointmentsModel
                                  .upcomingAppointments!.isEmpty
                          ? SizedBox(
                              width: size.width,
                              child: Column(
                                children: [
                                  const VerticalSpacingWidget(height: 30),
                                  Text("No appointment available",
                                      style: main20),
                                  const VerticalSpacingWidget(height: 20),
                                  Text(
                                    "Book a slot of your choice with expert\ndoctors near you and skip the queue\nwithout waiting for long time",
                                    style: green16,
                                    textAlign: TextAlign.center,
                                  ),
                                  const VerticalSpacingWidget(height: 10),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const AllDoctorNearYouScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: kMainColor,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      height: size.height * .05,
                                      width: size.width * .5,
                                      child: Center(
                                        child: Text(
                                          "Book appointment",
                                          style: white13B700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const VerticalSpacingWidget(height: 10),
                                  Image(
                                    image: const AssetImage(
                                        "assets/icons/no appointment.png"),
                                    height: size.height * .4,
                                    width: size.width * .8,
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: getUpComingAppointmentsModel
                                  .upcomingAppointments!.length,
                              itemBuilder: (context, index) {
                                return AppointmentCardWidget(
                                  sheduleLateMessage:
                                      getUpComingAppointmentsModel
                                          .upcomingAppointments![index]
                                          .sheduleLateMessage
                                          .toString(),
                                  isCheckIn: getUpComingAppointmentsModel
                                      .upcomingAppointments![index]
                                      .isCheckedin!,
                                  isReached: getUpComingAppointmentsModel
                                      .upcomingAppointments![index].isReached!,
                                  doctorUniqueId: getUpComingAppointmentsModel
                                      .upcomingAppointments![index]
                                      .mediezyDoctorId
                                      .toString(),
                                  patientId: getUpComingAppointmentsModel
                                      .upcomingAppointments![index].patientId!,
                                  tokenId: getUpComingAppointmentsModel
                                      .upcomingAppointments![index].tokenId!,
                                  isPatientAbsent: getUpComingAppointmentsModel
                                              .upcomingAppointments![index]
                                              .patientAbsent ==
                                          true
                                      ? "Absent"
                                      : "Not absent",
                                  nextAvailableDateAndTime:
                                      getUpComingAppointmentsModel
                                          .upcomingAppointments![index]
                                          .nextAvailableTokenDate
                                          .toString(),
                                  nextAvailableTokenNumber:
                                      getUpComingAppointmentsModel
                                          .upcomingAppointments![index]
                                          .nextAvailableTokenNumber
                                          .toString(),
                                  doctorId: getUpComingAppointmentsModel
                                      .upcomingAppointments![index].doctorId
                                      .toString(),
                                  clinicList: getUpComingAppointmentsModel
                                      .upcomingAppointments![index].clinics!
                                      .toList(),
                                  resheduleStatus: getUpComingAppointmentsModel
                                      .upcomingAppointments![index]
                                      .rescheduleType!,
                                  bookingTimeAndDate:
                                      getUpComingAppointmentsModel
                                          .upcomingAppointments![index]
                                          .tokenBookedDate
                                          .toString(),
                                  docterName: getUpComingAppointmentsModel
                                      .upcomingAppointments![index].doctorName
                                      .toString(),
                                  bookedClinicName: getUpComingAppointmentsModel
                                      .upcomingAppointments![index].clinicName
                                      .toString(),
                                  leaveMessage: getUpComingAppointmentsModel
                                      .upcomingAppointments![index]
                                      .leaveStatus!,
                                  docterImage: getUpComingAppointmentsModel
                                      .upcomingAppointments![index].doctorImage
                                      .toString(),
                                  appointmentFor: getUpComingAppointmentsModel
                                              .upcomingAppointments![index]
                                              .mainSymptoms ==
                                          null
                                      ? getUpComingAppointmentsModel
                                          .upcomingAppointments![index]
                                          .otherSymptom!
                                          .symtoms
                                          .toString()
                                      : getUpComingAppointmentsModel
                                          .upcomingAppointments![index]
                                          .mainSymptoms!
                                          .mainsymptoms
                                          .toString(),
                                  tokenNumber: getUpComingAppointmentsModel
                                      .upcomingAppointments![index].tokenNumber
                                      .toString(),
                                  appointmentDate: getUpComingAppointmentsModel
                                      .upcomingAppointments![index]
                                      .tokenScheduledDate
                                      .toString(),
                                  appointmentTime: getUpComingAppointmentsModel
                                      .upcomingAppointments![index]
                                      .tokenStartTime
                                      .toString(),
                                  patientName: getUpComingAppointmentsModel
                                      .upcomingAppointments![index].patientName
                                      .toString(),
                                  consultationStartingTime:
                                      getUpComingAppointmentsModel
                                          .upcomingAppointments![index]
                                          .scheduleStartTime
                                          .toString(),
                                  earlyTime: getUpComingAppointmentsModel
                                      .upcomingAppointments![index]
                                      .doctorEarlyTime
                                      .toString(),
                                  // estimatedArrivalTime: getUpComingAppointmentsModel
                                  //     .upcomingAppointments![index]
                                  //     .estimateArrivalTime
                                  //     .toString(),
                                  estimatedArrivalTime:
                                      getUpComingAppointmentsModel
                                          .upcomingAppointments![index]
                                          .newEstimateTime
                                          .toString(),
                                  lateTime: getUpComingAppointmentsModel
                                      .upcomingAppointments![index]
                                      .doctorLateTime
                                      .toString(),
                                  liveToken: getUpComingAppointmentsModel
                                      .upcomingAppointments![index].liveToken
                                      .toString(),
                                );
                              });
                    }
                  }
                  return Container();
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
