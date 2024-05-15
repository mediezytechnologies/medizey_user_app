import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/once_completed_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/user_rating_widget.dart';
import '../../../../Model/GetAppointments/get_completed_appointments_model.dart';
import '../../../../Repository/Bloc/GetAppointment/GetCompletedAppointments/get_completed_appointments_bloc.dart';
import '../../../CommonWidgets/heading_widget.dart';
import '../../../CommonWidgets/vertical_spacing_widget.dart';

class GetCompletedFeedbackWidget extends StatefulWidget {
  const GetCompletedFeedbackWidget({
    super.key,
  });

  @override
  State<GetCompletedFeedbackWidget> createState() =>
      _GetCompletedFeedbackWidgetState();
}

class _GetCompletedFeedbackWidgetState
    extends State<GetCompletedFeedbackWidget> {
  late GetCompletedAppointmentsModel getCompletedAppointmentsModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<GetCompletedAppointmentsBloc,
              GetCompletedAppointmentsState>(
            builder: (context, state) {
              if (state is GetCompletedAppointmentError) {
                return const Center(
                  child: Image(
                    image:
                        AssetImage("assets/images/something went wrong-01.png"),
                  ),
                );
              }
              if (state is GetCompletedAppointmentLoaded) {
                getCompletedAppointmentsModel =
                    BlocProvider.of<GetCompletedAppointmentsBloc>(context)
                        .getCompletedAppointmentsModel;
                return getCompletedAppointmentsModel.appointmentDetails == null
                    ? const SizedBox()
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: getCompletedAppointmentsModel
                            .appointmentDetails!.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          getCompletedAppointmentsModel =
                              BlocProvider.of<GetCompletedAppointmentsBloc>(
                                      context)
                                  .getCompletedAppointmentsModel;
                          return getCompletedAppointmentsModel
                                      .appointmentDetails![index]
                                      .feedbackStatus ==
                                  0
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const HeadingWidget(
                                      title: "Your completed appointments",
                                    ),
                                    const VerticalSpacingWidget(height: 2),
                                    OnceCompletedWidget(
                                      checkInTime: getCompletedAppointmentsModel
                                          .appointmentDetails![index]
                                          .checkInTime
                                          .toString(),
                                      whenItStart: getCompletedAppointmentsModel
                                          .appointmentDetails![index]
                                          .symptomStartTime
                                          .toString(),
                                      whenItsCome: getCompletedAppointmentsModel
                                          .appointmentDetails![index]
                                          .symptomFrequency
                                          .toString(),
                                      prescriptions:
                                          getCompletedAppointmentsModel
                                              .appointmentDetails![index]
                                              .doctorMedicines!
                                              .toList(),
                                      vitals: getCompletedAppointmentsModel
                                          .appointmentDetails![index].vitals!
                                          .toList(),
                                      clinicName: getCompletedAppointmentsModel
                                          .appointmentDetails![index].clinicName
                                          .toString(),
                                      doctorImage: getCompletedAppointmentsModel
                                          .appointmentDetails![index]
                                          .doctorImage
                                          .toString(),
                                      doctorName: getCompletedAppointmentsModel
                                          .appointmentDetails![index].doctorName
                                          .toString(),
                                      labName: getCompletedAppointmentsModel
                                          .appointmentDetails![index].labName
                                          .toString(),
                                      labTestName: getCompletedAppointmentsModel
                                          .appointmentDetails![index].labTest
                                          .toString(),
                                      note: getCompletedAppointmentsModel
                                          .appointmentDetails![index].notes
                                          .toString(),
                                      patientName: getCompletedAppointmentsModel
                                          .appointmentDetails![index]
                                          .patientName
                                          .toString(),
                                      prescriptionImage:
                                          getCompletedAppointmentsModel
                                              .appointmentDetails![index]
                                              .prescriptionImage
                                              .toString(),
                                      tokenDate: getCompletedAppointmentsModel
                                          .appointmentDetails![index].date
                                          .toString(),
                                      tokenTime: getCompletedAppointmentsModel
                                          .appointmentDetails![index]
                                          .tokenStartTime
                                          .toString(),
                                      symptoms: getCompletedAppointmentsModel
                                                  .appointmentDetails![index]
                                                  .mainSymptoms ==
                                              null
                                          ? getCompletedAppointmentsModel
                                              .appointmentDetails![index]
                                              .otherSymptoms!
                                              .first
                                              .symtoms
                                              .toString()
                                          : getCompletedAppointmentsModel
                                              .appointmentDetails![index]
                                              .mainSymptoms!
                                              .mainsymptoms
                                              .toString(),
                                      reviewAfter: getCompletedAppointmentsModel
                                          .appointmentDetails![index]
                                          .reviewAfter
                                          .toString(),
                                      scanningCenterName:
                                          getCompletedAppointmentsModel
                                              .appointmentDetails![index]
                                              .scanTest
                                              .toString(),
                                      scanningTestName:
                                          getCompletedAppointmentsModel
                                              .appointmentDetails![index]
                                              .scanName
                                              .toString(),
                                    ),
                                    // getCompletedAppointmentsModel
                                    //             .appointmentDetails![index]
                                    //             .feedbackStatus ==
                                    //         0
                                    //     ?
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const HeadingWidget(
                                            title: "Submit your feedback"),
                                        const VerticalSpacingWidget(height: 2),
                                        UserRatingWidget(
                                          doctorName:
                                              getCompletedAppointmentsModel
                                                  .appointmentDetails![index]
                                                  .doctorName
                                                  .toString(),
                                          appointmentId:
                                              getCompletedAppointmentsModel
                                                  .appointmentDetails![index]
                                                  .appointmentId!,
                                        ),
                                      ],
                                    ),
                                    // : const SizedBox(),
                                    const VerticalSpacingWidget(height: 5),
                                  ],
                                )
                              : const SizedBox();
                        });
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
