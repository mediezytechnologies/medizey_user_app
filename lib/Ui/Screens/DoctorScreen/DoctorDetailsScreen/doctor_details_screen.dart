// ignore_for_file: must_be_immutable

import 'dart:async';
import 'dart:io';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/Doctor/get_doctor_by_id_model.dart';
import 'package:mediezy_user/Repository/Bloc/Favourites/AddFavourites/add_favourites_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetDoctor/GetDoctorById/get_doctor_by_id_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/internet_handle_screen.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/BookAppointmentScreen/book_appointment_screen.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/DoctorDetailsScreen/widgets/doctor_details_first_widget.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/DoctorDetailsScreen/widgets/doctor_details_second_widget.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/DoctorDetailsScreen/widgets/doctor_details_third_widget.dart';
import '../../../../ddd/application/get_docters/get_docters_bloc.dart';
import '../../../../ddd/application/get_fav_doctor/get_fav_doctor_bloc.dart';
import '../../../../ddd/application/get_recently_booked_doctor/get_recently_booked_doctor_bloc.dart';
import '../../../Consts/text_style.dart';

class DoctorDetailsScreen extends StatefulWidget {
  DoctorDetailsScreen(
      {super.key,
      required this.doctorId,
      this.patientId,
      this.resheduleType,
      this.normalResheduleTokenId});

  final String doctorId;
  String? patientId;
  String? resheduleType;
  String? normalResheduleTokenId;

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  late GetDoctorByIdModel getDoctorByIdModel;
  late StreamSubscription<ConnectivityResult> subscription;

