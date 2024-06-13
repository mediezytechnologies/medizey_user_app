import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/GetAppointments/get_upcoming_appointments_model.dart';
import 'package:mediezy_user/Ui/CommonWidgets/heading_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/view_all_button_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/AppointmentsScreen/Widgets/appointment_card_widget.dart';
import 'package:mediezy_user/Ui/Screens/AppointmentsScreen/appointments_screen.dart';
import '../../../../Repository/Bloc/GetAppointment/GetUpcomingAppointment/get_upcoming_appointment_bloc.dart';
import '../../../CommonWidgets/bottom_navigation_control_widget.dart';
import 'home_screen_loading_widgets.dart';

class UpcommingAppoiment extends StatefulWidget {
  const UpcommingAppoiment({super.key});

  @override
  State<UpcommingAppoiment> createState() => _UpcommingAppoimentState();
}

class _UpcommingAppoimentState extends State<UpcommingAppoiment> {
  late GetUpComingAppointmentsModel getUpComingAppointmentsModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUpcomingAppointmentBloc, GetUpcomingAppointmentState>(
      builder: (context, state) {
        if (state is GetUpComingAppointmentLoading) {
          return upComingAppointmentsLoadingWidget();
        }
        if (state is GetUpComingAppointmentError) {
          return Container();
        }
        if (state is GetUpComingAppointmentLoaded) {
          if (state.isLoaded) {
            getUpComingAppointmentsModel =
                BlocProvider.of<GetUpcomingAppointmentBloc>(context)
                    .getUpComingAppointmentsModel;
            return getUpComingAppointmentsModel.upcomingAppointments == null ||
                    getUpComingAppointmentsModel.upcomingAppointments!.isEmpty
                ? Container()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: const HeadingWidget(
                          title: "Your appointments",
                        ),
                      ),
                      const VerticalSpacingWidget(height: 3),
                      ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: getUpComingAppointmentsModel
                                      .upcomingAppointments!.length >
                                  2
                              ? 2
                              : getUpComingAppointmentsModel
                                  .upcomingAppointments!.length,
                          itemBuilder: (context, index) {
                            return AppointmentCardWidget(
                              sheduleLateMessage: getUpComingAppointmentsModel
                                  .upcomingAppointments![index]
                                  .sheduleLateMessage
                                  .toString(),
                              isCheckIn: getUpComingAppointmentsModel
                                  .upcomingAppointments![index].isCheckedin!,
                              isReached: getUpComingAppointmentsModel
                                  .upcomingAppointments![index].isReached!,
                              doctorUniqueId: getUpComingAppointmentsModel
                                  .upcomingAppointments![index].mediezyDoctorId
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
                                  .upcomingAppointments![index].rescheduleType!,
                              bookingTimeAndDate: getUpComingAppointmentsModel
                                  .upcomingAppointments![index].tokenBookedDate
                                  .toString(),
                              docterName: getUpComingAppointmentsModel
                                  .upcomingAppointments![index].doctorName
                                  .toString(),
                              bookedClinicName: getUpComingAppointmentsModel
                                  .upcomingAppointments![index].clinicName
                                  .toString(),
                              leaveMessage: getUpComingAppointmentsModel
                                  .upcomingAppointments![index].leaveStatus!,
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
                                  .upcomingAppointments![index].tokenStartTime
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
                                  .upcomingAppointments![index].doctorEarlyTime
                                  .toString(),
                              // estimatedArrivalTime: getUpComingAppointmentsModel
                              //     .upcomingAppointments![index]
                              //     .estimateArrivalTime
                              //     .toString(),
                              estimatedArrivalTime: getUpComingAppointmentsModel
                                  .upcomingAppointments![index].newEstimateTime
                                  .toString(),
                              lateTime: getUpComingAppointmentsModel
                                  .upcomingAppointments![index].doctorLateTime
                                  .toString(),
                              liveToken: getUpComingAppointmentsModel
                                          .upcomingAppointments![index]
                                          .liveToken ==
                                      0
                                  ? '0'
                                  : getUpComingAppointmentsModel
                                      .upcomingAppointments![index].liveToken
                                      .toString(),
                            );
                          }),
                      const VerticalSpacingWidget(height: 2),
                      ViewAllButtonWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) =>
                                   BottomNavigationControlWidget(selectedIndex: 1)),
                              ),
                            );
                          },
                          buttonText: "View all appointments")
                    ],
                  );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: kMainColor,
              ),
            );
          }
        }
        return Container();
      },
    );
  }
}
