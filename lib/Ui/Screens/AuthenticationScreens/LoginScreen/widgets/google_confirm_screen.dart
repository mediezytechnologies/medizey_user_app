import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../ddd/application/firebase_login/firebase_login_bloc.dart';
import '../../../../../ddd/infrastructure/firebase_service/firebase_auth_service.dart';
import '../../../../CommonWidgets/bottom_navigation_control_widget.dart';
import '../../../../CommonWidgets/common_button_widget.dart';
import '../../../../CommonWidgets/text_style_widget.dart';
import '../../../../Consts/app_colors.dart';
import '../../../../Services/general_services.dart';

class GoogleContirmUserScreen extends StatefulWidget {
  const GoogleContirmUserScreen({
    super.key,
  });

  @override
  State<GoogleContirmUserScreen> createState() =>
      _GoogleContirmUserScreenState();
}

class _GoogleContirmUserScreenState extends State<GoogleContirmUserScreen> {
  final TextEditingController phoneNumberController = TextEditingController();
  final FocusNode phoneNumberFocusController = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              AuthServiceGoogle.instance.logOut(context);
            },
            icon: Icon(Icons.logout)),
      ),
      body: BlocConsumer<FirebaseLoginBloc, FirebaseLoginState>(
        listener: (context, state) {
          if (state.isError && state.status == false) {
            GeneralServices.instance.showErrorMessage(context, state.message);
          } else {
            //    log( "fcm tok in api : ${preference.getString('token')}");

            Future.delayed(const Duration(seconds: 3)).then(
              (value) => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomNavigationControlWidget(),
                  ),
                  (route) => false),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/mediezyIcon.png',
                  scale: 25.sp,
                ),
                const VerticalSpacingWidget(
                  height: 10,
                ),
                Text(
                  auth.currentUser!.displayName.toString(),
                  style: black16B600,
                ),
                const VerticalSpacingWidget(
                  height: 5,
                ),

                Text(
                  auth.currentUser!.email.toString(),
                  style: black14B600,
                ),
                const VerticalSpacingWidget(
                  height: 5,
                ),
                Text(
                  "Please add your mobile number",
                  style: black14B600,
                ),
                const VerticalSpacingWidget(
                  height: 5,
                ),
                Form(
                  key: _formKey,
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      style: black13B500,
                      cursorColor: kMainColor,
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      focusNode: phoneNumberFocusController,
                      textInputAction: TextInputAction.next,
                      maxLength: 10,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 10) {
                          return "Enter valid Phone number";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        counterText: "",
                        prefixIcon: Icon(
                          Icons.call,
                          color: kMainColor,
                        ),
                        hintStyle: grey13B600,
                        hintText: "Enter phone number",
                        filled: true,
                        fillColor: kCardColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 6.h),
                      ),
                    ),
                  ),
                ),
                const VerticalSpacingWidget(
                  height: 10,
                ),
                CommonButtonWidget(
                    title: "Login",
                    onTapFunction: () async {
                      bool isValid = _formKey.currentState!.validate();
                      if (isValid) {
                        BlocProvider.of<FirebaseLoginBloc>(context)
                            .add(FirebaseLoginEvent.started(
                          phoneNumberController.text,
                        ));

                        //        Navigator.pushAndRemoveUntil(
                        // context,
                        // MaterialPageRoute(
                        //   builder: (context) => const BottomNavigationControlWidget(),
                        // ),
                        // (route) => false);
                      }
                    }),
                // BlocConsumer<FirebaseLoginBloc, FirebaseLoginState>(
                //   listener: (context, state) {
                //     if (state.isError && state.status == false) {
                //       GeneralServices.instance
                //           .showErrorMessage(context, state.message);
                //     } else {
                //       Navigator.pushAndRemoveUntil(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) =>
                //                 const BottomNavigationControlWidget(),
                //           ),
                //           (route) => false);
                //     }
                //   },
                //   builder: (context, state) {
                //     return SizedBox(
                //       height: 60,
                //       child: CommonButtonWidget(
                //           title: "Login",
                //           onTapFunction: () {
                //             bool isValid = _formKey.currentState!.validate();
                //             if (isValid) {
                //               BlocProvider.of<FirebaseLoginBloc>(context)
                //                   .add(FirebaseLoginEvent.started(
                //                 phoneNumberController.text,
                //               ));
                //               log("numb ${phoneNumberController.text}");

                //               //        Navigator.pushAndRemoveUntil(
                //               // context,
                //               // MaterialPageRoute(
                //               //   builder: (context) => const BottomNavigationControlWidget(),
                //               // ),
                //               // (route) => false);
                //             }
                //           }),
                //     );
                //   },
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
