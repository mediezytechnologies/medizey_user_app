// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/DoctorScreen/AppointmentDoneScreen/appointment_done_screen.dart';

class TokenCardWidget extends StatefulWidget {
  TokenCardWidget(
      {super.key,
      required this.tokenNumber,
      required this.formatedTime,
      required this.date,
      required this.doctorId,
      required this.clinicId,
      required this.isBooked,
      required this.isTimeOut,
      required this.clinicName,
      required this.clinicAddress,
      required this.clinicLocation,
      required this.doctorFirstName,
      required this.doctorSecondName,
      required this.sheduleType,
      required this.estimatedTime,
      required this.isReserved,
      required this.tokenId,
      this.patientId,
      this.resheduleType,
      this.normalResheduleTokenId});

  final String tokenNumber;
  final String formatedTime;
  final DateTime date;
  final String doctorId;
  final String clinicId;
  final String isBooked;
  final String isTimeOut;
  final String clinicName;
  final String doctorFirstName;
  final String doctorSecondName;
  final String clinicAddress;
  final String clinicLocation;
  final String sheduleType;
  final String estimatedTime;
  final String isReserved;
  final String tokenId;
  String? patientId;
  String? resheduleType;
  String? normalResheduleTokenId;

  @override
  State<TokenCardWidget> createState() => _TokenCardWidgetState();
}

class _TokenCardWidgetState extends State<TokenCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.isBooked == '1' ||
                widget.isTimeOut == '1' ||
                widget.isReserved == '1'
            ? null
            : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AppointmentDoneScreen(
                    tokenId: widget.tokenId,
                    bookingDate: widget.date,
                    bookingTime: widget.formatedTime,
                    tokenNo: widget.tokenNumber,
                    doctorId: widget.doctorId,
                    clinicId: widget.clinicId,
                    clinicAddress: widget.clinicAddress,
                    clinicLocation: widget.clinicLocation,
                    clinicName: widget.clinicName,
                    doctorFirstName: widget.doctorFirstName,
                    doctorSecondName: widget.doctorSecondName,
                    sheduleType: widget.sheduleType,
                    estimatedTime: widget.estimatedTime,
                    patientId: widget.patientId,
                    resheduleType: widget.resheduleType,
                    normalResheduleTokenId: widget.normalResheduleTokenId,
                  ),
                ),
              );
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.isBooked == '1' ||
                  widget.isTimeOut == '1' ||
                  widget.isReserved == '1'
              ? Colors.grey.shade400
              : kCardColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: kMainColor, width: 1.5.w),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.tokenNumber,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: widget.isBooked == '1' ||
                          widget.isTimeOut == '1' ||
                          widget.isReserved == '1'
                      ? kCardColor
                      : kTextColor),
            ),
            Text(
              widget.formatedTime,
              style: TextStyle(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.bold,
                  color: widget.isBooked == '1' ||
                          widget.isTimeOut == '1' ||
                          widget.isReserved == '1'
                      ? kCardColor
                      : kTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
