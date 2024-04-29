import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'dart:io' show Platform;

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
            barrierDismissible: false,
            context: context,
            builder: ((context) {
              return CupertinoAlertDialog(
                content: Text(
                  title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: kTextColor),
                ),
                actions: [
                  TextButton(
                    child: Text(
                      "No",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: kTextColor),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    onPressed: yesFunction,
                    child: Text(
                      "Yes",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.red),
                    ),
                  )
                ],
              );
            }),
          )
        : showDialog(
            barrierDismissible: false,
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
                    child: Text(
                      "No",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: kTextColor),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    onPressed: yesFunction,
                    child: Text(
                      "Yes",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.red),
                    ),
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
            barrierDismissible: false,
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
            barrierDismissible: false,
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
            barrierDismissible: false,
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
            barrierDismissible: false,
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

  //* show delay success message
  void showDelaySuccessMessage(BuildContext context, String message) {
    Platform.isIOS
        ? showCupertinoDialog(
            barrierDismissible: false,
            context: context,
            builder: (ctx) {
              if (message != "") {
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pop(ctx);
                  log("delay worked");
                });
              }
              return CupertinoAlertDialog(
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
          )
        : showDialog(
            context: context,
            builder: (BuildContext ctx) {
              if (message != "") {
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pop(ctx);
                  log("delay worked");
                });
              }
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
}
