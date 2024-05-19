import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/once_completed_widget.dart';
import '../../../../Repository/Bloc/GetAppointment/bloc/get_completed_feedback_appointment_bloc.dart';
import '../../../CommonWidgets/heading_widget.dart';
import '../../../CommonWidgets/vertical_spacing_widget.dart';

class GetCompletedFeedbackWidget extends StatelessWidget {
  const GetCompletedFeedbackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<GetCompletedFeedbackAppointmentBloc,
              GetCompletedFeedBackAppointmentsState>(
            builder: (context, state) {
              if (state is GetCompletedFeedBackAppointmentError) {
                return const Center(
                  child: Image(
                    image: AssetImage(
                      "assets/images/something went wrong-01.png",
                    ),
                    height: 50,
                  ),
                );
              }
              if (state is GetCompletedFeedBackAppointmentLoaded) {
                final data = state.getCompletedAppointmentsModel;
                return data.appointmentDetails == null ||
                        data.appointmentDetails!.isEmpty
                    ? const SizedBox()
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: data.appointmentDetails!.length > 1
                            ? 1
                            : data.appointmentDetails!.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return data.appointmentDetails![index]
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
                                      appointmentId: data
                                          .appointmentDetails![index]
                                          .appointmentId!,
                                      checkInTime: data
                                          .appointmentDetails![index]
                                          .checkInTime
                                          .toString(),
                                      whenItStart: data
                                          .appointmentDetails![index]
                                          .symptomStartTime
                                          .toString(),
                                      whenItsCome: data
                                          .appointmentDetails![index]
                                          .symptomFrequency
                                          .toString(),
                                      prescriptions: data
                                          .appointmentDetails![index]
                                          .doctorMedicines!
                                          .toList(),
                                      vitals: data
                                          .appointmentDetails![index].vitals!
                                          .toList(),
                                      clinicName: data
                                          .appointmentDetails![index].clinicName
                                          .toString(),
                                      doctorImage: data
                                          .appointmentDetails![index]
                                          .doctorImage
                                          .toString(),
                                      doctorName: data
                                          .appointmentDetails![index].doctorName
                                          .toString(),
                                      labName: data
                                          .appointmentDetails![index].labName
                                          .toString(),
                                      labTestName: data
                                          .appointmentDetails![index].labTest
                                          .toString(),
                                      note: data
                                          .appointmentDetails![index].notes
                                          .toString(),
                                      patientName: data
                                          .appointmentDetails![index]
                                          .patientName
                                          .toString(),
                                      prescriptionImage: data
                                          .appointmentDetails![index]
                                          .prescriptionImage
                                          .toString(),
                                      tokenDate: data
                                          .appointmentDetails![index].date
                                          .toString(),
                                      tokenTime: data.appointmentDetails![index]
                                          .tokenStartTime
                                          .toString(),
                                      symptoms: data.appointmentDetails![index]
                                                  .mainSymptoms ==
                                              null
                                          ? data.appointmentDetails![index]
                                              .otherSymptoms!.first.symtoms
                                              .toString()
                                          : data.appointmentDetails![index]
                                              .mainSymptoms!.mainsymptoms
                                              .toString(),
                                      reviewAfter: data
                                          .appointmentDetails![index]
                                          .reviewAfter
                                          .toString(),
                                      scanningCenterName: data
                                          .appointmentDetails![index].scanTest
                                          .toString(),
                                      scanningTestName: data
                                          .appointmentDetails![index].scanName
                                          .toString(),
                                      checkOutTime: data
                                          .appointmentDetails![index]
                                          .checkoutTime
                                          .toString(),
                                    ),
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
