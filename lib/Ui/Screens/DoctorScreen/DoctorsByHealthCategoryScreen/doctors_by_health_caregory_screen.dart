import 'dart:async';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/HealthCategories/get_doctors_by_health_categories_model.dart';
import 'package:mediezy_user/Repository/Bloc/HealthCategories/GetDoctorsByHealthCategory/get_doctors_by_health_category_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/internet_handle_screen.dart';
import 'package:mediezy_user/Ui/CommonWidgets/recommend_doctor_card.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/CommonWidgets/doctor_card_widget.dart';

class DoctorsByHealthCatrgoryScreen extends StatefulWidget {
  const DoctorsByHealthCatrgoryScreen(
      {super.key,
      required this.healthCategoryId,
      required this.healthCategoryName});

  final String healthCategoryId;
  final String healthCategoryName;

  @override
  State<DoctorsByHealthCatrgoryScreen> createState() =>
      _DoctorsByHealthCatrgoryScreenState();
}

class _DoctorsByHealthCatrgoryScreenState
    extends State<DoctorsByHealthCatrgoryScreen> {
  late GetDoctorsByHealthCategoriesModel getDoctorsByHealthCategoriesModel;
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
    BlocProvider.of<GetDoctorsByHealthCategoryBloc>(context).add(
        FetchDoctorByHealthCategory(healthCategoryId: widget.healthCategoryId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadedSlideAnimation(
      beginOffset: const Offset(0, 0.3),
      endOffset: const Offset(0, 0),
      slideCurve: Curves.linearToEaseOut,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.healthCategoryName),
          centerTitle: true,
        ),
        body: StreamBuilder<ConnectivityResult>(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              final connectivityResult = snapshot.data;
              if (connectivityResult == ConnectivityResult.none) {
                return const InternetHandleScreen();
              } else {
                return BlocBuilder<GetDoctorsByHealthCategoryBloc,
                    GetDoctorsByHealthCategoryState>(
                  builder: (context, state) {
                    if (state is GetDoctorsByHealthCategoryLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: kMainColor,
                        ),
                      );
                    }
                    if (state is GetDoctorsByHealthCategoryError) {
                      return Center(
                        child: Image(
                          image: const AssetImage(
                              "assets/images/something went wrong-01.png"),
                          height: 200.h,
                          width: 200.w,
                        ),
                      );
                    }
                    if (state is GetDoctorsByHealthCategoryLoaded) {
                      getDoctorsByHealthCategoriesModel =
                          BlocProvider.of<GetDoctorsByHealthCategoryBloc>(
                                  context)
                              .getDoctorsByHealthCategoriesModel;
                      return FadedSlideAnimation(
                        beginOffset: const Offset(0, 0.3),
                        endOffset: const Offset(0, 0),
                        slideCurve: Curves.linearToEaseOut,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const VerticalSpacingWidget(height: 5),
                              ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return DoctorCardWidget(
                                      favourites: const SizedBox(),
                                      clinicList:
                                          getDoctorsByHealthCategoriesModel
                                              .healthConcern![index].clinics!
                                              .toList(),
                                      doctorId:
                                          getDoctorsByHealthCategoriesModel
                                              .healthConcern![index].userId
                                              .toString(),
                                      firstName:
                                          getDoctorsByHealthCategoriesModel
                                              .healthConcern![index].firstname
                                              .toString(),
                                      imageUrl:
                                          getDoctorsByHealthCategoriesModel
                                              .healthConcern![index].docterImage
                                              .toString(),
                                      lastName:
                                          getDoctorsByHealthCategoriesModel
                                              .healthConcern![index].secondname
                                              .toString(),
                                      location:
                                          getDoctorsByHealthCategoriesModel
                                              .healthConcern![index].location
                                              .toString(),
                                      mainHospitalName:
                                          getDoctorsByHealthCategoriesModel
                                              .healthConcern![index]
                                              .mainHospital
                                              .toString(),
                                      specialisation:
                                          getDoctorsByHealthCategoriesModel
                                              .healthConcern![index]
                                              .specialization
                                              .toString(),
                                    );
                                  },
                                  itemCount: getDoctorsByHealthCategoriesModel
                                      .healthConcern!.length),
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
            }),
      ),
    );
  }
}
