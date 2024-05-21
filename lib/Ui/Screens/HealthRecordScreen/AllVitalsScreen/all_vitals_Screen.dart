// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetVitals/get_vitals_bloc.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/Widgets/vital_widget.dart';

class AllVitalsScreen extends StatefulWidget {
  const AllVitalsScreen({super.key});

  @override
  State<AllVitalsScreen> createState() => _AllVitalsScreenState();
}

class _AllVitalsScreenState extends State<AllVitalsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<GetVitalsBloc, GetVitalsState>(
        builder: (context, state) {
          if (state is GetVitalsLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: kMainColor,
              ),
            );
          }
          if (state is GetVitalsError) {
            return Center(
              child: Image(
                image: const AssetImage(
                    "assets/images/something went wrong-01.png"),
                height: 200.h,
                width: 200.w,
              ),
            );
          }
          if (state is GetVitalsLoaded) {
            return state.getVitalsModel.vitals == null
                ? Center(
                    child: Image.asset(
                      "assets/icons/no data.png",
                      height: size.height * .45,
                    ),
                  )
                : ListView.builder(
                    itemCount: state.getVitalsModel.vitals!.length,
                    itemBuilder: (context, index) {
                      final vitals = state.getVitalsModel.vitals![index];
                      return VitalWidget(
                        appointmentDate: vitals.date.toString(),
                        dia: vitals.dia.toString(),
                        doctorName: vitals.doctorFirstname.toString(),
                        heartRate: vitals.heartRate.toString(),
                        height: vitals.height.toString(),
                        patientName: vitals.patientName.toString(),
                        spo2: vitals.spo2.toString(),
                        sys: vitals.sys.toString(),
                        temperature: vitals.temperature.toString(),
                        temperatureType: vitals.temperatureType.toString(),
                        weight: vitals.weight.toString(),
                      );
                    });
          }
          return Container();
        },
      ),
    );
  }
}
