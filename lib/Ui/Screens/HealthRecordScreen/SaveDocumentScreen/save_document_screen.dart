// ignore_for_file: unused_local_variable

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/HealthRecord/GetAllMembers/get_all_members_model.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetAllMembers/get_all_members_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/UploadDocument/UploadDocumentFinal/upload_document_lab_and_scan_final_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/bottom_navigation_control_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';

class DocumentSaveScreen extends StatefulWidget {
  const DocumentSaveScreen(
      {super.key, required this.type, required this.documentId});

  final int type;
  final String documentId;

  @override
  State<DocumentSaveScreen> createState() => _DocumentSaveScreenState();
}

class _DocumentSaveScreenState extends State<DocumentSaveScreen> {
  final TextEditingController doctorNameController = TextEditingController();
  final TextEditingController fileNameController = TextEditingController();
  final TextEditingController additionalNoteController =
      TextEditingController();
  final TextEditingController
      labTextAndScanTestNameAndAppointmentForController =
      TextEditingController();
  final TextEditingController
      labNameAndScanningCenterNameAndHospitalNameController =
      TextEditingController();
  final TextEditingController appointmentForController =
      TextEditingController();
  final TextEditingController hospitalNameController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  late GetAllMembersModel getAllMembersModel;
  late ValueNotifier<String> dropValueNotifier;
  String dropValue1 = "";
  late String selectedPatientId;
  List<PatientData> patientNames = [];

