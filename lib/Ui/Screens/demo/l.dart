// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';

class CupertinoDatePickerDemo extends StatefulWidget {
  const CupertinoDatePickerDemo({Key? key}) : super(key: key);

  @override
  State<CupertinoDatePickerDemo> createState() =>
      _CupertinoDatePickerDemoState();
}

class _CupertinoDatePickerDemoState extends State<CupertinoDatePickerDemo> {
  DateTime date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime? dates;
  DateTime? dateOfBirth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cupertino Date Picker Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              dateOfBirth != null
                  ? DateFormat('dd-MM-yyyy').format(dateOfBirth!)
                  : 'DOB',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: kTextColor),
            ),
            ElevatedButton(
              onPressed: () {
                selectDate(
                  context: context,
                  date: dateOfBirth ?? DateTime.now(),
                  onDateSelected: (DateTime picked) async {
                    setState(() {
                      dateOfBirth = picked;
                    });
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                );
              },
              child: const Text("Show Date Picker"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> selectDate({
    required BuildContext context,
    required DateTime date,
    required Function(DateTime) onDateSelected,
  }) async {
    final DateTime? picked = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300.0,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: date,
            minimumDate: DateTime.now().subtract(
              const Duration(days: 365 * 100),
            ),
            maximumDate: DateTime.now(),
            onDateTimeChanged: (DateTime newDate) {
              onDateSelected(newDate);
            },
          ),
        );
      },
    );
  }
}
