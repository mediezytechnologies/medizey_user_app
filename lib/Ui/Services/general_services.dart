// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'dart:io' show Platform;
import '../Consts/text_style.dart';

class GeneralServices {
  static GeneralServices instance = GeneralServices();

  //* to show toast
  showToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: const Color(0xFF56B89C),
        textColor: Colors.white,
        fontSize: 16.sp);
  }

  //* to close the app
  appCloseDialogue(
      BuildContext context, String title, void Function()? yesFunction) {
    Platform.isIOS
        ? showCupertinoDialog(
            barrierDismissible: true,
            context: context,
            builder: ((context) {
              return CupertinoAlertDialog(
                content: Text(title, style: black16B600),
                actions: [
                  TextButton(
                    child: Text("No", style: black14B500),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    onPressed: yesFunction,
                    child: Text("Yes", style: red16B600),
                  )
                ],
              );
            }),
          )
        : showDialog(
            barrierDismissible: true,
            context: context,
            builder: ((context) {
              return AlertDialog(
                backgroundColor: Theme.of(context).cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                content: Text(title, style: black16B600),
                actions: [
                  TextButton(
                    child: Text("No", style: black14B500),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    onPressed: yesFunction,
                    child: Text("Yes", style: red16B600),
                  )
                ],
              );
            }),
          );
  }

  //*show dialogw
  showDialogue(BuildContext context, String title) {
    Platform.isIOS
        ? showCupertinoDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) => CupertinoAlertDialog(
              content: Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: kTextColor),
              ),
              actions: [
                TextButton(
                  child: const Text(
                    "Ok",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          )
        : showDialog(
            barrierDismissible: true,
            context: context,
            builder: ((context) {
              return AlertDialog(
                backgroundColor: Theme.of(context).cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                content: Text(
                  title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: kTextColor),
                ),
                actions: [
                  TextButton(
                    child: const Text(
                      "Ok",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.red),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            }),
          );
  }

  //* show success message for button click
  void showSuccessMessage(BuildContext context, String message) {
    Platform.isIOS
        ? showCupertinoDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Align(
                alignment: Alignment.center,
                child: Lottie.asset("assets/animations/success.json",
                    height: 120.h),
              ),
              content: Text(
                message,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          )
        : showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Align(
                  alignment: Alignment.center,
                  child: Lottie.asset("assets/animations/success.json",
                      height: 120.h),
                ),
                content: Text(
                  message,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              );
            },
          );
  }

  //* show error button click
  void showErrorMessage(BuildContext context, String message) {
    Platform.isIOS
        ? showCupertinoDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Align(
                alignment: Alignment.center,
                child:
                    Lottie.asset("assets/animations/error.json", height: 120.h),
              ),
              content: Text(
                message,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          )
        : showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Align(
                  alignment: Alignment.center,
                  child: Lottie.asset("assets/animations/error.json",
                      height: 120.h),
                ),
                content: Text(
                  message,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              );
            },
          );
  }

  Future<void> showDelaySuccessMessage(
      BuildContext context, String message) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        Future.delayed(const Duration(seconds: 2), () {
          if (Navigator.of(dialogContext).canPop()) {
            Navigator.of(dialogContext).pop();
          }
        });
        return Platform.isIOS
            ? CupertinoAlertDialog(
                title: Align(
                  alignment: Alignment.center,
                  child: Lottie.asset("assets/animations/success.json",
                      height: 120.h),
                ),
                content: Text(
                  message,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
            : AlertDialog(
                title: Align(
                  alignment: Alignment.center,
                  child: Lottie.asset("assets/animations/success.json",
                      height: 120.h),
                ),
                content: Text(
                  message,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              );
      },
    );
    await Future.delayed(
      const Duration(seconds: 2, milliseconds: 100),
    );
  }

  Future<void> selectDate({
    required BuildContext context,
    required DateTime date,
    required Function(DateTime) onDateSelected,
  }) async {
    DateTime? tempDate = date;
    await showModalBottomSheet<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: Text('Cancel', style: main13B600),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoButton(
                    child: Text('OK', style: main13B600),
                    onPressed: () {
                      if (tempDate != null) {
                        onDateSelected(tempDate!);
                      }
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: date,
                minimumDate: DateTime.now().subtract(
                  const Duration(days: 365 * 100),
                ),
                maximumDate: DateTime.now(),
                onDateTimeChanged: (DateTime newDate) {
                  tempDate = newDate;
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
