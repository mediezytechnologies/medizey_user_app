import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