  @override
  void initState() {
    BlocProvider.of<GetAllMembersBloc>(context).add(FetchAllMembers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Document Details"),
        centerTitle: true,
      ),
      body: BlocListener<UploadDocumentFinalBloc, UploadDocumentFinalState>(
        listener: (context, state) {
          if (state is UploadDocumentFinalLoaded) {
            GeneralServices.instance
                .showSuccessMessage(context, "Uploaded document successfully");
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const BottomNavigationControlWidget(),
                ),
              );
            });
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpacingWidget(height: 10),
                Text(
                  "Patient name",
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: kSubTextColor,
                      fontWeight: FontWeight.w400),
                ),
                const VerticalSpacingWidget(height: 5),
                BlocBuilder<GetAllMembersBloc, GetAllMembersState>(
                  builder: (context, state) {
                    if (state is GetAllMembersLoaded) {
                      getAllMembersModel =
                          BlocProvider.of<GetAllMembersBloc>(context)
                              .getAllMembersModel;
                      if (patientNames.isEmpty) {
                        patientNames.addAll(getAllMembersModel.patientData!);
                        dropValueNotifier = ValueNotifier("Select Patient");
                        dropValue1 = "";
                        selectedPatientId = "";
                      }
                      return Container(
                        height: 40.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: kCardColor,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: const Color(0xFF9C9C9C)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Center(
                            child: ValueListenableBuilder(
                              valueListenable: dropValueNotifier,
                              builder:
                                  (BuildContext context, String dropValue, _) {
                                return DropdownButtonFormField(
                                  iconEnabledColor: kMainColor,
                                  decoration: const InputDecoration.collapsed(
                                    hintText: '',
                                  ),
                                  value: dropValue,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: kTextColor,
                                  ),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  onChanged: (String? value) {
                                    if (value == "Select Patient") {
                                      dropValueNotifier.value = value!;
                                      dropValue1 = "";
                                      selectedPatientId = "";
                                    } else {
                                      dropValueNotifier.value = value!;
                                      dropValue1 = value;
                                      selectedPatientId = patientNames
                                          .where((element) => element
                                              .patientName!
                                              .contains(value))
                                          .toList()
                                          .first
                                          .id
                                          .toString();
                                    }
                                  },
                                  items: [
                                    const DropdownMenuItem<String>(
                                      value: "Select Patient",
                                      child: Text("Select Patient"),
                                    ),
                                    ...patientNames
                                        .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem<String>(
                                        onTap: () {
                                          setState(() {
                                            dropValue1 = value.id.toString();
                                          });
                                        },
                                        value: value.patientName!,
                                        child: Text(value.patientName!),
                                      );
                                    }).toList(),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
                const VerticalSpacingWidget(height: 10),
                Text(
                  "Basic details",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: kTextColor,
                      fontWeight: FontWeight.w700),
                ),
                const VerticalSpacingWidget(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Record date",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: kSubTextColor,
                              fontWeight: FontWeight.w400),
                        ),
                        const VerticalSpacingWidget(height: 5),
                        InkWell(
                          onTap: () {
                            Platform.isIOS
                                ? selectIosDate(
                                    context: context,
                                    date: selectedDate,
                                    onDateSelected: (DateTime picked) {
                                      setState(() {
                                        selectedDate = picked;
                                      });
                                    },
                                  )
                                : selectDate(
                                    context: context,
                                    date: selectedDate,
                                    onDateSelected: (DateTime picked) {
                                      setState(() {
                                        selectedDate = picked;
                                      });
                                    },
                                  );
                          },
                          child: Container(
                            height: 45.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                              color: kCardColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                                  style: TextStyle(
                                      color: kTextColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Platform.isIOS
                                      ? CupertinoIcons.calendar
                                      : Icons.calendar_month_outlined,
                                  color: kMainColor,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.type == 2 ? "Prescribed by" : "Doctor name",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: kSubTextColor,
                              fontWeight: FontWeight.w400),
                        ),
                        const VerticalSpacingWidget(height: 5),
                        SizedBox(
                          height: 45.h,
                          width: 210.w,
                          child: TextFormField(
                            cursorColor: kMainColor,
                            controller: doctorNameController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  fontSize: 13.sp, color: kSubTextColor),
                              hintText: "Doctor name",
                              filled: true,
                              fillColor: kCardColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 15.h),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const VerticalSpacingWidget(height: 10),
                widget.type == 1 || widget.type == 3 || widget.type == 4
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.type == 1
                                ? "Lab Name"
                                : (widget.type == 3)
                                    ? "Hopital name"
                                    : "Scanning center name",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: kSubTextColor,
                                fontWeight: FontWeight.w400),
                          ),
                          const VerticalSpacingWidget(height: 5),
                          SizedBox(
                            height: 45.h,
                            width: double.infinity,
                            child: SizedBox(
                              width: double.infinity,
                              child: TextFormField(
                                cursorColor: kMainColor,
                                controller:
                                    labNameAndScanningCenterNameAndHospitalNameController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 13.sp, color: kSubTextColor),
                                  hintText: widget.type == 1
                                      ? "Enter lab Name"
                                      : (widget.type == 3)
                                          ? "Enter hospital name"
                                          : "Enter scanning center name",
                                  filled: true,
                                  fillColor: kCardColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 15.h),
                                ),
                              ),
                            ),
                          ),
                          const VerticalSpacingWidget(height: 10),
                        ],
                      )
                    : Container(),
                Text(
                  "Additional Details",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: kTextColor,
                      fontWeight: FontWeight.w700),
                ),
                const VerticalSpacingWidget(height: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "File name",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: kSubTextColor,
                          fontWeight: FontWeight.w400),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    SizedBox(
                      height: 45.h,
                      width: double.infinity,
                      child: TextFormField(
                        cursorColor: kMainColor,
                        controller: fileNameController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintStyle:
                              TextStyle(fontSize: 13.sp, color: kSubTextColor),
                          hintText: "Enter file name",
                          filled: true,
                          fillColor: kCardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 15.h),
                        ),
                      ),
                    )
                  ],
                ),
                const VerticalSpacingWidget(height: 5),
                widget.type == 1 || widget.type == 3 || widget.type == 4
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.type == 1
                                ? "Lab test name"
                                : (widget.type == 3)
                                    ? "Admitted for"
                                    : "Scan test name",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: kSubTextColor,
                                fontWeight: FontWeight.w400),
                          ),
                          const VerticalSpacingWidget(height: 5),
                          SizedBox(
                            height: 45.h,
                            width: double.infinity,
                            child: TextFormField(
                              cursorColor: kMainColor,
                              controller:
                                  labTextAndScanTestNameAndAppointmentForController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    fontSize: 13.sp, color: kSubTextColor),
                                hintText: widget.type == 1
                                    ? "Enter lab test name"
                                    : (widget.type == 3)
                                        ? "Enter admitted for"
                                        : "Enter scan test name",
                                filled: true,
                                fillColor: kCardColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 15.h),
                              ),
                            ),
                          )
                        ],
                      )
                    : Container(),
                const VerticalSpacingWidget(height: 5),
                Divider(color: kSubTextColor, height: 5.h),
                const VerticalSpacingWidget(height: 5),
                Text(
                  "Additional note",
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: kSubTextColor,
                      fontWeight: FontWeight.w400),
                ),
                const VerticalSpacingWidget(height: 5),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    cursorColor: kMainColor,
                    controller: additionalNoteController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    maxLines: 2,
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: 13.sp, color: kSubTextColor),
                      hintText: "Enter additional notes",
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
                    title: "Save",
                    onTapFunction: () {
                      if (selectedPatientId.isEmpty) {
                        GeneralServices.instance
                            .showErrorMessage(context, "Select Patient");
                      } else if (doctorNameController.text.isEmpty) {
                        GeneralServices.instance
                            .showErrorMessage(context, "Enter doctor name");
                      } else if (widget.type == 1 &&
                          labTextAndScanTestNameAndAppointmentForController
                              .text.isEmpty) {
                        GeneralServices.instance
                            .showErrorMessage(context, "Enter lab test name");
                      } else if (widget.type == 4 &&
                          labTextAndScanTestNameAndAppointmentForController
                              .text.isEmpty) {
                        GeneralServices.instance
                            .showErrorMessage(context, "Enter scan test name");
                      } else if (widget.type == 3 &&
                          labTextAndScanTestNameAndAppointmentForController
                              .text.isEmpty) {
                        GeneralServices.instance
                            .showErrorMessage(context, "Enter admitted for");
                      } else {
                        BlocProvider.of<UploadDocumentFinalBloc>(context).add(
                          UploadDocumentFinal(
                            documentId: widget.documentId,
                            patientId: selectedPatientId.toString(),
                            type: widget.type.toString(),
                            doctorName: doctorNameController.text,
                            date:
                                "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}",
                            fileName: fileNameController.text,
                            testName:
                                labTextAndScanTestNameAndAppointmentForController
                                    .text,
                            labName:
                                labNameAndScanningCenterNameAndHospitalNameController
                                    .text,
                            notes: additionalNoteController.text,
                            admittedFor:
                                labTextAndScanTestNameAndAppointmentForController
                                    .text,
                            hospitalName:
                                labNameAndScanningCenterNameAndHospitalNameController
                                    .text,
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //* for select date
  Future<void> selectDate({
    required BuildContext context,
    required DateTime date,
    required Function(DateTime) onDateSelected,
  }) async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = DateTime(now.year - 25, now.month, now.day);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: firstDate,
      lastDate: now.add(const Duration(days: 30)),
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

  Future<void> selectIosDate({
    required BuildContext context,
    required DateTime date,
    required Function(DateTime) onDateSelected,
  }) async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = DateTime(now.year - 25, now.month, now.day);
    final DateTime? picked = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300.0,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: date,
            minimumDate: firstDate,
            maximumDate: now.add(
              const Duration(days: 30),
            ),
            onDateTimeChanged: (DateTime newDate) {
              onDateSelected(newDate);
            },
          ),
        );
      },
    );
  }
}
