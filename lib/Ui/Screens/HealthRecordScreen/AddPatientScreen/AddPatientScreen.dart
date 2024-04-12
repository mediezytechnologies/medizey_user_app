// ignore_for_file: avoid_print, must_be_immutable, prefer_final_fields
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mediezy_user/Model/HealthRecord/GetAllergy/get_allery_model.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetAllMembers/get_all_members_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetAllergy/get_allergy_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Data/app_datas.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import 'package:mediezy_user/ddd/application/add_member_image/add_member_image_bloc.dart';
import 'package:mediezy_user/ddd/application/add_members/add_members_bloc.dart';
import 'package:mediezy_user/ddd/domain/add_member/model/add_member_model.dart';

class AddPatientScreen extends StatefulWidget {
  const AddPatientScreen({
    super.key,
  });

  @override
  State<AddPatientScreen> createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController illnessController = TextEditingController();
  final TextEditingController medicineController = TextEditingController();
  final TextEditingController drugAllergyController = TextEditingController();
  final TextEditingController skinAllergyController = TextEditingController();
  final TextEditingController foodAllergyController = TextEditingController();
  final TextEditingController dustAllergyController = TextEditingController();
  final TextEditingController otherAllergyController = TextEditingController();
  final TextEditingController otherSurgeryController = TextEditingController();
  final TextEditingController otherTreatmentController =
      TextEditingController();
  GlobalKey _dobColumnKey = GlobalKey();

  late GetAllergyModel getAllergyModel;
  String dustAllery = "";
  String genderValue = "Male";
  String selectedGender = "1";
  String regularMedicine = "Yes";
  List<String> selectedSurgery = [];
  List<String> selectedTreatment = [];
  int selectedAllergyStart = -1;
  int selectedDustAlleryStart = -1;
  Set<int> selectedAllergies = {};
  Set<int> selectedSurgeryStart = <int>{};
  Set<int> selectedTreatmentStart = <int>{};
  String surgeryIndex = "";
  String treatmentIndex = "";
  List<Map<String, dynamic>> medicineDataList = [];
  List<Medicine>? medicineDataLists = [];
  List<Allergy> allergies = [];
  DateTime? dateOfBirth;
  final ImagePicker imagePicker = ImagePicker();
  String? imagePath;
  bool isOtherTreatmentSelected = false;
  bool isOtherSurgerySelected = false;

