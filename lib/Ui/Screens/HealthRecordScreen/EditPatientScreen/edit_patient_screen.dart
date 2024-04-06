import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mediezy_user/Model/HealthRecord/GetAllMembers/get_all_members_model.dart';
import 'package:mediezy_user/Model/HealthRecord/GetAllergy/get_allery_model.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/DeleteMedicine/delete_medicine_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetAllergy/get_allergy_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/UpdateMedicine/update_medicine_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/bloc/get_updated_medicine_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/bloc/get_updated_medicine_event.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/bloc/get_updated_medicine_state.dart';
import 'package:mediezy_user/Ui/CommonWidgets/bottom_navigation_control_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Data/app_datas.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import 'package:mediezy_user/ddd/application/add_member_image/add_member_image_bloc.dart';
import 'package:mediezy_user/ddd/application/edit_member/edit_member_bloc.dart';
import 'package:mediezy_user/ddd/domain/add_member/model/add_member_model.dart';

class EditPatientScreen extends StatefulWidget {
  const EditPatientScreen({
    super.key,
    required this.patientId,
    required this.patienName,
    required this.patientAge,
    required this.patientNumber,
    required this.patientGender,
    required this.patientImage,
    required this.regularMedicine,
    required this.surgeryName,
    required this.treatmentTaken,
    required this.medicineList,
    required this.surgeryDetails,
    required this.treatmentDetails,
    required this.allergiesDetails,
    required this.dateOfBirth,
  });

  final String patientId;
  final String patienName;
  final String patientAge;
  final String patientNumber;
  final String patientGender;
  final String patientImage;
  final String regularMedicine;
  final List<String> surgeryName;
  final List<String> treatmentTaken;
  final List<MedicineDetails> medicineList;
  final List<AllergiesDetails> allergiesDetails;
  final String surgeryDetails;
  final String treatmentDetails;
  final String dateOfBirth;

  @override
  State<EditPatientScreen> createState() => _EditPatientScreenState();
}

class _EditPatientScreenState extends State<EditPatientScreen> {
  late GetAllergyModel getAllergyModel;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController illnessController = TextEditingController();
  final TextEditingController medicineController = TextEditingController();
  final TextEditingController drugAllergyController = TextEditingController();
  final TextEditingController skinAllergyController = TextEditingController();
  final TextEditingController foodAllergyController = TextEditingController();
  final TextEditingController otherSurgeryController = TextEditingController();
  final TextEditingController otherTreatmentController =
      TextEditingController();
  String fullName = '';
  String selectedAllergyId = "";
  String dustAllery = "";
  String genderValue = "Male";
  String selectedGender = "1";
  String regularMedicine = "Yes";
  int selectedAllergyStart = -1;
  int selectedDustAlleryStart = -1;
  File? imageFromGallery;
  String selectedAllergyName = "";
  String selectedAllergyDetails = "";
  String? selectedDustAllergy = "";
  late List<String> selectedSurgery;
  late Set<int> selectedSurgeryStart;
  late String surgeryIndex;
  late List<String> selectedTreatment;
  late Set<int> selectedTreatmentStart;
  late String treatmentIndex;
  int editingMedicineIndex = -1;
  String medicineId = "";
  DateTime? dOB;
  bool isEditOrAddMedicine = false;
  List<Allergy> allergies = [];
  Set<int> selectedAllergies = {};
  List<Medicine>? medicineDataLists = [];
  final ImagePicker imagePicker = ImagePicker();
  String? imagePath;
  DateTime? dateOfBirth;
  bool isTreatmentOtherSelected = false;
  bool isOtherSurgerySelected = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAllergyBloc>(context).add(FetchAllergy());
    BlocProvider.of<GetUpdatedMedicineBloc>(context)
        .add(GetFetchUpdatedMedicineEvent(patientId: widget.patientId));

