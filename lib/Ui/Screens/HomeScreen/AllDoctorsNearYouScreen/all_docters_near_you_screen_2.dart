import 'dart:async';
import 'dart:developer';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/internet_handle_screen.dart';
import 'package:mediezy_user/Ui/CommonWidgets/recommend_doctor_card.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';

import '../../../../ddd/application/get_docters/get_docters_bloc.dart';
import '../../../CommonWidgets/doctor_card_widget_2.dart';

class AllDoctorNearYouScreen2 extends StatefulWidget {
  const AllDoctorNearYouScreen2({super.key});

  @override
  State<AllDoctorNearYouScreen2> createState() =>
      _AllDoctorNearYouScreen2State();
}

class _AllDoctorNearYouScreen2State extends State<AllDoctorNearYouScreen2> {
  late StreamSubscription<ConnectivityResult> subscription;
  bool isClicked = false;

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
    BlocProvider.of<GetDoctersBloc>(context).add(const GetDoctersEvent.started());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctors Near You"),
        centerTitle: true,
      ),
      body: StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            final connectivityResult = snapshot.data;
            if (connectivityResult == ConnectivityResult.none) {
              return const InternetHandleScreen();
            } else {
              return BlocConsumer<GetDoctersBloc, GetDoctersState>(
                listener: (context, state) {
                  if (state.isloding) {
                     Center(
                      child: Image(
                        image: const AssetImage(
                            "assets/images/something went wrong-01.png"),
                        height: 200.h,
                        width: 200.w,
                      ),
                    );
                  }
                  if (state.isError) {
                    log("data error ${state.message}");
                  }
                },
                builder: (context, state) {
                  return FadedSlideAnimation(
                    beginOffset: const Offset(0, 0.3),
                    endOffset: const Offset(0, 0),
                    slideCurve: Curves.linearToEaseOut,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                //    String ?id =          state.model!.favoriteDoctors![index].userId.toString();
                                return DoctorCardWidget2(
                                  userAwayFrom: "2.2",
                                  clinicList:
                                      state.model[index].clinics!.toList(),
                                  doctorId:
                                      state.model[index].userId.toString(),
                                  firstName:
                                      state.model[index].firstname ?? "jhfg",
                                  lastName:
                                      state.model[index].secondname ?? "jhfg",
                                  imageUrl:
                                      state.model[index].docterImage ?? "jhfg",
                                  mainHospitalName:
                                      state.model[index].mainHospital ?? "jhfg",
                                  specialisation:
                                      state.model[index].specialization ??
                                          "jhfg",
                                  location:
                                      state.model[index].location ?? "jhfg",
                                );
                              },
                              itemCount: state.model.length),
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
                },
              );
            }
          }),
    );
  }
}
