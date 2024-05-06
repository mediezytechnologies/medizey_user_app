import 'dart:async';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/GetSpecialisations/get_doctors_as_per_specialisation_model.dart';
import 'package:mediezy_user/Repository/Bloc/GetSpecialisations/GetDoctorsAsPerSpecialisation/get_doctors_as_per_specialisation_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/internet_handle_screen.dart';
import 'package:mediezy_user/Ui/CommonWidgets/recommend_doctor_card.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/CommonWidgets/doctor_card_widget.dart';

class DoctorsBySpecialisationScreen extends StatefulWidget {
  const DoctorsBySpecialisationScreen(
      {super.key,
      required this.specialisationName,
      required this.specialisationId});

  final String specialisationName;
  final String specialisationId;

  @override
  State<DoctorsBySpecialisationScreen> createState() =>
      _DoctorsBySpecialisationScreenState();
}

class _DoctorsBySpecialisationScreenState
    extends State<DoctorsBySpecialisationScreen> {
  late GetDoctersAsPerSpecialisationModel getDoctersAsPerSpecialisationModel;
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
    BlocProvider.of<GetDoctorsAsPerSpecialisationBloc>(context)
        .add(FetchDocterAsperSpecialisaton(id: widget.specialisationId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.specialisationName),
        centerTitle: true,
      ),
      body: StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          final connectivityResult = snapshot.data;
          if (connectivityResult == ConnectivityResult.none) {
            return const InternetHandleScreen();
          } else {
            return BlocBuilder<GetDoctorsAsPerSpecialisationBloc,
                GetDoctorsAsPerSpecialisationState>(
              builder: (context, state) {
                if (state is GetDoctorsAsperSpecialisationLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: kMainColor,
                    ),
                  );
                }
                if (state is GetDoctorsAsperSpecialisationError) {
                  return const Center(
                    child: Text("Something went Wrong"),
                  );
                }
                if (state is GetDoctorsAsperSpecialisationLoaded) {
                  getDoctersAsPerSpecialisationModel =
                      BlocProvider.of<GetDoctorsAsPerSpecialisationBloc>(
                              context)
                          .getDoctersAsPerSpecialisationModel;
                  return FadedSlideAnimation(
                    beginOffset: const Offset(0, 0.3),
                    endOffset: const Offset(0, 0),
                    slideCurve: Curves.linearToEaseOut,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const VerticalSpacingWidget(height: 10),
                          getDoctersAsPerSpecialisationModel
                                  .doctorBySpecialization!.isEmpty
                              ? Center(
                                  child: Column(
                                    children: [
                                      const VerticalSpacingWidget(height: 100),
                                      Image(
                                        image: const AssetImage(
                                            "assets/icons/no doctor.png"),
                                        height: 250.h,
                                        width: 250.w,
                                      ),
                                      Text(
                                        "No Doctors available\nStay tuned",
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
                                  itemCount: getDoctersAsPerSpecialisationModel
                                      .doctorBySpecialization!.length,
                                  itemBuilder: (context, index) {
                                    return DoctorCardWidget(
                                      favourites: const SizedBox(),
                                      userAwayFrom:
                                          getDoctersAsPerSpecialisationModel
                                              .doctorBySpecialization![index]
                                              .distanceFromUser
                                              .toString(),
                                      clinicList:
                                          getDoctersAsPerSpecialisationModel
                                              .doctorBySpecialization![index]
                                              .clinics!
                                              .toList(),
                                      location:
                                          getDoctersAsPerSpecialisationModel
                                              .doctorBySpecialization![index]
                                              .location
                                              .toString(),
                                      specialisation:
                                          getDoctersAsPerSpecialisationModel
                                              .doctorBySpecialization![index]
                                              .specialization
                                              .toString(),
                                      doctorId:
                                          getDoctersAsPerSpecialisationModel
                                              .doctorBySpecialization![index]
                                              .userId
                                              .toString(),
                                      firstName:
                                          getDoctersAsPerSpecialisationModel
                                              .doctorBySpecialization![index]
                                              .firstname
                                              .toString(),
                                      lastName:
                                          getDoctersAsPerSpecialisationModel
                                              .doctorBySpecialization![index]
                                              .secondname
                                              .toString(),
                                      imageUrl:
                                          getDoctersAsPerSpecialisationModel
                                              .doctorBySpecialization![index]
                                              .docterImage
                                              .toString(),
                                      mainHospitalName:
                                          getDoctersAsPerSpecialisationModel
                                              .doctorBySpecialization![index]
                                              .mainHospital
                                              .toString(),
                                    );
                                  },
                                ),
                          const VerticalSpacingWidget(height: 5),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: const RecommendedDoctorCard(),
                          ),
                          const VerticalSpacingWidget(height: 5)
                        ],
                      ),
                    ),
                  );
                }
                return Container();
              },
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
