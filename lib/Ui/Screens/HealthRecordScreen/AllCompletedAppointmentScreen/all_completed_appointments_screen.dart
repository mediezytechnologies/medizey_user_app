import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetCompletedAppointmentsByPatientId/get_completed_appointmets_by_patient_id_bloc.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/AppointmentsScreen/Widgets/completed_appointment_card_widget.dart';

class AllCompletedAppointmentsScreen extends StatelessWidget {
  const AllCompletedAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetCompletedAppointmetsByPatientIdBloc,
          GetCompletedAppointmetsByPatientIdState>(
        builder: (context, state) {
          if (state is GetCompletedAppointmetsByPatientIdLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: kMainColor,
              ),
            );
          }
          if (state is GetCompletedAppointmetsByPatientIdError) {
            return Center(
              child: Image(
                image: const AssetImage(
                    "assets/images/something went wrong-01.png"),
                height: 200.h,
                width: 200.w,
              ),
            );
          }
          if (state is GetCompletedAppointmetsByPatientIdLoaded) {
            final completedAppointment = state.getCompletedAppointmentsModel;
            return completedAppointment.appointmentDetails == null
                ? Center(
                    child: Image.asset("assets/icons/no data.png"),
                  )
                : ListView.builder(
                    itemCount: completedAppointment.appointmentDetails!.length,
                    itemBuilder: (context, index) {
                      return CompletedAppointmentCardWidget(
                        whenItStart: completedAppointment
                            .appointmentDetails![index].symptomStartTime
                            .toString(),
                        whenItsCome: completedAppointment
                            .appointmentDetails![index].symptomFrequency
                            .toString(),
                        vitals: completedAppointment
                            .appointmentDetails![index].vitals!
                            .toList(),
                        prescriptions: completedAppointment
                            .appointmentDetails![index].doctorMedicines!
                            .toList(),
                        clinicName: completedAppointment
                            .appointmentDetails![index].clinicName
                            .toString(),
                        doctorImage: completedAppointment
                            .appointmentDetails![index].doctorImage
                            .toString(),
                        doctorName: completedAppointment
                            .appointmentDetails![index].doctorName
                            .toString(),
                        labName: completedAppointment
                            .appointmentDetails![index].labName
                            .toString(),
                        labTestName: completedAppointment
                            .appointmentDetails![index].labTest
                            .toString(),
                        note: completedAppointment
                            .appointmentDetails![index].notes
                            .toString(),
                        patientName: completedAppointment
                            .appointmentDetails![index].patientName
                            .toString(),
                        prescriptionImage: completedAppointment
                            .appointmentDetails![index].prescriptionImage
                            .toString(),
                        tokenDate: completedAppointment
                            .appointmentDetails![index].date
                            .toString(),
                        tokenTime: completedAppointment
                            .appointmentDetails![index].tokenStartTime
                            .toString(),
                        symptoms: completedAppointment
                                    .appointmentDetails![index].mainSymptoms ==
                                null
                            ? completedAppointment.appointmentDetails![index]
                                .otherSymptoms!.first.symtoms
                                .toString()
                            : completedAppointment.appointmentDetails![index]
                                .mainSymptoms!.mainsymptoms
                                .toString(),
                        reviewAfter: completedAppointment
                            .appointmentDetails![index].reviewAfter
                            .toString(),
                        scanningCenterName: completedAppointment
                            .appointmentDetails![index].scanTest
                            .toString(),
                        scanningTestName: completedAppointment
                            .appointmentDetails![index].scanName
                            .toString(),
                      );
                    });
          }
          return Container();
        },
      ),
    );
  }
}
