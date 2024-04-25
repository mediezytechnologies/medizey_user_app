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
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:mediezy_user/Repository/Bloc/Article/article_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/Favourites/GetFavourites/get_favourites_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetAppointment/GetUpcomingAppointment/get_upcoming_appointment_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetDoctor/GetDoctors/get_doctor_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/Hospital/GetHospital/get_hospital_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/banner/banner_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/recommend_doctor_card.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/AllDoctorsNearYouScreen/all_docters_near_you_screen_2.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/get_favourite_doctor_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/get_doctor_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_appbar.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_intro_card.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_suggest_doctor_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/upcoming_appoiment.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';

import '../../../ddd/application/get_docters/get_docters_bloc.dart';
import '../../../ddd/infrastructure/docters_service/docters_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController suggestionController = TextEditingController();
  late Timer pollingTimer;
  bool isLoading = true;
  late ScrollController _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;

  @override
  void initState() {
    _scrollViewController = ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
    super.initState();
    BlocProvider.of<GetDoctorBloc>(context).add(FetchGetDoctor());
    BlocProvider.of<GetUpcomingAppointmentBloc>(context)
        .add(FetchUpComingAppointments());
    BlocProvider.of<GetHospitalBloc>(context).add((FetchAllHospitals()));
    BlocProvider.of<ArticleBloc>(context).add((FetchArticle()));
    BlocProvider.of<BannerBloc>(context).add(FetchBannerEvent(type: "1"));
    BlocProvider.of<GetFavouritesBloc>(context).add(FetchAllFavourites());
    BlocProvider.of<GetDoctersBloc>(context).add(GetDoctersEvent.started());
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

  appBarScrolling() {}

  @override
  void dispose() {
    stopPolling();
    stopPolling();
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }

  //ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

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
              body:

                  // ValueListenableBuilder(
                  //     valueListenable: scrollNotifier,
                  //     builder: (context, index, _) {
                  //       return NotificationListener<UserScrollNotification>(
                  //         onNotification: (notification) {
                  //           final ScrollDirection direction = notification.direction;

                  //           if (direction == ScrollDirection.reverse) {
                  //             scrollNotifier.value = false;
                  //           } else if (direction == ScrollDirection.forward) {
                  //             scrollNotifier.value = true;
                  //           }
                  //           return true;
                  //         },
                  //         child:

                  Column(
                children: [
                  // AnimatedContainer(
                  //     height: _showAppbar ? 56.0 : 0.0,
                  //     duration: Duration(milliseconds: 200),
                  //     child: AppBar(
                  //       backgroundColor: Colors.amber,
                  //       title: const Text("Demo Scrolling "),
                  //       centerTitle: true,
                  //       leading: const Icon(Icons.star),
                  //     )),
                  HomeAappBar(
                    isAppBar: _showAppbar ? size.height * .10 : 0.0,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _scrollViewController,
                      child: Column(
                        children: [
              //            ElevatedButton(
              //   onPressed: () => MapsLauncher.launchQuery(
              //       '1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA'),
              //   child: Text('LAUNCH QUERY'),
              // ),
              // SizedBox(height: 32),
              // ElevatedButton(
              //   onPressed: () => MapsLauncher.launchCoordinates(
              //       37.4220041, -122.0862462, 'Google Headquarters are here'),
              //   child: Text('LAUNCH COORDINATES'),
              // ),
                          // ElevatedButton(
                          //   onPressed: () {
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) =>
                          //               AllDoctorNearYouScreen2(),
                          //         ));
                          //   },
                          //   child: Text("data"),
                          // ),
                          SizedBox(height: size.height * 0.02),
                          const HomeIntroCard(),
                          Container(
                            width: double.infinity,
                            color: kSubScaffoldColor,
                            child: Column(
                              children: [
                                const VerticalSpacingWidget(height: 5),
                                const UpcommingAppoiment(),
                                const VerticalSpacingWidget(height: 5),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.01),
                                  child: const GetDoctorWidget(),
                                ),
                                const VerticalSpacingWidget(height: 5),
                                const GetFavouriteDoctorWidget(),
                                const VerticalSpacingWidget(height: 5),
                              ],
                            ),
                          ),
                          HomeSuggestDoctorWidget(
                              suggestionController: suggestionController),
                          Container(
                            width: double.infinity,
                            color: kSubScaffoldColor,
                            child: Column(
                              children: [
                                const VerticalSpacingWidget(height: 5),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.01),
                                  child: const RecommendedDoctorCard(),
                                ),
                                const VerticalSpacingWidget(height: 5),
                              ],
                            ),
                          ),
                          const Image(
                            image: AssetImage("assets/images/mediezy.jpg"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
