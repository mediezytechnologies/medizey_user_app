// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../../../Ui/Screens/AuthenticationScreens/LoginScreen/login_screen.dart';
import '../../Ui/Screens/AuthenticationScreens/LoginScreen/widgets/google_confirm_screen.dart';


class AuthServiceGoogle {
  static AuthServiceGoogle instance = AuthServiceGoogle();

  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  //* to detect the user is loggedin or not
  Stream<User?> get getAuthChange => auth.authStateChanges();

  //*Sign in with google
  signUpWithGoogle(BuildContext context) async {
    showLoaderDialog(context);
    final preference = await SharedPreferences.getInstance();
    try {
      //* signup to google
      GoogleSignInAccount? googleSignAccount = await googleSignIn.signIn();
      if (googleSignAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignAccount.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

            log("message tok : ${googleSignInAuthentication.accessToken}   ============================>>>>>>>>>>>>>"  );
        //* then sign to firebase
        try {
          await auth.signInWithCredential(credential);
          preference.setString('firebaseTokens',
              googleSignInAuthentication.accessToken.toString());
          log(googleSignInAuthentication.toString());
          log("${googleSignInAuthentication.accessToken}======= acces nowfklsfjdklsa");
          log("${googleSignInAuthentication.idToken}=======");
          log(googleSignInAuthentication.idToken.toString());
          Navigator.pop(context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const GoogleContirmUserScreen(),
              ));
        } catch (error) {
          Navigator.pop(context);
          errorDialogue(errorMessage: error.toString(), context: context);
        }
      } else {
        Navigator.pop(context);
        errorDialogue(errorMessage: "Unable to Sign in", context: context);
      }
    } on FirebaseAuthException catch (error) {
      errorDialogue(errorMessage: error.toString(), context: context);
    }
  }

  //* logout
  logOut(BuildContext context) {
    showLoaderDialog(context);
    try {
      auth.signOut();
      googleSignIn.signOut();
      Navigator.pop(context);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
    } on FirebaseAuthException catch (error) {
      errorDialogue(errorMessage: error.toString(), context: context);
    }
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Builder(builder: (context) {
        return SizedBox(
          width: 100.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: kMainColor,
              ),
              SizedBox(
                height: 18.h,
              ),
              Container(
                margin: const EdgeInsets.only(left: 7),
                child: const Text(
                  "Loading...",
                ),
              ),
            ],
          ),
        );
      }),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> errorDialogue(
      {required String errorMessage, required BuildContext context}) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(errorMessage),
          title: Row(
            children: [
              const Icon(Icons.abc, color: Colors.red),
              SizedBox(width: 5.w),
              const Text("An error occured")
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: const Text("Ok"),
            )
          ],
        );
      },
    );
  }
}