import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetUploadedLabReport/get_uploaded_lab_report_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/AddDocumentScreen/add_document_screen.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/Widgets/all_lab_report_card_widget.dart';

class AllUploadedLabReportScreen extends StatefulWidget {
  const AllUploadedLabReportScreen({super.key});

  @override
  State<AllUploadedLabReportScreen> createState() =>
      _AllUploadedLabReportScreenState();
}

class _AllUploadedLabReportScreenState
    extends State<AllUploadedLabReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetUploadedLabReportBloc, GetUploadedLabReportState>(
        builder: (context, state) {
          if (state is GetUploadedLabReportLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: kMainColor,
              ),
            );
          }
          if (state is GetUploadedLabReportError) {
            return Image(
              image:
                  const AssetImage("assets/images/something went wrong-01.png"),
              height: 200.h,
              width: 200.w,
            );
          }
          if (state is GetUploadedLabReportLoaded) {
            final labReport = state.getUploadedLabTestModel;
            return labReport.documentData == null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        Image.asset("assets/icons/no data.png"),
                        const VerticalSpacingWidget(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddDocumentScreen(
                                  appBarTitle: "Upload Lab Report",
                                  type: 1,
                                  stringType: "Lab report",
                                ),
                              ),
                            );
                          },
                          child: Image(
                            image: const AssetImage(
                              "assets/images/upload_lab_report.png",
                            ),
                            width: 300.w,
                            height: 150.h,
                          ),
                        )
                      ],
                    ),
                  )
                : ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: labReport.documentData!.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const VerticalSpacingWidget(height: 5),
                    itemBuilder: (context, index) {
                      return AllLabReportCardWidget(
                        doctorName: labReport
                            .documentData![index].labReport!.first.doctorName
                            .toString(),
                        documentId:
                            labReport.documentData![index].id.toString(),
                        documentPath: labReport
                            .documentData![index].documentPath
                            .toString(),
                        labName: labReport
                            .documentData![index].labReport!.first.labName
                            .toString(),
                        labTestName: labReport
                            .documentData![index].labReport!.first.testName
                            .toString(),
                        patientId:
                            labReport.documentData![index].patientId.toString(),
                        patientName:
                            labReport.documentData![index].patient!.toString(),
                        recordDate: labReport
                            .documentData![index].labReport!.first.date
                            .toString(),
                        updatedTime:
                            labReport.documentData![index].hoursAgo.toString(),
                      );
                    },
                  );
          }
          return Container();
        },
      ),
    );
  }
}
