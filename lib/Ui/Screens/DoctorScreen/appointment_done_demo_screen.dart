// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:async';
import 'dart:io';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mediezy_user/Model/GetFamilyMembers/get_family_members_model.dart';
import 'package:mediezy_user/Model/GetSymptoms/get_symptoms_model.dart';
import 'package:mediezy_user/Model/OtherTypePatientDetails/other_type_patient_details_model.dart';
import 'package:mediezy_user/Repository/Bloc/BookAppointment/AutoFetch/auto_fetch_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/BookAppointment/BookAppointmets/book_appointment_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/BookAppointment/GetFamilyMembers/get_family_members_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/BookAppointment/OtherTypePatientDetails/other_type_patient_details_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/BookAppointment/Payment/payment_bloc.dart';
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
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Repository/Bloc/BookAppointment/BookAppointmentInitial/book_appointment_initial_bloc.dart';
import '../../CommonWidgets/text_style_widget.dart';

class AppointmentDoneDemoScreen extends StatefulWidget {
  AppointmentDoneDemoScreen(
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
      required this.consultationFee,
      this.patientId,
      this.resheduleType,
      this.normalResheduleTokenId});

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
  final String consultationFee;
  String? patientId;
  String? resheduleType;
  String? normalResheduleTokenId;

  @override
  State<AppointmentDoneDemoScreen> createState() =>
      _AppointmentDoneDemoScreenState();
}

