// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'dart:io' show Platform;
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Repository/Bloc/GetAppointment/GetUpcomingAppointment/get_upcoming_appointment_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/recommend_doctor_card.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/Widgets/home_recently_booked_doctor_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/get_doctor_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/get_favourite_doctor_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_appbar.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_intro_card.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/home_suggest_doctor_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/upcoming_appoiment.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import 'package:mediezy_user/ddd/application/get_docters/get_docters_bloc.dart';
import '../../../Repository/Bloc/GetAppointment/bloc/get_completed_feedback_appointment_bloc.dart';
import '../../../ddd/application/get_fav_doctor/get_fav_doctor_bloc.dart';
import '../../../ddd/application/get_recently_booked_doctor/get_recently_booked_doctor_bloc.dart';
import 'ChatScreen/chat_screen.dart';
import 'Widgets/get_completed_feedback_widget.dart';

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

    BlocProvider.of<GetUpcomingAppointmentBloc>(context)
        .add(FetchUpComingAppointments());
    BlocProvider.of<GetRecentlyBookedDoctorBloc>(context)
        .add(const GetRecentlyBookedDoctorEvent.started(true));
    BlocProvider.of<GetDoctersBloc>(context)
        .add(const GetDoctersEvent.started(true));
    BlocProvider.of<GetFavDoctorBloc>(context)
        .add(const GetFavDoctorEvent.started(true));
    BlocProvider.of<GetCompletedFeedbackAppointmentBloc>(context)
        .add(FetchCompletedFeedbackAppointments());
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
    stopPolling();
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }

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
              .appCloseDialogue(context, "Are you want to exit?", () async {
            SystemNavigator.pop();
          });
          return Future.value(false);
        },
        child:  Container(
          color:kSecondaryColor,
          child: SafeArea(
             child: Scaffold(
                floatingActionButton: FloatingActionButton(
                  shape: const StadiumBorder(),
                  backgroundColor: kSubMainColor,
                  child: Icon(CupertinoIcons.chat_bubble_text,
                      size: 24.sp, color: kCardColor),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatScreen(),
                      ),
                    );
                  },
                ),
                backgroundColor: kSecondaryColor,
                body: Column(
                  children: [
                    HomeAappBar(
                      isAppBar: _showAppbar ? size.height * .05 : 0.0,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        dragStartBehavior: DragStartBehavior.start,
                        controller: _scrollViewController,
                        physics: Platform.isAndroid
                            ? const AlwaysScrollableScrollPhysics()
                            : const ClampingScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(height: size.height * 0.006),
                            const HomeIntroCard(),
                            Container(
                              width: double.infinity,
                              color: kSubScaffoldColor,
                              child: Column(
                                children: [
                                  const VerticalSpacingWidget(height: 5),
                                  const UpcommingAppoiment(),
                                  const VerticalSpacingWidget(height: 5),
                                  const GetCompletedFeedbackWidget(),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.01),
                                    child: const GetDoctorWidget(),
                                  ),
                                  const VerticalSpacingWidget(height: 5),
                                  const GetFavouriteDoctorWidget(),
                                  const VerticalSpacingWidget(height: 5),
                                  const HomeRecentlyBookedDoctorWidget(),
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
              ),
           ),
         ),
        ),
      //),
    );
  }
}

