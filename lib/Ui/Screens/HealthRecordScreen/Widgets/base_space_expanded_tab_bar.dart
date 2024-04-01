// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/GetAppointments/get_completed_appointments_model.dart';
import 'package:mediezy_user/Model/HealthRecord/GetAllMembers/get_all_members_model.dart';
import 'package:mediezy_user/Model/HealthRecord/GetAllUploadedDocuments/get_all_uploaded_documet_model.dart';
import 'package:mediezy_user/Model/HealthRecord/GetUploadedDischargeSummary/get_uploaded_discharge_summary_model.dart';
import 'package:mediezy_user/Model/HealthRecord/GetUploadedLabTest/get_uploaded_lab_test_model.dart';
import 'package:mediezy_user/Model/HealthRecord/GetUploadedPrescriptions/get_uploaded_prescription_model.dart';
import 'package:mediezy_user/Model/HealthRecord/GetUploadedScanReport/get_uploaded_scan_report_model.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/DeleteDocument/delete_document_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetAllMembers/get_all_members_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetAllPrescriptions/get_all_prescriptions_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetAllUploadedDocuments/get_all_uploaded_documents_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetCompletedAppointmentsByPatientId/get_completed_appointmets_by_patient_id_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetUploadedDischargeSummary/get_uploaded_discharge_summary_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetUploadedLabReport/get_uploaded_lab_report_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetUploadedScanReport/get_uploaded_scan_report_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/internet_handle_screen.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';

class BaseSpaceExpandedTabBar extends StatefulWidget {
  final List<Widget> tabs;
  final List<Widget> tabViews;

  const BaseSpaceExpandedTabBar({
    Key? key,
    required this.tabs,
    required this.tabViews,
  }) : super(key: key);

  @override
  _BaseSpaceExpandedTabBarState createState() =>
      _BaseSpaceExpandedTabBarState();
}

