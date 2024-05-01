import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
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
  const AppointmentCardWidget(
      {super.key,
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
      required this.isCheckIn});

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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
                        height: 100.h,
                        width: 80.w,
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
                      Row(
                        children: [
                          SizedBox(
                            width: 200.w,
                            child: Text(
                              "Dr ${widget.docterName}",
                              style: text14B600,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        widget.bookedClinicName,
                        style: subText12B500,
                      ),
                      widget.appointmentFor == "null"
                          ? const SizedBox()
                          : Text(
                              widget.appointmentFor,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: kSubTextColor),
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
                                  style: text12B500),
                              Text(
                                " | ",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: kTextColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(widget.appointmentTime, style: text12B500),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("For: ", style: subText12B500),
                          Text(widget.patientName, style: text12B500),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height * .060,
                  width: width * .1,
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Token",
                        style: tokenText,
                      ),
                      Text(widget.tokenNumber, style: liveTokenCountWhiteText),
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
                              height: height * .050,
                              width: width * .30,
                              decoration: BoxDecoration(
                                color: kSecondaryColor,
                               borderRadius: BorderRadius.circular(7.r),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Live Token",
                                      style: liveTokenCountWhiteText),
                                  Container(
                                    height: height * .038,
                                    width: width * .08.w,
                                    decoration: BoxDecoration(
                                      color: kCardColor,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    child: Center(
                                      child: Text(widget.liveToken,
                                          style: text14B600),
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
                                  height: height * .075,
                                  width: width * .5,
                                  child: Text(
                                    "You failed to reach on time, So your token will be considered as the last token",
                                    style: redAbsentAndResheduleText12B600,
                                    maxLines: 3,
                                  ),
                                )
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Estimated \nArrival Time",
                                        style: subText10B600),
                                    const HorizontalSpacingWidget(width: 10),
                                    Text(
                                        widget.estimatedArrivalTime
                                            .substring(0, 5),
                                        style: redEstimatedText20B600),
                                    Text(
                                        widget.estimatedArrivalTime
                                            .substring(5),
                                        style: redEstimatedSubText10B600)
                                  ],
                                )
                    ],
                  )
                : Column(
                    children: [
                      Text(
                        "Sorry, your booking has been cancelled due to the doctor's inconvenience. Kindly reschedule",
                        style: redAbsentAndResheduleText12B600,
                        textAlign: TextAlign.center,
                      ),
                      const VerticalSpacingWidget(height: 5),
                      GestureDetector(
                        onTap: () {
                          showAvailableToken(context);
                        },
                        child: Container(
                          height: height * .047,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(7.r),
                          ),
                          child: Center(
                            child: Text("Reshedule",
                                style: resheduleButtonText13B700),
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
                              ? Text("Reached", style: reachedText12B700)
                              : GestureDetector(
                                  onTap: () async {
                                    await scanQR();
                                  },
                                  child: widget.leaveMessage == 0 &&
                                          widget.resheduleStatus == 0
                                      ? Icon(
                                          CupertinoIcons.qrcode,
                                          color: kMainColor,
                                          size: 22.sp,
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
                                style: seeMoreText15)
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
                      Text("Token Booked : ", style: text12B500),
                      Text(widget.bookingTimeAndDate, style: subText10B500),
                    ],
                  ),
                  const VerticalSpacingWidget(height: 2),
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 2.5.r, backgroundColor: kSecondaryColor),
                      const HorizontalSpacingWidget(width: 5),
                      Text("Consultation Starting from : ", style: text12B500),
                      Text(widget.consultationStartingTime,
                          style: subText10B500),
                    ],
                  ),
                  const VerticalSpacingWidget(height: 2),
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 2.5.r, backgroundColor: kSecondaryColor),
                      const HorizontalSpacingWidget(width: 5),
                      Text("Appointment Time : ", style: text12B500),
                      Text(
                          "${DateFormat('dd-MM-yyyy').format(DateTime.parse(widget.appointmentDate))} | ${widget.appointmentTime}",
                          style: subText10B500),
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
                            Text("Doctor Late for : ", style: text12B500),
                            Text("${widget.lateTime} Min",
                                style: subText10B500),
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
                            Text("Doctor Early for : ", style: text12B500),
                            Text("${widget.earlyTime} Min",
                                style: subText10B500),
                          ],
                        ),
                        const VerticalSpacingWidget(height: 2),
                      ],
                    )
                ],
              ),
            ),
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
                          style: seeMoreText15),
                    ),
                  ),
                )
              : Container(),
          const VerticalSpacingWidget(height: 3),
        ],
      ),
    );
  }

  Future<dynamic> showAvailableToken(BuildContext context) {
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
                style: text14B600,
                textAlign: TextAlign.center,
              ),
              const VerticalSpacingWidget(height: 5),
              Text(
                "Next Available Token details",
                style: text12B500,
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
                            style: text14B600,
                            textAlign: TextAlign.center,
                          ),
                    const VerticalSpacingWidget(height: 3),
                    widget.nextAvailableDateAndTime == "null"
                        ? const SizedBox()
                        : Text(
                            widget.nextAvailableDateAndTime,
                            style: text14B600,
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
                          child: Text("Book now",
                              style: resheduleButtonText13B700),
                        ),
                      ),
                    ),
                    const VerticalSpacingWidget(height: 3),
                  ],
                ),
              ),
              const VerticalSpacingWidget(height: 3),
              Text("Or", style: text12B500),
              const VerticalSpacingWidget(height: 3),
              Text(
                "Book another doctor",
                style: text14B600,
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
                    child: Text("Choose another doctor",
                        style: resheduleButtonText13B700),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
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
