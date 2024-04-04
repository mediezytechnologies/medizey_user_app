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
import 'package:mediezy_user/Repository/Bloc/HealthRecord/EditMember/edit_member_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetAllergy/get_allergy_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/UpdateMedicine/update_medicine_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Data/app_datas.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';

class EditPatientScreen extends StatefulWidget {
  const EditPatientScreen(
      {super.key,
      required this.patientId,
      required this.patienName,
      required this.patientAge,
      required this.patientNumber,
      required this.patientGender,
      required this.patientImage,
      required this.regularMedicine,
      required this.allergyId,
      required this.allergyName,
      required this.allergyDetails,
      required this.surgeryName,
      required this.treatmentTaken,
      required this.medicineList,
      required this.surgeryDetails,
      required this.treatmentDetails});

  final String patientId;
  final String patienName;
  final String patientAge;
  final String patientNumber;
  final String patientGender;
  final String patientImage;
  final String regularMedicine;
  final String allergyId;
  final String allergyName;
  final String allergyDetails;
  final List<String> surgeryName;
  final List<String> treatmentTaken;
  final List<MedicineDetails> medicineList;
  final String surgeryDetails;
  final String treatmentDetails;

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
  String buttonText = "Add";

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAllergyBloc>(context).add(FetchAllergy());
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
    selectedAllergyName = widget.allergyName;
    selectedAllergyId = widget.allergyId;
    selectedAllergyDetails = widget.allergyDetails;
    selectedDustAlleryStart = widget.allergyDetails == "Skin"
        ? 0
        : (widget.allergyDetails == "Cold")
            ? 1
            : -1;
    selectedSurgery = widget.surgeryName;
    selectedSurgeryStart = <int>{};
    surgeryIndex = "";
    selectedTreatment = widget.treatmentTaken;
    selectedTreatmentStart = <int>{};
    treatmentIndex = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Patient"),
        centerTitle: true,
      ),
      body: BlocListener<UpdateMedicineBloc, UpdateMedicineState>(
        listener: (context, state) {
          if (state is UpdateMedicineLoaded) {}
        },
        child: BlocListener<EditMemberBloc, EditMemberState>(
          listener: (context, state) {
            if (state is EditMemberLoaded) {
              GeneralServices.instance.showDelaySuccessMessage(
                  context, "Family Member edit successfully");
            }
            if (state is EditMemberError) {
              GeneralServices.instance
                  .showErrorMessage(context, "Family Member Edit error");
            }
          },
          child: SingleChildScrollView(
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
                          width: 100.w,
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
                            pickImageFromGallery();
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
                          style: TextStyle(fontSize: 13.sp, color: kTextColor),
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
                                    // dateOfBirth!,
                                    dOB != null
                                        ? DateFormat('dd-MM-yyyy').format(dOB!)
                                        : widget.patientAge,
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
                                        visualDensity:
                                            const VisualDensity(horizontal: -4),
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
                                        visualDensity:
                                            const VisualDensity(horizontal: -4),
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
                      ? ListView.builder(
                          itemCount: widget.medicineList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return Container(
                              padding: EdgeInsets.only(
                                  bottom: 10.h, left: 10.w, right: 10.w),
                              margin: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  color: kCardColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                            widget.medicineList[index].illness
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
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
                                                editingMedicineIndex = index;
                                              });
                                              medicineController.text = widget
                                                  .medicineList[index]
                                                  .medicineName
                                                  .toString();
                                              illnessController.text = widget
                                                  .medicineList[index].illness
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
                                                  fontWeight: FontWeight.w700),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          PopupMenuItem(
                                            onTap: () {
                                              BlocProvider.of<
                                                          DeleteMedicineBloc>(
                                                      context)
                                                  .add(FetchDeleteMedicineEvent(
                                                      medicineId: widget
                                                          .medicineList[index]
                                                          .medicineId
                                                          .toString(),
                                                      patientId:
                                                          widget.patientId));

                                              setState(() {
                                                widget.medicineList
                                                    .removeAt(index);
                                              });
                                            },
                                            child: Text(
                                              "Delete",
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w700),
                                              overflow: TextOverflow.ellipsis,
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
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.sp,
                                            color: kSubTextColor),
                                      ),
                                      Text(
                                        widget.medicineList[index].medicineName
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
                          }))
                      : Container(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.h,
                        child: TextFormField(
                          style: TextStyle(fontSize: 13.sp, color: kTextColor),
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
                              style:
                                  TextStyle(fontSize: 13.sp, color: kTextColor),
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
                              BlocProvider.of<UpdateMedicineBloc>(context).add(
                                FetchUpdateMedicine(
                                    parientId: widget.patientId,
                                    medicineId: medicineId,
                                    illnessName: illnessController.text,
                                    medicineName: medicineController.text),
                              );
                              illnessController.clear();
                              medicineController.clear();
                            },
                            child: Container(
                              height: 45.h,
                              width: 70.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: kMainColor,
                              ),
                              child: Center(
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: kCardColor),
                                ),
                              ),
                            ),
                          )
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
                        return Wrap(
                          children: List.generate(
                            getAllergyModel.allergies!.length,
                            (index) {
                              final allergyName = getAllergyModel
                                  .allergies![index].allergy
                                  .toString();
                              final isSelected =
                                  allergyName == selectedAllergyName;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedAllergyStart =
                                        selectedAllergyStart == index
                                            ? -1
                                            : index;
                                    selectedAllergyName = allergyName;
                                    selectedAllergyId = getAllergyModel
                                        .allergies![index].id
                                        .toString();
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        isSelected ? Colors.grey : kCardColor,
                                    border:
                                        Border.all(color: kMainColor, width: 1),
                                  ),
                                  margin: const EdgeInsets.all(3.0),
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    allergyName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 9.8.sp,
                                      color: isSelected
                                          ? Colors.white
                                          : kTextColor,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                  const VerticalSpacingWidget(height: 2),
                  //! drug allergy
                  if (selectedAllergyName == "Drug Allergy")
                    SizedBox(
                      height: 50.h,
                      child: TextFormField(
                        cursorColor: kMainColor,
                        controller: drugAllergyController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintStyle:
                              TextStyle(fontSize: 13.sp, color: kSubTextColor),
                          hintText: selectedAllergyName == "Drug Allergy"
                              ? selectedAllergyDetails
                              : "Enter Drug Name",
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
                  //! skin allergy
                  if (selectedAllergyName == "Skin Allergy")
                    SizedBox(
                      height: 50.h,
                      child: TextFormField(
                        cursorColor: kMainColor,
                        controller: skinAllergyController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintStyle:
                              TextStyle(fontSize: 13.sp, color: kSubTextColor),
                          hintText: selectedAllergyName == "Skin Allergy"
                              ? selectedAllergyDetails
                              : "in which situation",
                          filled: true,
                          fillColor: kCardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  //! dust allergy
                  if (selectedAllergyName == "Dust Allergy")
                    Center(
                      child: Wrap(
                        children: List.generate(
                          dustAlleryTypes.length,
                          (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDustAlleryStart = index;
                                dustAllery = dustAlleryTypes[index];
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: selectedDustAlleryStart == index
                                    ? Colors.grey
                                    : kCardColor,
                                border: Border.all(color: kMainColor, width: 1),
                              ),
                              margin: const EdgeInsets.all(3.0),
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                dustAlleryTypes[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 9.8.sp,
                                  color: selectedDustAlleryStart == index
                                      ? Colors.white
                                      : kTextColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  //! food allergy
                  if (selectedAllergyName == "Food Allergy")
                    SizedBox(
                      height: 50.h,
                      child: TextFormField(
                        cursorColor: kMainColor,
                        controller: foodAllergyController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintStyle:
                              TextStyle(fontSize: 13.sp, color: kSubTextColor),
                          hintText: selectedAllergyName == "Food Allergy"
                              ? selectedAllergyDetails
                              : "in which food",
                          filled: true,
                          fillColor: kCardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  const VerticalSpacingWidget(height: 5),
                  Text(
                    "Any Surgery?",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: kSubTextColor),
                  ),
                  VerticalSpacingWidget(height: 2.h),
                  Wrap(
                    children: List.generate(
                      surgeryTypes.length,
                      (index) {
                        bool isSelected =
                            selectedSurgery.contains(surgeryTypes[index]);
                        bool isInitiallySelected =
                            widget.surgeryName.contains(surgeryTypes[index]);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                surgeryIndex = "";
                                selectedSurgery.remove(surgeryTypes[index]);
                                selectedSurgeryStart.remove(index);
                              } else {
                                surgeryIndex = surgeryTypes[index];
                                selectedSurgeryStart.add(index);
                                selectedSurgery.add(surgeryTypes[index]);
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
                      },
                    ),
                  ),
                  const VerticalSpacingWidget(height: 2),
                  if (widget.surgeryName.contains("Other"))
                    SizedBox(
                      height: 50.h,
                      child: TextFormField(
                        cursorColor: kMainColor,
                        controller: otherSurgeryController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintStyle:
                              TextStyle(fontSize: 13.sp, color: kSubTextColor),
                          hintText: widget.surgeryDetails,
                          filled: true,
                          fillColor: kCardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  const VerticalSpacingWidget(height: 5),
                  Text(
                    "Any Treatment taken for?",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
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
                              if (isSelected) {
                                treatmentIndex = "";
                                selectedTreatment.remove(treatmentTypes[index]);
                                selectedTreatmentStart.remove(index);
                              } else {
                                treatmentIndex = treatmentTypes[index];
                                selectedTreatmentStart.add(index);
                                selectedTreatment.add(treatmentTypes[index]);
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
                  const VerticalSpacingWidget(height: 2),
                  if (widget.treatmentTaken.contains("Other"))
                    SizedBox(
                      height: 50.h,
                      child: TextFormField(
                        cursorColor: kMainColor,
                        controller: otherTreatmentController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintStyle:
                              TextStyle(fontSize: 13.sp, color: kSubTextColor),
                          hintText: widget.treatmentDetails,
                          filled: true,
                          fillColor: kCardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  const VerticalSpacingWidget(height: 10),
                  CommonButtonWidget(
                      title: "Update",
                      onTapFunction: () {
                        BlocProvider.of<EditMemberBloc>(context).add(
                          FetchEditMember(
                              patientImage: imageFromGallery,
                              patientId: widget.patientId,
                              age: dOB != null
                                  ? DateFormat('yyy-MM-dd').format(dOB!)
                                  : '',
                              fullName: nameController.text,
                              gender: selectedGender,
                              regularMedicine: regularMedicine,
                              allergyId: selectedAllergyId,
                              allegyDetails: (selectedAllergyId == "1")
                                  ? drugAllergyController.text
                                  : (selectedAllergyId == "2")
                                      ? skinAllergyController.text
                                      : (selectedAllergyId == "3")
                                          ? dustAllery
                                          : (selectedAllergyId == "4")
                                              ? foodAllergyController.text
                                              : "No",
                              mobileNumber: phoneNumberController.text,
                              surgeryName: selectedSurgery.toString(),
                              treatmentName: selectedTreatment.toString(),
                              surgeyDetails: otherSurgeryController.text,
                              treatmentDetails: otherTreatmentController.text),
                        );
                      }),
                  const VerticalSpacingWidget(height: 10),
                ],
              ),
            ),
          ),
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