class _BaseSpaceExpandedTabBarState extends State<BaseSpaceExpandedTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late GetAllMembersModel getAllMembersModel;
  late GetAllUploadedDocumentModel getAllUploadedDocumentModel;
  late GetUploadedPrescriptionModel getUploadedPrescriptionModel;
  late GetCompletedAppointmentsModel getCompletedAppointmentsModel;
  late GetUploadedLabTestModel getUploadedLabTestModel;
  late GetUploadedScanReportModel getUploadedScanReportModel;
  late GetUploadedDischargeSummaryModel getUploadedDischargeSummaryModel;
  late ValueNotifier<int> dropValueMemberNotifier;
  int dropValueMember = 0;
  late String selectedMemberId = "";
  late List<PatientData> patientId;
  late List<PatientData> patientNames = [];
  late StreamSubscription<ConnectivityResult> subscription;

  void handleConnectivityChange(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
    } else {}
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabs.length, vsync: this);
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      handleConnectivityChange(result);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpacingWidget(height: 5),
        BlocListener<DeleteDocumentBloc, DeleteDocumentState>(
          listener: (context, state) {
            if (state is DeleteDocumentLoaded) {
              BlocProvider.of<GetAllPrescriptionsBloc>(context).add(
                FetchUploadedPrescriptions(patientId: selectedMemberId),
              );
              BlocProvider.of<GetCompletedAppointmetsByPatientIdBloc>(context)
                  .add(
                FetchCompletedAppointmentsByPatientId(
                    patientId: selectedMemberId),
              );
              BlocProvider.of<GetUploadedLabReportBloc>(context).add(
                FetchGetUploadedLabReport(patientId: selectedMemberId),
              );
              BlocProvider.of<GetUploadedScanReportBloc>(context).add(
                FetchGetUploadedScanReport(patientId: selectedMemberId),
              );
              BlocProvider.of<GetUploadedDischargeSummaryBloc>(context).add(
                FetchGetUploadedDischargeSummary(patientId: selectedMemberId),
              );
            }
          },
          child: StreamBuilder<ConnectivityResult>(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) {
                final connectivityResult = snapshot.data;
                if (connectivityResult == ConnectivityResult.none) {
                  return const InternetHandleScreen();
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select Patient",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: kSubTextColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const VerticalSpacingWidget(height: 5),
                        BlocBuilder<GetAllMembersBloc, GetAllMembersState>(
                          builder: (context, state) {
                            if (state is GetAllMembersLoaded) {
                              getAllMembersModel =
                                  BlocProvider.of<GetAllMembersBloc>(context)
                                      .getAllMembersModel;
                              if (patientNames.isEmpty) {
                                patientNames
                                    .addAll(getAllMembersModel.patientData!);
                                dropValueMemberNotifier =
                                    ValueNotifier<int>(patientNames.first.id!);
                                dropValueMember = patientNames.first.id!;
                                selectedMemberId =
                                    patientNames.first.id.toString();
                              }
                              BlocProvider.of<GetAllUploadedDocumentsBloc>(
                                      context)
                                  .add(
                                FetchAllUploadedDocuments(
                                    patientId: selectedMemberId),
                              );
                              BlocProvider.of<GetAllPrescriptionsBloc>(context)
                                  .add(
                                FetchUploadedPrescriptions(
                                    patientId: selectedMemberId),
                              );
                              BlocProvider.of<GetUploadedLabReportBloc>(context)
                                  .add(
                                FetchGetUploadedLabReport(
                                    patientId: selectedMemberId),
                              );
                              BlocProvider.of<GetUploadedScanReportBloc>(
                                      context)
                                  .add(
                                FetchGetUploadedScanReport(
                                    patientId: selectedMemberId),
                              );
                              BlocProvider.of<
                                          GetCompletedAppointmetsByPatientIdBloc>(
                                      context)
                                  .add(
                                FetchCompletedAppointmentsByPatientId(
                                    patientId: selectedMemberId),
                              );
                              BlocProvider.of<GetUploadedDischargeSummaryBloc>(
                                      context)
                                  .add(
                                FetchGetUploadedDischargeSummary(
                                    patientId: selectedMemberId),
                              );
                              return Container(
                                height: 40.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: kCardColor,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0xFF9C9C9C))),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Center(
                                    child: ValueListenableBuilder(
                                      valueListenable: dropValueMemberNotifier,
                                      builder: (BuildContext context,
                                          int dropValue, _) {
                                        return DropdownButtonFormField(
                                          iconEnabledColor: kMainColor,
                                          decoration:
                                              const InputDecoration.collapsed(
                                                  hintText: ''),
                                          value: dropValue,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: kTextColor),
                                          icon: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onChanged: (int? value) {
                                            dropValue = value!;
                                            dropValueMemberNotifier.value =
                                                value;
                                            dropValueMember = value;
                                            selectedMemberId = value.toString();
                                            BlocProvider.of<
                                                        GetAllUploadedDocumentsBloc>(
                                                    context)
                                                .add(
                                              FetchAllUploadedDocuments(
                                                  patientId: selectedMemberId),
                                            );
                                            BlocProvider.of<
                                                        GetAllPrescriptionsBloc>(
                                                    context)
                                                .add(
                                              FetchUploadedPrescriptions(
                                                  patientId: selectedMemberId),
                                            );
                                            BlocProvider.of<
                                                        GetUploadedLabReportBloc>(
                                                    context)
                                                .add(
                                              FetchGetUploadedLabReport(
                                                  patientId: selectedMemberId),
                                            );
                                            BlocProvider.of<
                                                        GetUploadedScanReportBloc>(
                                                    context)
                                                .add(
                                              FetchGetUploadedScanReport(
                                                  patientId: selectedMemberId),
                                            );
                                            BlocProvider.of<
                                                        GetCompletedAppointmetsByPatientIdBloc>(
                                                    context)
                                                .add(
                                              FetchCompletedAppointmentsByPatientId(
                                                  patientId: selectedMemberId),
                                            );
                                            BlocProvider.of<
                                                        GetUploadedDischargeSummaryBloc>(
                                                    context)
                                                .add(
                                              FetchGetUploadedDischargeSummary(
                                                  patientId: selectedMemberId),
                                            );
                                          },
                                          items: patientNames
                                              .map<DropdownMenuItem<int>>(
                                                  (value) {
                                            return DropdownMenuItem<int>(
                                              value: value.id!,
                                              child: Text(value.patientName!),
                                            );
                                          }).toList(),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            }
                            return Container();
                          },
                        ),
                        const VerticalSpacingWidget(height: 10),
                      ],
                    ),
                  );
                }
              }),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: TabBar(
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: kMainColor),
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: kScaffoldColor,
              tabAlignment: TabAlignment.start,
              tabs: widget.tabs,
              labelColor: Colors.white,
              labelStyle:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: const TextStyle(fontSize: 12),
              isScrollable: true,
            ),
          ),
        ),
        const VerticalSpacingWidget(height: 10),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.tabViews,
          ),
        ),
      ],
    );
  }
}
