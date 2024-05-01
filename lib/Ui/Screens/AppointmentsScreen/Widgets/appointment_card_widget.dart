import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mediezy_user/Model/Clinics/clinic_model.dart';
import 'package:mediezy_user/Repository/Bloc/QRCodeScan/qr_code_scan_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
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
                              "Dr.${widget.docterName}",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        widget.bookedClinicName,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: kSubTextColor),
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
                                    DateTime.parse(widget.appointmentDate)),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: kTextColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                " | ",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: kTextColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    widget.appointmentTime,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: kTextColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "For: ",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: kSubTextColor),
                          ),
                          Text(
                            widget.patientName,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: kTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height * .060,
                  width: width * .1,
                  decoration: BoxDecoration(
                      color: const Color(0xFF55B79B),
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Token",
                        style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.bold,
                            color: kCardColor),
                      ),
                      Text(
                        widget.tokenNumber,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: kCardColor),
                      ),
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
                              height: height * .058,
                              width: width * .35,
                              decoration: BoxDecoration(
                                color: const Color(0xFF55B79B),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Live Token",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: kCardColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    height: height * .045,
                                    width: width * .1.w,
                                    decoration: BoxDecoration(
                                      color: kCardColor,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(
                                      child: Text(
                                        widget.liveToken,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: kTextColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
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
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: -.5,
                                    ),
                                    maxLines: 3,
                                  ),
                                )
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Estimated \nArrival Time",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                          color: kSubTextColor),
                                    ),
                                    const HorizontalSpacingWidget(width: 10),
                                    Text(
                                      widget.estimatedArrivalTime
                                          .substring(0, 5),
                                      style: TextStyle(
                                        fontSize: 22.sp,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        letterSpacing: -1,
                                      ),
                                    ),
                                    Text(
                                      widget.estimatedArrivalTime.substring(5),
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: 0,
                                          height: 2),
                                    )
                                  ],
                                )
                    ],
                  )
                : Column(
                    children: [
                      Text(
                        "Sorry, your booking has been cancelled due to the doctor's inconvenience. Kindly reschedule",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const VerticalSpacingWidget(height: 5),
                      GestureDetector(
                        onTap: () {
                          showAvailableToken(context);
                        },
                        child: Container(
                          height: 40.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFF55B79B),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Reshedule",
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: kCardColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
          ),
          const VerticalSpacingWidget(height: 5),
          isSecondContainerVisible
              ? Container()
              : Padding(
                  padding: EdgeInsets.only(left: 8.w, right: 8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.appointmentDate == formatDate()
                          ? widget.isReached == 1
                              ? Text(
                                  "Reached",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF55B79B),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () async {
                                    await scanQR();
                                  },
                                  child: widget.leaveMessage == 0 &&
                                          widget.resheduleStatus == 0
                                      ? Icon(
                                          Icons.qr_code_scanner_outlined,
                                          color: Colors.blue,
                                          size: 28.sp,
                                        )
                                      : Container())
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
                                style: TextStyle(
                                    fontSize: 15.sp, color: Colors.blue),
                              )
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
                      const CircleAvatar(
                        radius: 3,
                        backgroundColor: Color(0xFF55B79B),
                      ),
                      const HorizontalSpacingWidget(width: 5),
                      Text(
                        "Token Booked : ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.sp),
                      ),
                      Text(
                        widget.bookingTimeAndDate,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: kSubTextColor,
                            fontSize: 12.sp),
                      ),
                    ],
                  ),
                  const VerticalSpacingWidget(height: 2),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 3,
                        backgroundColor: Color(0xFF55B79B),
                      ),
                      const HorizontalSpacingWidget(width: 5),
                      Text(
                        "Consultation Starting from : ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.sp),
                      ),
                      Text(
                        widget.consultationStartingTime,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: kSubTextColor,
                            fontSize: 12.sp),
                      ),
                    ],
                  ),
                  const VerticalSpacingWidget(height: 2),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 3,
                        backgroundColor: Color(0xFF55B79B),
                      ),
                      const HorizontalSpacingWidget(width: 5),
                      Text(
                        "Appointment Time : ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13.sp),
                      ),
                      Text(
                        "${DateFormat('dd-MM-yyyy').format(DateTime.parse(widget.appointmentDate))} | ${widget.appointmentTime}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: kSubTextColor,
                            fontSize: 12.sp),
                      ),
                    ],
                  ),
                  const VerticalSpacingWidget(height: 2),
                  if (widget.lateTime != 0.toString())
                    Column(
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: Color(0xFF55B79B),
                            ),
                            const HorizontalSpacingWidget(width: 5),
                            Text(
                              "Doctor Late for : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.sp),
                            ),
                            Text(
                              "${widget.lateTime} Min",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: kSubTextColor,
                                  fontSize: 12.sp),
                            ),
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
                            const CircleAvatar(
                              radius: 3,
                              backgroundColor: Color(0xFF55B79B),
                            ),
                            const HorizontalSpacingWidget(width: 5),
                            Text(
                              "Doctor Early for : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.sp),
                            ),
                            Text(
                              "${widget.earlyTime} Min",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: kSubTextColor,
                                  fontSize: 12.sp),
                            ),
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
                        style: TextStyle(fontSize: 15.sp, color: Colors.blue),
                      ),
                    ),
                  ),
                )
              : Container(),
          const VerticalSpacingWidget(height: 5),
        ],
      ),
    );
  }

  Future<dynamic> showAvailableToken(BuildContext context) {
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
                style: TextStyle(
                  fontSize: 15.sp,
                  color: kTextColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const VerticalSpacingWidget(height: 5),
              Text(
                "Next Available Token details",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: kTextColor,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const VerticalSpacingWidget(height: 5),
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kTextColor, width: 1)),
                child: Column(
                  children: [
                    widget.nextAvailableTokenNumber == "0"
                        ? const SizedBox()
                        : Text(
                            "Token No : ${widget.nextAvailableTokenNumber}",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: kTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                    const VerticalSpacingWidget(height: 3),
                    widget.nextAvailableDateAndTime == "null"
                        ? const SizedBox()
                        : Text(
                            widget.nextAvailableDateAndTime,
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: kTextColor,
                              fontWeight: FontWeight.bold,
                            ),
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
                        height: 40.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color(0xFF55B79B),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "Book now",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: kCardColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const VerticalSpacingWidget(height: 3),
                  ],
                ),
              ),
              const VerticalSpacingWidget(height: 3),
              Text(
                "Or",
                style: TextStyle(
                  fontSize: 15.sp,
                  color: kTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const VerticalSpacingWidget(height: 3),
              Text(
                "Book another doctor",
                style: TextStyle(
                  fontSize: 15.sp,
                  color: kTextColor,
                  fontWeight: FontWeight.bold,
                ),
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
                  height: 40.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xFF55B79B),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "Choose another doctor",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: kCardColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
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
