import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetAllUploadedDocuments/get_all_uploaded_documents_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/Widgets/all_uploaded_document_card_widget.dart';

class AllUploadedDocumentScreen extends StatefulWidget {
  const AllUploadedDocumentScreen({super.key});

  @override
  State<AllUploadedDocumentScreen> createState() =>
      _AllUploadedDocumentScreenState();
}

class _AllUploadedDocumentScreenState extends State<AllUploadedDocumentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetAllUploadedDocumentsBloc,
          GetAllUploadedDocumentsState>(
        builder: (context, state) {
          if (state is GetAllUploadedDocumentsLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: kMainColor,
              ),
            );
          }
          if (state is GetAllUploadedDocumentsError) {
            return Center(
              child: Image(
                image: const AssetImage(
                    "assets/images/something went wrong-01.png"),
                height: 200.h,
                width: 200.w,
              ),
            );
          }
          if (state is GetAllUploadedDocumentsLoaded) {
            final allDocumet = state.getAllUploadedDocumentModel;
            return allDocumet.documentData == null
                ? Center(child: Image.asset("assets/icons/no data.png"))
                : ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: allDocumet.documentData!.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const VerticalSpacingWidget(height: 3),
                    itemBuilder: (context, index) {
                      var allDocument = allDocumet.documentData![index];
                      return Padding(
                        padding: EdgeInsets.fromLTRB(8.w, 5.h, 8.w, 2.h),
                        child: AllUploadedDocumentCardWidget(
                          documentPath: allDocumet
                              .documentData![index].documentPath
                              .toString(),
                          patientName: allDocumet.documentData![index].patient
                              .toString(),
                          recordDate:
                              allDocumet.documentData![index].date.toString(),
                          testOrScanOrDoctorNameText: allDocument.labReport !=
                                      null &&
                                  allDocument.labReport!.isNotEmpty
                              ? "${allDocument.labReport!.first.testName}"
                              : allDocument.patientPrescription != null &&
                                      allDocument
                                          .patientPrescription!.isNotEmpty
                                  ? "Dr ${allDocument.patientPrescription!.first.doctorName}"
                                  : allDocument.dischargeSummary != null &&
                                          allDocument
                                              .dischargeSummary!.isNotEmpty
                                      ? "Dr ${allDocument.dischargeSummary!.first.doctorName}"
                                      : allDocument.scanReport != null &&
                                              allDocument.scanReport!.isNotEmpty
                                          ? "${allDocument.scanReport!.first.admittedFor}"
                                          : 'Doctor Name Not Available',
                          testOrScanOrDoctorNameTitle: allDocument.type == 1
                              ? "Test name : "
                              : (allDocument.type == 4)
                                  ? "Scan name : "
                                  : "Doctor name : ",
                          type: allDocument.type == 1
                              ? "Lab report"
                              : (allDocument.type == 2)
                                  ? "Prescription"
                                  : (allDocument.type == 3)
                                      ? "Discharge summary"
                                      : "Scan Report",
                          updatedTime: allDocumet.documentData![index].hoursAgo
                              .toString(),
                        ),
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
