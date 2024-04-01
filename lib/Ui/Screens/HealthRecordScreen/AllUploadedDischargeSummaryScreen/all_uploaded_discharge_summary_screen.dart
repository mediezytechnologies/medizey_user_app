import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetUploadedDischargeSummary/get_uploaded_discharge_summary_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/Widgets/all_discharge_summary_card_widget.dart';

class AllUploadedDischargeSummaryScreen extends StatefulWidget {
  const AllUploadedDischargeSummaryScreen({super.key});

  @override
  State<AllUploadedDischargeSummaryScreen> createState() =>
      _AllUploadedDischargeSummaryScreenState();
}

class _AllUploadedDischargeSummaryScreenState
    extends State<AllUploadedDischargeSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetUploadedDischargeSummaryBloc,
          GetUploadedDischargeSummaryState>(
        builder: (context, state) {
          if (state is GetUploadedDischargeSummaryLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: kMainColor,
              ),
            );
          }
          if (state is GetUploadedDischargeSummaryError) {
            return Center(
              child: Image(
                image: const AssetImage(
                    "assets/images/something went wrong-01.png"),
                height: 200.h,
                width: 200.w,
              ),
            );
          }
          if (state is GetUploadedDischargeSummaryLoaded) {
            final dischargeSummary = state.getUploadedDischargeSummaryModel;
            return dischargeSummary.documentData == null
                ? Image.asset("assets/icons/no data.png")
                : ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: dischargeSummary.documentData!.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const VerticalSpacingWidget(height: 5),
                    itemBuilder: (context, index) {
                      return AllDischargeSummaryCardWidget(
                        admittedFor: dischargeSummary.documentData![index]
                            .dischargeSummary!.first.admittedFor
                            .toString(),
                        doctorName: dischargeSummary.documentData![index]
                            .dischargeSummary!.first.doctorName
                            .toString(),
                        documentId:
                            dischargeSummary.documentData![index].id.toString(),
                        documentPath: dischargeSummary
                            .documentData![index].documentPath
                            .toString(),
                        hospitalName: dischargeSummary.documentData![index]
                            .dischargeSummary!.first.hospitalName
                            .toString(),
                        patientId: dischargeSummary
                            .documentData![index].patientId
                            .toString(),
                        patientName: dischargeSummary
                            .documentData![index].patient!
                            .toString(),
                        recordDate: dischargeSummary
                            .documentData![index].dischargeSummary!.first.date
                            .toString(),
                        updatedTime: dischargeSummary
                            .documentData![index].hoursAgo
                            .toString(),
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
