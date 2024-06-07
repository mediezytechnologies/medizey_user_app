// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: file_names, deprecated_member_use

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/bottom_navigation_control_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/internet_handle_screen.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/AppointmentsScreen/CompletedAppointmentScreen/completed_appointments_screen.dart';
import 'package:mediezy_user/Ui/Screens/AppointmentsScreen/UpcomingAppointmentScreen/up_coming_appointment_Screen.dart';

class AppointmentsScreen extends StatefulWidget {
  AppointmentsScreen({
    Key? key,
    this.initialIndex = 0,
  }) : super(key: key);
  int initialIndex;
  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.initialIndex,
      length: 2,
      child: WillPopScope(
        onWillPop: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNavigationControlWidget(
                selectedIndex: 1,
              ),
            ),
          );
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("My Bookings"),
            centerTitle: true,
        automaticallyImplyLeading: false,
            bottom: TabBar(
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: kMainColor,
              indicatorColor: kMainColor,
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Up Coming",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Completed",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          body: StreamBuilder<ConnectivityResult>(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) {
                final connectivityResult = snapshot.data;
                if (connectivityResult == ConnectivityResult.none) {
                  return const InternetHandleScreen();
                } else {
                  return const TabBarView(children: [
                    UpComingAppointmentScreen(),
                    CompletedAppointmentScreen(),
                  ]);
                }
              }),
        ),
      ),
    );
  }
}
