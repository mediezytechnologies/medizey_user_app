import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/Hospital/get_hospital_doctor_by_specialisation_model.dart';
import 'package:mediezy_user/Repository/Bloc/Hospital/GetHospitalDoctorBySpecialisation/get_hospital_doctor_by_specialisation_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/CommonWidgets/doctor_card_widget.dart';

class HospitalDoctorBySpecialisation extends StatefulWidget {
  const HospitalDoctorBySpecialisation(
      {super.key,
      required this.specilisationId,
      required this.specialisationName,
      required this.clinicId});

  final String specilisationId;
  final String specialisationName;
  final String clinicId;

  @override
  State<HospitalDoctorBySpecialisation> createState() =>
      _HospitalDoctorBySpecialisationState();
}

class _HospitalDoctorBySpecialisationState
    extends State<HospitalDoctorBySpecialisation> {
  late GetHospitalDoctorBySpecialisationModel
      getHospitalDoctorBySpecialisationModel;

  @override
  void initState() {
    BlocProvider.of<GetHospitalDoctorBySpecialisationBloc>(context).add(
        FetchHospitalDoctorBySpecialisation(
            specialisationId: widget.specilisationId,
            clinicId: widget.clinicId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.specialisationName),
          centerTitle: true,
        ),
        body: FadedSlideAnimation(
          beginOffset: const Offset(0, 0.3),
          endOffset: const Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
          child: BlocBuilder<GetHospitalDoctorBySpecialisationBloc,
              GetHospitalDoctorBySpecialisationState>(
            builder: (context, state) {
              if (state is GetHospitalDoctorBySpecialisationLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: kMainColor,
                  ),
                );
              }
              if (state is GetHospitalDoctorBySpecialisationError) {
                return Center(
                  child: Image(
                    image: const AssetImage(
                        "assets/images/something went wrong-01.png"),
                    height: 200.h,
                    width: 200.w,
                  ),
                );
              }
              if (state is GetHospitalDoctorBySpecialisationLoaded) {
                getHospitalDoctorBySpecialisationModel =
                    BlocProvider.of<GetHospitalDoctorBySpecialisationBloc>(
                            context)
                        .getHospitalDoctorBySpecialisationModel;
                return FadedSlideAnimation(
                  beginOffset: const Offset(0, 0.3),
                  endOffset: const Offset(0, 0),
                  slideCurve: Curves.linearToEaseOut,
                  child: getHospitalDoctorBySpecialisationModel
                          .doctorDetails!.isEmpty
                      ? Center(
                          child: Text(
                            "No doctors available",
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              const VerticalSpacingWidget(height: 10),
                              ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return DoctorCardWidget(
                                      favourites: const SizedBox(),
                                      userAwayFrom: "2.2",
                                      clinicList:
                                          getHospitalDoctorBySpecialisationModel
                                              .doctorDetails![index].clinics!
                                              .toList(),
                                      doctorId:
                                          getHospitalDoctorBySpecialisationModel
                                              .doctorDetails![index].userId
                                              .toString(),
                                      firstName:
                                          getHospitalDoctorBySpecialisationModel
                                              .doctorDetails![index].firstname
                                              .toString(),
                                      lastName:
                                          getHospitalDoctorBySpecialisationModel
                                              .doctorDetails![index].lastname
                                              .toString(),
                                      imageUrl:
                                          getHospitalDoctorBySpecialisationModel
                                              .doctorDetails![index].docterImage
                                              .toString(),
                                      mainHospitalName:
                                          getHospitalDoctorBySpecialisationModel
                                              .doctorDetails![index].servicesAt
                                              .toString(),
                                      specialisation:
                                          getHospitalDoctorBySpecialisationModel
                                              .doctorDetails![index]
                                              .specialization
                                              .toString(),
                                      location:
                                          getHospitalDoctorBySpecialisationModel
                                              .doctorDetails![index].location
                                              .toString(),
                                    );
                                  },
                                  itemCount:
                                      getHospitalDoctorBySpecialisationModel
                                          .doctorDetails!.length)
                            ],
                          ),
                        ),
                );
              }
              return Container();
            },
          ),
        ));
  }
}
