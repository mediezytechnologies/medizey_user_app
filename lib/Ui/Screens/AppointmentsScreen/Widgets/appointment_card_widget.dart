import 'dart:io';
import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:mediezy_user/Model/Clinics/clinic_model.dart';
import 'package:mediezy_user/Repository/Bloc/QRCodeScan/qr_code_scan_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/text_style_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/BookAppointmentScreen/book_appointment_screen.dart';
import 'package:mediezy_user/Ui/Screens/SearchScreen/search_screen.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';

class AppointmentCardWidget extends StatefulWidget {
  const AppointmentCardWidget({
    super.key,
    required this.doctorId,
    required this.docterImage,
    required this.docterName,
    required this.appointmentFor,
    required this.tokenNumber,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.patientName,
    required this.liveToken,
    required this.estimatedArrivalTime,
    required this.consultationStartingTime,
    required this.lateTime,
    required this.earlyTime,
    required this.leaveMessage,
    required this.bookedClinicName,
    required this.bookingTimeAndDate,
    required this.resheduleStatus,
    required this.clinicList,
    required this.isPatientAbsent,
    required this.nextAvailableDateAndTime,
    required this.nextAvailableTokenNumber,
    required this.patientId,
    required this.tokenId,
    required this.doctorUniqueId,
    required this.isReached,
    required this.isCheckIn,
  });

  final String doctorId;
  final String docterImage;
  final String docterName;
  final String appointmentFor;
  final String tokenNumber;
  final String appointmentDate;
  final String appointmentTime;
  final String patientName;
  final String liveToken;
  final String estimatedArrivalTime;
  final String bookingTimeAndDate;
  final String consultationStartingTime;
  final String lateTime;
  final String earlyTime;
  final int leaveMessage;
  final String bookedClinicName;
  final int resheduleStatus;
  final List<Clinics> clinicList;
  final String nextAvailableDateAndTime;
  final String nextAvailableTokenNumber;
  final String isPatientAbsent;
  final int patientId;
  final int tokenId;
  final String doctorUniqueId;
  final int isReached;
  final int isCheckIn;

  @override
  State<AppointmentCardWidget> createState() => _AppointmentCardWidgetState();
}

