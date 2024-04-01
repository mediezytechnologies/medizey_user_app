import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetAllPrescriptions/get_all_prescriptions_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/Widgets/all_prescription_card_widget.dart';

class AllUploadedPrecriptionScreen extends StatefulWidget {
  const AllUploadedPrecriptionScreen({super.key});

  @override
  State<AllUploadedPrecriptionScreen> createState() =>
      _AllUploadedPrecriptionScreenState();
}

class _AllUploadedPrecriptionScreenState
    extends State<AllUploadedPrecriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetAllPrescriptionsBloc, GetAllPrescriptionsState>(
        builder: (context, state) {
          if (state is GetAllPrescriptionsLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: kMainColor,
              ),
            );
          }
          if (state is GetAllPrescriptionsError) {
            return Center(
              child: Image(
                image: const AssetImage(
                    "assets/images/something went wrong-01.png"),
                height: 200.h,
                width: 200.w,
              ),
            );
          }
          if (state is GetAllPrescriptionsLoaded) {
            final prescription = state.getUploadedPrescriptionModel;
            return prescription.documentData == null
                ? Image.asset("assets/icons/no data.png")
                : ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: prescription.documentData!.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const VerticalSpacingWidget(height: 5),
                    itemBuilder: (context, index) {
                      return AllPrescriptionCardWidget(
                        doctorName: prescription.documentData![index]
                            .patientPrescription!.first.doctorName
                            .toString(),
                        documentId:
                            prescription.documentData![index].id.toString(),
                        documentPath: prescription
                            .documentData![index].documentPath
                            .toString(),
                        patientId: prescription.documentData![index].patientId
                            .toString(),
                        patientName: prescription.documentData![index].patient
                            .toString(),
                        recordDate: prescription.documentData![index]
                            .patientPrescription!.first.date
                            .toString(),
                        updatedTime: prescription.documentData![index].hoursAgo
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
