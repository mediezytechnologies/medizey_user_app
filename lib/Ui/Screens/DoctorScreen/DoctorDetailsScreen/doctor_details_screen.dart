import 'dart:async';
import 'dart:developer';
import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/Doctor/get_doctor_by_id_model.dart';
import 'package:mediezy_user/Repository/Bloc/Favourites/AddFavourites/add_favourites_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetDoctor/GetDoctorById/get_doctor_by_id_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/internet_handle_screen.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/BookAppointmentScreen/book_appointment_screen.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({super.key, required this.doctorId});

  final String doctorId;

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
      appBar: AppBar(),
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
                            1
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
                                  //! first section
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: kCardColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FadedScaleAnimation(
                                                  scaleDuration: const Duration(
                                                      milliseconds: 400),
                                                  fadeDuration: const Duration(
                                                      milliseconds: 400),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: FancyShimmerImage(
                                                        height: 100.h,
                                                        width: 100.w,
                                                        boxFit: BoxFit.cover,
                                                        errorWidget:
                                                            const Image(
                                                          image: AssetImage(
                                                              "assets/icons/no image.png"),
                                                        ),
                                                        imageUrl:
                                                            getDoctorByIdModel
                                                                .doctorDetails!
                                                                .first
                                                                .docterImage
                                                                .toString()),
                                                  ),
                                                ),
                                                const VerticalSpacingWidget(
                                                    height: 5),
                                                Text(
                                                  'Dr.\n${getDoctorByIdModel.doctorDetails!.first.firstname.toString()}\n${getDoctorByIdModel.doctorDetails!.first.secondname.toString()}',
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: kTextColor),
                                                ),
                                              ],
                                            ),
                                            const HorizontalSpacingWidget(
                                                width: 20),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Specialisation In",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: kSubTextColor),
                                                ),
                                                SizedBox(
                                                  width: 180.w,
                                                  child: Text(
                                                    getDoctorByIdModel
                                                        .doctorDetails!
                                                        .first
                                                        .specialization
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                const VerticalSpacingWidget(
                                                    height: 2),
                                                Text(
                                                  "Location",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: kSubTextColor),
                                                ),
                                                Text(
                                                  getDoctorByIdModel
                                                      .doctorDetails!
                                                      .first
                                                      .location
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                                const VerticalSpacingWidget(
                                                    height: 2),
                                                Text(
                                                  "Works at",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: kSubTextColor),
                                                ),
                                                SizedBox(
                                                  height: 35.h,
                                                  width: 180.w,
                                                  child: Text(
                                                    getDoctorByIdModel
                                                        .doctorDetails!
                                                        .first
                                                        .mainHospital
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                const VerticalSpacingWidget(
                                                    height: 2),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      IconlyLight.location,
                                                      size: 14.sp,
                                                    ),
                                                    SizedBox(
                                                      width: 3.w,
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        text: getDoctorByIdModel
                                                            .doctorDetails!
                                                            .first
                                                            .distanceFromUser
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            color: kTextColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        children: [
                                                          TextSpan(
                                                              text: ' away',
                                                              style: TextStyle(
                                                                  color:
                                                                      kSubTextColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal),
                                                              recognizer:
                                                                  TapGestureRecognizer()
                                                                    ..onTap =
                                                                        () {})
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const VerticalSpacingWidget(
                                                    height: 10),
                                                BlocBuilder<AddFavouritesBloc,
                                                    AddFavouritesState>(
                                                  builder: (context, state) {
                                                    return InkWell(
                                                      onTap: () {
                                                        BlocProvider.of<
                                                                    AddFavouritesBloc>(
                                                                context)
                                                            .add(
                                                          AddFavourites(
                                                            doctorId:
                                                                widget.doctorId,
                                                            favouriteStatus:
                                                                getDoctorByIdModel
                                                                    .doctorDetails!
                                                                    .first
                                                                    .favoriteStatus!
                                                                    .toInt(),
                                                          ),
                                                        );
                                                      },
                                                      child: Container(
                                                        // padding: EdgeInsets
                                                        //     .symmetric(
                                                        //         horizontal:
                                                        //             size.width *
                                                        //                 0.03),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.r),
                                                            border: Border.all(
                                                                width: 1.5.w,
                                                                color:
                                                                    kMainColor)),
                                                        height:
                                                            size.height * 0.04,
                                                        width: size.width * .42,
                                                        // width: 150.w,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "Add To Favourite",
                                                              style: TextStyle(
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    kMainColor,
                                                              ),
                                                            ),
                                                            const HorizontalSpacingWidget(
                                                                width: 5),
                                                            Icon(
                                                              state.favouriteStatusMap[
                                                                          widget
                                                                              .doctorId] ==
                                                                      false
                                                                  ? CupertinoIcons
                                                                      .heart_fill
                                                                  : CupertinoIcons
                                                                      .heart,
                                                              color: kMainColor,
                                                              size: 16.sp,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const VerticalSpacingWidget(height: 10),
                                  //! second section
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: kCardColor,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "About",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: kSubTextColor),
                                        ),
                                        const VerticalSpacingWidget(height: 5),
                                        Text(
                                          getDoctorByIdModel
                                              .doctorDetails!.first.about
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: kTextColor,
                                              height: 1.3.h),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const VerticalSpacingWidget(height: 10),
                                  //! third section
                                  Container(
                                    decoration: BoxDecoration(
                                        color: kCardColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //! Clinic
                                        Text(
                                          "Clinics",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: kSubTextColor),
                                        ),
                                        const VerticalSpacingWidget(height: 5),
                                        ListView.separated(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    getDoctorByIdModel
                                                        .doctorDetails!
                                                        .first
                                                        .clinics![index]
                                                        .clinicName
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: kTextColor),
                                                  ),
                                                  const VerticalSpacingWidget(
                                                      height: 2),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Availibility: ",
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                kSubTextColor),
                                                      ),
                                                      Text(
                                                        getDoctorByIdModel
                                                                    .doctorDetails!
                                                                    .first
                                                                    .clinics![
                                                                        index]
                                                                    .clinicStartTime ==
                                                                null
                                                            ? "N/A - "
                                                            : getDoctorByIdModel
                                                                .doctorDetails!
                                                                .first
                                                                .clinics![index]
                                                                .clinicStartTime
                                                                .toString(),
                                                        style: TextStyle(
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: kTextColor),
                                                      ),
                                                      Text(
                                                        getDoctorByIdModel
                                                                    .doctorDetails!
                                                                    .first
                                                                    .clinics![
                                                                        index]
                                                                    .clinicEndTime ==
                                                                null
                                                            ? "N/A"
                                                            : " - ${getDoctorByIdModel.doctorDetails!.first.clinics![index].clinicEndTime.toString()}",
                                                        style: TextStyle(
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: kTextColor),
                                                      ),
                                                    ],
                                                  ),
                                                  const VerticalSpacingWidget(
                                                      height: 2),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Address: ",
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                kSubTextColor),
                                                      ),
                                                      Text(
                                                        getDoctorByIdModel
                                                            .doctorDetails!
                                                            .first
                                                            .clinics![index]
                                                            .clinicAddress
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: kTextColor),
                                                      ),
                                                    ],
                                                  ),
                                                  const VerticalSpacingWidget(
                                                      height: 2),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Location: ",
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                kSubTextColor),
                                                      ),
                                                      Text(
                                                        getDoctorByIdModel
                                                            .doctorDetails!
                                                            .first
                                                            .clinics![index]
                                                            .clinicLocation
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: kTextColor),
                                                      ),
                                                    ],
                                                  ),
                                                  const VerticalSpacingWidget(
                                                      height: 2),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Available tokens : ",
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                kSubTextColor),
                                                      ),
                                                      Text(
                                                        getDoctorByIdModel
                                                            .doctorDetails!
                                                            .first
                                                            .clinics![index]
                                                            .availableTokenCount
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: kTextColor),
                                                      ),
                                                    ],
                                                  ),
                                                  const VerticalSpacingWidget(
                                                      height: 2),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Total tokens : ",
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                kSubTextColor),
                                                      ),
                                                      Text(
                                                        getDoctorByIdModel
                                                            .doctorDetails!
                                                            .first
                                                            .clinics![index]
                                                            .totalTokenCount
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: kTextColor),
                                                      ),
                                                    ],
                                                  ),
                                                  const VerticalSpacingWidget(
                                                      height: 2),
                                                  const VerticalSpacingWidget(
                                                      height: 2),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Next available token : ",
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                kSubTextColor),
                                                      ),
                                                      Text(
                                                        getDoctorByIdModel
                                                                    .doctorDetails!
                                                                    .first
                                                                    .clinics![
                                                                        index]
                                                                    .nextAvailableTokenTime ==
                                                                null
                                                            ? "N/A"
                                                            : getDoctorByIdModel
                                                                .doctorDetails!
                                                                .first
                                                                .clinics![index]
                                                                .nextAvailableTokenTime
                                                                .toString(),
                                                        style: TextStyle(
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: kTextColor),
                                                      ),
                                                    ],
                                                  ),
                                                  const VerticalSpacingWidget(
                                                      height: 5),
                                                ],
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
                                  //! fourth section
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: kCardColor,
                                    ),
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(8),
                                    //! services
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Specifications",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: kSubTextColor),
                                        ),
                                        const VerticalSpacingWidget(height: 10),
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
                                              getDoctorByIdModel.doctorDetails!
                                                  .first.specifications![index],
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: kTextColor),
                                            );
                                          },
                                          separatorBuilder: (context, index) =>
                                              const VerticalSpacingWidget(
                                                  height: 3),
                                        )
                                      ],
                                    ),
                                  ),
                                  const VerticalSpacingWidget(height: 10),
                                  //! fifth section
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
                                        Text(
                                          "Sub Specifications",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: kSubTextColor),
                                        ),
                                        const VerticalSpacingWidget(height: 10),
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
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: kTextColor),
                                            );
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
                            bottom: 10.h,
                            left: 10.w,
                            right: 10.w,
                            child: CommonButtonWidget(
                              title: "Book Appointment Now",
                              onTapFunction: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookAppointmentScreen(
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
