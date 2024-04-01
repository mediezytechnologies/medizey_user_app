// ignore_for_file: file_names, deprecated_member_use

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/GetAppointments/get_completed_appointments_model.dart';
import 'package:mediezy_user/Model/GetAppointments/get_upcoming_appointments_model.dart';
import 'package:mediezy_user/Repository/Bloc/GetAppointment/GetCompletedAppointments/get_completed_appointments_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetAppointment/GetUpcomingAppointment/get_upcoming_appointment_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/bottom_navigation_control_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/internet_handle_screen.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/AppointmentsScreen/Widgets/appointment_card_widget.dart';
import 'package:mediezy_user/Ui/Screens/AppointmentsScreen/Widgets/completed_appointment_card_widget.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  late GetUpComingAppointmentsModel getUpComingAppointmentsModel;
  late GetCompletedAppointmentsModel getCompletedAppointmentsModel;
  late Timer pollingTimer;
  late StreamSubscription<ConnectivityResult> subscription;
  bool isSecondContainerVisible = false;

  void handleConnectivityChange(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
    } else {}
  }

  @override
  void initState() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      handleConnectivityChange(result);
    });
    BlocProvider.of<GetUpcomingAppointmentBloc>(context)
        .add(FetchUpComingAppointments());
    BlocProvider.of<GetCompletedAppointmentsBloc>(context)
        .add(FetchCompletedAppointments());
    super.initState();
    startPolling();
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: WillPopScope(
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
            title: const Text("My Bookings"),
            centerTitle: true,
            automaticallyImplyLeading: false,
            bottom: TabBar(
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: kMainColor,
              indicatorColor: kMainColor,
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Up Coming",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Completed",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          body: StreamBuilder<ConnectivityResult>(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) {
                final connectivityResult = snapshot.data;
                if (connectivityResult == ConnectivityResult.none) {
                  return const InternetHandleScreen();
                } else {
                  return TabBarView(children: [
                    //!up coming
                    BlocBuilder<GetUpcomingAppointmentBloc,
                        GetUpcomingAppointmentState>(
                      builder: (context, state) {
                        if (state is GetUpComingAppointmentLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: kMainColor,
                            ),
                          );
                        }
                        if (state is GetUpComingAppointmentError) {
                          return Center(
                            child: Image(
                              image: const AssetImage(
                                  "assets/images/something went wrong-01.png"),
                              height: 200.h,
                              width: 200.w,
                            ),
                          );
                        }
                        if (state is GetUpComingAppointmentLoaded) {
                          if (state.isLoaded) {
                            getUpComingAppointmentsModel =
                                BlocProvider.of<GetUpcomingAppointmentBloc>(
                                        context)
                                    .getUpComingAppointmentsModel;
                            return getUpComingAppointmentsModel
                                            .upcomingAppointments ==
                                        null ||
                                    getUpComingAppointmentsModel
                                        .upcomingAppointments!.isEmpty
                                ? Center(
                                    child: Column(
                                      children: [
                                        const VerticalSpacingWidget(height: 80),
                                        Image(
                                          image: const AssetImage(
                                              "assets/icons/no appointment.png"),
                                          height: 250.h,
                                          width: 250.w,
                                        ),
                                        Text(
                                          "No Appointments available",
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  )
                                : ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: getUpComingAppointmentsModel
                                        .upcomingAppointments!.length,
                                    itemBuilder: (context, index) {
                                      return AppointmentCardWidget(
                                        isPatientAbsent:
                                            getUpComingAppointmentsModel
                                                        .upcomingAppointments![
                                                            index]
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
                                            .upcomingAppointments![index]
                                            .doctorId
                                            .toString(),
                                        clinicList: getUpComingAppointmentsModel
                                            .upcomingAppointments![index]
                                            .clinics!
                                            .toList(),
                                        resheduleStatus:
                                            getUpComingAppointmentsModel
                                                .upcomingAppointments![index]
                                                .rescheduleType!,
                                        bookingTimeAndDate:
                                            getUpComingAppointmentsModel
                                                .upcomingAppointments![index]
                                                .tokenBookedDate
                                                .toString(),
                                        docterName: getUpComingAppointmentsModel
                                            .upcomingAppointments![index]
                                            .doctorName
                                            .toString(),
                                        bookedClinicName:
                                            getUpComingAppointmentsModel
                                                .upcomingAppointments![index]
                                                .clinicName
                                                .toString(),
                                        leaveMessage:
                                            getUpComingAppointmentsModel
                                                .upcomingAppointments![index]
                                                .leaveStatus!,
                                        docterImage:
                                            getUpComingAppointmentsModel
                                                .upcomingAppointments![index]
                                                .doctorImage
                                                .toString(),
                                        appointmentFor:
                                            getUpComingAppointmentsModel
                                                        .upcomingAppointments![
                                                            index]
                                                        .mainSymptoms ==
                                                    null
                                                ? getUpComingAppointmentsModel
                                                    .upcomingAppointments![
                                                        index]
                                                    .otherSymptom!
                                                    .symtoms
                                                    .toString()
                                                : getUpComingAppointmentsModel
                                                    .upcomingAppointments![
                                                        index]
                                                    .mainSymptoms!
                                                    .mainsymptoms
                                                    .toString(),
                                        tokenNumber:
                                            getUpComingAppointmentsModel
                                                .upcomingAppointments![index]
                                                .tokenNumber
                                                .toString(),
                                        appointmentDate:
                                            getUpComingAppointmentsModel
                                                .upcomingAppointments![index]
                                                .tokenScheduledDate
                                                .toString(),
                                        appointmentTime:
                                            getUpComingAppointmentsModel
                                                .upcomingAppointments![index]
                                                .tokenStartTime
                                                .toString(),
                                        patientName:
                                            getUpComingAppointmentsModel
                                                .upcomingAppointments![index]
                                                .patientName
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
                                        estimatedArrivalTime:
                                            getUpComingAppointmentsModel
                                                .upcomingAppointments![index]
                                                .estimateArrivalTime
                                                .toString(),
                                        lateTime: getUpComingAppointmentsModel
                                            .upcomingAppointments![index]
                                            .doctorLateTime
                                            .toString(),
                                        liveToken: getUpComingAppointmentsModel
                                            .upcomingAppointments![index]
                                            .liveToken
                                            .toString(),
                                      );
                                    });
                          }
                        }
                        return Container();
                      },
                    ),
                    //! completed
                    BlocBuilder<GetCompletedAppointmentsBloc,
                        GetCompletedAppointmentsState>(
                      builder: (context, state) {
                        if (state is GetCompletedAppointmentLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: kMainColor,
                            ),
                          );
                        }
                        if (state is GetCompletedAppointmentError) {
                          return Center(
                            child: Image(
                              image: const AssetImage(
                                  "assets/images/something went wrong-01.png"),
                              height: 200.h,
                              width: 200.w,
                            ),
                          );
                        }
                        if (state is GetCompletedAppointmentLoaded) {
                          getCompletedAppointmentsModel =
                              BlocProvider.of<GetCompletedAppointmentsBloc>(
                                      context)
                                  .getCompletedAppointmentsModel;
                          return getCompletedAppointmentsModel
                                      .completedAppointments!.isEmpty ||
                                  getCompletedAppointmentsModel
                                          .completedAppointments ==
                                      null
                              ? Center(
                                  child: Column(
                                    children: [
                                      const VerticalSpacingWidget(height: 80),
                                      Image(
                                        image: const AssetImage(
                                            "assets/icons/no appointment.png"),
                                        height: 250.h,
                                        width: 250.w,
                                      ),
                                      Text(
                                        "No Appointments available",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: getCompletedAppointmentsModel
                                      .completedAppointments!.length,
                                  itemBuilder: (context, index) {
                                    return CompletedAppointmentCardWidget(
                                      prescriptions:
                                          getCompletedAppointmentsModel
                                              .completedAppointments![index]
                                              .medicalPrescriptions!
                                              .toList(),
                                      clinicName: getCompletedAppointmentsModel
                                          .completedAppointments![index]
                                          .clinicName
                                          .toString(),
                                      doctorImage: getCompletedAppointmentsModel
                                          .completedAppointments![index]
                                          .doctorImage
                                          .toString(),
                                      doctorName: getCompletedAppointmentsModel
                                          .completedAppointments![index]
                                          .doctorName
                                          .toString(),
                                      labName: getCompletedAppointmentsModel
                                                  .completedAppointments![index]
                                                  .labName ==
                                              null
                                          ? ""
                                          : getCompletedAppointmentsModel
                                              .completedAppointments![index]
                                              .labName
                                              .toString(),
                                      labTestName: getCompletedAppointmentsModel
                                                  .completedAppointments![index]
                                                  .labTest ==
                                              null
                                          ? ""
                                          : getCompletedAppointmentsModel
                                              .completedAppointments![index]
                                              .labTest
                                              .toString(),
                                      medicalStoreName:
                                          getCompletedAppointmentsModel
                                                      .completedAppointments![
                                                          index]
                                                      .medicalStoreName ==
                                                  null
                                              ? ""
                                              : getCompletedAppointmentsModel
                                                  .completedAppointments![index]
                                                  .medicalStoreName
                                                  .toString(),
                                      note: getCompletedAppointmentsModel
                                                  .completedAppointments![index]
                                                  .notes ==
                                              null
                                          ? ""
                                          : getCompletedAppointmentsModel
                                              .completedAppointments![index]
                                              .notes
                                              .toString(),
                                      patientName: getCompletedAppointmentsModel
                                          .completedAppointments![index]
                                          .patientName
                                          .toString(),
                                      prescriptionImage:
                                          getCompletedAppointmentsModel
                                                      .completedAppointments![
                                                          index]
                                                      .prescriptionImage ==
                                                  null
                                              ? ""
                                              : getCompletedAppointmentsModel
                                                  .completedAppointments![index]
                                                  .prescriptionImage
                                                  .toString(),
                                      reviewAfter: getCompletedAppointmentsModel
                                                  .completedAppointments![index]
                                                  .reviewAfter ==
                                              null
                                          ? ""
                                          : getCompletedAppointmentsModel
                                              .completedAppointments![index]
                                              .reviewAfter
                                              .toString(),
                                      tokenDate: getCompletedAppointmentsModel
                                          .completedAppointments![index]
                                          .tokenDate
                                          .toString(),
                                      tokenTime: getCompletedAppointmentsModel
                                          .completedAppointments![index]
                                          .tokenTime
                                          .toString(),
                                      symptoms: getCompletedAppointmentsModel
                                                  .completedAppointments![index]
                                                  .mainSymptoms ==
                                              null
                                          ? getCompletedAppointmentsModel
                                              .completedAppointments![index]
                                              .otherSymptom!
                                              .symtoms
                                              .toString()
                                          : getCompletedAppointmentsModel
                                              .completedAppointments![index]
                                              .mainSymptoms!
                                              .mainsymptoms
                                              .toString(),
                                    );
                                  });
                        }
                        return Container();
                      },
                    ),
                  ]);
                }
              }),
        ),
      ),
    );
  }
}