    nameController.text = widget.patienName;
    phoneNumberController.text = widget.patientNumber;
    otherSurgeryController.text =
        widget.surgeryDetails == "null" ? "" : widget.surgeryDetails;
    otherTreatmentController.text =
        widget.treatmentDetails == "null" ? "" : widget.treatmentDetails;

    genderValue = widget.patientGender == "1"
        ? "Male"
        : (widget.patientGender == "2")
            ? "Female"
            : "Other";
    selectedGender = widget.patientGender == "1"
        ? "1"
        : (widget.patientGender == "2")
            ? "2"
            : "3";
    regularMedicine = widget.regularMedicine;
    selectedSurgery = widget.surgeryName;
    selectedSurgeryStart = <int>{};
    surgeryIndex = "";
    selectedTreatment = widget.treatmentTaken;
    selectedTreatmentStart = <int>{};
    treatmentIndex = "";
    widget.surgeryDetails == ""
        ? isOtherSurgerySelected = false
        : isOtherSurgerySelected = true;
    widget.treatmentDetails == ""
        ? isTreatmentOtherSelected = false
        : isTreatmentOtherSelected = true;
    selectedAllergies = Set<int>.from(widget.allergiesDetails.map((detail) {
      int id = detail.allergyId! - 1;
      return id;
    }));
    allergies = widget.allergiesDetails
        .map((detail) => Allergy(
            allergyDetails: detail.allergyDetails, allergyId: detail.allergyId))
        .toList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   log("message medisine :$selectedAllergies");
      //     allergies.forEach((allergies) {
      //                     print(
      //                         'details: ${allergies.allergyDetails}, details id: ${allergies.allergyId}, ');
      //                   });
      // },),
      appBar: AppBar(
        title: const Text("Edit Patient"),
        centerTitle: true,
      ),
      body: BlocListener<UpdateMedicineBloc, UpdateMedicineState>(
        listener: (context, state) {
          if (state is UpdateMedicineLoaded) {
            BlocProvider.of<GetUpdatedMedicineBloc>(context)
                .add(GetFetchUpdatedMedicineEvent(patientId: widget.patientId));
          }
        },
        child: BlocConsumer<EditMemberBloc, EditMemberState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VerticalSpacingWidget(height: 20),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 100.h,
                            width: 110.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: FadedScaleAnimation(
                              scaleDuration: const Duration(milliseconds: 400),
                              fadeDuration: const Duration(milliseconds: 400),
                              child: ClipOval(
                                child: imageFromGallery != null
                                    ? Image.file(
                                        imageFromGallery!,
                                        height: 80.h,
                                        width: 80.w,
                                        fit: BoxFit.cover,
                                      )
                                    : (widget.patientImage == ""
                                        ? Image.asset(
                                            "assets/icons/profile pic.png",
                                            height: 80.h,
                                            width: 80.w,
                                            color: kMainColor,
                                          )
                                        : Image.network(
                                            widget.patientImage,
                                            height: 80.h,
                                            width: 80.w,
                                            fit: BoxFit.cover,
                                          )),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -10.h,
                          right: 100.w,
                          child: IconButton(
                            onPressed: () {
                              placePicImage();
                            },
                            icon: Icon(
                              Icons.add_a_photo,
                              size: 26.sp,
                              weight: 5,
                              color: kMainColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const VerticalSpacingWidget(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Full Name",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                              color: kSubTextColor),
                        ),
                        VerticalSpacingWidget(height: 5.h),
                        SizedBox(
                          height: 50.h,
                          child: TextFormField(
                            style:
                                TextStyle(fontSize: 13.sp, color: kTextColor),
                            cursorColor: kMainColor,
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  fontSize: 13.sp, color: kSubTextColor),
                              hintText: widget.patienName,
                              filled: true,
                              fillColor: kCardColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    VerticalSpacingWidget(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Phone Number",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.sp,
                                  color: kSubTextColor),
                            ),
                            const VerticalSpacingWidget(height: 5),
                            SizedBox(
                              height: 50.h,
                              width: 200.w,
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize: 13.sp, color: kSubTextColor),
                                cursorColor: kMainColor,
                                controller: phoneNumberController,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                maxLength: 10,
                                decoration: InputDecoration(
                                  counterText: "",
                                  hintStyle: TextStyle(
                                      fontSize: 13.sp, color: kSubTextColor),
                                  hintText: widget.patientNumber,
                                  filled: true,
                                  fillColor: kCardColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 10.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Age",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.sp,
                                  color: kSubTextColor),
                            ),
                            VerticalSpacingWidget(height: 5.h),
                            InkWell(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                selectDate(
                                  context: context,
                                  date: DateTime.now(),
                                  onDateSelected: (DateTime picked) async {
                                    setState(() {
                                      dOB = picked;
                                    });
                                  },
                                );
                              },
                              child: Container(
                                height: 45.h,
                                width: 130.w,
                                decoration: BoxDecoration(
                                  color: kCardColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      widget.patientAge,
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                          color: kTextColor),
                                    ),
                                    Icon(
                                      IconlyLight.calendar,
                                      color: kMainColor,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const VerticalSpacingWidget(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              genderValue = "Male";
                              selectedGender = "1";
                            });
                          },
                          child: Row(
                            children: [
                              Radio<String>(
                                activeColor: kMainColor,
                                visualDensity:
                                    const VisualDensity(horizontal: -4),
                                value: "Male",
                                groupValue: genderValue,
                                onChanged: (value) {
                                  setState(() {
                                    genderValue = value!;
                                    selectedGender = "1";
                                  });
                                },
                              ),
                              Text(
                                "Male",
                                style: TextStyle(fontSize: 13.sp),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              genderValue = "Female";
                              selectedGender = "2";
                            });
                          },
                          child: Row(
                            children: [
                              Radio<String>(
                                activeColor: kMainColor,
                                visualDensity:
                                    const VisualDensity(horizontal: -4),
                                value: "Female",
                                groupValue: genderValue,
                                onChanged: (value) {
                                  setState(() {
                                    genderValue = value!;
                                    selectedGender = "2";
                                  });
                                },
                              ),
                              Text(
                                "Female",
                                style: TextStyle(fontSize: 13.sp),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              genderValue = "Other";
                              selectedGender = "3";
                            });
                          },
                          child: Row(
                            children: [
                              Radio<String>(
                                activeColor: kMainColor,
                                visualDensity:
                                    const VisualDensity(horizontal: -4),
                                value: "Other",
                                groupValue: genderValue,
                                onChanged: (value) {
                                  setState(() {
                                    genderValue = value!;
                                    selectedGender = "3";
                                  });
                                },
                              ),
                              Text(
                                "Other",
                                style: TextStyle(fontSize: 13.sp),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Using any regular medicines?",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: kSubTextColor),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        regularMedicine = "Yes";
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Radio<String>(
                                          visualDensity: const VisualDensity(
                                              horizontal: -4),
                                          activeColor: kMainColor,
                                          value: "Yes",
                                          groupValue: regularMedicine,
                                          onChanged: (value) {
                                            setState(() {
                                              regularMedicine = value!;
                                            });
                                          },
                                        ),
                                        Text(
                                          "Yes",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: kSubTextColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        regularMedicine = "No";
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Radio<String>(
                                          visualDensity: const VisualDensity(
                                              horizontal: -4),
                                          activeColor: kMainColor,
                                          value: "No",
                                          groupValue: regularMedicine,
                                          onChanged: (value) {
                                            setState(() {
                                              regularMedicine = value!;
                                            });
                                          },
                                        ),
                                        Text(
                                          "No",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: kSubTextColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    regularMedicine == "Yes"
                        //* old medicines
                        ? BlocBuilder<GetUpdatedMedicineBloc,
                            GetUpdatedMedicineState>(
                            builder: (context, state) {
                              if (state is GetUpdatedMedicineError) {
                                return Center(
                                  child: Text(state.errorMessage),
                                );
                              }
                              if (state is GetUpdatedMedicineLoading) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: kMainColor,
                                  ),
                                );
                              }
                              if (state is GetUpdatedMedicineLoaded) {
                                return ListView.builder(
                                    itemCount: state.getUpdatedMedicineModel
                                                .medicineDetails ==
                                            null
                                        ? widget.medicineList.length
                                        : state.getUpdatedMedicineModel
                                            .medicineDetails!.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: ((context, index) {
                                      var medicine = state
                                          .getUpdatedMedicineModel
                                          .medicineDetails![index];
                                      return Container(
                                        padding: EdgeInsets.only(
                                            bottom: 10.h,
                                            left: 10.w,
                                            right: 10.w),
                                        margin:
                                            const EdgeInsets.only(bottom: 5),
                                        decoration: BoxDecoration(
                                            color: kCardColor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Illness name : ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 13.sp,
                                                          color: kSubTextColor),
                                                    ),
                                                    Text(
                                                      medicine.illness
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 13.sp,
                                                          color: kTextColor),
                                                    ),
                                                  ],
                                                ),
                                                PopupMenuButton(
                                                  iconSize: 20.sp,
                                                  icon: Icon(
                                                    Icons.more_vert,
                                                    color: kMainColor,
                                                  ),
                                                  itemBuilder: (context) =>
                                                      <PopupMenuEntry<dynamic>>[
                                                    PopupMenuItem(
                                                      onTap: () async {
                                                        setState(() {
                                                          isEditOrAddMedicine =
                                                              true;
                                                          editingMedicineIndex =
                                                              index;
                                                        });
                                                        medicineController
                                                                .text =
                                                            widget
                                                                .medicineList[
                                                                    index]
                                                                .medicineName
                                                                .toString();
                                                        illnessController.text =
                                                            widget
                                                                .medicineList[
                                                                    index]
                                                                .illness
                                                                .toString();
                                                        medicineId = widget
                                                            .medicineList[index]
                                                            .medicineId
                                                            .toString();
                                                      },
                                                      child: Text(
                                                        "Edit",
                                                        style: TextStyle(
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    PopupMenuItem(
                                                      onTap: () {
                                                        BlocProvider.of<
                                                                    DeleteMedicineBloc>(
                                                                context)
                                                            .add(FetchDeleteMedicineEvent(
                                                                medicineId: widget
                                                                    .medicineList[
                                                                        index]
                                                                    .medicineId
                                                                    .toString(),
                                                                patientId: widget
                                                                    .patientId));

                                                        setState(() {
                                                          widget.medicineList
                                                              .removeAt(index);
                                                        });
                                                      },
                                                      child: Text(
                                                        "Delete",
                                                        style: TextStyle(
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Medicine name : ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13.sp,
                                                      color: kSubTextColor),
                                                ),
                                                Text(
                                                  medicine.medicineName
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13.sp,
                                                      color: kTextColor),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    }));
                              }
                              return Container();
                            },
                          )
                        : Container(),
                    medicineDataLists!.isEmpty
                        ? const SizedBox()
                        : Text(
                            "New added medicine",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: kSubTextColor),
                          ),
                    const VerticalSpacingWidget(height: 3),
                    ListView.builder(
                        itemCount: medicineDataLists!.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                color: kCardColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Illness name : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp,
                                          color: kSubTextColor),
                                    ),
                                    Text(
                                      medicineDataLists![index].illness!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp,
                                          color: kTextColor),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Medicine name : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp,
                                          color: kSubTextColor),
                                    ),
                                    Text(
                                      medicineDataLists![index]
                                          .medicineName
                                          .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp,
                                          color: kTextColor),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        })),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50.h,
                          child: TextFormField(
                            style:
                                TextStyle(fontSize: 13.sp, color: kTextColor),
                            cursorColor: kMainColor,
                            controller: illnessController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  fontSize: 13.sp, color: kSubTextColor),
                              hintText: "In which illness",
                              filled: true,
                              fillColor: kCardColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                            ),
                          ),
                        ),
                        const VerticalSpacingWidget(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 250.w,
                              height: 50.h,
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize: 13.sp, color: kTextColor),
                                cursorColor: kMainColor,
                                controller: medicineController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 13.sp, color: kSubTextColor),
                                  hintText: "Enter medicine name",
                                  filled: true,
                                  fillColor: kCardColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10.0),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (isEditOrAddMedicine) {
                                  BlocProvider.of<UpdateMedicineBloc>(context)
                                      .add(
                                    FetchUpdateMedicine(
                                      parientId: widget.patientId,
                                      medicineId: medicineId,
                                      illnessName: illnessController.text,
                                      medicineName: medicineController.text,
                                    ),
                                  );
                                } else {
                                  medicineDataLists!.add(Medicine(
                                    medicineName: medicineController.text,
                                    illness: illnessController.text,
                                  ));
                                }
                                illnessController.clear();
                                medicineController.clear();
                                setState(() {
                                  isEditOrAddMedicine = !isEditOrAddMedicine;
                                });
                              },
                              child: Container(
                                height: 45.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: kMainColor,
                                ),
                                child: Center(
                                  child: Text(
                                    isEditOrAddMedicine ? "Update" : "Add",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: kCardColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const VerticalSpacingWidget(height: 5),
                      ],
                    ),
                    Text(
                      "Any Allergy?",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13.sp,
                          color: kSubTextColor),
                    ),
                    VerticalSpacingWidget(height: 2.h),
                    BlocBuilder<GetAllergyBloc, GetAllergyState>(
                      builder: (context, state) {
                        if (state is GetAllergyLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: kCardColor,
                            ),
                          );
                        }
                        if (state is GetAllergyError) {
                          return const Center(
                            child: Text("Something went wrong"),
                          );
                        }
                        if (state is GetAllergyLoaded) {
                          getAllergyModel =
                              BlocProvider.of<GetAllergyBloc>(context)
                                  .getAllergyModel;
                          log('length ${getAllergyModel.allergies!.length}');
                          return Wrap(
                            children: List.generate(
                              getAllergyModel.allergies!.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (index == 4) {
                                      if (selectedAllergies.contains(index)) {
                                        selectedAllergies.remove(index);
                                        allergies.removeWhere((element) =>
                                            element.allergyId! == index + 1);
                                      } else {
                                        selectedAllergies = {index};

                                        allergies.clear();
                                        allergies.add(
                                          Allergy(
                                              allergyDetails: '',
                                              allergyId: index + 1),
                                        );
                                      }
                                    } else {
                                      if (selectedAllergies.contains(index)) {
                                        selectedAllergies.remove(index);
                                        allergies.removeWhere((element) =>
                                            element.allergyId! == index + 1);
                                      } else {
                                        selectedAllergies.add(index);
                                        allergies.add(Allergy(
                                            allergyDetails: '',
                                            allergyId: index + 1));
                                      }
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: selectedAllergies.contains(index)
                                        ? Colors.grey
                                        : kCardColor,
                                    border:
                                        Border.all(color: kMainColor, width: 1),
                                  ),
                                  margin: const EdgeInsets.all(3.0),
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    getAllergyModel.allergies![index].allergy
                                        .toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 9.8.sp,
                                      color: selectedAllergies.contains(index)
                                          ? Colors.white
                                          : kTextColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                    const VerticalSpacingWidget(height: 2),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: selectedAllergies.length,
                      itemBuilder: (context, index) {
                        switch (selectedAllergies.elementAt(index)) {
                          case 0:
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: TextFormField(
                                cursorColor: kMainColor,
                                keyboardType: TextInputType.text,
                                onChanged: (value) {
                                  setState(() {
                                    allergies[index].allergyDetails = value;
                                  });
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 14.sp, color: kSubTextColor),
                                  hintText: allergies[index]
                                          .allergyDetails!
                                          .isNotEmpty
                                      ? allergies[index].allergyDetails
                                      : "Enter drug allergy details",
                                  filled: true,
                                  fillColor: kCardColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10.0),
                                ),
                              ),
                            );
                          case 1:
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: TextFormField(
                                cursorColor: kMainColor,
                                keyboardType: TextInputType.text,
                                onChanged: (value) {
                                  setState(() {
                                    allergies[index].allergyDetails = value;
                                  });
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 14.sp, color: kSubTextColor),
                                  hintText: allergies[index]
                                          .allergyDetails!
                                          .isNotEmpty
                                      ? allergies[index].allergyDetails
                                      : "Enter skin allergy details",
                                  filled: true,
                                  fillColor: kCardColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10.0),
                                ),
                              ),
                            );
                          case 2:
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: TextFormField(
                                cursorColor: kMainColor,
                                keyboardType: TextInputType.text,
                                onChanged: (value) {
                                  setState(() {
                                    allergies[index].allergyDetails = value;
                                  });
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 14.sp, color: kSubTextColor),
                                  hintText: allergies[index]
                                          .allergyDetails!
                                          .isNotEmpty
                                      ? allergies[index].allergyDetails
                                      : "Enter dust allergy details",
                                  filled: true,
                                  fillColor: kCardColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10.0),
                                ),
                              ),
                            );
                          case 3:
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: TextFormField(
                                cursorColor: kMainColor,
                                keyboardType: TextInputType.text,
                                onChanged: (value) {
                                  setState(() {
                                    allergies[index].allergyDetails = value;
                                  });
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 14.sp, color: kSubTextColor),
                                  hintText: allergies[index]
                                          .allergyDetails!
                                          .isNotEmpty
                                      ? allergies[index].allergyDetails
                                      : "Enter food allergy details",
                                  filled: true,
                                  fillColor: kCardColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10.0),
                                ),
                              ),
                            );
                          case 5:
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: TextFormField(
                                cursorColor: kMainColor,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  setState(() {
                                    allergies[index].allergyDetails = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 14.sp, color: kSubTextColor),
                                  hintText: allergies[index]
                                          .allergyDetails!
                                          .isNotEmpty
                                      ? allergies[index].allergyDetails
                                      : "Enter other allergy details",
                                  filled: true,
                                  fillColor: kCardColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10.0),
                                ),
                              ),
                            );
                          default:
                            return Container();
                        }
                      },
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "Any Surgery?",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13.sp,
                          color: kSubTextColor),
                    ),
                    VerticalSpacingWidget(height: 2.h),
                    Wrap(
                      children: List.generate(surgeryTypes.length, (index) {
                        bool isSelected =
                            selectedSurgery.contains(surgeryTypes[index]);
                        bool isInitiallySelected =
                            widget.surgeryName.contains(surgeryTypes[index]);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (surgeryTypes[index] == "No" ||
                                  surgeryTypes[index] == "Other") {
                                if (!selectedSurgeryStart.contains(index)) {
                                  selectedSurgery.clear();
                                  selectedSurgeryStart.clear();
                                  selectedSurgeryStart.add(index);
                                  selectedSurgery.add(surgeryTypes[index]);
                                  if (surgeryTypes[index] == "Other") {
                                    isOtherSurgerySelected = true;
                                  } else {
                                    isOtherSurgerySelected = false;
                                  }
                                }
                              } else {
                                if (selectedSurgeryStart.contains(index)) {
                                  surgeryIndex = "";
                                  selectedSurgery.remove(surgeryTypes[index]);
                                  selectedSurgeryStart.remove(index);
                                } else {
                                  surgeryIndex = surgeryTypes[index];
                                  selectedSurgeryStart.add(index);
                                  selectedSurgery.add(surgeryTypes[index]);
                                }
                                if (selectedSurgery.contains("No")) {
                                  selectedSurgery.remove("No");
                                  selectedSurgeryStart.removeWhere((element) =>
                                      element == surgeryTypes.indexOf("No"));
                                }
                                if (selectedSurgery.contains("Other")) {
                                  selectedSurgery.remove("Other");
                                  selectedSurgeryStart.removeWhere((element) =>
                                      element == surgeryTypes.indexOf("Other"));
                                }
                                isOtherSurgerySelected = false;
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isInitiallySelected
                                  ? Colors.grey
                                  : isSelected
                                      ? Colors.grey
                                      : kCardColor,
                              border: Border.all(
                                color: kMainColor,
                                width: 1,
                              ),
                            ),
                            margin: const EdgeInsets.all(3.0),
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              surgeryTypes[index],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 10.sp,
                                color: isInitiallySelected
                                    ? Colors.white
                                    : isSelected
                                        ? Colors.white
                                        : kTextColor,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    if (isOtherSurgerySelected)
                      TextFormField(
                        cursorColor: kMainColor,
                        controller: otherSurgeryController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintStyle:
                              TextStyle(fontSize: 13.sp, color: kSubTextColor),
                          hintText: "In which surgery",
                          filled: true,
                          fillColor: kCardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10.0),
                        ),
                      ),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "Any Treatment taken for?",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13.sp,
                          color: kSubTextColor),
                    ),
                    VerticalSpacingWidget(height: 2.h),
                    Wrap(
                      children: List.generate(
                        treatmentTypes.length,
                        (index) {
                          bool isSelected =
                              selectedTreatment.contains(treatmentTypes[index]);
                          bool isInitiallySelected = widget.treatmentTaken
                              .contains(treatmentTypes[index]);
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (treatmentTypes[index] == "No" ||
                                    treatmentTypes[index] == "Other") {
                                  if (!selectedTreatmentStart.contains(index)) {
                                    selectedTreatment.clear();
                                    selectedTreatmentStart.clear();
                                    selectedTreatmentStart.add(index);
                                    selectedTreatment
                                        .add(treatmentTypes[index]);
                                    if (treatmentTypes[index] == "Other") {
                                      isTreatmentOtherSelected = true;
                                    } else {
                                      isTreatmentOtherSelected = false;
                                    }
                                  }
                                } else {
                                  if (selectedTreatmentStart.contains(index)) {
                                    treatmentIndex = "";
                                    selectedTreatment
                                        .remove(treatmentTypes[index]);
                                    selectedTreatmentStart.remove(index);
                                  } else {
                                    treatmentIndex = treatmentTypes[index];
                                    selectedTreatmentStart.add(index);
                                    selectedTreatment
                                        .add(treatmentTypes[index]);
                                  }
                                  if (selectedTreatment.contains("No")) {
                                    selectedTreatment.remove("No");
                                    selectedTreatmentStart.removeWhere(
                                        (element) =>
                                            element ==
                                            treatmentTypes.indexOf("No"));
                                  }
                                  if (selectedTreatment.contains("Other")) {
                                    selectedTreatment.remove("Other");
                                    selectedTreatmentStart.removeWhere(
                                        (element) =>
                                            element ==
                                            treatmentTypes.indexOf("Other"));
                                  }
                                  isTreatmentOtherSelected = false;
                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isInitiallySelected
                                    ? Colors.grey
                                    : isSelected
                                        ? Colors.grey
                                        : kCardColor,
                                border: Border.all(
                                  color: kMainColor,
                                  width: 1,
                                ),
                              ),
                              margin: const EdgeInsets.all(3.0),
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                treatmentTypes[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp,
                                  color: isInitiallySelected
                                      ? Colors.white
                                      : isSelected
                                          ? Colors.white
                                          : kTextColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    if (isTreatmentOtherSelected)
                      SizedBox(
                        height: 50.h,
                        child: TextFormField(
                          style: TextStyle(fontSize: 13.sp, color: kTextColor),
                          cursorColor: kMainColor,
                          controller: otherTreatmentController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontSize: 13.sp, color: kSubTextColor),
                            hintText: "Which Treatment",
                            filled: true,
                            fillColor: kCardColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10.0),
                          ),
                        ),
                      ),
                    const VerticalSpacingWidget(height: 20),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(330.w, 50.h),
                          backgroundColor: kMainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: state.isloding
                            ? () {
                                const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            : () async {
                                BlocProvider.of<EditMemberBloc>(context).add(
                                  EditMemberEvent.started(
                                    widget.patientId,
                                    nameController.text,
                                    dateOfBirth == null
                                        ? widget.dateOfBirth
                                        : DateFormat('yyy-MM-dd')
                                            .format(dateOfBirth!),
                                    phoneNumberController.text,
                                    selectedGender,
                                    regularMedicine,
                                    selectedSurgery.toString(),
                                    selectedTreatment.toString(),
                                    otherSurgeryController.text,
                                    otherTreatmentController.text,
                                    context,
                                    allergies,
                                    medicineDataLists!,
                                  ),
                                );
                                if (imagePath != null) {
                                  log(imagePath!);
                                  Future.delayed(const Duration(seconds: 2))
                                      .then((value) =>
                                          BlocProvider.of<AddMemberImageBloc>(
                                                  context)
                                              .add(AddMemberImageEvent.started(
                                                  imagePath!)));
                                  Future.delayed(const Duration(seconds: 2))
                                      .then((value) =>
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const BottomNavigationControlWidget(),
                                              ),
                                              (route) => false));
                                }
                                Future.delayed(const Duration(seconds: 2)).then(
                                    (value) => Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const BottomNavigationControlWidget(),
                                        ),
                                        (route) => false));
                                log('button pressed');
                                GeneralServices.instance
                                    .showToastMessage("Updated successfully");
                              },
                        child:
                            //  state.isloding
                            //     ? Center(
                            //         child: CircularProgressIndicator(
                            //           color: kCardColor,
                            //         ),
                            //       )
                            //     :
                            Text(
                          "Update Member",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const VerticalSpacingWidget(height: 10),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      File compressedImage = await compressImage(imageFile);
      setState(() {
        imageFromGallery = compressedImage;
      });
    } else {
      setState(() {
        GeneralServices.instance.showToastMessage('Please select an image');
      });
    }
  }

  Future placePicImage() async {
    var image = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 30,
    );
    if (image == null) return;
    final imageTemporary = image.path;
    setState(() {
      imagePath = imageTemporary;
      print("$imageTemporary======= image");
    });
  }

//* Image compression function
  Future<File> compressImage(File imageFile) async {
    int fileSize = await imageFile.length();
    int maxFileSize = 2048 * 1024;
    if (fileSize <= maxFileSize) {
      return imageFile;
    }
    Uint8List? compressedBytes = await FlutterImageCompress.compressWithFile(
      imageFile.path,
      quality: 85,
    );
    if (compressedBytes != null) {
      List<int> compressedList = compressedBytes.toList();
      File compressedImage = File(imageFile.path)
        ..writeAsBytesSync(compressedList);
      return compressedImage;
    } else {
      throw Exception('Image compression failed');
    }
  }

  Future<void> selectDate({
    required BuildContext context,
    required DateTime date,
    required Function(DateTime) onDateSelected,
  }) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 100)),
      lastDate: DateTime.now(),
      builder: ((context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: kMainColor,
            ),
          ),
          child: child!,
        );
      }),
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }
}
