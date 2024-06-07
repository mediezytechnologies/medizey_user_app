// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetAllMembers/get_all_members_bloc.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/AllCompletedAppointmentScreen/all_completed_appointments_screen.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/AllUploadedDischargeSummaryScreen/all_uploaded_discharge_summary_screen.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/AllUploadedDocumentScreen/all_uploaded_document_screen.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/AllUploadedLabReportScreen/all_uploaded_lab_report_screen.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/AllUploadedPrescriptionScreen/all_uploaded_prescription_screen.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/AllUploadedScanReportScreen/all_uploaded_scan_report_screen.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/AllVitalsScreen/all_vitals_Screen.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/Widgets/base_space_expanded_tab_bar.dart';

class AllRecordsScreen extends StatefulWidget {
  const AllRecordsScreen({Key? key}) : super(key: key);

  @override
  State<AllRecordsScreen> createState() => _AllRecordsScreenState();
}

class _AllRecordsScreenState extends State<AllRecordsScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    BlocProvider.of<GetAllMembersBloc>(context).add(FetchAllMembers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return Scaffold(  bottomNavigationBar: Platform.isIOS
            ? SizedBox(
                height: size.height * 0.038,
                width: double.infinity,
              )
            : const SizedBox(),
      appBar: AppBar(
        title: const Text("Health Record"),
        centerTitle: true,
      ),
      body: const BaseSpaceExpandedTabBar(
        tabs: [
          Tab(height: 35, text: 'All'),
          Tab(height: 35, text: 'Completed'),
          Tab(height: 35, text: 'Vitals'),
          Tab(height: 35, text: 'Prescription'),
          Tab(height: 35, text: 'Lab Report'),
          Tab(height: 35, text: 'Scan Report'),
          Tab(height: 35, text: 'Discharge Summary'),
        ],
        tabViews: [
          AllUploadedDocumentScreen(),
          AllCompletedAppointmentsScreen(),
          AllVitalsScreen(),
          AllUploadedPrecriptionScreen(),
          AllUploadedLabReportScreen(),
          AllUploadedScanReportScreen(),
          AllUploadedDischargeSummaryScreen()
        ],
      ),
    );
  }
}
