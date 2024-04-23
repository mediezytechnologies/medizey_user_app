import 'dart:async';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/GetRecentlyBookedDoctor/get_recently_booked_doctor_model.dart';
import 'package:mediezy_user/Repository/Bloc/GetRecentlyBookedDoctor/get_recently_booked_doctors_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_loadin_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/internet_handle_screen.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/doctor_card_widget.dart';

class RecentBookedDoctorsScreen extends StatefulWidget {
  const RecentBookedDoctorsScreen({super.key});

  @override
  State<RecentBookedDoctorsScreen> createState() =>
      _RecentBookedDoctorsScreenState();
}

class _RecentBookedDoctorsScreenState extends State<RecentBookedDoctorsScreen> {
  late GetRecentlyBookedDoctorModel getRecentlyBookedDoctorModel;
  late StreamSubscription<ConnectivityResult> subscription;

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
    BlocProvider.of<GetRecentlyBookedDoctorsBloc>(context)
        .add(FetchRecentlyBookedDoctors());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recent booked"),
        centerTitle: true,
      ),
      body: StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          final connectivityResult = snapshot.data;
          if (connectivityResult == ConnectivityResult.none) {
            return const InternetHandleScreen();
          } else {
            return FadedSlideAnimation(
              beginOffset: const Offset(0, 0.3),
              endOffset: const Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
              child: BlocBuilder<GetRecentlyBookedDoctorsBloc,
                  GetRecentlyBookedDoctorsState>(
                builder: (context, state) {
                  if (state is GetRecentlyBookedDoctorLoading) {
                    return doctorCardLoadingWidget();
                  }
                  if (state is GetRecentlyBookedDoctorError) {
                    return Center(
                      child: Image(
                        image: const AssetImage(
                            "assets/images/something went wrong-01.png"),
                        height: 200.h,
                        width: 200.w,
                      ),
                    );
                  }
                  if (state is GetRecentlyBookedDoctorLoaded) {
                    getRecentlyBookedDoctorModel =
                        BlocProvider.of<GetRecentlyBookedDoctorsBloc>(context)
                            .getRecentlyBookedDoctorModel;
                    return getRecentlyBookedDoctorModel.recentlyBookedDoctor ==
                            null
                        ? Center(
                            child: Column(
                              children: [
                                const VerticalSpacingWidget(height: 80),
                                Image(
                                  image: const AssetImage(
                                      "assets/icons/no recent booked.png"),
                                  height: 250.h,
                                  width: 250.w,
                                ),
                                Text(
                                  "No Recent booked doctors\nare available",
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
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: getRecentlyBookedDoctorModel
                                .recentlyBookedDoctor!.length,
                            itemBuilder: (context, index) {
                              return DoctorCardWidget(
                                userAwayFrom: getRecentlyBookedDoctorModel
                                    .recentlyBookedDoctor![index]
                                    .distanceFromUser
                                    .toString(),
                                clinicList: getRecentlyBookedDoctorModel
                                    .recentlyBookedDoctor![index].clinics!
                                    .toList(),
                                doctorId: getRecentlyBookedDoctorModel
                                    .recentlyBookedDoctor![index].userId
                                    .toString(),
                                firstName: getRecentlyBookedDoctorModel
                                    .recentlyBookedDoctor![index].firstname
                                    .toString(),
                                lastName: getRecentlyBookedDoctorModel
                                    .recentlyBookedDoctor![index].secondname
                                    .toString(),
                                imageUrl: getRecentlyBookedDoctorModel
                                    .recentlyBookedDoctor![index].docterImage
                                    .toString(),
                                mainHospitalName: getRecentlyBookedDoctorModel
                                    .recentlyBookedDoctor![index].mainHospital
                                    .toString(),
                                specialisation: getRecentlyBookedDoctorModel
                                    .recentlyBookedDoctor![index].specialization
                                    .toString(),
                                location: getRecentlyBookedDoctorModel
                                    .recentlyBookedDoctor![index].location
                                    .toString(),
                              );
                            });
                  }
                  return Container();
                },
              ),
            );
          }
        },
      ),
    );
  }
}
