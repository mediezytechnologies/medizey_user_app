import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mediezy_user/Ui/Screens/AuthenticationScreens/LoginScreen/widgets/google_confirm_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../Ui/Screens/AuthenticationScreens/LoginScreen/login_screen.dart';

class GoogleAuthService {
  FirebaseAuth firebaseauth = FirebaseAuth.instance;
  Future<User?> signInWithGoogle() async {
    final preference = await SharedPreferences.getInstance();
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        UserCredential userCredential =
            await firebaseauth.signInWithCredential(credential);
        preference.setString(
            'firebaseToken', googleAuth.accessToken.toString());
        log(googleAuth.toString());
        log("${googleAuth.accessToken}======= acces");
        log("${googleAuth.idToken}=======");

        return userCredential.user;
      }
    } catch (e) {
      log(e.toString());
      log("exception");
    }
    return null;
  }

  Future singnOut() async {
    await GoogleSignIn().signOut();
    await firebaseauth.signOut();
  }
}

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future insertNote(
    String number,
    String email,
  ) async {
    try {
      await firestore.collection('login').add({
        "number": number,
        "email": email,
      });
    } catch (e) {}
  }
}

class LoginPageGoogle extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> handleSignIn() async {
    final preference = await SharedPreferences.getInstance();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        preference.setString('firebaseTokens',
            googleSignInAuthentication.accessToken.toString());
        log(googleSignInAuthentication.toString());
        log("${googleSignInAuthentication.accessToken}======= acces nowfklsfjdklsa");
        log("${googleSignInAuthentication.idToken}=======");
        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        final User? user = authResult.user;
        return user;
      }
    } catch (error) {
      print(error);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sign In Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            User? user = await handleSignIn();
            if (user != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage(user)),
              );
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Error'),
                    content: Text('Sign in failed. Please try again.'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: Text('Sign in with Google'),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final User user;

  ProfilePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Name: ${user.displayName}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Email: ${user.email}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
              child: Text('Sign out'),
            )
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: use_build_context_synchronously

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
                builder: (context) => GoogleContirmUserScreen(),
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
            builder: (context) => LoginScreen(),
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
                color: Colors.amber,
              ),
              SizedBox(
                height: 18.h,
              ),
              Container(
                margin: const EdgeInsets.only(left: 7),
                child: Text(
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
