import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/Hospital/get_hospitals_model.dart';
import 'package:mediezy_user/Repository/Bloc/Hospital/GetHospital/get_hospital_bloc.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/hospital_card_widget.dart';

class HospitalListingScreen extends StatefulWidget {
  const HospitalListingScreen({super.key});

  @override
  State<HospitalListingScreen> createState() => _HospitalListingScreenState();
}

class _HospitalListingScreenState extends State<HospitalListingScreen> {
  late GetHospitalModel getHospitalModel;

  @override
  void initState() {
    BlocProvider.of<GetHospitalBloc>(context).add((FetchAllHospitals()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hospitals"),
        centerTitle: true,
      ),
      body: BlocBuilder<GetHospitalBloc, GetHospitalState>(
        builder: (context, state) {
          if (state is GetHospitalLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: kMainColor,
              ),
            );
          }
          if (state is GetHospitalError) {
            return Center(
              child: Image(
                image: const AssetImage(
                    "assets/images/something went wrong-01.png"),
                height: 200.h,
                width: 200.w,
              ),
            );
          }
          if (state is GetHospitalLoaded) {
            getHospitalModel =
                BlocProvider.of<GetHospitalBloc>(context).getHospitalModel;
            return ListView.builder(
                itemCount: getHospitalModel.clinics!.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return HospitalCardWidget(
                    distanceAway: getHospitalModel
                        .clinics![index].distanceFromUser
                        .toString(),
                    hospitalId:
                        getHospitalModel.clinics![index].clinicId.toString(),
                    address:
                        getHospitalModel.clinics![index].address.toString(),
                    department: getHospitalModel.clinics![index].specializations
                        .toString(),
                    doctorCount:
                        getHospitalModel.clinics![index].doctorCount.toString(),
                    image: getHospitalModel.clinics![index].clinicMainImage
                        .toString(),
                    name:
                        getHospitalModel.clinics![index].clinicName.toString(),
                    hospitalLocation:
                        getHospitalModel.clinics![index].location.toString(),
                  );
                });
          }
          return Container();
        },
      ),
    );
  }
}