  void handleConnectivityChange(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
    } else {}
  }

  @override
  void initState() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      handleConnectivityChange(result);
    });
    BlocProvider.of<GetDoctorByIdBloc>(context)
        .add(FetchDoctorById(id: widget.doctorId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Platform.isIOS
          ? SizedBox(
              height: size.height * 0.038,
              width: double.infinity,
            )
          : const SizedBox(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            BlocProvider.of<GetDoctersBloc>(context)
                .add(const GetDoctersEvent.started(false));
            BlocProvider.of<GetRecentlyBookedDoctorBloc>(context)
                .add(const GetRecentlyBookedDoctorEvent.started(false));
            BlocProvider.of<GetFavDoctorBloc>(context)
                .add(const GetFavDoctorEvent.started(false));
            Navigator.pop(context);
          },
          icon: Icon(Platform.isIOS ? CupertinoIcons.back : Icons.arrow_back),
        ),
      ),
      body: StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            final connectivityResult = snapshot.data;
            if (connectivityResult == ConnectivityResult.none) {
              return const InternetHandleScreen();
            } else {
              return BlocBuilder<GetDoctorByIdBloc, GetDoctorByIdState>(
                builder: (context, state) {
                  if (state is GetDoctorByIdLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: kMainColor,
                      ),
                    );
                  }
                  if (state is GetDoctorByIdError) {
                    return Center(
                      child: Image(
                        image: const AssetImage(
                            "assets/images/something went wrong-01.png"),
                        height: 200.h,
                        width: 200.w,
                      ),
                    );
                  }
                  if (state is GetDoctorByIdLoaded) {
                    getDoctorByIdModel =
                        BlocProvider.of<GetDoctorByIdBloc>(context)
                            .getDoctorByIdModel;
                    BlocProvider.of<AddFavouritesBloc>(context).add(
                      InitializeFavouriteStatus({
                        widget.doctorId: getDoctorByIdModel
                                .doctorDetails!.first.favoriteStatus! ==
                            0
                      }),
                    );
                    return FadedSlideAnimation(
                      beginOffset: const Offset(0, 0.3),
                      endOffset: const Offset(0, 0),
                      slideCurve: Curves.linearToEaseOut,
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Column(
                                children: [
                                  DoctorDetailsFirstWidget(
                                      qualification: getDoctorByIdModel
                                          .doctorDetails!.first.qualification
                                          .toString(),
                                      image: getDoctorByIdModel
                                          .doctorDetails!.first.docterImage
                                          .toString(),
                                      firstName: getDoctorByIdModel
                                          .doctorDetails!.first.firstname
                                          .toString(),
                                      secondName: getDoctorByIdModel
                                          .doctorDetails!.first.secondname
                                          .toString(),
                                      specialization: getDoctorByIdModel
                                          .doctorDetails!.first.specialization
                                          .toString(),
                                      location: getDoctorByIdModel
                                          .doctorDetails!.first.location
                                          .toString(),
                                      mainHospital: getDoctorByIdModel
                                          .doctorDetails!.first.mainHospital
                                          .toString(),
                                      doctorId: widget.doctorId,
                                      favouriteStatus: getDoctorByIdModel
                                          .doctorDetails!
                                          .first
                                          .favoriteStatus!),
                                  const VerticalSpacingWidget(height: 10),
                                  DoctorDetailsSecondWidget(
                                      about: getDoctorByIdModel
                                          .doctorDetails!.first.about
                                          .toString()),
                                  const VerticalSpacingWidget(height: 10),
                                  //! third section
                                  Container(
                                    decoration: BoxDecoration(
                                      color: kCardColor,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Clinics", style: grey13B400),
                                        const VerticalSpacingWidget(height: 5),
                                        ListView.separated(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return DoctorDetailsThirdWidget(
                                                isOnLeave: getDoctorByIdModel
                                                    .doctorDetails!
                                                    .first
                                                    .clinics![index]
                                                    .leaveStatusMessage!,
                                                consultationFee:
                                                    getDoctorByIdModel
                                                        .doctorDetails!
                                                        .first
                                                        .clinics![index]
                                                        .consultationFee
                                                        .toString(),
                                                distanceFromUser:
                                                    getDoctorByIdModel
                                                        .doctorDetails!
                                                        .first
                                                        .clinics![index]
                                                        .distanceFromClinic
                                                        .toString(),
                                                clinicName: getDoctorByIdModel
                                                    .doctorDetails!
                                                    .first
                                                    .clinics![index]
                                                    .clinicName
                                                    .toString(),
                                                startTime: getDoctorByIdModel
                                                    .doctorDetails!
                                                    .first
                                                    .clinics![index]
                                                    .clinicStartTime
                                                    .toString(),
                                                endTime: getDoctorByIdModel
                                                    .doctorDetails!
                                                    .first
                                                    .clinics![index]
                                                    .clinicEndTime
                                                    .toString(),
                                                address: getDoctorByIdModel
                                                    .doctorDetails!
                                                    .first
                                                    .clinics![index]
                                                    .clinicAddress
                                                    .toString(),
                                                location: getDoctorByIdModel
                                                    .doctorDetails!
                                                    .first
                                                    .clinics![index]
                                                    .clinicLocation
                                                    .toString(),
                                                availableTokenCount:
                                                    getDoctorByIdModel
                                                        .doctorDetails!
                                                        .first
                                                        .clinics![index]
                                                        .availableTokenCount!,
                                                totalTokenCount:
                                                    getDoctorByIdModel
                                                        .doctorDetails!
                                                        .first
                                                        .clinics![index]
                                                        .totalTokenCount!,
                                                nextDateAvailableTokenTime:
                                                    getDoctorByIdModel
                                                        .doctorDetails!
                                                        .first
                                                        .clinics![index]
                                                        .nextDateAvailableTokenTime
                                                        .toString(),
                                                nextAvailableTokenTime:
                                                    getDoctorByIdModel
                                                        .doctorDetails!
                                                        .first
                                                        .clinics![index]
                                                        .nextAvailableTokenTime
                                                        .toString(),
                                              );
                                            },
                                            separatorBuilder: (context, index) {
                                              return const VerticalSpacingWidget(
                                                  height: 5);
                                            },
                                            itemCount: getDoctorByIdModel
                                                .doctorDetails!
                                                .first
                                                .clinics!
                                                .length)
                                      ],
                                    ),
                                  ),
                                  const VerticalSpacingWidget(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: kCardColor,
                                    ),
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Specifications",
                                            style: grey13B400),
                                        const VerticalSpacingWidget(height: 5),
                                        ListView.separated(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: getDoctorByIdModel
                                              .doctorDetails!
                                              .first
                                              .specifications!
                                              .length,
                                          itemBuilder: (context, index) {
                                            return Text(
                                                getDoctorByIdModel
                                                    .doctorDetails!
                                                    .first
                                                    .specifications![index],
                                                style: black13B500);
                                          },
                                          separatorBuilder: (context, index) =>
                                              const VerticalSpacingWidget(
                                                  height: 3),
                                        )
                                      ],
                                    ),
                                  ),
                                  const VerticalSpacingWidget(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: kCardColor),
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //! specifications
                                        Text("Sub Specifications",
                                            style: grey13B400),
                                        const VerticalSpacingWidget(height: 5),
                                        ListView.separated(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: getDoctorByIdModel
                                              .doctorDetails!
                                              .first
                                              .subspecifications!
                                              .length,
                                          itemBuilder: (context, index) {
                                            return Text(
                                                getDoctorByIdModel
                                                    .doctorDetails!
                                                    .first
                                                    .subspecifications![index],
                                                style: black13B500);
                                          },
                                          separatorBuilder: (context, index) =>
                                              const VerticalSpacingWidget(
                                                  height: 3),
                                        )
                                      ],
                                    ),
                                  ),
                                  const VerticalSpacingWidget(height: 70),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: Platform.isIOS ? 0.h : 10.h,
                            left: 10.w,
                            right: 10.w,
                            child: CommonButtonWidget(
                              widget: Text("Book Appointment Now",
                                  style: white13B700),
                              onTapFunction: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookAppointmentScreen(
                                      patientId: widget.patientId,
                                      clinicList: getDoctorByIdModel
                                          .doctorDetails!.first.clinics!
                                          .toList(),
                                      doctorId: getDoctorByIdModel
                                          .doctorDetails!.first.userId
                                          .toString(),
                                      doctorFirstName: getDoctorByIdModel
                                          .doctorDetails!.first.firstname
                                          .toString(),
                                      doctorSecondName: getDoctorByIdModel
                                          .doctorDetails!.first.secondname
                                          .toString(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              );
            }
          }),
    );
  }
}
