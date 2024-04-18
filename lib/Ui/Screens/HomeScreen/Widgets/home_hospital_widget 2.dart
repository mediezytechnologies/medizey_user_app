import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/Hospital/get_hospitals_model.dart';
import 'package:mediezy_user/Repository/Bloc/Hospital/GetHospital/get_hospital_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/heading_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/view_all_button_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/HospitalListingScreen/hospital_listing_screen.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/Widgets/hospital_card_widget.dart';

class HomeHospitalWidget extends StatefulWidget {
  const HomeHospitalWidget({super.key});

  @override
  State<HomeHospitalWidget> createState() => _HomeHospitalWidgetState();
}

class _HomeHospitalWidgetState extends State<HomeHospitalWidget> {
  late GetHospitalModel getHospitalModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHospitalBloc, GetHospitalState>(
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
              image:
                  const AssetImage("assets/images/something went wrong-01.png"),
              height: 200.h,
              width: 200.w,
            ),
          );
        }
        if (state is GetHospitalLoaded) {
          getHospitalModel =
              BlocProvider.of<GetHospitalBloc>(context).getHospitalModel;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingWidget(
                title: "Hospitals and clinics near you",
              ),
              const VerticalSpacingWidget(height: 5),
              ListView.builder(
                  itemCount: getHospitalModel.clinics!.length > 2
                      ? 2
                      : getHospitalModel.clinics!.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return HospitalCardWidget(
                      hospitalId:
                          getHospitalModel.clinics![index].clinicId.toString(),
                      address:
                          getHospitalModel.clinics![index].address.toString(),
                      department: getHospitalModel
                          .clinics![index].specializations
                          .toString(),
                      doctorCount: getHospitalModel.clinics![index].doctorCount
                          .toString(),
                      image: getHospitalModel.clinics![index].clinicMainImage
                          .toString(),
                      name: getHospitalModel.clinics![index].clinicName
                          .toString(),
                      hospitalLocation:
                          getHospitalModel.clinics![index].location.toString(),
                    );
                  }),
              const VerticalSpacingWidget(height: 2),
              ViewAllButtonWidget(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const HospitalListingScreen()),
                      ),
                    );
                  },
                  buttonText: "All hospitals")
            ],
          );
        }
        return Container();
      },
    );
  }
}
