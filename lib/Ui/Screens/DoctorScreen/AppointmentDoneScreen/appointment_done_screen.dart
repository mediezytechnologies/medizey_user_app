// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mediezy_user/Model/GetFamilyMembers/get_family_members_model.dart';
import 'package:mediezy_user/Model/GetSymptoms/get_symptoms_model.dart';
import 'package:mediezy_user/Repository/Bloc/BookAppointment/AutoFetch/auto_fetch_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/BookAppointment/BookAppointmets/book_appointment_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/BookAppointment/GetFamilyMembers/get_family_members_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetSymptoms/get_symptoms_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/GetToken/get_token_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/internet_handle_screen.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/AppointmentsScreen/appointments_screen.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/BookingConfirmationScreen/booking_confirmation_screen.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/AddPatientScreen/AddPatientScreen.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';

class AppointmentDoneScreen extends StatefulWidget {
  AppointmentDoneScreen(
      {super.key,
      required this.bookingTime,
      required this.bookingDate,
      required this.tokenNo,
      required this.doctorId,
      required this.clinicId,
      required this.clinicName,
      required this.clinicAddress,
      required this.clinicLocation,
      required this.doctorFirstName,
      required this.doctorSecondName,
      required this.sheduleType,
      required this.estimatedTime,
      required this.tokenId,
      this.patientId});

  final String bookingTime;
  final DateTime bookingDate;
  final String tokenNo;
  final String doctorId;
  final String clinicId;
  final String clinicName;
  final String doctorFirstName;
  final String doctorSecondName;
  final String clinicAddress;
  final String clinicLocation;
  final String sheduleType;
  final String estimatedTime;
  final String tokenId;
  String? patientId;

  @override
  State<AppointmentDoneScreen> createState() => _AppointmentDoneScreenState();
}

class _AppointmentDoneScreenState extends State<AppointmentDoneScreen> {
  List<String> deceaseStartingTime = [
    'Today',
    'Yesterday',
    '5 Days Before',
    'Other'
  ];

  List<String> deceaseRepeats = ['Continues', 'Frequently', 'Sometimes'];
  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController patientAgeController = TextEditingController();
  final TextEditingController patientContactNumberController =
      TextEditingController();
  final TextEditingController appointmentForController =
      TextEditingController();
  final TextEditingController illnessController = TextEditingController();
  final TextEditingController medicineController = TextEditingController();
  final TextEditingController drugAllergyController = TextEditingController();
  final TextEditingController skinAllergyController = TextEditingController();
  final TextEditingController foodAllergyController = TextEditingController();
  final TextEditingController otherSurgeryController = TextEditingController();
  final TextEditingController otherTreatmentController =
      TextEditingController();
  final TextEditingController daysController = TextEditingController();
  String? originalAge;
  String dropdownValue = 'Male';
  String bookingFor = "Self";
  int selectedStart = -1;
  int selectedCome = -1;
  int selectedSymptomsID = -1;
  late GetSymptomsModel getSymptomsModel;
  List<int> selectedSymptoms = [];
  String selectedBookingFor = "1";
  String patientId = "0";
  late StreamSubscription<ConnectivityResult> subscription;
  late GetFamilyMembersModel getFamilyMembersModel;
  late ValueNotifier<int> dropValueMemberNotifier;
  int dropValueMember = 0;
  late String selectedFamilyMemberId = "";
  late List<FamilyMember> familyMemberId;
  late List<FamilyMember> familyMemberNames = [];

