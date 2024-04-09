import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/GetAppointments/get_completed_appointments_model.dart';
import 'package:mediezy_user/Repository/Bloc/GetAppointment/GetCompletedAppointments/get_completed_appointments_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/AppointmentsScreen/Widgets/completed_appointment_card_widget.dart';

class CompletedAppointmentScreen extends StatefulWidget {
  const CompletedAppointmentScreen({super.key});

  @override
  State<CompletedAppointmentScreen> createState() =>
      _CompletedAppointmentScreenState();
}

class _CompletedAppointmentScreenState
    extends State<CompletedAppointmentScreen> {
  late GetCompletedAppointmentsModel getCompletedAppointmentsModel;

  @override
  void initState() {
    BlocProvider.of<GetCompletedAppointmentsBloc>(context)
        .add(FetchCompletedAppointments());
    super.initState();
  }

  Future<void> _refreshData() async {
    BlocProvider.of<GetCompletedAppointmentsBloc>(context)
        .add(FetchCompletedAppointments());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: BlocBuilder<GetCompletedAppointmentsBloc,
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
                  BlocProvider.of<GetCompletedAppointmentsBloc>(context)
                      .getCompletedAppointmentsModel;
              return getCompletedAppointmentsModel.appointmentDetails == null
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
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: getCompletedAppointmentsModel
                          .appointmentDetails!.length,
                      itemBuilder: (context, index) {
                        return CompletedAppointmentCardWidget(
                          prescriptions: getCompletedAppointmentsModel
                              .appointmentDetails![index].doctorMedicines!
                              .toList(),
                          clinicName: getCompletedAppointmentsModel
                              .appointmentDetails![index].clinicName
                              .toString(),
                          doctorImage: getCompletedAppointmentsModel
                              .appointmentDetails![index].doctorImage
                              .toString(),
                          doctorName: getCompletedAppointmentsModel
                              .appointmentDetails![index].doctorName
                              .toString(),
                          labName: getCompletedAppointmentsModel
                                      .appointmentDetails![index].labName ==
                                  null
                              ? ""
                              : getCompletedAppointmentsModel
                                  .appointmentDetails![index].labName
                                  .toString(),
                          labTestName: getCompletedAppointmentsModel
                                      .appointmentDetails![index].labTest ==
                                  null
                              ? ""
                              : getCompletedAppointmentsModel
                                  .appointmentDetails![index].labTest
                                  .toString(),
                          note: getCompletedAppointmentsModel
                                      .appointmentDetails![index].notes ==
                                  null
                              ? ""
                              : getCompletedAppointmentsModel
                                  .appointmentDetails![index].notes
                                  .toString(),
                          patientName: getCompletedAppointmentsModel
                              .appointmentDetails![index].patientName
                              .toString(),
                          prescriptionImage: getCompletedAppointmentsModel
                                      .appointmentDetails![index]
                                      .prescriptionImage ==
                                  null
                              ? ""
                              : getCompletedAppointmentsModel
                                  .appointmentDetails![index].prescriptionImage
                                  .toString(),
                          tokenDate: getCompletedAppointmentsModel
                              .appointmentDetails![index].date
                              .toString(),
                          tokenTime: getCompletedAppointmentsModel
                              .appointmentDetails![index].tokenStartTime
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
                        );
                      });
            }
            return Container();
          },
        ),
      ),
    );
  }
}
