// ignore_for_file: unnecessary_null_comparison, avoid_print, deprecated_member_use, use_build_context_synchronously
import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/HealthRecord/GetAllMembers/get_all_members_model.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/DeleteMember/delete_member_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetAllMembers/get_all_members_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/bottom_navigation_control_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/text_style.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/CommonWidgets/get_banner_widget.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/AddPatientScreen/AddPatientScreen.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/Widgets/add_documents_widget.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/Widgets/go_to_all_record_widget.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/Widgets/round_name_widget.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/Widgets/user_details_display_card_widget.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import 'package:shimmer/shimmer.dart';

import '../../../ddd/application/get_banner/get_banner_bloc.dart';

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
    BlocProvider.of<GetBannerBloc>(context)
        .add(const GetBannerEvent.fetchBanner("3"));
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
              builder: (context) => BottomNavigationControlWidget(
                selectedIndex: 0,
              ),
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
                            child: ListView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
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
                                  height: 60.h,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
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
                                                    selectedPatientIndex ==
                                                            index
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
                                                    selectedPatientIndex ==
                                                            index
                                                        ? kCardColor
                                                        : kTextColor,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          if (getAllMembersModel
                                                  .patientData!.length ==
                                              11) {
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
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 4.w),
                                                child: Container(
                                                  height: 42.h,
                                                  width: 42.w,
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
                                              dobShow: getAllMembersModel
                                                  .patientData![index].dobShow
                                                  .toString(),
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
                    Text("Upload your health documents", style: grey15B500),
                    const VerticalSpacingWidget(height: 5),
                    const AddDocumentsWidget(),
                    const VerticalSpacingWidget(height: 10),
                    const GoToAllRecordWidget(),
                    const VerticalSpacingWidget(height: 10),
                    const GetBannerWidget(),
                    const VerticalSpacingWidget(height: 10),
                    Text("FAQs", style: grey15B600),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        childrenPadding: EdgeInsets.symmetric(horizontal: 8.w),
                        title: Text('Are my health records safe and secure',
                            style: black14B600),
                        children: [
                          Text(
                            'Absolutely! Your health records can only be viewed by you and your doctor, will never be shared by any third party. You can read our privacy policy to know more',
                            style: grey12B500,
                          ),
                        ],
                      ),
                    ),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        childrenPadding: EdgeInsets.symmetric(horizontal: 8.w),
                        title: Text('Who can view my health records?',
                            style: black14B600),
                        children: [
                          Text(
                            'Your health records can only be viewed by you and your doctor. However, you do have an option to share your health records with the doctor in the course of physical consultation.',
                            style: grey12B500,
                          ),
                        ],
                      ),
                    ),
                    const VerticalSpacingWidget(height: 10)
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
