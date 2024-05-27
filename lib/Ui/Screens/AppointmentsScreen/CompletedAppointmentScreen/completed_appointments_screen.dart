import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/GetAppointments/get_completed_appointments_model.dart';
import 'package:mediezy_user/Repository/Bloc/GetAppointment/GetCompletedAppointments/get_completed_appointments_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/AppointmentsScreen/Widgets/completed_appointment_card_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/AllDoctorsNearYouScreen/all_doctors_near_you_screen.dart';

import '../../../CommonWidgets/text_style_widget.dart';

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
                    return getCompletedAppointmentsModel.appointmentDetails ==
                            null
                        ? SizedBox(
                            width: size.width,
                            child: Column(
                              children: [
                                const VerticalSpacingWidget(height: 30),
                                Text("No appointment available", style: main20),
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
                                      borderRadius: BorderRadius.circular(10.r),
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
                            itemCount: getCompletedAppointmentsModel
                                .appointmentDetails!.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return CompletedAppointmentCardWidget(
                                whenItStart: getCompletedAppointmentsModel
                                    .appointmentDetails![index].symptomStartTime
                                    .toString(),
                                whenItsCome: getCompletedAppointmentsModel
                                    .appointmentDetails![index].symptomFrequency
                                    .toString(),
                                prescriptions: getCompletedAppointmentsModel
                                    .appointmentDetails![index].doctorMedicines!
                                    .toList(),
                                vitals: getCompletedAppointmentsModel
                                    .appointmentDetails![index].vitals!
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
                                    .appointmentDetails![index].labName
                                    .toString(),
                                labTestName: getCompletedAppointmentsModel
                                    .appointmentDetails![index].labTest
                                    .toString(),
                                note: getCompletedAppointmentsModel
                                    .appointmentDetails![index].notes
                                    .toString(),
                                patientName: getCompletedAppointmentsModel
                                    .appointmentDetails![index].patientName
                                    .toString(),
                                prescriptionImage: getCompletedAppointmentsModel
                                    .appointmentDetails![index]
                                    .prescriptionImage
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
                                reviewAfter: getCompletedAppointmentsModel
                                    .appointmentDetails![index].reviewAfter
                                    .toString(),
                                scanningCenterName:
                                    getCompletedAppointmentsModel
                                        .appointmentDetails![index].scanName
                                        .toString(),
                                scanningTestName: getCompletedAppointmentsModel
                                    .appointmentDetails![index].scanTest
                                    .toString(),
                              );
                            });
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
