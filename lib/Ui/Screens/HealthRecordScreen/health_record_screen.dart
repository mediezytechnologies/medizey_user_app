// ignore_for_file: unnecessary_null_comparison, avoid_print, deprecated_member_use, use_build_context_synchronously

import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/Banner/banner_model.dart';
import 'package:mediezy_user/Model/HealthRecord/GetAllMembers/get_all_members_model.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/DeleteMember/delete_member_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetAllMembers/get_all_members_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/banner/banner_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/bottom_navigation_control_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/AddDocumentScreen/add_document_screen.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/AddPatientScreen/AddPatientScreen.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/AllRecordsScreen/all_records_screen.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/EditPatientScreen/edit_patient_screen.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import 'package:shimmer/shimmer.dart';

class HealthRecordScreen extends StatefulWidget {
  const HealthRecordScreen({super.key});

  @override
  State<HealthRecordScreen> createState() => _HealthRecordScreenState();
}

class _HealthRecordScreenState extends State<HealthRecordScreen> {
  late GetAllMembersModel getAllMembersModel;
  late BannerModel bannerModel;
  int selectedPatientIndex = 0;
  String patientId = "";

  @override
  void initState() {
    BlocProvider.of<GetAllMembersBloc>(context).add(FetchAllMembers());
    BlocProvider.of<BannerBloc>(context).add(FetchBannerEvent(type: "3"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadedSlideAnimation(
      beginOffset: const Offset(0, 0.3),
      endOffset: const Offset(0, 0),
      slideCurve: Curves.linearToEaseOut,
      child: WillPopScope(
        onWillPop: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavigationControlWidget(),
            ),
          );
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Health Records"),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: BlocListener<DeleteMemberBloc, DeleteMemberState>(
            listener: (context, state) {
              if (state is DeleteMemberLoaded) {
                BlocProvider.of<GetAllMembersBloc>(context)
                    .add(FetchAllMembers());
              }
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<GetAllMembersBloc, GetAllMembersState>(
                      builder: (context, state) {
                        if (state is GetAllMembersLoading) {
                          return Shimmer.fromColors(
                            baseColor: kShimmerBaseColor,
                            highlightColor: kShimmerHighlightColor,
                            child: Container(
                              width: double.infinity,
                              height: 150.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        }
                        if (state is GetAllMembersError) {
                          return const Center(
                            child: Text("Something Went Wrong"),
                          );
                        }
                        if (state is GetAllMembersLoaded) {
                          getAllMembersModel =
                              BlocProvider.of<GetAllMembersBloc>(context)
                                  .getAllMembersModel;
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kCardColor,
                            ),
                            padding: const EdgeInsets.all(8),
                            width: double.infinity,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          getAllMembersModel
                                              .patientData!.first.patientName
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const HorizontalSpacingWidget(
                                            width: 10),
                                        Text(
                                          getAllMembersModel.patientData!.first
                                              .mediezyPatientId
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const VerticalSpacingWidget(height: 5),
                                SizedBox(
                                  height: 60.h,
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: getAllMembersModel
                                            .patientData!.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedPatientIndex = index;
                                                patientId = getAllMembersModel
                                                    .patientData![index].id
                                                    .toString();
                                              });
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                FadedScaleAnimation(
                                                  scaleDuration: const Duration(
                                                      milliseconds: 400),
                                                  fadeDuration: const Duration(
                                                      milliseconds: 400),
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        right: 5.w),
                                                    height: 35.h,
                                                    width: 35.w,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          selectedPatientIndex ==
                                                                  index
                                                              ? kMainColor
                                                              : kCardColor,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: kMainColor),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "${getAllMembersModel.patientData![index].patientName![0].toUpperCase()}${getAllMembersModel.patientData![index].patientName![1].toUpperCase()}",
                                                        style: TextStyle(
                                                          color:
                                                              selectedPatientIndex ==
                                                                      index
                                                                  ? kCardColor
                                                                  : kTextColor,
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 35.w,
                                                  child: Text(
                                                    getAllMembersModel
                                                        .patientData![index]
                                                        .patientName
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: kTextColor,
                                                    ),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          try {
                                            if (getAllMembersModel
                                                    .patientData!.length ==
                                                6) {
                                              GeneralServices.instance
                                                  .showDialogue(
                                                context,
                                                "Unable to add patient. The maximum limit for patients has been reached",
                                              );
                                            } else {
                                              bool addedData =
                                                  await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const AddPatientScreen(),
                                                ),
                                              );
                                              if (addedData != null &&
                                                  addedData) {
                                                await fetchAllMembers();
                                              }
                                            }
                                          } catch (error, stackTrace) {
                                            print(
                                                'Error in InkWell onTap: $error');
                                            print('Stack Trace: $stackTrace');
                                          }
                                        },
                                        child: Column(
                                          children: [
                                            FadedScaleAnimation(
                                              scaleDuration: const Duration(
                                                  milliseconds: 400),
                                              fadeDuration: const Duration(
                                                  milliseconds: 400),
                                              child: Container(
                                                height: 35.h,
                                                width: 35.w,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: kMainColor),
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.add,
                                                    size: 22.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "Add",
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400,
                                                color: kTextColor,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        getAllMembersModel.patientData!.length,
                                    itemBuilder: (context, index) {
                                      return selectedPatientIndex == index
                                          ? Container(
                                              padding: const EdgeInsets.all(8),
                                              height: 50.h,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color:
                                                      const Color(0xFFEAF3F8)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            getAllMembersModel
                                                                .patientData![
                                                                    index]
                                                                .patientName
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color:
                                                                    kTextColor),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Gender:",
                                                            style: TextStyle(
                                                                fontSize: 10.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    kSubTextColor),
                                                          ),
                                                          Text(
                                                            getAllMembersModel
                                                                        .patientData![
                                                                            index]
                                                                        .patientGender ==
                                                                    "1"
                                                                ? "Male"
                                                                : (getAllMembersModel
                                                                            .patientData![index]
                                                                            .patientGender ==
                                                                        "2")
                                                                    ? "Female"
                                                                    : "Other",
                                                            style: TextStyle(
                                                                fontSize: 10.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color:
                                                                    kTextColor),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                " | ",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color:
                                                                        kTextColor),
                                                              ),
                                                              Text(
                                                                "Age:",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color:
                                                                        kSubTextColor),
                                                              ),
                                                              Text(
                                                                getAllMembersModel
                                                                    .patientData![
                                                                        index]
                                                                    .displayAge
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color:
                                                                        kTextColor),
                                                              ),
                                                            ],
                                                          ),
                                                          Text(
                                                            " | ",
                                                            style: TextStyle(
                                                                fontSize: 10.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color:
                                                                    kTextColor),
                                                          ),
                                                          Text(
                                                            "ID:",
                                                            style: TextStyle(
                                                                fontSize: 10.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    kSubTextColor),
                                                          ),
                                                          Text(
                                                            getAllMembersModel
                                                                .patientData![
                                                                    index]
                                                                .mediezyPatientId
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 10.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color:
                                                                    kTextColor),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      IconButton(
                                                        padding: EdgeInsets.zero,
                                                        onPressed: () async {
                                                          bool addedData =
                                                              await Navigator
                                                                  .push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder:
                                                                  (context) {
                                                                return EditPatientScreen(
                                                                  surgeryDetails: getAllMembersModel
                                                                      .patientData![
                                                                          index]
                                                                      .surgeryDetails
                                                                      .toString(),
                                                                  treatmentDetails: getAllMembersModel
                                                                      .patientData![
                                                                          index]
                                                                      .treatmentTakenDetails
                                                                      .toString(),
                                                                  medicineList: getAllMembersModel
                                                                      .patientData![
                                                                          index]
                                                                      .medicineDetails!
                                                                      .toList(),
                                                                  patientId: getAllMembersModel
                                                                      .patientData![
                                                                          index]
                                                                      .id
                                                                      .toString(),
                                                                  patientGender: getAllMembersModel
                                                                      .patientData![
                                                                          index]
                                                                      .patientGender
                                                                      .toString(),
                                                                  patienName: getAllMembersModel
                                                                      .patientData![
                                                                          index]
                                                                      .patientName
                                                                      .toString(),
                                                                  patientAge: getAllMembersModel
                                                                      .patientData![
                                                                          index]
                                                                      .dob
                                                                      .toString(),
                                                                  patientImage: getAllMembersModel
                                                                              .patientData![
                                                                                  index]
                                                                              .patientImage ==
                                                                          null
                                                                      ? ""
                                                                      : getAllMembersModel
                                                                          .patientData![
                                                                              index]
                                                                          .patientImage
                                                                          .toString(),
                                                                  patientNumber: getAllMembersModel
                                                                      .patientData![
                                                                          index]
                                                                      .patientMobileNumber
                                                                      .toString(),
                                                                  regularMedicine: getAllMembersModel
                                                                      .patientData![
                                                                          index]
                                                                      .regularMedicine
                                                                      .toString(),
                                                                  allergyId: getAllMembersModel
                                                                      .patientData![
                                                                          index]
                                                                      .allergyId
                                                                      .toString(),
                                                                  allergyDetails: getAllMembersModel
                                                                      .patientData![
                                                                          index]
                                                                      .allergyDetail
                                                                      .toString(),
                                                                  allergyName: getAllMembersModel
                                                                      .patientData![
                                                                          index]
                                                                      .allergyName
                                                                      .toString(),
                                                                  surgeryName: getAllMembersModel
                                                                      .patientData![
                                                                          index]
                                                                      .surgeryName!
                                                                      .toList(),
                                                                  treatmentTaken: getAllMembersModel
                                                                      .patientData![
                                                                          index]
                                                                      .treatmentTaken!
                                                                      .toList(),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                          if (addedData ==
                                                              true) {
                                                            print(
                                                                "<<<< value $addedData is true");
                                                            await fetchAllMembers();
                                                            setState(() {
                                                              fetchAllMembers();
                                                              addedData ==
                                                                  false;
                                                            });
                                                          } else {
                                                            print(
                                                                "<<<< value $addedData is false");
                                                          }
                                                        },
                                                        icon: Icon(
                                                          Icons.edit_outlined,
                                                          color: kMainColor,
                                                          size: 18.sp,
                                                        ),
                                                      ),
                                                      index == 0
                                                          ? Container()
                                                          : IconButton(
                                                             padding: EdgeInsets.zero,
                                                              onPressed: () {
                                                                GeneralServices
                                                                    .instance
                                                                    .appCloseDialogue(
                                                                  context,
                                                                  "Are you sure to delete?",
                                                                  () {
                                                                    BlocProvider.of<DeleteMemberBloc>(
                                                                            context)
                                                                        .add(
                                                                      FetchDeleteMember(
                                                                        patientId: getAllMembersModel
                                                                            .patientData![index]
                                                                            .id
                                                                            .toString(),
                                                                      ),
                                                                    );
                                                                    fetchAllMembers();
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                );
                                                              },
                                                              icon: Icon(
                                                                Icons
                                                                    .delete_outlined,
                                                                color:
                                                                    kMainColor,
                                                                size: 18.sp,
                                                              ),
                                                            ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          : Container();
                                    })
                              ],
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                    const VerticalSpacingWidget(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: SizedBox(
                        height: 140.h,
                        child: BlocBuilder<BannerBloc, BannerState>(
                          builder: (context, state) {
                            if (state is BannerLoading) {
                              return Shimmer.fromColors(
                                baseColor: kShimmerBaseColor,
                                highlightColor: kShimmerHighlightColor,
                                child: Container(
                                  width: double.infinity,
                                  height: 140.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              );
                            }
                            if (state is BannerError) {
                              return const Center(
                                child: Image(
                                  image: AssetImage(
                                      "assets/images/something went wrong-01.png"),
                                ),
                              );
                            }
                            if (state is BannerLoaded) {
                              bannerModel = BlocProvider.of<BannerBloc>(context)
                                  .bannerModel;
                              return Swiper(
                                autoplay: true,
                                itemCount: bannerModel.bannerImages!.length,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 6.w, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: FancyShimmerImage(
                                        boxFit: BoxFit.fill,
                                        errorWidget: const Image(
                                            image: AssetImage(
                                                "assets/icons/no image.png")),
                                        imageUrl:
                                            bannerModel.bannerImages![index],
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
                              );
                            }
                            return Container();
                          },
                        ),
                      ),
                    ),
                    const VerticalSpacingWidget(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AllRecordsScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 80.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: kCardColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            FadedScaleAnimation(
                              scaleDuration: const Duration(milliseconds: 400),
                              fadeDuration: const Duration(milliseconds: 400),
                              child: Image(
                                image:
                                    const AssetImage("assets/icons/folder.png"),
                                height: 45.h,
                                width: 55.w,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "All health records",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: kTextColor),
                                ),
                                SizedBox(
                                  width: 280.w,
                                  child: Text(
                                    "Prescriptions, Lab report, Scanning report, Discharge summary",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        color: kSubTextColor),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const VerticalSpacingWidget(height: 10),
                    Text(
                      "Upload your health documents",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: kSubTextColor),
                    ),
                    const VerticalSpacingWidget(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          //! add prescription
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const AddDocumentScreen(
                                    appBarTitle: "Upload Prescription",
                                    type: 2,
                                    stringType: "Prescription",
                                  ),
                                ),
                              );
                            },
                            child: FadedScaleAnimation(
                              scaleDuration: const Duration(milliseconds: 400),
                              fadeDuration: const Duration(milliseconds: 400),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: const Image(
                                  image: AssetImage(
                                      "assets/icons/add prescription.jpg"),
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                          ),
                          const HorizontalSpacingWidget(width: 5),
                          //!lab report
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const AddDocumentScreen(
                                    appBarTitle: "Upload Lab Report",
                                    type: 1,
                                    stringType: "Lab report",
                                  ),
                                ),
                              );
                            },
                            child: FadedScaleAnimation(
                              scaleDuration: const Duration(milliseconds: 400),
                              fadeDuration: const Duration(milliseconds: 400),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: const Image(
                                  image:
                                      AssetImage("assets/icons/lab report.jpg"),
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                          ),
                          const HorizontalSpacingWidget(width: 5),
                          //!scan report
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const AddDocumentScreen(
                                    appBarTitle: "Upload Scan Report",
                                    type: 4,
                                    stringType: "Scanning report",
                                  ),
                                ),
                              );
                            },
                            child: FadedScaleAnimation(
                              scaleDuration: const Duration(milliseconds: 400),
                              fadeDuration: const Duration(milliseconds: 400),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: const Image(
                                  image: AssetImage(
                                      "assets/icons/scanning report.jpg"),
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                          ),
                          const HorizontalSpacingWidget(width: 5),
                          //! discharge summery
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const AddDocumentScreen(
                                    appBarTitle: "Upload Discharge Summary",
                                    type: 3,
                                    stringType: "Discharge summary",
                                  ),
                                ),
                              );
                            },
                            child: FadedScaleAnimation(
                              scaleDuration: const Duration(milliseconds: 400),
                              fadeDuration: const Duration(milliseconds: 400),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: const Image(
                                  image: AssetImage(
                                      "assets/icons/discharge report.jpg"),
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const VerticalSpacingWidget(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> fetchAllMembers() async {
    try {
      setState(() {
        BlocProvider.of<GetAllMembersBloc>(context).add(FetchAllMembers());
      });
    } catch (error, stackTrace) {
      print('Error fetching all members: $error');
      print('Stack Trace: $stackTrace');
    }
  }
}
