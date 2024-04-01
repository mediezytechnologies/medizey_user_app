import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetUploadedScanReport/get_uploaded_scan_report_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/Widgets/all_scan_report_card_widget.dart';

class AllUploadedScanReportScreen extends StatefulWidget {
  const AllUploadedScanReportScreen({super.key});

  @override
  State<AllUploadedScanReportScreen> createState() =>
      _AllUploadedScanReportScreenState();
}

class _AllUploadedScanReportScreenState
    extends State<AllUploadedScanReportScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUploadedScanReportBloc, GetUploadedScanReportState>(
      builder: (context, state) {
        if (state is GetUploadedScanReportLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: kMainColor,
            ),
          );
        }
        if (state is GetUploadedScanReportError) {
          return Center(
            child: Image(
              image:
                  const AssetImage("assets/images/something went wrong-01.png"),
              height: 200.h,
              width: 200.w,
            ),
          );
        }
        if (state is GetUploadedScanReportLoaded) {
          final scanReport = state.getUploadedScanReportModel;
          return scanReport.documentData == null
              ? Image.asset("assets/icons/no data.png")
              : ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: scanReport.documentData!.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const VerticalSpacingWidget(height: 5),
                  itemBuilder: (context, index) {
                    return AllScanReportCardWidget(
                      doctorName: scanReport
                          .documentData![index].scanReport!.first.doctorName
                          .toString(),
                      documentId: scanReport.documentData![index].id.toString(),
                      documentPath: scanReport.documentData![index].documentPath
                          .toString(),
                      patientId:
                          scanReport.documentData![index].patientId.toString(),
                      patientName:
                          scanReport.documentData![index].patient!.toString(),
                      recordDate: scanReport
                          .documentData![index].scanReport!.first.date
                          .toString(),
                      scanCenterName: scanReport
                          .documentData![index].scanReport!.first.labName
                          .toString(),
                      scanTestName: scanReport
                          .documentData![index].scanReport!.first.testName
                          .toString(),
                      updatedTime:
                          scanReport.documentData![index].hoursAgo.toString(),
                    );
                  },
                );
        }
        return Container();
      },
    );
  }
}