  void handleConnectivityChange(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
    } else {}
  }

  String formatDate() {
    String formattedSelectedDate =
        DateFormat('yyyy-MM-dd').format(widget.bookingDate);
    return formattedSelectedDate;
  }

  checkPatientIdAvailableOrNot() {
    widget.patientId == null
        ? BlocProvider.of<AutoFetchBloc>(context)
            .add(FetchAutoFetch(section: "Self", patientId: ""))
        : BlocProvider.of<AutoFetchBloc>(context).add(FetchAutoFetch(
            section: "Family Member", patientId: widget.patientId.toString()));
  }

  @override
  void initState() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      handleConnectivityChange(result);
    });
    BlocProvider.of<GetSymptomsBloc>(context)
        .add(FetchSymptoms(doctorId: widget.doctorId));
    BlocProvider.of<GetFamilyMembersBloc>(context).add(FetchFamilyMember());
    checkPatientIdAvailableOrNot();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Token"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AppointmentsScreen(),
                ),
              );
            },
            icon: const Icon(IconlyLight.calendar),
          )
        ],
      ),
      body: StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            final connectivityResult = snapshot.data;
            if (connectivityResult == ConnectivityResult.none) {
              return const InternetHandleScreen();
            } else {
              return BlocListener<BookAppointmentBloc, BookAppointmentState>(
                listener: (context, state) {
                  if (state is BookAppointmentLoaded) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingConfirmationScreen(
                          age: patientAgeController.text,
                          gender: dropdownValue,
                          appointmentDate: formatDate(),
                          appointmentTime: widget.bookingTime,
                          name: patientNameController.text,
                          mobileNo: patientContactNumberController.text,
                          tokenNo: widget.tokenNo,
                          address: widget.clinicAddress,
                          clinicName: widget.clinicName,
                          doctorFirstName: widget.doctorFirstName,
                          doctorSecondName: widget.doctorSecondName,
                          location: widget.clinicLocation,
                          estimatedTime: widget.estimatedTime,
                        ),
                      ),
                    );
                  }
                  if (state is BookAppointmentError) {
                    showErrorDialogue(context, state);
                  }
                },
                child: FadedSlideAnimation(
                  beginOffset: const Offset(0, 0.3),
                  endOffset: const Offset(0, 0),
                  slideCurve: Curves.linearToEaseOut,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const VerticalSpacingWidget(height: 10),
                          widget.patientId == null
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                        
                                          bookingFor = "Self";
                                          selectedBookingFor = 1.toString();
                                          BlocProvider.of<AutoFetchBloc>(
                                                  context)
                                              .add(FetchAutoFetch(
                                                  section: "Self",
                                                  patientId: ""));
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Radio<String>(
                                            visualDensity: const VisualDensity(
                                                horizontal: -4),
                                            activeColor: kMainColor,
                                            value: "Self",
                                            groupValue: bookingFor,
                                            onChanged: (value) {
                                              setState(() {
                                             
                                                bookingFor = value!;
                                                selectedBookingFor =
                                                    1.toString();
                                                BlocProvider.of<AutoFetchBloc>(
                                                        context)
                                                    .add(
                                                  FetchAutoFetch(
                                                      section: "Self",
                                                      patientId: ""),
                                                );
                                              });
                                            },
                                          ),
                                          Text(
                                            "Self",
                                            style: TextStyle(
                                                fontWeight: bookingFor == "Self"
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                                fontSize: 14.sp,
                                                color: bookingFor == "Self"
                                                    ? kTextColor
                                                    : kSubTextColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          bookingFor = "Family Member";
                                          selectedBookingFor = 2.toString();
                                          getFamilyMembersModel = BlocProvider
                                                  .of<GetFamilyMembersBloc>(
                                                      context)
                                              .getFamilyMembersModel;
                                          selectedFamilyMemberId =
                                              getFamilyMembersModel
                                                      .familyMember!.isEmpty
                                                  ? ""
                                                  : getFamilyMembersModel
                                                      .familyMember!.first.id
                                                      .toString();
                                          selectedFamilyMemberId == ""
                                              ? null
                                              : BlocProvider.of<AutoFetchBloc>(
                                                      context)
                                                  .add(
                                                  FetchAutoFetch(
                                                      section: "Family Member",
                                                      patientId:
                                                          selectedFamilyMemberId),
                                                );
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Radio<String>(
                                            activeColor: kMainColor,
                                            visualDensity: const VisualDensity(
                                                horizontal: -4),
                                            value: "Family Member",
                                            groupValue: bookingFor,
                                            onChanged: (value) {
                                              setState(() {
                                                bookingFor = value!;
                                                selectedBookingFor =
                                                    2.toString();
                                                getFamilyMembersModel = BlocProvider
                                                        .of<GetFamilyMembersBloc>(
                                                            context)
                                                    .getFamilyMembersModel;
                                                selectedFamilyMemberId =
                                                    getFamilyMembersModel
                                                            .familyMember!
                                                            .isEmpty
                                                        ? ""
                                                        : getFamilyMembersModel
                                                            .familyMember!
                                                            .first
                                                            .id
                                                            .toString();
                                                selectedFamilyMemberId == ""
                                                    ? null
                                                    : BlocProvider.of<
                                                                AutoFetchBloc>(
                                                            context)
                                                        .add(
                                                        FetchAutoFetch(
                                                            section:
                                                                "Family Member",
                                                            patientId:
                                                                selectedFamilyMemberId),
                                                      );
                                              });
                                            },
                                          ),
                                          Text(
                                            "Family Member",
                                            style: TextStyle(
                                                fontWeight: bookingFor ==
                                                        "Family Member"
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                                fontSize: 14.sp,
                                                color: bookingFor ==
                                                        "Family Member"
                                                    ? kTextColor
                                                    : kSubTextColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          bookingFor = "Other";
                                          selectedBookingFor = 3.toString();
                                          patientNameController.text = "";
                                          patientAgeController.text = "";
                                          patientContactNumberController.text =
                                              "";
                                          dropdownValue = "Male";
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Radio<String>(
                                            activeColor: kMainColor,
                                            visualDensity: const VisualDensity(
                                                horizontal: -4),
                                            value: "Other",
                                            groupValue: bookingFor,
                                            onChanged: (value) {
                                              setState(() {
                                                bookingFor = value!;
                                                selectedBookingFor =
                                                    3.toString();
                                                patientNameController.text = "";
                                                patientAgeController.text = "";
                                                patientContactNumberController
                                                    .text = "";
                                                dropdownValue = "Male";
                                              });
                                            },
                                          ),
                                          Text(
                                            "Other",
                                            style: TextStyle(
                                                fontWeight:
                                                    bookingFor == "Other"
                                                        ? FontWeight.bold
                                                        : FontWeight.normal,
                                                fontSize: 14.sp,
                                                color: bookingFor == "Other"
                                                    ? kTextColor
                                                    : kSubTextColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          bookingFor == "Family Member"
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BlocBuilder<GetFamilyMembersBloc,
                                        GetFamilyMembersState>(
                                      builder: (context, state) {
                                        if (state is GetFamilyMembersLoaded) {
                                          getFamilyMembersModel = BlocProvider
                                                  .of<GetFamilyMembersBloc>(
                                                      context)
                                              .getFamilyMembersModel;
                                          if (getFamilyMembersModel
                                              .familyMember!.isNotEmpty) {
                                            if (familyMemberNames.isEmpty) {
                                              familyMemberNames.addAll(
                                                  getFamilyMembersModel
                                                      .familyMember!);
                                              dropValueMemberNotifier =
                                                  ValueNotifier<int>(
                                                      familyMemberNames
                                                          .first.id!);
                                              dropValueMember =
                                                  familyMemberNames.first.id!;
                                              selectedFamilyMemberId =
                                                  familyMemberNames.first.id
                                                      .toString();
                                            }
                                          }
                                          if (getFamilyMembersModel
                                              .familyMember!.isEmpty) {
                                            return Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const VerticalSpacingWidget(
                                                      height: 30),
                                                  Text(
                                                    "You have not added any family members yet",
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  const VerticalSpacingWidget(
                                                      height: 10),
                                                  CommonButtonWidget(
                                                      title: "Add member",
                                                      onTapFunction: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                AddPatientScreen(),
                                                          ),
                                                        );
                                                      })
                                                ],
                                              ),
                                            );
                                          } else {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Select Family Member",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14.sp,
                                                      color: kSubTextColor),
                                                ),
                                                const VerticalSpacingWidget(
                                                    height: 5),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      height: 45.h,
                                                      width: 240.w,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.w),
                                                      decoration: BoxDecoration(
                                                        color: kCardColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: Border.all(
                                                          color: const Color(
                                                              0xFF9C9C9C),
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child:
                                                            ValueListenableBuilder(
                                                          valueListenable:
                                                              dropValueMemberNotifier,
                                                          builder: (BuildContext
                                                                  context,
                                                              int dropValue,
                                                              _) {
                                                            return DropdownButtonFormField(
                                                              iconEnabledColor:
                                                                  kMainColor,
                                                              decoration:
                                                                  const InputDecoration
                                                                      .collapsed(
                                                                      hintText:
                                                                          ''),
                                                              value: dropValue,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      14.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color:
                                                                      kTextColor),
                                                              icon: const Icon(Icons
                                                                  .keyboard_arrow_down),
                                                              onChanged:
                                                                  (int? value) {
                                                                dropValue =
                                                                    value!;
                                                                dropValueMemberNotifier
                                                                        .value =
                                                                    value;
                                                                dropValueMember =
                                                                    value;
                                                                selectedFamilyMemberId =
                                                                    value
                                                                        .toString();
                                                                BlocProvider.of<
                                                                            AutoFetchBloc>(
                                                                        context)
                                                                    .add(
                                                                  FetchAutoFetch(
                                                                      section:
                                                                          "Family Member",
                                                                      patientId:
                                                                          selectedFamilyMemberId),
                                                                );
                                                              },
                                                              items: familyMemberNames.map<
                                                                      DropdownMenuItem<
                                                                          int>>(
                                                                  (value) {
                                                                return DropdownMenuItem<
                                                                    int>(
                                                                  value:
                                                                      value.id!,
                                                                  child: Text(value
                                                                      .firstname!),
                                                                );
                                                              }).toList(),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            kMainColor,
                                                        fixedSize:
                                                            const Size(85, 45),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                AddPatientScreen(),
                                                          ),
                                                        );
                                                      },
                                                      child: Text(
                                                        "Add",
                                                        style: TextStyle(
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: kCardColor),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            );
                                          }
                                        }
                                        return Container();
                                      },
                                    ),
                                    const VerticalSpacingWidget(height: 5),
                                  ],
                                )
                              : Container(),
                          BlocBuilder<AutoFetchBloc, AutoFetchState>(
                            builder: (context, state) {
                              if (state is AutoFetchLoading) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: kMainColor,
                                  ),
                                );
                              }
                              if (state is AutoFetchError) {
                                return const Center(
                                  child: Text("Something went wrong"),
                                );
                              }
                              if (state is AutoFetchLoaded) {
                                final member = state.autoFetchModel;
                                getFamilyMembersModel =
                                    BlocProvider.of<GetFamilyMembersBloc>(
                                            context)
                                        .getFamilyMembersModel;
                                patientId = bookingFor == "Self"
                                    ? member.details!.first.patientId.toString()
                                    : (bookingFor == "Family Member")
                                        ? selectedFamilyMemberId
                                        : "0";
                                if (bookingFor != "Other") {
                                  patientNameController.text =
                                      member.details!.first.firstname ?? "";
                                  patientAgeController.text = member
                                          .details!.first.displayAge
                                          ?.toString() ??
                                      "";
                                  patientContactNumberController.text =
                                      member.details!.first.mobileNo ?? "";
                                  dropdownValue =
                                      member.details!.first.gender == "2"
                                          ? "Female"
                                          : "Male";
                                  originalAge =
                                      member.details!.first.age.toString();
                                }
                                return getFamilyMembersModel
                                            .familyMember!.isEmpty &&
                                        bookingFor == "Family Member"
                                    ? const SizedBox()
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  "Patient Name",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14.sp,
                                                      color: kSubTextColor),
                                                ),
                                              ),
                                              const HorizontalSpacingWidget(
                                                  width: 10),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "Age",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14.sp,
                                                      color: kSubTextColor),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: SizedBox(
                                                  height: 45.h,
                                                  child: TextFormField(
                                                    cursorColor: kMainColor,
                                                    controller:
                                                        patientNameController,
                                                    readOnly:
                                                        bookingFor != "Other"
                                                            ? true
                                                            : false,
                                                    keyboardType: TextInputType
                                                        .emailAddress,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    maxLength: 20,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          "Enter patient Name",
                                                      counterText: "",
                                                      hintStyle: TextStyle(
                                                          fontSize: 14.sp,
                                                          color: kSubTextColor),
                                                      filled: true,
                                                      fillColor: kCardColor,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const HorizontalSpacingWidget(
                                                  width: 10),
                                              Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  height: 45.h,
                                                  child: TextFormField(
                                                    cursorColor: kMainColor,
                                                    controller:
                                                        patientAgeController,
                                                    readOnly:
                                                        bookingFor != "Other"
                                                            ? true
                                                            : false,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    maxLength: 3,
                                                    decoration: InputDecoration(
                                                      counterText: "",
                                                      hintStyle: TextStyle(
                                                          fontSize: 14.sp,
                                                          color: kSubTextColor),
                                                      hintText: "25 age",
                                                      filled: true,
                                                      fillColor: kCardColor,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const VerticalSpacingWidget(
                                              height: 10),
                                          Text(
                                            "Contact Number",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
                                                color: kSubTextColor),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: SizedBox(
                                                  height: 45.h,
                                                  child: TextFormField(
                                                    cursorColor: kMainColor,
                                                    controller:
                                                        patientContactNumberController,
                                                    readOnly:
                                                        bookingFor != "Other"
                                                            ? true
                                                            : false,
                                                    keyboardType:
                                                        TextInputType.phone,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    maxLength: 10,
                                                    decoration: InputDecoration(
                                                      counterText: "",
                                                      hintStyle: TextStyle(
                                                          fontSize: 14.sp,
                                                          color: kSubTextColor),
                                                      hintText:
                                                          "Enter patient Phone number",
                                                      filled: true,
                                                      fillColor: kCardColor,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        borderSide:
                                                            BorderSide.none,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const HorizontalSpacingWidget(
                                                  width: 10),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  height: 45.h,
                                                  color: kCardColor,
                                                  child: DropdownButton<String>(
                                                    value: dropdownValue,
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        dropdownValue =
                                                            newValue!;
                                                      });
                                                    },
                                                    items: <String>[
                                                      'Male',
                                                      'Female',
                                                      'Other'
                                                    ].map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (String value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(value),
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                              }
                              return Container();
                            },
                          ),
                          const VerticalSpacingWidget(height: 10),
                          
                          // getFamilyMembersModel.familyMember!.isEmpty &&
                          //         bookingFor == "Family Member"
                          //     ? const SizedBox()
                          //     :

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Appointment for",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: kSubTextColor),
                              ),
                              SizedBox(
                                height: 45.h,
                                child: TextFormField(
                                  cursorColor: kMainColor,
                                  controller: appointmentForController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
                                  maxLength: 35,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    hintStyle: TextStyle(
                                        fontSize: 14.sp, color: kSubTextColor),
                                    hintText: "eg. Chest pain, Body ache, etc.",
                                    filled: true,
                                    fillColor: kCardColor,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const VerticalSpacingWidget(height: 10),
                          // getFamilyMembersModel.familyMember!.isEmpty &&
                          //         bookingFor == "Family Member"
                          //     ? const SizedBox()
                          //     :

                          BlocBuilder<GetSymptomsBloc, GetSymptomsState>(
                            builder: (context, state) {
                              if (state is GetSymptomsLoaded) {
                                getSymptomsModel =
                                    BlocProvider.of<GetSymptomsBloc>(context)
                                        .getSymptomsModel;
                                return Wrap(
                                  children: List.generate(
                                    getSymptomsModel.symptoms!.length,
                                    (index) => Builder(
                                      builder: (BuildContext context) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (selectedSymptoms.contains(
                                                  getSymptomsModel
                                                      .symptoms![index].id!)) {
                                                selectedSymptoms.remove(
                                                    getSymptomsModel
                                                        .symptoms![index].id!);
                                              } else {
                                                selectedSymptoms.add(
                                                    getSymptomsModel
                                                        .symptoms![index].id!);
                                              }
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: selectedSymptoms.contains(
                                                      getSymptomsModel
                                                          .symptoms![index].id!)
                                                  ? Colors.grey
                                                  : kCardColor,
                                              border: Border.all(
                                                  color: kMainColor, width: 1),
                                            ),
                                            margin: const EdgeInsets.all(3.0),
                                            padding: const EdgeInsets.all(6.0),
                                            child: Text(
                                              getSymptomsModel
                                                  .symptoms![index].symtoms
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 11.sp,
                                                  color:
                                                      selectedSymptoms.contains(
                                                              getSymptomsModel
                                                                  .symptoms![
                                                                      index]
                                                                  .id!)
                                                          ? Colors.white
                                                          : kTextColor),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              }
                              return Container();
                            },
                          ),
                          const VerticalSpacingWidget(height: 5),
                          // getFamilyMembersModel.familyMember!.isEmpty &&
                          //         bookingFor == "Family Member"
                          //     ? const SizedBox()
                          //     :

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "When did it start",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: kSubTextColor),
                              ),
                              const VerticalSpacingWidget(height: 2),
                              Wrap(
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children: List.generate(
                                  deceaseStartingTime.length,
                                  (index) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedStart =
                                            selectedStart == index ? -1 : index;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: selectedStart == index
                                            ? Colors.grey
                                            : kCardColor,
                                        border: Border.all(
                                            color: kMainColor, width: 1),
                                      ),
                                      margin: const EdgeInsets.all(3.0),
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                        deceaseStartingTime[index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11.sp,
                                          color: selectedStart == index
                                              ? Colors.white
                                              : kTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              VerticalSpacingWidget(height: 2.h),
                              if (selectedStart == 3)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "How many days",
                                      style: TextStyle(fontSize: 12.sp),
                                    ),
                                    const VerticalSpacingWidget(height: 5),
                                    SizedBox(
                                      height: 40.h,
                                      child: TextFormField(
                                        cursorColor: kMainColor,
                                        controller: daysController,
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          hintStyle: TextStyle(
                                              fontSize: 12.sp,
                                              color: kSubTextColor),
                                          hintText: "10 days",
                                          filled: true,
                                          fillColor: kCardColor,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                          const VerticalSpacingWidget(height: 5),
                          // getFamilyMembersModel.familyMember!.isEmpty &&
                          //         bookingFor == "Family Member"
                          //     ? const SizedBox()
                          //     :

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "How Frequently",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: kSubTextColor),
                              ),
                              const VerticalSpacingWidget(height: 2),
                              Wrap(
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children: List.generate(
                                  deceaseRepeats.length,
                                  (index) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedCome =
                                            selectedCome == index ? -1 : index;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: selectedCome == index
                                            ? Colors.grey
                                            : kCardColor,
                                        border: Border.all(
                                            color: kMainColor, width: 1),
                                      ),
                                      margin: const EdgeInsets.all(3.0),
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                        deceaseRepeats[index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 11.sp,
                                          color: selectedCome == index
                                              ? Colors.white
                                              : kTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const VerticalSpacingWidget(height: 10),
                          // getFamilyMembersModel.familyMember!.isEmpty &&
                          //         bookingFor == "Family Member"
                          //     ? const SizedBox()
                          //     :

                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Token Number",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        color: kSubTextColor),
                                  ),
                                  Text(
                                    widget.tokenNo,
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w500,
                                        color: kTextColor),
                                  ),
                                ],
                              ),
                              const VerticalSpacingWidget(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    formatDate(),
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        color: kSubTextColor),
                                  ),
                                  Text(
                                    widget.bookingTime,
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w500,
                                        color: kTextColor),
                                  ),
                                ],
                              ),
                              const VerticalSpacingWidget(height: 10),
                              widget.patientId == null
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Platform Fee",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500,
                                              color: kSubTextColor),
                                        ),
                                        Text(
                                          "₹ 10",
                                          style: TextStyle(
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w500,
                                              color: kTextColor),
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                              const VerticalSpacingWidget(height: 10),
                              CommonButtonWidget(
                                title: "Book Now",
                                onTapFunction: () {
                                  if (patientNameController.text.isEmpty) {
                                    GeneralServices.instance.showErrorMessage(
                                        context, "Fill patient name");
                                  } else if (patientAgeController
                                      .text.isEmpty) {
                                    GeneralServices.instance.showErrorMessage(
                                        context, "Fill patient Age");
                                  } else if (patientContactNumberController
                                      .text.isEmpty) {
                                    GeneralServices.instance.showErrorMessage(
                                        context, "Fill contact number");
                                  } else if (selectedSymptoms.isEmpty &&
                                      appointmentForController.text.isEmpty) {
                                    GeneralServices.instance.showErrorMessage(
                                        context, "Please select symptoms");
                                  } else if (selectedStart == -1) {
                                    GeneralServices.instance.showErrorMessage(
                                        context,
                                        "Please select when did start");
                                  } else if (selectedCome == -1) {
                                    GeneralServices.instance.showErrorMessage(
                                        context,
                                        "Please select how frequently");
                                  } else {
                                    BlocProvider.of<BookAppointmentBloc>(
                                            context)
                                        .add(
                                      PassBookAppointMentEvent(
                                          resheduleOrNot: widget.patientId ==
                                                  null
                                              ? 0
                                              : 1,
                                          patientName: patientNameController
                                              .text,
                                          doctorId: widget.doctorId,
                                          clinicId: widget.clinicId,
                                          date: formatDate(),
                                          whenitcomes: selectedStart == 3
                                              ? "${daysController.text} days before"
                                              : deceaseStartingTime[
                                                  selectedStart],
                                          whenitstart: deceaseRepeats[
                                              selectedCome],
                                          tokenTime: widget.bookingTime,
                                          tokenNumber: widget.tokenNo,
                                          gender: dropdownValue,
                                          age:
                                              bookingFor ==
                                                      "Other"
                                                  ? patientAgeController.text
                                                  : originalAge.toString(),
                                          mobileNo:
                                              patientContactNumberController
                                                  .text,
                                          appoinmentfor1:
                                              appointmentForController
                                                      .text.isEmpty
                                                  ? []
                                                  : [
                                                      appointmentForController
                                                          .text
                                                    ],
                                          appoinmentfor2: selectedSymptoms,
                                          bookingType: selectedBookingFor,
                                          patientId: patientId,
                                          sheduleType: widget.sheduleType,
                                          tokenId: widget.tokenId),
                                    );
                                  }
                                },
                              ),
                              const VerticalSpacingWidget(height: 10)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }

  Future<dynamic> showErrorDialogue(
      BuildContext context, BookAppointmentError state) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: ((context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              state.errorMessage !=
                      "This token has already been booked by someone. Please book another token."
                  ? const SizedBox()
                  : Text(
                      "Just missed",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
              const VerticalSpacingWidget(height: 2),
              Lottie.asset("assets/animations/error.json", height: 100.h),
              const VerticalSpacingWidget(height: 2),
              Text(
                state.errorMessage,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: kTextColor,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              const VerticalSpacingWidget(height: 3),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(60.w, 30.h),
                  backgroundColor: kMainColor,
                  foregroundColor: kCardColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  BlocProvider.of<GetTokenBloc>(context).add(
                    FetchToken(
                      date: formatDate(),
                      doctorId: widget.doctorId,
                      hospitalId: widget.clinicId,
                    ),
                  );
                },
                child: const Text("Ok"),
              )
            ],
          ),
        );
      }),
    );
  }
}