class _AppointmentDoneDemoScreenState extends State<AppointmentDoneDemoScreen> {
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
  final TextEditingController patientIdSearchController =
      TextEditingController();
  final TextEditingController searchPhoneNumber = TextEditingController();
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
  late OtherTypePatientDetailsModel otherTypePatientDetailsModel;
  late ValueNotifier<int> dropValueMemberNotifier;
  int dropValueMember = 0;
  late String selectedFamilyMemberId = "";
  late List<FamilyMember> familyMemberId;
  late List<FamilyMember> familyMemberNames = [];
  bool isSelectPatient = false;
  String? patientName;
  String? patientDisplayAge;
  String? patientGender;
  String? patientAge;
  String? patientPhoneNumber;
  String? patientMediezyId;
  late Razorpay _razorpay;
  double platFormFee = 10.0;
  bool isFeeChecked = false;

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
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      handleConnectivityChange(result);
    });
    BlocProvider.of<GetSymptomsBloc>(context)
        .add(FetchSymptoms(doctorId: widget.doctorId));
    BlocProvider.of<GetFamilyMembersBloc>(context).add(FetchFamilyMember());
    calculatePlatFormFee();
    checkPatientIdAvailableOrNot();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    final preference = await SharedPreferences.getInstance();
    String? email = preference.getString('email');
    GeneralServices.instance
        .showToastMessage("Payment succesfull${response.paymentId}");
    Future.delayed(const Duration(seconds: 2), () async {
      BlocProvider.of<BookAppointmentBloc>(context).add(
        PassBookAppointMentEvent(
            normalResheduleTokenId: widget.normalResheduleTokenId.toString(),
            resheduleOrNot:
                widget.patientId == null && widget.resheduleType == null
                    ? 0
                    : (widget.resheduleType == '1')
                        ? 1
                        : 2,
            patientName: bookingFor == "Other"
                ? patientName.toString()
                : patientNameController.text,
            doctorId: widget.doctorId,
            clinicId: widget.clinicId,
            date: formatDate(),
            whenitcomes: selectedStart == 3
                ? "${daysController.text} days before"
                : deceaseStartingTime[selectedStart],
            whenitstart: deceaseRepeats[selectedCome],
            tokenTime: widget.bookingTime,
            tokenNumber: widget.tokenNo,
            gender: bookingFor == "Other"
                ? patientGender.toString()
                : dropdownValue,
            age: bookingFor == "Other"
                ? patientAge.toString()
                : originalAge.toString(),
            mobileNo: bookingFor == "Other"
                ? patientPhoneNumber.toString()
                : patientContactNumberController.text,
            appoinmentfor1: appointmentForController.text.isEmpty
                ? []
                : [appointmentForController.text],
            appoinmentfor2: selectedSymptoms,
            bookingType: selectedBookingFor,
            patientId:
                bookingFor == "Other" ? patientMediezyId.toString() : patientId,
            sheduleType: widget.sheduleType,
            tokenId: widget.tokenId),
      );
    }).then(
      (value) => BlocProvider.of<PaymentBloc>(context).add(
        PassPaymentEvent(
            razorPaymentId: response.paymentId.toString(),
            tokenId: widget.tokenId.toString(),
            currency: "INR",
            contactNumber: bookingFor == "Other"
                ? patientPhoneNumber.toString()
                : patientContactNumberController.text,
            email: email.toString(),
            // amount: isFeeChecked
            //     ? double.parse(widget.consultationFee) + platFormFee
            //     : platFormFee,
            amount: 1),
      ),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    GeneralServices.instance
        .showToastMessage("Payment failed${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    GeneralServices.instance
        .showToastMessage("External wallet${response.walletName}");
  }

  void openPaymentCheckout() {
    // amount = amount * 100;
    var options = {
      'key': 'rzp_live_VUHG1603ofFkWt',
      'amount': 100,
      'name': 'Mediezy Technologies',
      "image": "https://test.mediezy.com/UserImages/mediezyhearticon.png",
      'description': 'Platform fee',
      'prefill': {'contact': '9744887799', 'email': 'mediezytech@gmail.com'},
      'external': {
        'wallets': ['paytm']
      },
      'theme': {'color': '#595DFA'},
      'modal': {'backdropclose': true, 'confirm_close': true},
      'retry': {'enabled': true, 'max_count': 4},
      'timeout': 300
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            icon: Icon(
              IconlyLight.calendar,
              size: 18.sp,
            ),
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
              return BlocListener<BookAppointmentInitialBloc,
                  BookAppointmentInitialState>(
                listener: (context, state) {
                  if (state is BookAppointmentInitialLoaded) {
                    if (state.bookApointmentInitialModel.status == true &&
                        widget.patientId == null) {
                      // openPaymentCheckout(isFeeChecked
                      //     ? double.parse(widget.consultationFee) + platFormFee
                      //     : platFormFee);
                      openPaymentCheckout();
                    } else if (state.bookApointmentInitialModel.status ==
                            true &&
                        widget.patientId != null) {
                      BlocProvider.of<BookAppointmentBloc>(context).add(
                        PassBookAppointMentEvent(
                            normalResheduleTokenId:
                                widget.normalResheduleTokenId.toString(),
                            resheduleOrNot: widget.patientId == null &&
                                    widget.resheduleType == null
                                ? 0
                                : (widget.resheduleType == '1')
                                    ? 1
                                    : 2,
                            patientName: bookingFor == "Other"
                                ? patientName.toString()
                                : patientNameController.text,
                            doctorId: widget.doctorId,
                            clinicId: widget.clinicId,
                            date: formatDate(),
                            whenitcomes: selectedStart == 3
                                ? "${daysController.text} days before"
                                : deceaseStartingTime[selectedStart],
                            whenitstart: deceaseRepeats[selectedCome],
                            tokenTime: widget.bookingTime,
                            tokenNumber: widget.tokenNo,
                            gender: bookingFor == "Other"
                                ? patientGender.toString()
                                : dropdownValue,
                            age: bookingFor == "Other"
                                ? patientAge.toString()
                                : originalAge.toString(),
                            mobileNo: bookingFor == "Other"
                                ? patientPhoneNumber.toString()
                                : patientContactNumberController.text,
                            appoinmentfor1:
                                appointmentForController.text.isEmpty
                                    ? []
                                    : [appointmentForController.text],
                            appoinmentfor2: selectedSymptoms,
                            bookingType: selectedBookingFor,
                            patientId: bookingFor == "Other"
                                ? patientMediezyId.toString()
                                : patientId,
                            sheduleType: widget.sheduleType,
                            tokenId: widget.tokenId),
                      );
                    } else {
                      Platform.isIOS
                          ? showErrorInitialDialogueIos(
                              context,
                              state.bookApointmentInitialModel.message
                                  .toString())
                          : showErrorInitialDialogueAndroid(
                              context,
                              state.bookApointmentInitialModel.message
                                  .toString());
                    }
                  }
                },
                child: BlocListener<BookAppointmentBloc, BookAppointmentState>(
                  listener: (context, state) {
                    if (state is BookAppointmentLoaded) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingConfirmationScreen(
                            consultationFee: widget.consultationFee,
                            age: patientAge == null
                                ? patientAgeController.text
                                : patientDisplayAge.toString(),
                            gender: patientGender == null
                                ? dropdownValue
                                : patientGender == "1"
                                    ? "Male"
                                    : (patientGender == "2")
                                        ? "Female"
                                        : "Other",
                            appointmentDate: formatDate(),
                            appointmentTime: widget.bookingTime,
                            name: patientNameController.text.isEmpty
                                ? patientName.toString()
                                : patientNameController.text,
                            mobileNo:
                                patientContactNumberController.text.isEmpty
                                    ? patientPhoneNumber.toString()
                                    : patientContactNumberController.text,
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
                  },
                  child:
                      BlocBuilder<GetFamilyMembersBloc, GetFamilyMembersState>(
                          builder: (context, state) {
                    if (state is GetFamilyMembersLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: kMainColor,
                        ),
                      );
                    }
                    if (state is GetFamilyMembersLoaded) {
                      getFamilyMembersModel =
                          BlocProvider.of<GetFamilyMembersBloc>(context)
                              .getFamilyMembersModel;
                      return FadedSlideAnimation(
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
                                                patientIdSearchController
                                                    .clear();
                                                isSelectPatient = false;
                                                searchPhoneNumber.clear();
                                                patientName = null;
                                                bookingFor = "Self";
                                                selectedBookingFor =
                                                    1.toString();
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
                                                  visualDensity:
                                                      const VisualDensity(
                                                          horizontal: -4),
                                                  activeColor: kMainColor,
                                                  value: "Self",
                                                  groupValue: bookingFor,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      patientIdSearchController
                                                          .clear();
                                                      isSelectPatient = false;
                                                      searchPhoneNumber.clear();
                                                      patientName = null;
                                                      bookingFor = value!;
                                                      selectedBookingFor =
                                                          1.toString();
                                                      BlocProvider.of<
                                                                  AutoFetchBloc>(
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
                                                      fontWeight:
                                                          bookingFor == "Self"
                                                              ? FontWeight.w700
                                                              : FontWeight.w400,
                                                      fontSize: 13.sp,
                                                      color:
                                                          bookingFor == "Self"
                                                              ? kTextColor
                                                              : kSubTextColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                patientIdSearchController
                                                    .clear();
                                                isSelectPatient = false;
                                                searchPhoneNumber.clear();
                                                patientName = null;
                                                bookingFor = "Family Member";
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
                                            child: Row(
                                              children: [
                                                Radio<String>(
                                                  activeColor: kMainColor,
                                                  visualDensity:
                                                      const VisualDensity(
                                                          horizontal: -4),
                                                  value: "Family Member",
                                                  groupValue: bookingFor,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      patientIdSearchController
                                                          .clear();
                                                      isSelectPatient = false;
                                                      searchPhoneNumber.clear();
                                                      patientName = null;
                                                      bookingFor = value!;
                                                      selectedBookingFor =
                                                          2.toString();
                                                      getFamilyMembersModel =
                                                          BlocProvider.of<
                                                                      GetFamilyMembersBloc>(
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
                                                      selectedFamilyMemberId ==
                                                              ""
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
                                                          ? FontWeight.w700
                                                          : FontWeight.w400,
                                                      fontSize: 13.sp,
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
                                                selectedBookingFor =
                                                    3.toString();
                                                patientNameController.text = "";
                                                patientAgeController.text = "";
                                                patientContactNumberController
                                                    .text = "";
                                                dropdownValue = "Male";
                                              });
                                            },
                                            child: Row(
                                              children: [
                                                Radio<String>(
                                                  activeColor: kMainColor,
                                                  visualDensity:
                                                      const VisualDensity(
                                                          horizontal: -4),
                                                  value: "Other",
                                                  groupValue: bookingFor,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      bookingFor = value!;
                                                      selectedBookingFor =
                                                          3.toString();
                                                      patientNameController
                                                          .text = "";
                                                      patientAgeController
                                                          .text = "";
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
                                                              ? FontWeight.w700
                                                              : FontWeight.w400,
                                                      fontSize: 13.sp,
                                                      color:
                                                          bookingFor == "Other"
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          BlocBuilder<GetFamilyMembersBloc,
                                              GetFamilyMembersState>(
                                            builder: (context, state) {
                                              if (state
                                                  is GetFamilyMembersLoaded) {
                                                if (getFamilyMembersModel
                                                    .familyMember!.isNotEmpty) {
                                                  if (familyMemberNames
                                                      .isEmpty) {
                                                    familyMemberNames.addAll(
                                                        getFamilyMembersModel
                                                            .familyMember!);
                                                    dropValueMemberNotifier =
                                                        ValueNotifier<int>(
                                                            familyMemberNames
                                                                .first.id!);
                                                    dropValueMember =
                                                        familyMemberNames
                                                            .first.id!;
                                                    selectedFamilyMemberId =
                                                        familyMemberNames
                                                            .first.id
                                                            .toString();
                                                  }
                                                }
                                                if (getFamilyMembersModel
                                                    .familyMember!.isEmpty) {
                                                  return Center(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const VerticalSpacingWidget(
                                                            height: 30),
                                                        Text(
                                                          "You have not added any family members yet",
                                                          style: black13B500,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        const VerticalSpacingWidget(
                                                            height: 10),
                                                        CommonButtonWidget(
                                                            title: "Add member",
                                                            onTapFunction: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          "Select Family Member",
                                                          style: grey12B500),
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
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        8.w),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: kCardColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              border:
                                                                  Border.all(
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
                                                                    decoration: const InputDecoration
                                                                        .collapsed(
                                                                        hintText:
                                                                            ''),
                                                                    value:
                                                                        dropValue,
                                                                    style: TextStyle(
                                                                        fontSize: 14
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color:
                                                                            kTextColor),
                                                                    icon: const Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down),
                                                                    onChanged: (int?
                                                                        value) {
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
                                                                      BlocProvider.of<AutoFetchBloc>(
                                                                              context)
                                                                          .add(
                                                                        FetchAutoFetch(
                                                                            section:
                                                                                "Family Member",
                                                                            patientId:
                                                                                selectedFamilyMemberId),
                                                                      );
                                                                    },
                                                                    items: familyMemberNames
                                                                        .map<DropdownMenuItem<int>>(
                                                                            (value) {
                                                                      return DropdownMenuItem<
                                                                          int>(
                                                                        value: value
                                                                            .id!,
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              size.width * .5,
                                                                          child:
                                                                              Text(
                                                                            value.firstname!,
                                                                            maxLines:
                                                                                1,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }).toList(),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  kMainColor,
                                                              fixedSize:
                                                                  const Size(
                                                                      85, 45),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              if (getFamilyMembersModel
                                                                      .familyMember!
                                                                      .length ==
                                                                  5) {
                                                                GeneralServices
                                                                    .instance
                                                                    .showDialogue(
                                                                  context,
                                                                  "Unable to add patient. The maximum limit for patients has been reached",
                                                                );
                                                              } else {
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            AddPatientScreen(),
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                            child: Text(
                                                              "Add",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      15.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color:
                                                                      kCardColor),
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
                                          const VerticalSpacingWidget(
                                              height: 5),
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
                                          ? member.details!.first.patientId
                                              .toString()
                                          : (bookingFor == "Family Member")
                                              ? selectedFamilyMemberId
                                              : "0";
                                      if (bookingFor != "Other") {
                                        patientNameController.text =
                                            member.details!.first.firstname ??
                                                "";
                                        patientAgeController.text = member
                                                .details!.first.displayAge
                                                ?.toString() ??
                                            "";
                                        patientContactNumberController.text =
                                            member.details!.first.mobileNo ??
                                                "";
                                        dropdownValue =
                                            member.details!.first.gender == "2"
                                                ? "Female"
                                                : "Male";
                                        originalAge = member.details!.first.age
                                            .toString();
                                      }
                                      return getFamilyMembersModel
                                                  .familyMember!.isEmpty &&
                                              bookingFor == "Family Member"
                                          ? const SizedBox()
                                          : bookingFor == "Other"
                                              ? BlocListener<
                                                  OtherTypePatientDetailsBloc,
                                                  OtherTypePatientDetailsState>(
                                                  listener: (context, state) {
                                                    if (state
                                                        is OtherTypePatientDetailsLoading) {
                                                      Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                                color:
                                                                    kMainColor),
                                                      );
                                                    }
                                                    if (state
                                                        is OtherTypePatientDetailsError) {
                                                      GeneralServices.instance
                                                          .showErrorMessage(
                                                              context,
                                                              state
                                                                  .errorMessage);
                                                    }
                                                    if (state
                                                        is OtherTypePatientDetailsLoaded) {
                                                      otherTypePatientDetailsModel =
                                                          state
                                                              .otherTypePatientDetailsModel;
                                                      setState(() {
                                                        isSelectPatient = true;
                                                      });
                                                      GeneralServices.instance
                                                          .showToastMessage(state
                                                              .otherTypePatientDetailsModel
                                                              .message
                                                              .toString());
                                                    }
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            height:
                                                                size.height *
                                                                    .065,
                                                            width:
                                                                size.width * .6,
                                                            child:
                                                                TextFormField(
                                                              cursorColor:
                                                                  kMainColor,
                                                              controller:
                                                                  patientIdSearchController,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .done,
                                                              maxLength: 10,
                                                              decoration:
                                                                  InputDecoration(
                                                                counterText: "",
                                                                hintStyle:
                                                                    grey13B600,
                                                                hintText:
                                                                    "Enter patient id",
                                                                filled: true,
                                                                fillColor:
                                                                    kCardColor,
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none,
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        vertical:
                                                                            5.h,
                                                                        horizontal:
                                                                            5.w),
                                                              ),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              BlocProvider.of<
                                                                          OtherTypePatientDetailsBloc>(
                                                                      context)
                                                                  .add(
                                                                FetchOtherTypePatientDetails(
                                                                    patientId:
                                                                        patientIdSearchController
                                                                            .text),
                                                              );
                                                            },
                                                            child: Container(
                                                              height:
                                                                  size.height *
                                                                      .065,
                                                              width:
                                                                  size.width *
                                                                      .19,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    kMainColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.r),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                    "Search",
                                                                    style:
                                                                        white13B700),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      isSelectPatient
                                                          ? Column(
                                                              children: [
                                                                const VerticalSpacingWidget(
                                                                    height: 10),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    SizedBox(
                                                                      height: size
                                                                              .height *
                                                                          .065,
                                                                      width:
                                                                          size.width *
                                                                              .6,
                                                                      child:
                                                                          TextFormField(
                                                                        cursorColor:
                                                                            kMainColor,
                                                                        controller:
                                                                            searchPhoneNumber,
                                                                        keyboardType:
                                                                            TextInputType.phone,
                                                                        textInputAction:
                                                                            TextInputAction.done,
                                                                        maxLength:
                                                                            10,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          counterText:
                                                                              "",
                                                                          hintStyle:
                                                                              grey13B600,
                                                                          hintText:
                                                                              "Enter mobile number",
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              kCardColor,
                                                                          border:
                                                                              OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(4),
                                                                            borderSide:
                                                                                BorderSide.none,
                                                                          ),
                                                                          contentPadding: EdgeInsets.symmetric(
                                                                              vertical: 5.h,
                                                                              horizontal: 5.w),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        if (otherTypePatientDetailsModel.details!.mobileNo.toString() ==
                                                                            searchPhoneNumber.text) {
                                                                          GeneralServices
                                                                              .instance
                                                                              .showToastMessage("Phonenumber matched, please fill other details");
                                                                          setState(
                                                                              () {
                                                                            patientName =
                                                                                otherTypePatientDetailsModel.details!.firstname.toString();
                                                                            patientDisplayAge =
                                                                                otherTypePatientDetailsModel.details!.displayAge.toString();
                                                                            patientAge =
                                                                                otherTypePatientDetailsModel.details!.age.toString();
                                                                            patientGender =
                                                                                otherTypePatientDetailsModel.details!.gender.toString();
                                                                            patientPhoneNumber =
                                                                                otherTypePatientDetailsModel.details!.mobileNo.toString();
                                                                            patientMediezyId =
                                                                                otherTypePatientDetailsModel.details!.patientId.toString();
                                                                          });
                                                                        } else {
                                                                          GeneralServices
                                                                              .instance
                                                                              .showToastMessage("Phonenumber is not matched,\nenter correct phone number");
                                                                        }
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height: size.height *
                                                                            .065,
                                                                        width: size.width *
                                                                            .19,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              kMainColor,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                        ),
                                                                        child:
                                                                            Center(
                                                                          child: Text(
                                                                              "Submit",
                                                                              style: white13B700),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            )
                                                          : const SizedBox(),
                                                      const VerticalSpacingWidget(
                                                          height: 5),
                                                      patientName == null
                                                          ? const SizedBox()
                                                          : Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(10),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.r),
                                                                color:
                                                                    kCardColor,
                                                              ),
                                                              child: Column(
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      patientName ==
                                                                              null
                                                                          ? const SizedBox()
                                                                          : Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text("Name : ", style: grey12B500),
                                                                                Text(patientName.toString(), style: black13B500),
                                                                              ],
                                                                            ),
                                                                      patientName ==
                                                                              null
                                                                          ? const SizedBox()
                                                                          : Row(
                                                                              children: [
                                                                                Text("Age : ", style: grey12B500),
                                                                                Text(patientDisplayAge.toString(), style: black13B500),
                                                                              ],
                                                                            ),
                                                                    ],
                                                                  ),
                                                                  const VerticalSpacingWidget(
                                                                      height:
                                                                          5),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      patientPhoneNumber ==
                                                                              null
                                                                          ? const SizedBox()
                                                                          : Row(
                                                                              children: [
                                                                                Text("Number : ", style: grey12B500),
                                                                                Text(patientPhoneNumber.toString(), style: black13B500),
                                                                              ],
                                                                            ),
                                                                      const VerticalSpacingWidget(
                                                                          height:
                                                                              2),
                                                                      patientGender ==
                                                                              null
                                                                          ? const SizedBox()
                                                                          : Row(
                                                                              children: [
                                                                                Text("Gender : ", style: grey12B500),
                                                                                Text(
                                                                                    patientGender == "1"
                                                                                        ? "Male"
                                                                                        : (patientGender == "2")
                                                                                            ? "Female"
                                                                                            : "Other",
                                                                                    style: black13B500),
                                                                              ],
                                                                            ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                    ],
                                                  ),
                                                )
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
                                                              style:
                                                                  grey12B500),
                                                        ),
                                                        const HorizontalSpacingWidget(
                                                            width: 10),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Text("Age",
                                                              style:
                                                                  grey12B500),
                                                        ),
                                                      ],
                                                    ),
                                                    const VerticalSpacingWidget(
                                                        height: 2),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 2,
                                                          child: SizedBox(
                                                            height:
                                                                size.height *
                                                                    .065,
                                                            child:
                                                                TextFormField(
                                                              cursorColor:
                                                                  kMainColor,
                                                              controller:
                                                                  patientNameController,
                                                              readOnly:
                                                                  bookingFor !=
                                                                          "Other"
                                                                      ? true
                                                                      : false,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .emailAddress,
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                              maxLength: 20,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    "Enter patient Name",
                                                                counterText: "",
                                                                hintStyle:
                                                                    grey13B600,
                                                                filled: true,
                                                                fillColor:
                                                                    kCardColor,
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.r),
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none,
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                        vertical:
                                                                            5.h,
                                                                        horizontal:
                                                                            5.w),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const HorizontalSpacingWidget(
                                                            width: 10),
                                                        Expanded(
                                                          flex: 1,
                                                          child: SizedBox(
                                                            height:
                                                                size.height *
                                                                    .065,
                                                            child:
                                                                TextFormField(
                                                              cursorColor:
                                                                  kMainColor,
                                                              controller:
                                                                  patientAgeController,
                                                              readOnly:
                                                                  bookingFor !=
                                                                          "Other"
                                                                      ? true
                                                                      : false,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                              maxLength: 3,
                                                              decoration:
                                                                  InputDecoration(
                                                                counterText: "",
                                                                hintStyle:
                                                                    grey13B600,
                                                                hintText:
                                                                    "25 age",
                                                                filled: true,
                                                                fillColor:
                                                                    kCardColor,
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.r),
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const VerticalSpacingWidget(
                                                        height: 10),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 2,
                                                          child: Text(
                                                              "Contact Number",
                                                              style:
                                                                  grey12B500),
                                                        ),
                                                        const HorizontalSpacingWidget(
                                                            width: 10),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Text("Gender",
                                                              style:
                                                                  grey12B500),
                                                        ),
                                                      ],
                                                    ),
                                                    const VerticalSpacingWidget(
                                                        height: 2),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 2,
                                                          child: SizedBox(
                                                            height:
                                                                size.height *
                                                                    .065,
                                                            child:
                                                                TextFormField(
                                                              cursorColor:
                                                                  kMainColor,
                                                              controller:
                                                                  patientContactNumberController,
                                                              readOnly:
                                                                  bookingFor !=
                                                                          "Other"
                                                                      ? true
                                                                      : false,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .phone,
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                              maxLength: 10,
                                                              decoration:
                                                                  InputDecoration(
                                                                counterText: "",
                                                                hintStyle:
                                                                    grey13B600,
                                                                hintText:
                                                                    "Enter patient Phone number",
                                                                filled: true,
                                                                fillColor:
                                                                    kCardColor,
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4),
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none,
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
                                                            height:
                                                                size.height *
                                                                    .065,
                                                            color: kCardColor,
                                                            child:
                                                                DropdownButton<
                                                                    String>(
                                                              value:
                                                                  dropdownValue,
                                                              onChanged: (String?
                                                                  newValue) {
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
                                                                      String>>((String
                                                                  value) {
                                                                return DropdownMenuItem<
                                                                    String>(
                                                                  value: value,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child: Text(
                                                                        value),
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Appointment for", style: grey12B500),
                                    const VerticalSpacingWidget(height: 2),
                                    SizedBox(
                                      height: size.height * .065,
                                      child: TextFormField(
                                        style: black12B500,
                                        cursorColor: kMainColor,
                                        controller: appointmentForController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.done,
                                        decoration: InputDecoration(
                                          counterText: "",
                                          hintStyle: grey13B600,
                                          hintText:
                                              "eg. Chest pain, Body ache, etc.",
                                          filled: true,
                                          fillColor: kCardColor,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            borderSide: BorderSide.none,
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5.h, horizontal: 5.w),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const VerticalSpacingWidget(height: 10),
                                BlocBuilder<GetSymptomsBloc, GetSymptomsState>(
                                  builder: (context, state) {
                                    if (state is GetSymptomsLoaded) {
                                      getSymptomsModel =
                                          BlocProvider.of<GetSymptomsBloc>(
                                                  context)
                                              .getSymptomsModel;
                                      return Wrap(
                                        children: List.generate(
                                          getSymptomsModel.symptoms!.length,
                                          (index) => Builder(
                                            builder: (BuildContext context) {
                                              return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (selectedSymptoms
                                                        .contains(
                                                            getSymptomsModel
                                                                .symptoms![
                                                                    index]
                                                                .id!)) {
                                                      selectedSymptoms.remove(
                                                          getSymptomsModel
                                                              .symptoms![index]
                                                              .id!);
                                                    } else {
                                                      selectedSymptoms.add(
                                                          getSymptomsModel
                                                              .symptoms![index]
                                                              .id!);
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: selectedSymptoms
                                                            .contains(
                                                                getSymptomsModel
                                                                    .symptoms![
                                                                        index]
                                                                    .id!)
                                                        ? Colors.grey
                                                        : kCardColor,
                                                    border: Border.all(
                                                        color: kMainColor,
                                                        width: 1),
                                                  ),
                                                  margin:
                                                      const EdgeInsets.all(3.0),
                                                  padding:
                                                      const EdgeInsets.all(6.0),
                                                  child: Text(
                                                    getSymptomsModel
                                                        .symptoms![index]
                                                        .symtoms
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 10.sp,
                                                        color: selectedSymptoms.contains(
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("When did it start",
                                        style: grey12B500),
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
                                                  selectedStart == index
                                                      ? -1
                                                      : index;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: selectedStart == index
                                                  ? Colors.grey
                                                  : kCardColor,
                                              border: Border.all(
                                                  color: kMainColor, width: 1),
                                            ),
                                            margin: const EdgeInsets.all(3.0),
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              deceaseStartingTime[index],
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10.sp,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "How many days",
                                            style: grey12B500,
                                          ),
                                          const VerticalSpacingWidget(
                                              height: 5),
                                          SizedBox(
                                            height: size.height * .065,
                                            child: TextFormField(
                                              style: black12B500,
                                              cursorColor: kMainColor,
                                              controller: daysController,
                                              keyboardType:
                                                  TextInputType.number,
                                              textInputAction:
                                                  TextInputAction.next,
                                              decoration: InputDecoration(
                                                hintStyle: grey13B600,
                                                hintText: "10 days",
                                                filled: true,
                                                fillColor: kCardColor,
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  borderSide: BorderSide.none,
                                                ),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 8.h,
                                                        horizontal: 5.w),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                                const VerticalSpacingWidget(height: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("How Frequently", style: grey12B500),
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
                                                  selectedCome == index
                                                      ? -1
                                                      : index;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: selectedCome == index
                                                  ? Colors.grey
                                                  : kCardColor,
                                              border: Border.all(
                                                  color: kMainColor, width: 1),
                                            ),
                                            margin: const EdgeInsets.all(3.0),
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              deceaseRepeats[index],
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10.sp,
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
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Token Number", style: grey13B400),
                                        Text(widget.tokenNo,
                                            style: black14B500),
                                      ],
                                    ),
                                    const VerticalSpacingWidget(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(formatDate(), style: grey13B400),
                                        Text(widget.bookingTime,
                                            style: black14B500),
                                      ],
                                    ),
                                    const VerticalSpacingWidget(height: 5),
                                    widget.patientId == null
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Platform Fee",
                                                  style: grey13B400),
                                              Text(
                                                  "₹ ${platFormFee.toString()}",
                                                  style: black14B500),
                                            ],
                                          )
                                        : const SizedBox(),
                                    const VerticalSpacingWidget(height: 5),
                                    widget.patientId == null
                                        ? SizedBox(
                                            height: 20.h,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    "Consultation fee (pay at clinic)",
                                                    style: grey13B400),
                                                Row(
                                                  children: [
                                                    // Transform.scale(
                                                    //   scale: 0.8,
                                                    //   child: Checkbox(
                                                    //     activeColor: kMainColor,
                                                    //     value: isFeeChecked,
                                                    //     onChanged: (bool? value) {
                                                    //       setState(() {
                                                    //         isFeeChecked = value!;
                                                    //       });
                                                    //     },
                                                    //   ),
                                                    // ),
                                                    Text(
                                                        "₹ ${widget.consultationFee}",
                                                        style: black14B500),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        : const SizedBox(),
                                    const VerticalSpacingWidget(height: 5),
                                    // widget.patientId == null
                                    //     ? Row(
                                    //         mainAxisAlignment:
                                    //             MainAxisAlignment.spaceBetween,
                                    //         children: [
                                    //           Text("Total", style: grey13B400),
                                    //           Text(
                                    //               "₹ ${isFeeChecked ? double.parse(widget.consultationFee) + platFormFee : platFormFee}",
                                    //               style: black14B500),
                                    //         ],
                                    //       )
                                    //     : const SizedBox(),
                                    const VerticalSpacingWidget(height: 20),
                                    CommonButtonWidget(
                                      title: "Book Now",
                                      onTapFunction: () {
                                        if (patientNameController
                                                .text.isEmpty &&
                                            patientName == null) {
                                          GeneralServices.instance
                                              .showErrorMessage(
                                                  context, "Fill patient name");
                                        } else if (patientAgeController
                                                .text.isEmpty &&
                                            patientDisplayAge == null) {
                                          GeneralServices.instance
                                              .showErrorMessage(
                                                  context, "Fill patient Age");
                                        } else if (patientContactNumberController
                                                .text.isEmpty &&
                                            patientPhoneNumber == null) {
                                          GeneralServices.instance
                                              .showErrorMessage(context,
                                                  "Fill contact number");
                                        } else if (selectedSymptoms.isEmpty &&
                                            appointmentForController
                                                .text.isEmpty) {
                                          GeneralServices.instance
                                              .showErrorMessage(context,
                                                  "Please select symptoms");
                                        } else if (selectedStart == -1) {
                                          GeneralServices.instance
                                              .showErrorMessage(context,
                                                  "Please select when did start");
                                        } else if (selectedCome == -1) {
                                          GeneralServices.instance
                                              .showErrorMessage(context,
                                                  "Please select how frequently");
                                        } else {
                                          BlocProvider.of<
                                                      BookAppointmentInitialBloc>(
                                                  context)
                                              .add(
                                            PassBookAppointMentInitialEvent(
                                                normalResheduleTokenId: widget
                                                    .normalResheduleTokenId
                                                    .toString(),
                                                resheduleOrNot:
                                                    widget.patientId == null &&
                                                            widget.resheduleType ==
                                                                null
                                                        ? 0
                                                        : (widget.resheduleType ==
                                                                '1')
                                                            ? 1
                                                            : 2,
                                                patientName: bookingFor == "Other"
                                                    ? patientName.toString()
                                                    : patientNameController
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
                                                gender: bookingFor == "Other"
                                                    ? patientGender.toString()
                                                    : dropdownValue,
                                                age: bookingFor == "Other"
                                                    ? patientAge.toString()
                                                    : originalAge.toString(),
                                                mobileNo: bookingFor == "Other"
                                                    ? patientPhoneNumber
                                                        .toString()
                                                    : patientContactNumberController
                                                        .text,
                                                appoinmentfor1:
                                                    appointmentForController
                                                            .text.isEmpty
                                                        ? []
                                                        : [appointmentForController.text],
                                                appoinmentfor2: selectedSymptoms,
                                                bookingType: selectedBookingFor,
                                                patientId: bookingFor == "Other" ? patientMediezyId.toString() : patientId,
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
                      );
                    }
                    return Container();
                  }),
                ),
              );
            }
          }),
    );
  }

  Future<dynamic> showErrorDialogue(
      BuildContext context, BookAppointmentInitialError state) {
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

  Future<dynamic> showErrorInitialDialogueAndroid(
      BuildContext context, String message) {
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
              message !=
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
                message,
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

  void calculatePlatFormFee() {
    double consultationFee = double.tryParse(widget.consultationFee) ?? 0.0;
    platFormFee = consultationFee <= 200 ? 10 : consultationFee * 5 / 100;
  }

  Future<dynamic> showErrorDialogueIos(
      BuildContext context, BookAppointmentInitialError state) {
    return showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: ((context) {
        return CupertinoAlertDialog(
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

  Future<dynamic> showErrorInitialDialogueIos(
      BuildContext context, String message) {
    return showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: ((context) {
        return CupertinoAlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              message !=
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
                message,
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
