// ignore_for_file: unnecessary_null_comparison, avoid_print, deprecated_member_use, use_build_context_synchronously
import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/HealthRecord/GetAllMembers/get_all_members_model.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/DeleteMember/delete_member_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetAllMembers/get_all_members_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/banner/banner_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/bottom_navigation_control_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/text_style_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/Widgets/get_banner_widget.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/AddDocumentScreen/add_document_screen.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/AddPatientScreen/AddPatientScreen.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/Widgets/go_to_all_record_widget.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/Widgets/round_name_widget.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/Widgets/user_details_display_card_widget.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import 'package:shimmer/shimmer.dart';

class HealthRecordScreen extends StatefulWidget {
  const HealthRecordScreen({super.key});

  @override
  State<HealthRecordScreen> createState() => _HealthRecordScreenState();
}

class _HealthRecordScreenState extends State<HealthRecordScreen> {
  late GetAllMembersModel getAllMembersModel;

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
                            child: Text("Something went wrong"),
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
                                  children: [
                                    Text(
                                        getAllMembersModel
                                            .patientData!.first.patientName
                                            .toString(),
                                        style: black14B600),
                                    const HorizontalSpacingWidget(width: 10),
                                    Text(
                                        getAllMembersModel
                                            .patientData!.first.mediezyPatientId
                                            .toString(),
                                        style: grey10B500),
                                  ],
                                ),
                                const VerticalSpacingWidget(height: 5),
                                SizedBox(
                                  height: 65.h,
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
                                            child: RoundNameWidget(
                                              containerColor:
                                                  selectedPatientIndex == index
                                                      ? kMainColor
                                                      : kCardColor,
                                              patientFirstLetter:
                                                  getAllMembersModel
                                                      .patientData![index]
                                                      .patientName![0]
                                                      .toUpperCase(),
                                              patientName: getAllMembersModel
                                                  .patientData![index]
                                                  .patientName
                                                  .toString(),
                                              patientSecondLetter:
                                                  getAllMembersModel
                                                      .patientData![index]
                                                      .patientName![1]
                                                      .toUpperCase(),
                                              textColor:
                                                  selectedPatientIndex == index
                                                      ? kCardColor
                                                      : kTextColor,
                                            ),
                                          );
                                        },
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          if (getAllMembersModel
                                                  .patientData!.length ==
                                              6) {
                                            GeneralServices.instance
                                                .showDialogue(
                                              context,
                                              "Unable to add patient. The maximum limit for patients has been reached",
                                            );
                                          } else {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AddPatientScreen(),
                                              ),
                                            );
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
                                                height: 39.h,
                                                width: 39.w,
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
                                            Text("Add", style: black9B400)
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
                                          ? UserDetailsDisplayCardWidget(
                                              patientId: getAllMembersModel
                                                  .patientData![index].id
                                                  .toString(),
                                              patienName: getAllMembersModel
                                                  .patientData![index]
                                                  .patientName
                                                  .toString(),
                                              patientAge: getAllMembersModel
                                                  .patientData![index].dob
                                                  .toString(),
                                              patientNumber: getAllMembersModel
                                                  .patientData![index]
                                                  .patientMobileNumber
                                                  .toString(),
                                              patientGender: getAllMembersModel
                                                  .patientData![index]
                                                  .patientGender
                                                  .toString(),
                                              patientImage: getAllMembersModel
                                                  .patientData![index]
                                                  .patientImage
                                                  .toString(),
                                              regularMedicine:
                                                  getAllMembersModel
                                                      .patientData![index]
                                                      .regularMedicine
                                                      .toString(),
                                              surgeryName: getAllMembersModel
                                                  .patientData![index]
                                                  .surgeryName!
                                                  .toList(),
                                              treatmentTaken: getAllMembersModel
                                                  .patientData![index]
                                                  .treatmentTaken!
                                                  .toList(),
                                              medicineList: getAllMembersModel
                                                  .patientData![index]
                                                  .medicineDetails!
                                                  .toList(),
                                              allergiesDetails:
                                                  getAllMembersModel
                                                      .patientData![index]
                                                      .allergiesDetails!
                                                      .toList(),
                                              surgeryDetails: getAllMembersModel
                                                  .patientData![index]
                                                  .surgeryDetails
                                                  .toString(),
                                              treatmentDetails:
                                                  getAllMembersModel
                                                      .patientData![index]
                                                      .treatmentTakenDetails
                                                      .toString(),
                                              dateOfBirth: getAllMembersModel
                                                  .patientData![index].dob
                                                  .toString(),
                                              mediezyPatientId:
                                                  getAllMembersModel
                                                      .patientData![index]
                                                      .mediezyPatientId
                                                      .toString(),
                                              patientIndex: index,
                                              displayAge: getAllMembersModel
                                                  .patientData![index]
                                                  .displayAge
                                                  .toString(),
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
                    const GetBannerWidget(),
                    const VerticalSpacingWidget(height: 10),
                    const GoToAllRecordWidget(),
                    const VerticalSpacingWidget(height: 10),
                    Text(
                      "Upload your health documents",
                      style: grey15B500
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
}
