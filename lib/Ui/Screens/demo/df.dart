import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetAppointment/GetUpcomingAppointment/get_upcoming_appointment_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetDoctor/GetDoctors/get_doctor_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/Hospital/GetHospital/get_hospital_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/get_doctor_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/get_favourite_doctor_widget.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/upcoming_appoiment.dart';
import '../../../Repository/Bloc/Article/article_bloc.dart';
import '../../../Repository/Bloc/banner/banner_bloc.dart';

class ScrollScreenDemo extends StatefulWidget {
  const ScrollScreenDemo({super.key});

  @override
  State<ScrollScreenDemo> createState() => _ScrollScreenDemoState();
}

class _ScrollScreenDemoState extends State<ScrollScreenDemo> {
  late ScrollController _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;

//  final TextEditingController suggestionController = TextEditingController();
  late Timer pollingTimer;
  bool isLoading = true;

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
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          AnimatedContainer(
              height: _showAppbar ? 56.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: AppBar(
                backgroundColor: Colors.amber,
                title: const Text("Demo Scrolling "),
                centerTitle: true,
                leading: const Icon(Icons.star),
              )),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollViewController,
              child: Column(
                children: [
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
                  Container(
                    color: const Color.fromARGB(255, 33, 96, 243),
                    height: 300,
                    width: double.infinity,
                  ),
                  Container(
                    color: const Color.fromARGB(255, 33, 243, 212),
                    height: 300,
                    width: double.infinity,
                  ),
                  Container(
                    color: const Color.fromARGB(255, 68, 243, 33),
                    height: 300,
                    width: double.infinity,
                  ),
                  Container(
                    color: const Color.fromARGB(255, 91, 79, 25),
                    height: 300,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