  @override
  void initState() {
    BlocProvider.of<GetAllergyBloc>(context).add(FetchAllergy());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Family Member"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                          child: imagePath != null
                              ? Image.file(
                                  File(imagePath!),
                                  height: 80.h,
                                  width: 80.w,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  "assets/icons/profile pic.png",
                                  height: 80.h,
                                  width: 80.w,
                                  color: kMainColor,
                                  fit: BoxFit.cover,
                                ),
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
                    width: double.infinity,
                    height: 50,
                    child: TextFormField(
                      style: TextStyle(fontSize: 13.sp, color: kTextColor),
                      cursorColor: kMainColor,
                      controller: fullNameController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintStyle:
                            TextStyle(fontSize: 12.sp, color: kSubTextColor),
                        hintText: "Enter full name",
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
                          style: TextStyle(fontSize: 13.sp, color: kTextColor),
                          cursorColor: kMainColor,
                          controller: phoneNumberController,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          decoration: InputDecoration(
                            counterText: "",
                            hintStyle: TextStyle(
                                fontSize: 12.sp, color: kSubTextColor),
                            hintText: "Enter Phone Number",
                            filled: true,
                            fillColor: kCardColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 10.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Focus(
                    key: _dobColumnKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "DOB",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                              color: kSubTextColor),
                        ),
                        VerticalSpacingWidget(height: 5.h),
                        InkWell(
                          onTap: () {
                            selectDate(
                              context: context,
                              date: dateOfBirth ?? DateTime.now(),
                              onDateSelected: (DateTime picked) async {
                                setState(() {
                                  dateOfBirth = picked;
                                });
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                            );
                          },
                          child: Container(
                            height: 48.h,
                            width: 130.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  dateOfBirth != null
                                      ? DateFormat('dd-MM-yyyy')
                                          .format(dateOfBirth!)
                                      : 'DOB',
                                  style: TextStyle(
                                      fontSize: 15.sp,
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
                  ),
                ],
              ),
              const VerticalSpacingWidget(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gender",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        color: kSubTextColor),
                  ),
                  VerticalSpacingWidget(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
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
                                  visualDensity:
                                      const VisualDensity(horizontal: -4),
                                  activeColor: kMainColor,
                                  value: "Male",
                                  groupValue: genderValue,
                                  onChanged: (value) {
                                    setState(() {
                                      genderValue = value!;
                                      selectedGender = "1";
                                    });
                                  },
                                ),
                                Text("Male", style: TextStyle(fontSize: 13.sp)),
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
                                genderValue = "Female";
                                selectedGender = "2";
                              });
                            },
                            child: Row(
                              children: [
                                Radio<String>(
                                  visualDensity:
                                      const VisualDensity(horizontal: -4),
                                  activeColor: kMainColor,
                                  value: "Female",
                                  groupValue: genderValue,
                                  onChanged: (value) {
                                    setState(() {
                                      genderValue = value!;
                                      selectedGender = "2";
                                    });
                                  },
                                ),
                                Text("Female",
                                    style: TextStyle(fontSize: 13.sp)),
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
                                genderValue = "Other";
                                selectedGender = "3";
                              });
                            },
                            child: Row(
                              children: [
                                Radio<String>(
                                  visualDensity:
                                      const VisualDensity(horizontal: -4),
                                  activeColor: kMainColor,
                                  value: "Other",
                                  groupValue: genderValue,
                                  onChanged: (value) {
                                    setState(() {
                                      genderValue = value!;
                                      selectedGender = "3";
                                    });
                                  },
                                ),
                                Text("Other",
                                    style: TextStyle(fontSize: 13.sp)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
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
                        fontSize: 13.sp,
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
                                        fontSize: 12.sp, color: kSubTextColor),
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
                                        fontSize: 12.sp, color: kSubTextColor),
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
              const VerticalSpacingWidget(height: 2),
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
                              medicineDataLists![index].medicineName.toString(),
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
                }),
              ),
              regularMedicine == "Yes"
                  ? Column(
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
                            onChanged: (value) {},
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
                                onChanged: (value) {},
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
                                if (medicineController.text.isNotEmpty &&
                                    illnessController.text.isNotEmpty) {
                                  setState(() {
                                    final medicineName =
                                        medicineController.text;
                                    final illness = illnessController.text;
                                    medicineDataLists!.add(Medicine(
                                        medicineName: medicineName,
                                        illness: illness));
                                    log("${medicineDataLists!.length}");
                                    medicineController.clear();
                                    illnessController.clear();
                                  });
                                } else {
                                  GeneralServices.instance.showToastMessage(
                                      "Please fill the details");
                                }
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
                    )
                  : Container(),
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
                    getAllergyModel = BlocProvider.of<GetAllergyBloc>(context)
                        .getAllergyModel;
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
                              border: Border.all(color: kMainColor, width: 1),
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
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: TextFormField(
                          style: TextStyle(fontSize: 13.sp, color: kTextColor),
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
                                fontSize: 13.sp, color: kSubTextColor),
                            hintText: "Enter Drug Name",
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
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: SizedBox(
                          height: 50.h,
                          width: double.infinity,
                          child: TextFormField(
                            style:
                                TextStyle(fontSize: 13.sp, color: kTextColor),
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
                                  fontSize: 13.sp, color: kSubTextColor),
                              hintText: "Enter skin allergy",
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
                      );
                    case 2:
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: SizedBox(
                          height: 50.h,
                          width: double.infinity,
                          child: TextFormField(
                            style:
                                TextStyle(fontSize: 13.sp, color: kTextColor),
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
                                  fontSize: 13.sp, color: kSubTextColor),
                              hintText: "Enter dust allergy",
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
                      );
                    case 3:
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: SizedBox(
                          height: 50.h,
                          width: double.infinity,
                          child: TextFormField(
                            style:
                                TextStyle(fontSize: 13.sp, color: kTextColor),
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
                                  fontSize: 13.sp, color: kSubTextColor),
                              hintText: "Enter food allergy",
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
                      );
                    case 5:
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: SizedBox(
                          height: 50.h,
                          width: double.infinity,
                          child: TextFormField(
                            style:
                                TextStyle(fontSize: 13.sp, color: kTextColor),
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
                                  fontSize: 13.sp, color: kSubTextColor),
                              hintText: "Enter allergy details",
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
                children: List.generate(
                  surgeryTypes.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        if (surgeryTypes[index] == "No") {
                          if (!selectedSurgeryStart.contains(index)) {
                            selectedSurgery.clear();
                            selectedSurgeryStart.clear();
                            selectedSurgeryStart.add(index);
                            selectedSurgery.add(surgeryTypes[index]);
                            isOtherSurgerySelected = false;
                          }
                        } else {
                          if (selectedSurgeryStart.contains(index)) {
                            surgeryIndex = "";
                            selectedSurgery.remove(surgeryTypes[index]);
                            selectedSurgeryStart.remove(index);
                            if (surgeryTypes[index] == "Other") {
                              isOtherSurgerySelected = false;
                            }
                          } else {
                            surgeryIndex = surgeryTypes[index];
                            selectedSurgeryStart.add(index);
                            selectedSurgery.add(surgeryTypes[index]);
                            if (surgeryTypes[index] == "Other") {
                              isOtherSurgerySelected = true;
                            }
                          }
                          if (selectedSurgery.contains("No")) {
                            selectedSurgery.remove("No");
                            selectedSurgeryStart.removeWhere((element) =>
                                element == surgeryTypes.indexOf("No"));
                          }
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: selectedSurgeryStart.contains(index)
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
                          color: selectedSurgeryStart.contains(index)
                              ? Colors.white
                              : kTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const VerticalSpacingWidget(height: 5),
              if (isOtherSurgerySelected)
                SizedBox(
                  height: 50.h,
                  width: double.infinity,
                  child: TextFormField(
                    style: TextStyle(fontSize: 13.sp, color: kTextColor),
                    cursorColor: kMainColor,
                    controller: otherSurgeryController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: 13.sp, color: kSubTextColor),
                      hintText: "Which Surgery",
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
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        if (treatmentTypes[index] == "No") {
                          if (!selectedTreatmentStart.contains(index)) {
                            selectedTreatment.clear();
                            selectedTreatmentStart.clear();
                            selectedTreatmentStart.add(index);
                            selectedTreatment.add(treatmentTypes[index]);
                            isOtherTreatmentSelected = false;
                          }
                        } else {
                          if (selectedTreatmentStart.contains(index)) {
                            treatmentIndex = "";
                            selectedTreatment.remove(treatmentTypes[index]);
                            selectedTreatmentStart.remove(index);
                            if (treatmentTypes[index] == "Other") {
                              isOtherTreatmentSelected = false;
                            }
                          } else {
                            treatmentIndex = treatmentTypes[index];
                            selectedTreatmentStart.add(index);
                            selectedTreatment.add(treatmentTypes[index]);
                            if (treatmentTypes[index] == "Other") {
                              isOtherTreatmentSelected = true;
                            }
                          }
                          if (selectedTreatment.contains("No")) {
                            selectedTreatment.remove("No");
                            selectedTreatmentStart.removeWhere((element) =>
                                element == treatmentTypes.indexOf("No"));
                          }
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: selectedTreatmentStart.contains(index)
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
                          color: selectedTreatmentStart.contains(index)
                              ? Colors.white
                              : kTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const VerticalSpacingWidget(height: 5),
              if (isOtherTreatmentSelected)
                SizedBox(
                  height: 50.h,
                  child: TextFormField(
                    style: TextStyle(fontSize: 13.sp, color: kTextColor),
                    cursorColor: kMainColor,
                    controller: otherTreatmentController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: 13.sp, color: kSubTextColor),
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
              BlocConsumer<AddMembersBloc, AddMembersState>(
                listener: (context, state) {
                  if (state.isError &&
                      state.status == false &&
                      state.message == 'Patient already exists.') {
                    log("message error catched ui");
                    log("message error ${state.message}");
                    log("message state emit ui ${state.message}");
                    GeneralServices.instance
                        .showErrorMessage(context, state.message);
                  } else if (state.status == true) {
                    log(" no error");
                    if (imagePath != null) {
                      Future.delayed(const Duration(seconds: 1)).then((value) =>
                          BlocProvider.of<AddMemberImageBloc>(context)
                              .add(AddMemberImageEvent.started(imagePath!)));
                      GeneralServices.instance
                          .showToastMessage("Family member added successfully");
                      Future.delayed(const Duration(seconds: 1))
                          .then((value) async {
                        BlocProvider.of<GetAllMembersBloc>(context)
                            .add(FetchAllMembers());
                        Navigator.pop(context);
                      });
                    } else {
                      log("message state emit ui ${state.status}");
                      log("image null");
                      GeneralServices.instance
                          .showToastMessage("Family member added successfully");
                      Future.delayed(const Duration(seconds: 1)).then((value) {
                        BlocProvider.of<GetAllMembersBloc>(context)
                            .add(FetchAllMembers());
                        Navigator.pop(context);
                      });
                    }
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
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
                            log(medicineDataList.toString());
                            if (fullNameController.text.isEmpty) {
                              GeneralServices.instance.showErrorMessage(
                                  context, "Fill family member name");
                            } else if (dateOfBirth == null) {
                              GeneralServices.instance.showErrorMessage(
                                  context, "Fill date of birth");
                            } else if (phoneNumberController.text.isEmpty ||
                                phoneNumberController.text.length < 10) {
                              GeneralServices.instance.showErrorMessage(
                                  context, "Fill family member number");
                            } else if (regularMedicine == "Yes" &&
                                (medicineDataLists!.isEmpty)) {
                              GeneralServices.instance.showErrorMessage(
                                  context, "Add illness and medicine details");
                            } else if (allergies.isEmpty) {
                              GeneralServices.instance
                                  .showErrorMessage(context, "Select allergy");
                            } else if (selectedSurgery.isEmpty) {
                              GeneralServices.instance
                                  .showErrorMessage(context, "Select surgery");
                            } else if (selectedTreatment.isEmpty) {
                              GeneralServices.instance.showErrorMessage(
                                  context, "Select treatment");
                            } else {
                              log("message $allergies");
                              log(" jkfhsdjkf : $regularMedicine");
                              log(" medisi : $medicineDataLists");
                              BlocProvider.of<AddMembersBloc>(context).add(
                                AddMembersEvent.started(
                                  fullNameController.text,
                                  DateFormat('yyy-MM-dd').format(dateOfBirth!),
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
                              log('button pressed');
                            }
                          },
                    child: state.isloding
                        ? Center(
                            child: CircularProgressIndicator(
                              color: kCardColor,
                            ),
                          )
                        : Text(
                            "Add Member",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                  );
                },
              ),
              VerticalSpacingWidget(height: 5.h),
            ],
          ),
        ),
      ),
    );
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
