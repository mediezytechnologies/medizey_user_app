// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../Consts/app_colors.dart';

class AuthService {
  FirebaseAuth firebaseauth = FirebaseAuth.instance;



// Future<UserCredential> signInWithFacebook() async {
//   // Trigger the sign-in flow
//   final LoginResult loginResult = await FacebookAuth.instance.login();

//   // Create a credential from the access token
//   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!);

//   // Once signed in, return the UserCredential
//   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
// }
//google//
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        UserCredential userCredential =
            await firebaseauth.signInWithCredential(credential);
        log(googleAuth.toString());
        log("${googleAuth.accessToken}======= acces");
        log("${googleAuth.idToken}=======");

        return userCredential.user;
      }
    } catch (e) {
      print(e);
      print("exception");
    }
    return null;
  }

  Future singnOut() async {
    await GoogleSignIn().signOut();
    await firebaseauth.signOut();
  }
}

//================================
class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future insertNote(String title, String discription, String userId) async {
    try {
      await firestore.collection('note').add({
        "title": title,
        "discription": discription,
        "userId": userId,
        "date": DateTime.now(),
      });
    } catch (e) {}
  }
}

class LoginScreenGoogle extends StatelessWidget {
  LoginScreenGoogle({Key? key}) : super(key: key);

 late GoogleSignInAccount _userObj;
 final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final width10 = SizedBox(width: width * .06);
    final height10 = SizedBox(height: height * .02);
    final height20 = SizedBox(height: height * .05);

    return Scaffold(
      backgroundColor: kCardColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "LOGIN",
          ),
          height20,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .09),
            child: Column(
              children: [
                height10,

                height10,

                // SignInButton(
                //   Buttons.Facebook,
                //   mini: true,
                //   onPressed: () {},
                // ),
                height10,
                ElevatedButton(
                  onPressed: () async {
                    User? result = await AuthService().signInWithGoogle();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreenGoogle(result: result!,),
                        ));
                      
                  },
                  child: Text(
                    "Continue With Google",
                  ),
                ),
                // SignInButton(Buttons.GoogleDark, text: "Continue With Google",
                //     onPressed: () async {
                //   User? result = await AuthService().signInWithGoogle();
                //   Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => HomeScreenGoogle(),
                //       ));
                // }),
                height10,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//home


class HomeScreenGoogle extends StatefulWidget {
  HomeScreenGoogle({
    Key? key,
    required this.result,
  }) : super(key: key);
  final User result;
  @override
  State<HomeScreenGoogle> createState() => _HomeScreenGoogleState();
}

class _HomeScreenGoogleState extends State<HomeScreenGoogle> {

// User? result;


  @override
  void initState() {
 //getUser();
    super.initState();
  }

  getUser()async{
   // result = await AuthService().signInWithGoogle();
  }
  // User user;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //final  GoogleSignInAccount _userObj;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        // floatingActionButton: FloatingActionButton(backgroundColor: blackLight,
        //   onPressed: (){
        //       Navigator.pushReplacement(
        //               context,
        //               MaterialPageRoute(
        //                 builder: (context) => CreateNote(user: user),
        //               ));
        //   },child: Icon(Icons.add,color: gold,),),
        backgroundColor: kBorderColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kBorderColor,
          actions: [
            IconButton(
                onPressed: () async {
                  await AuthService().singnOut();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreenGoogle(),
                      ));
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Container(
          width: double.infinity,
          color: kCardColor,
          height: double.infinity,
          child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
             Image.network(widget.result.photoURL!),
             const SizedBox(height: 20,),
             Text(widget.result!.displayName.toString()),
             const SizedBox(height: 20,),
             Text(widget.result!.email.toString()),
             const SizedBox(height: 20,),
              Text(widget.result.phoneNumber.toString()),
              // Text(widget.result.delete().toString()),
             
         ],
       ),
        ));
  }
}

class SubmitButton extends StatelessWidget {
  SubmitButton({
    Key? key,
    required this.title,
    required this.onpressed,
  }) : super(key: key);
  final String title;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, height * .05),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor:Colors.amber ,
        ),
        onPressed: onpressed,
        child: Text(
          title,

        ));
  }
}

// class FirebaseSiginFire extends StatefulWidget {
//   FirebaseSiginFire({Key? key}) : super(key: key);

//   @override
//   State<FirebaseSiginFire> createState() => _FirebaseSiginFireState();
// }

// class _FirebaseSiginFireState extends State<FirebaseSiginFire> {
//   Future<User?> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//       if (googleUser != null) {
//         final GoogleSignInAuthentication googleAuth =
//             await googleUser.authentication;
//         final credential = GoogleAuthProvider.credential(
//             accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
//         UserCredential userCredential =
//             await firebaseauth.signInWithCredential(credential);
//         print(googleAuth);
//         print("${googleAuth.accessToken}=======");
//         return userCredential.user;
//       }
//     } catch (e) {
//       print(e);
//       print("exception");
//     }
//   }

//   Future singnOut() async {
//     await GoogleSignIn().signOut();
//     await firebaseauth.signOut();
//   }
//  final GoogleSignIn _googleSignIn = GoogleSignIn();

//  Future<void> signInWithGoogle() async {
//   log("changes");
//   try {
//     final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
//     final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleSignInAuthentication.accessToken,
//       idToken: googleSignInAuthentication.idToken,

//     );
// print(googleSignInAuthentication.accessToken.toString());
// print(googleSignInAuthentication.idToken.toString());
//     final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
//     final User? user = userCredential.user;

//    // log(user.toString());
//     // Use the user object for further operations or navigate to a new screen.
//   } catch (e) {
//     print(e.toString());
//   }
// }

//   bool _isLoggedIn = false;
//   late GoogleSignInAccount _userObj;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: _isLoggedIn
//             ? Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Image.network(_userObj.photoUrl!),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Text(_userObj.displayName!),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Text(_userObj.email),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Text(_userObj.serverAuthCode.toString()),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Text(_userObj.id.toString()),
//                     MaterialButton(
//                       onPressed: () {
//                         _googleSignIn.signOut().then((value) {
//                           setState(() {
//                             _isLoggedIn = false;
//                           });
//                         }).catchError((e) {});
//                       },
//                       height: 50,
//                       minWidth: 100,
//                       color: Colors.red,
//                       child: const Text(
//                         'Logout',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             : Center(
//                 child: MaterialButton(
//                 onPressed: () {
//                   _googleSignIn.signIn().then((userData) {
//                     setState(() {
//                       _isLoggedIn = true;
//                       _userObj = userData!;
//                     });
//                   }).catchError((e) {
//                     print(e);
//                   });
//                 },
//                 height: 50,
//                 minWidth: 100,
//                 color: Colors.red,
//                 child: const Text(
//                   'Google Signin',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               )),
//       ),
//     );
//   }
// }
