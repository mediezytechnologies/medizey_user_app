// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:io';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/Article/article_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetAppointment/GetCompletedAppointments/get_completed_appointments_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetAppointment/GetUpcomingAppointment/get_upcoming_appointment_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetHealthSymptomsAndDoctor/GetHealthSymptoms/get_health_symptoms_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetRecentlyBookedDoctor/get_recently_booked_doctors_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthCategories/GetHealthCategories/get_health_categories_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/Hospital/GetHospital/get_hospital_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/Profile/GetUser/get_user_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/banner/banner_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/recommend_doctor_card.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/Widgets/get_doctor_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_appbar.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_article_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_helath_concern_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_hospital_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_intro_card.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_recently_booked_doctor_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_suggest_doctor_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/upcoming_appoiment.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import 'Widgets/home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController suggestionController = TextEditingController();
  late Timer pollingTimer;
  bool isLoading = true;

//location //===========

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetUpcomingAppointmentBloc>(context)
        .add(FetchUpComingAppointments());
    BlocProvider.of<GetHealthCategoriesBloc>(context)
        .add(FetchHealthCategories());
    BlocProvider.of<GetUserBloc>(context).add(FetchUserDetails());
    BlocProvider.of<GetRecentlyBookedDoctorsBloc>(context)
        .add(FetchRecentlyBookedDoctors());
    BlocProvider.of<GetHealthSymptomsBloc>(context)
        .add(FetchAllHealthSymptoms());
    BlocProvider.of<GetHospitalBloc>(context).add((FetchAllHospitals()));
    BlocProvider.of<ArticleBloc>(context).add((FetchArticle()));
    BlocProvider.of<GetCompletedAppointmentsBloc>(context)
        .add(FetchCompletedAppointments());
    BlocProvider.of<BannerBloc>(context).add(FetchBannerEvent(type: "1"));
    startPolling();
  }

  void startPolling() async {
    pollingTimer = Timer.periodic(const Duration(seconds: 15), (timer) {
      BlocProvider.of<GetUpcomingAppointmentBloc>(context)
          .add(FetchUpComingAppointments());
    });
  }

  void stopPolling() {
    pollingTimer.cancel();
  }

  @override
  void dispose() {
    stopPolling();
    super.dispose();
  }

  ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadedSlideAnimation(
      beginOffset: const Offset(0, 0.3),
      endOffset: const Offset(0, 0),
      slideCurve: Curves.linearToEaseOut,
      child: WillPopScope(
        onWillPop: () async {
          GeneralServices.instance
              .appCloseDialogue(context, "Are you want to Exit", () async {
            SystemNavigator.pop();
          });
          return Future.value(false);
        },
        child: Scaffold(
          backgroundColor: kSecondaryColor,
          body: ValueListenableBuilder(
              valueListenable: scrollNotifier,
              builder: (context, index, _) {
                return NotificationListener<UserScrollNotification>(
                
                  onNotification: (notification) {
                    final ScrollDirection direction = notification.direction;

                    if (direction == ScrollDirection.reverse) {
                      scrollNotifier.value = false;
                    } else if (direction == ScrollDirection.forward) {
                      scrollNotifier.value = true;
                    }
                    return true;
                  },
                  child: Stack(
                    children: [
                      ListView(
                        children: [
                          SizedBox(
                              height: Platform.isIOS
                                  ? size.height * 0.03
                                  : size.height * 0.07),
                          const HomeIntroCard(),
                        
                     
                          Container(
                            width: double.infinity,
                            color: kSubScaffoldColor,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.01),
                              child: const Column(
                                children: [
                                 
                                  VerticalSpacingWidget(height: 5),
                                  RecommendedDoctorCard(),
                                  VerticalSpacingWidget(height: 5),
                                  UpcommingAppoiment(),
                                  VerticalSpacingWidget(height: 5),
                                  HomeHealthConcernWidget(),
                                  VerticalSpacingWidget(height: 5),
                                  HomeRecentlyBookedDoctorWidget(),
                                  VerticalSpacingWidget(height: 5),
                                ],
                              ),
                            ),
                          ),
                          HomeSuggestDoctorWidget(
                              suggestionController: suggestionController),
                          Container(
                            width: double.infinity,
                            color: kSubScaffoldColor,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.01),
                              child: const Column(
                                children: [
                                  VerticalSpacingWidget(height: 5),
                                  HomeHospitalWidget(),
                                  VerticalSpacingWidget(height: 5),
                                  HomeArticleWidget(),
                                  VerticalSpacingWidget(height: 5),
                                ],
                              ),
                            ),
                          ),
                          const Image(
                            image: AssetImage("assets/images/mediezy.jpg"),
                          ),
                        ],
                      ),
                      scrollNotifier.value == true
                          ? const HomeAappBar()
                          : const SizedBox(),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
