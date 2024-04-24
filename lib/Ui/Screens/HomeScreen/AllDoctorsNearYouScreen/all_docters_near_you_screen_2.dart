import 'dart:async';
import 'dart:developer';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/Doctor/doctor_model.dart';
import 'package:mediezy_user/Repository/Bloc/GetDoctor/GetDoctors/get_doctor_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/internet_handle_screen.dart';
import 'package:mediezy_user/Ui/CommonWidgets/recommend_doctor_card.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/CommonWidgets/doctor_card_widget.dart';

import '../../../../ddd/application/get_docters/get_docters_bloc.dart';
import '../../../CommonWidgets/doctor_card_widget_2.dart';

class AllDoctorNearYouScreen2 extends StatefulWidget {
  const AllDoctorNearYouScreen2({super.key});

  @override
  State<AllDoctorNearYouScreen2> createState() => _AllDoctorNearYouScreen2State();
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
    BlocProvider.of<GetDoctersBloc>(context).add(GetDoctersEvent.started());
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

           return   BlocConsumer<GetDoctersBloc, GetDoctersState>(
                listener: (context, state) {
                 if (state.isError) {
                   log("data error ${state.message!}");
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
                       String ?id =          state.model!.favoriteDoctors![index].userId.toString();
                                  return DoctorCardWidget2(
                                    userAwayFrom: "2.2",
                                    clinicList:
                                    state.model!.favoriteDoctors![index].clinics!.toList(),
                                    
                                    
                                    
                                    doctorId:
                                   state.model!.favoriteDoctors![index].userId.toString()
                                    ,
                                    firstName: 
                                    state.model!.favoriteDoctors![index].firstname??"jhfg"
                                    ,
                                    
                                    lastName:
                                     state.model!.favoriteDoctors![index].secondname??"jhfg"
                                    ,
                                    
                                   
                                    imageUrl: 
                                     state.model!.favoriteDoctors![index].docterImage??"jhfg"
                                    ,
                                    
                                   
                                    mainHospitalName: 

                                     state.model!.favoriteDoctors![index].mainHospital??"jhfg"
                                    ,
                                    
                                    
                                  
                                    specialisation:
                                     state.model!.favoriteDoctors![index].specialization??"jhfg"
                                    ,
                                    
                                    location: 
                                     state.model!.favoriteDoctors![index].location??"jhfg"
                                    ,
                                    
                                  
                                  );
                                },
                                itemCount:
                                 state.model!.favoriteDoctors!.length),
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







              // return BlocBuilder<GetDoctorBloc, GetDoctorState>(
              //   builder: (context, state) {
              //     if (state is GetDoctorLoading) {
              //       return Center(
              //         child: CircularProgressIndicator(
              //           color: kMainColor,
              //         ),
              //       );
              //     }
              //     if (state is GetDoctorError) {
              //       return Center(
              //         child: Image(
              //           image: const AssetImage(
              //               "assets/images/something went wrong-01.png"),
              //           height: 200.h,
              //           width: 200.w,
              //         ),
              //       );
              //     }
              //     if (state is GetDoctorLoaded) {
              //       doctorModel =
              //           BlocProvider.of<GetDoctorBloc>(context).doctorModel;
              //       return FadedSlideAnimation(
              //         beginOffset: const Offset(0, 0.3),
              //         endOffset: const Offset(0, 0),
              //         slideCurve: Curves.linearToEaseOut,
              //         child: SingleChildScrollView(
              //           child: Column(
              //             children: [
              //               ListView.builder(
              //                   padding: EdgeInsets.zero,
              //                   shrinkWrap: true,
              //                   physics: const NeverScrollableScrollPhysics(),
              //                   itemBuilder: (context, index) {
              //                     return DoctorCardWidget(
              //                       userAwayFrom: "2.2",
              //                       clinicList: doctorModel
              //                           .allDoctors![index].clinics!
              //                           .toList(),
              //                       doctorId: doctorModel
              //                           .allDoctors![index].userId
              //                           .toString(),
              //                       firstName: doctorModel
              //                           .allDoctors![index].firstname
              //                           .toString(),
              //                       lastName: doctorModel
              //                           .allDoctors![index].secondname
              //                           .toString(),
              //                       imageUrl: doctorModel
              //                           .allDoctors![index].docterImage
              //                           .toString(),
              //                       mainHospitalName: doctorModel
              //                           .allDoctors![index].mainHospital
              //                           .toString(),
              //                       specialisation: doctorModel
              //                           .allDoctors![index].specialization
              //                           .toString(),
              //                       location: doctorModel
              //                           .allDoctors![index].location
              //                           .toString(),
              //                     );
              //                   },
              //                   itemCount: doctorModel.allDoctors!.length),
              //               const VerticalSpacingWidget(height: 5),
              //               Padding(
              //                 padding: EdgeInsets.symmetric(horizontal: 8.w),
              //                 child: const RecommendedDoctorCard(),
              //               ),
              //               const VerticalSpacingWidget(height: 5)
              //             ],
              //           ),
              //         ),
              //       );
              //     }
              //     return Container();
              //   },
              // );
            }
          }),
    );
  }
}