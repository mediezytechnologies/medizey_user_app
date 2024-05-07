
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class FirebaseSiginFire extends StatefulWidget {
 FirebaseSiginFire({Key? key}) : super(key: key);


 @override
 State<FirebaseSiginFire> createState() => _FirebaseSiginFireState();
}


class _FirebaseSiginFireState extends State<FirebaseSiginFire> {
 final GoogleSignIn _googleSignIn = GoogleSignIn();
 
 Future<void> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    final User? user = userCredential.user;
    
    // Use the user object for further operations or navigate to a new screen.
  } catch (e) {
    print(e.toString());
  }
}

 bool _isLoggedIn = false;
 late GoogleSignInAccount _userObj;


 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       child: _isLoggedIn
           ? Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
             Image.network(_userObj.photoUrl!),
             const SizedBox(height: 20,),
             Text(_userObj.displayName!),
             const SizedBox(height: 20,),
             Text(_userObj.email),
             const SizedBox(height: 20,),
             MaterialButton(
               onPressed: () {
                 _googleSignIn.signOut().then((value) {
                   setState(() {
                     _isLoggedIn = false;
                   });
                 }).catchError((e) {});
               },
               height: 50,
               minWidth: 100,
               color: Colors.red,
               child: const Text('Logout',style: TextStyle(color: Colors.white),),
             )
         ],
       ),
       ) : Center(
         child: MaterialButton(
           onPressed: () {
             _googleSignIn.signIn().then((userData) {
               setState(() {
                 _isLoggedIn = true;
                 _userObj = userData!;
               });
             }).catchError((e) {
               print(e);
             });
           },
           height: 50,
           minWidth: 100,
           color: Colors.red,
           child: const Text('Google Signin',style: TextStyle(color: Colors.white),),
         )
       ),
     ),
   );
 }
}