class _AppointmentCardWidgetState extends State<AppointmentCardWidget> {
  bool isSecondContainerVisible = false;
  DateTime currentDate = DateTime.now();
  String? mediezyDoctorId;
  String formatDate() {
    String formattedSelectedDate = DateFormat('yyyy-MM-dd').format(currentDate);
    return formattedSelectedDate;
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    String combinedDateTimeString =
        '${widget.appointmentDate} ${widget.appointmentTime}';
    DateTime appointmentDateTime =
        DateFormat("yyyy-MM-dd hh:mm a").parse(combinedDateTimeString);
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(8.w, 4.h, 8.w, 4.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: kCardColor),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadedScaleAnimation(
                  scaleDuration: const Duration(milliseconds: 400),
                  fadeDuration: const Duration(milliseconds: 400),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FancyShimmerImage(
                        height: size.height * .15,
                        width: size.width * .2,
                        boxFit: BoxFit.contain,
                        errorWidget: const Image(
                          image: AssetImage("assets/icons/no data.png"),
                        ),
                        imageUrl: widget.docterImage),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VerticalSpacingWidget(height: 10),
                      SizedBox(
                        width: size.width * .5,
                        child: Text(
                          "Dr ${widget.docterName}",
                          style: black14B600,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: size.width * .5,
                        child: Text(
                          widget.bookedClinicName,
                          style: grey12B500,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      widget.appointmentFor == "null"
                          ? const SizedBox()
                          : SizedBox(
                              width: size.width * .5,
                              child: Text(
                                widget.appointmentFor,
                                style: grey12B500,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                  DateFormat('dd-MM-yyyy').format(
                                    DateTime.parse(widget.appointmentDate),
                                  ),
                                  style: black12B500),
                              Text(
                                " | ",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: kTextColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(widget.appointmentTime, style: black12B500),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text("For: ", style: grey12B500),
                              SizedBox(
                                width: size.width * .28,
                                child: Text(
                                  widget.patientName,
                                  style: black12B500,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const HorizontalSpacingWidget(width: 20),
                          GestureDetector(
                            onTap: () {
                              String clinicAddress = getAvailableClinicAddress(
                                  widget.bookedClinicName, widget.clinicList);
                              MapsLauncher.launchQuery(clinicAddress);
                            },
                            child: Wrap(
                              children: [
                                Text('Location', style: grey11B400),
                                const HorizontalSpacingWidget(width: 5),
                                Icon(
                                  IconlyLight.location,
                                  color: kSecondaryColor,
                                  size: 14.sp,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height * .060,
                  width: size.width * .1,
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Token",
                        style: white9Bold,
                      ),
                      Text(widget.tokenNumber, style: white12Bold),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: widget.leaveMessage == 0 && widget.resheduleStatus == 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.appointmentDate == formatDate()
                          ? Container(
                              height: size.height * .050,
                              width: size.width * .30,
                              decoration: BoxDecoration(
                                color: kSecondaryColor,
                                borderRadius: BorderRadius.circular(7.r),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Live Token", style: white12Bold),
                                  Container(
                                    height: size.height * .038,
                                    width: size.width * .08.w,
                                    decoration: BoxDecoration(
                                      color: kCardColor,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    child: Center(
                                      child: Text(widget.liveToken,
                                          style: black14B600),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container(),
                      widget.isCheckIn == 1 || widget.isReached == 1
                          ? const SizedBox()
                          : widget.isPatientAbsent == "Absent" &&
                                  widget.appointmentDate == formatDate()
                              ? SizedBox(
                                  height: size.height * .075,
                                  width: size.width * .5,
                                  child: Text(
                                    "You failed to reach on time, So your token will be considered as the last token",
                                    style: red11B600,
                                    maxLines: 3,
                                  ),
                                )
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Estimated \nArrival Time",
                                        style: grey10B600),
                                    const HorizontalSpacingWidget(width: 10),
                                    Text(
                                        widget.estimatedArrivalTime
                                            .substring(0, 5),
                                        style: red20B600),
                                    Text(
                                        widget.estimatedArrivalTime
                                            .substring(5),
                                        style: red10B600)
                                  ],
                                )
                    ],
                  )
                : Column(
                    children: [
                      Text(
                        "Sorry, your booking has been cancelled due to the doctor's inconvenience. Kindly reschedule",
                        style: red11B600,
                        textAlign: TextAlign.center,
                      ),
                      const VerticalSpacingWidget(height: 5),
                      GestureDetector(
                        onTap: () {
                          Platform.isIOS
                              ? showAvailableTokenIos(context, '1')
                              : showAvailableToken(context, '1');
                        },
                        child: Container(
                          height: size.height * .047,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(7.r),
                          ),
                          child: Center(
                            child: Text("Reshedule", style: white13B700),
                          ),
                        ),
                      )
                    ],
                  ),
          ),
          const VerticalSpacingWidget(height: 3),
          isSecondContainerVisible
              ? Container()
              : Padding(
                  padding: EdgeInsets.only(left: 8.w, right: 8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.appointmentDate == formatDate()
                          ? widget.isReached == 1
                              ? Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: .7.w, color: kMainColor),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  height: size.height * .042,
                                  width: size.width * .18,
                                  child: Center(
                                    child: Text("Reached", style: main12B700),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () async {
                                    await scanQR();
                                  },
                                  child: widget.leaveMessage == 0 &&
                                          widget.resheduleStatus == 0
                                      ? Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: .7.w, color: kMainColor),
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          height: size.height * .042,
                                          width: size.width * .57,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Icon(
                                                CupertinoIcons.qrcode,
                                                color: kMainColor,
                                                size: 20.sp,
                                              ),
                                              Text(
                                                "Scan QR code once you reach",
                                                style: main12B700,
                                              )
                                            ],
                                          ),
                                        )
                                      : Container(),
                                )
                          : const SizedBox(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSecondContainerVisible =
                                !isSecondContainerVisible;
                          });
                        },
                        child: widget.leaveMessage == 0 &&
                                widget.resheduleStatus == 0
                            ? Text(
                                isSecondContainerVisible
                                    ? "See less"
                                    : "See more",
                                style: main15)
                            : Container(),
                      ),
                    ],
                  ),
                ),
          const VerticalSpacingWidget(height: 5),
          if (isSecondContainerVisible)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 2.5.r, backgroundColor: kSecondaryColor),
                      const HorizontalSpacingWidget(width: 5),
                      Text("Token Booked : ", style: black12B500),
                      Text(widget.bookingTimeAndDate, style: grey10B500),
                    ],
                  ),
                  const VerticalSpacingWidget(height: 2),
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 2.5.r, backgroundColor: kSecondaryColor),
                      const HorizontalSpacingWidget(width: 5),
                      Text("Consultation Starting from : ", style: black12B500),
                      Text(widget.consultationStartingTime, style: grey10B500),
                    ],
                  ),
                  const VerticalSpacingWidget(height: 2),
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 2.5.r, backgroundColor: kSecondaryColor),
                      const HorizontalSpacingWidget(width: 5),
                      Text("Appointment Time : ", style: black12B500),
                      Text(
                          "${DateFormat('dd-MM-yyyy').format(DateTime.parse(widget.appointmentDate))} | ${widget.appointmentTime}",
                          style: grey10B500),
                    ],
                  ),
                  const VerticalSpacingWidget(height: 2),
                  if (widget.lateTime != 0.toString())
                    Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                                radius: 2.5.r,
                                backgroundColor: kSecondaryColor),
                            const HorizontalSpacingWidget(width: 5),
                            Text("Doctor Late for : ", style: black12B500),
                            Text("${widget.lateTime} Min", style: grey10B500),
                          ],
                        ),
                        const VerticalSpacingWidget(height: 2),
                      ],
                    ),
                  if (widget.earlyTime != 0.toString())
                    Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                                radius: 2.5.r,
                                backgroundColor: kSecondaryColor),
                            const HorizontalSpacingWidget(width: 5),
                            Text("Doctor Early for : ", style: black12B500),
                            Text("${widget.earlyTime} Min", style: grey10B500),
                          ],
                        ),
                        const VerticalSpacingWidget(height: 2),
                      ],
                    ),
                  Divider(
                    color: kSubTextColor,
                  ),
                  Text(
                    "Incase you can't make it for the appointment, please reschedule the appointment, preferably 5 hours before the schedule time.",
                    style: grey10B500,
                  ),
                  const VerticalSpacingWidget(height: 5),
                  GestureDetector(
                    onTap: () {
                      if (currentTime.isBefore(
                        appointmentDateTime.subtract(
                          const Duration(hours: 5),
                        ),
                      )) {
                        Platform.isIOS
                            ? showAvailableTokenIos(context, '2')
                            : showAvailableToken(context, '2');
                      } else {
                        GeneralServices.instance.showToastMessage(
                            "Please reschedule the appointment at least 5 hours in advance if necessary");
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.calendar_today,
                              color: currentTime.isBefore(
                                appointmentDateTime.subtract(
                                  const Duration(hours: 5),
                                ),
                              )
                                  ? kMainColor
                                  : kSubTextColor,
                              size: 22.sp,
                            ),
                            const HorizontalSpacingWidget(width: 5),
                            Text("Reschedule", style: black12B500),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: currentTime.isBefore(
                            appointmentDateTime.subtract(
                              const Duration(hours: 5),
                            ),
                          )
                              ? kMainColor
                              : kSubTextColor,
                          size: 18.sp,
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpacingWidget(height: 2),
                ],
              ),
            ),
          const VerticalSpacingWidget(height: 5),
          isSecondContainerVisible
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isSecondContainerVisible = !isSecondContainerVisible;
                        });
                      },
                      child: Text(
                          isSecondContainerVisible ? "See less" : "See More",
                          style: main15),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Future<dynamic> showAvailableToken(
      BuildContext context, String resheduleType) {
    final height = MediaQuery.of(context).size.height;
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
              Text(
                "Book same doctor",
                style: black14B600,
                textAlign: TextAlign.center,
              ),
              const VerticalSpacingWidget(height: 5),
              Text(
                "Next Available Token details",
                style: black12B500,
                textAlign: TextAlign.center,
              ),
              const VerticalSpacingWidget(height: 5),
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  border: Border.all(color: kSubTextColor, width: .5.w),
                ),
                child: Column(
                  children: [
                    widget.nextAvailableTokenNumber == "0"
                        ? const SizedBox()
                        : Text(
                            "Token No : ${widget.nextAvailableTokenNumber}",
                            style: black14B600,
                            textAlign: TextAlign.center,
                          ),
                    const VerticalSpacingWidget(height: 3),
                    widget.nextAvailableDateAndTime == "null"
                        ? const SizedBox()
                        : Text(
                            widget.nextAvailableDateAndTime,
                            style: black14B600,
                            textAlign: TextAlign.center,
                          ),
                    const VerticalSpacingWidget(height: 3),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return BookAppointmentScreen(
                              doctorId: widget.doctorId,
                              clinicList: widget.clinicList,
                              doctorFirstName: widget.docterName,
                              doctorSecondName: "",
                              patientId: widget.patientId.toString(),
                              resheduleType: resheduleType,
                              normalResheduleTokenId: widget.tokenId.toString(),
                            );
                          }),
                        );
                      },
                      child: Container(
                        height: height * .047,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(7.r),
                        ),
                        child: Center(
                          child: Text("Book now", style: white13B700),
                        ),
                      ),
                    ),
                    const VerticalSpacingWidget(height: 3),
                  ],
                ),
              ),
              const VerticalSpacingWidget(height: 3),
              Text("Or", style: black12B500),
              const VerticalSpacingWidget(height: 3),
              Text(
                "Book another doctor",
                style: black14B600,
                textAlign: TextAlign.center,
              ),
              const VerticalSpacingWidget(height: 5),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(
                        patientId: widget.patientId.toString(),
                        resheduleType: resheduleType,
                        normalResheduleTokenId: widget.tokenId.toString(),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: height * .047,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  child: Center(
                    child: Text("Choose another doctor", style: white13B700),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Future<dynamic> showAvailableTokenIos(
      BuildContext context, String resheduleType) {
    final height = MediaQuery.of(context).size.height;
    return showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: ((context) {
        return CupertinoAlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Book same doctor",
                style: black14B600,
                textAlign: TextAlign.center,
              ),
              const VerticalSpacingWidget(height: 5),
              Text(
                "Next Available Token details",
                style: black12B500,
                textAlign: TextAlign.center,
              ),
              const VerticalSpacingWidget(height: 5),
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  border: Border.all(color: kSubTextColor, width: .5.w),
                ),
                child: Column(
                  children: [
                    widget.nextAvailableTokenNumber == "0"
                        ? const SizedBox()
                        : Text(
                            "Token No : ${widget.nextAvailableTokenNumber}",
                            style: black14B600,
                            textAlign: TextAlign.center,
                          ),
                    const VerticalSpacingWidget(height: 3),
                    widget.nextAvailableDateAndTime == "null"
                        ? const SizedBox()
                        : Text(
                            widget.nextAvailableDateAndTime,
                            style: black14B600,
                            textAlign: TextAlign.center,
                          ),
                    const VerticalSpacingWidget(height: 3),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return BookAppointmentScreen(
                              doctorId: widget.doctorId,
                              clinicList: widget.clinicList,
                              doctorFirstName: widget.docterName,
                              doctorSecondName: "",
                              patientId: widget.patientId.toString(),
                              resheduleType: resheduleType,
                              normalResheduleTokenId: widget.tokenId.toString(),
                            );
                          }),
                        );
                      },
                      child: Container(
                        height: height * .047,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(7.r),
                        ),
                        child: Center(
                          child: Text("Book now", style: white13B700),
                        ),
                      ),
                    ),
                    const VerticalSpacingWidget(height: 3),
                  ],
                ),
              ),
              const VerticalSpacingWidget(height: 3),
              Text("Or", style: black12B500),
              const VerticalSpacingWidget(height: 3),
              Text(
                "Book another doctor",
                style: black14B600,
                textAlign: TextAlign.center,
              ),
              const VerticalSpacingWidget(height: 5),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(
                        patientId: widget.patientId.toString(),
                        resheduleType: resheduleType,
                        normalResheduleTokenId: widget.tokenId.toString(),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: height * .047,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  child: Center(
                    child: Text("Choose another doctor", style: white13B700),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  String getAvailableClinicAddress(
      String clinicName, List<Clinics> clinicList) {
    for (var clinic in clinicList) {
      if (clinic.clinicName == clinicName) {
        return clinic.clinicAddress.toString();
      }
    }

    return "";
  }

  Future<void> scanQR() async {
    String qRcodeScanRes;
    try {
      qRcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#070606', 'Cancel', true, ScanMode.QR);
    } on PlatformException {
      qRcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      if (widget.doctorUniqueId == qRcodeScanRes) {
        BlocProvider.of<QrCodeScanBloc>(context).add(CheckQRCodeScan(
            patientId: widget.patientId.toString(),
            tokenId: widget.tokenId.toString(),
            reachedStatus: "1"));
        GeneralServices.instance.showToastMessage("Scanned successfully");
      } else {
        GeneralServices.instance.showToastMessage("Please try again");
      }
    });
  }
}
