import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';


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
  Future insertNote(String number, String email,) async {
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
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential authResult = await _auth.signInWithCredential(credential);
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