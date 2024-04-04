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
            return completedAppointment.completedAppointments!.isEmpty ||
                    completedAppointment.completedAppointments == null
                ? Center(
                    child: Image.asset("assets/icons/no data.png"),
                  )
                : ListView.builder(
                    itemCount:
                        completedAppointment.completedAppointments!.length,
                    itemBuilder: (context, index) {
                      return CompletedAppointmentCardWidget(
                        prescriptions: completedAppointment
                            .completedAppointments![index].medicalPrescriptions!
                            .toList(),
                        clinicName: completedAppointment
                            .completedAppointments![index].clinicName
                            .toString(),
                        doctorImage: completedAppointment
                            .completedAppointments![index].doctorImage
                            .toString(),
                        doctorName: completedAppointment
                            .completedAppointments![index].doctorName
                            .toString(),
                        labName: completedAppointment
                                    .completedAppointments![index].labName ==
                                null
                            ? ""
                            : completedAppointment
                                .completedAppointments![index].labName
                                .toString(),
                        labTestName: completedAppointment
                                    .completedAppointments![index].labTest ==
                                null
                            ? ""
                            : completedAppointment
                                .completedAppointments![index].labTest
                                .toString(),
                        medicalStoreName: completedAppointment
                                    .completedAppointments![index]
                                    .medicalStoreName ==
                                null
                            ? ""
                            : completedAppointment
                                .completedAppointments![index].medicalStoreName
                                .toString(),
                        note: completedAppointment
                                    .completedAppointments![index].notes ==
                                null
                            ? ""
                            : completedAppointment
                                .completedAppointments![index].notes
<<<<<<< HEAD
                                .toString(),
                        patientName: completedAppointment
                            .completedAppointments![index].patientName
                            .toString(),
                        prescriptionImage: completedAppointment
                                    .completedAppointments![index]
                                    .prescriptionImage ==
                                null
                            ? ""
                            : completedAppointment
                                .completedAppointments![index].prescriptionImage
                                .toString(),
=======
                                .toString(),
                        patientName: completedAppointment
                            .completedAppointments![index].patientName
                            .toString(),
                        prescriptionImage: completedAppointment
                                    .completedAppointments![index]
                                    .prescriptionImage ==
                                null
                            ? ""
                            : completedAppointment
                                .completedAppointments![index].prescriptionImage
                                .toString(),
>>>>>>> fe0e675d98c5501f7e9ae26aef4a7c9763a660c3
                        reviewAfter: completedAppointment
                                    .completedAppointments![index]
                                    .reviewAfter ==
                                null
                            ? ""
                            : completedAppointment
                                .completedAppointments![index].reviewAfter
                                .toString(),
                        tokenDate: completedAppointment
                            .completedAppointments![index].tokenDate
                            .toString(),
                        tokenTime: completedAppointment
                            .completedAppointments![index].tokenTime
                            .toString(),
                        symptoms: completedAppointment
                                    .completedAppointments![index]
<<<<<<< HEAD
                                    .mainSymptoms ==
=======
                                    .mainSymptoms!
                                    .mainsymptoms ==
>>>>>>> fe0e675d98c5501f7e9ae26aef4a7c9763a660c3
                                null
                            ? completedAppointment.completedAppointments![index]
                                .otherSymptom!.symtoms
                                .toString()
                            : completedAppointment.completedAppointments![index]
                                .mainSymptoms!.mainsymptoms
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
