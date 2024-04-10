import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/Hospital/get_hospital_by_id_model.dart';
import 'package:mediezy_user/Repository/Bloc/Hospital/GetHospitalById/get_hospital_by_id_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HomeScreen/HospitalDoctorBySpacialisationScreen/hospital_doctor_by_specialisation_screen.dart';

class HospitalScreen extends StatefulWidget {
  const HospitalScreen({
    super.key,
    required this.hospitalId,
  });

  final String hospitalId;

  @override
  State<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  late GetHospitalByIdModel getHospitalByIdModel;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetHospitalByIdBloc>(context)
        .add(FetchHospitalById(hospitalId: widget.hospitalId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<GetHospitalByIdBloc, GetHospitalByIdState>(
        builder: (context, state) {
          if (state is GetHospitalByIdLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: kMainColor,
              ),
            );
          }
          if (state is GetHospitalByIdError) {
            return Center(
              child: Image(
                image: const AssetImage(
                    "assets/images/something went wrong-01.png"),
                height: 200.h,
                width: 200.w,
              ),
            );
          }
          if (state is GetHospitalByIdLoaded) {
            getHospitalByIdModel = BlocProvider.of<GetHospitalByIdBloc>(context)
                .getHospitalByIdModel;
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150.h,
                      width: double.infinity,
                      child: Swiper(
                        autoplay: true,
                        itemCount: getHospitalByIdModel
                            .clinicDetails!.first.images!.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 6.w, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                getHospitalByIdModel
                                    .clinicDetails!.first.images![index]
                                    .toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                        pagination: SwiperPagination(
                          alignment: Alignment.bottomCenter,
                          builder: DotSwiperPaginationBuilder(
                              color: Colors.grey[200],
                              activeColor: Colors.red[400],
                              size: 8.sp,
                              activeSize: 8.sp),
                        ),
                      ),
                    ),
                    const VerticalSpacingWidget(height: 10),
                    Text(
                      getHospitalByIdModel.clinicDetails!.first.clinicName
                          .toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22.sp),
                    ),
                    const VerticalSpacingWidget(height: 2),
                    Text(
                      "${getHospitalByIdModel.clinicDetails!.first.address.toString()}, ${getHospitalByIdModel.clinicDetails!.first.location.toString()}",
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                          color: kSubTextColor),
                    ),
                    const VerticalSpacingWidget(height: 10),
                    Text(
                      getHospitalByIdModel
                          .clinicDetails!.first.clinicDescription
                          .toString(),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const VerticalSpacingWidget(height: 10),
                    Text(
                      "Specializations",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: kSubTextColor),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    ListView.builder(
                      itemCount: getHospitalByIdModel
                          .clinicDetails!.first.specializations!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    HospitalDoctorBySpecialisation(
                                  clinicId: getHospitalByIdModel
                                      .clinicDetails!.first.clinicId
                                      .toString(),
                                  specialisationName: getHospitalByIdModel
                                      .clinicDetails!
                                      .first
                                      .specializations![index]
                                      .specializationName
                                      .toString(),
                                  specilisationId: getHospitalByIdModel
                                      .clinicDetails!
                                      .first
                                      .specializations![index]
                                      .specializationId
                                      .toString(),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5.h),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kCardColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image(
                                    image: NetworkImage(
                                      getHospitalByIdModel
                                          .clinicDetails!
                                          .first
                                          .specializations![index]
                                          .specializationIcon
                                          .toString(),
                                    ),
                                    height: 40.h,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      getHospitalByIdModel
                                          .clinicDetails!
                                          .first
                                          .specializations![index]
                                          .specializationName
                                          .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${getHospitalByIdModel.clinicDetails!.first.specializations![index].availableDoctorCount.toString()} Doctors available",
                                          style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w400,
                                              color: kSubTextColor),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 30.sp,
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
