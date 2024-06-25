// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../ddd/application/firebase_login/firebase_login_bloc.dart';
import '../../../../../ddd/application/location_controller/locationcontroller.dart';
import '../../../../../ddd/application/notification_token/notificatio_token_bloc.dart';
import '../../../../../ddd/application/user_location/user_location_bloc.dart';
import '../../../../CommonWidgets/bottom_navigation_control_widget.dart';
import '../../../../Consts/text_style.dart';
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
  final locationController = Get.put(LocationController());
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocConsumer<FirebaseLoginBloc, FirebaseLoginState>(
        listener: (context, state) {
          if (state.isError && state.status == false) {
            GeneralServices.instance.showErrorMessage(context, state.message);
            log("========errererere     ${state.message}");
          } else {
            Future.delayed(const Duration(seconds: 5))
                .then((value) => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavigationControlWidget(
                        selectedIndex: 0,
                      ),
                    ),
                    (route) => false));
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
                  height: size.height * .09,
                  width: size.width * .20,
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
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                    ),
                  ),
                ),
                const VerticalSpacingWidget(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(330.w, 40.h),
                    backgroundColor: kMainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onPressed: () async {
                    final preference = await SharedPreferences.getInstance();
                    preference.setString(
                        'email', auth.currentUser!.email.toString());
                    bool isValid = _formKey.currentState!.validate();
                    if (isValid) {
                      BlocProvider.of<FirebaseLoginBloc>(context)
                          .add(FirebaseLoginEvent.started(
                        phoneNumberController.text,
                      ));
                      locationController.fetchCountry().then((value) =>
                          Future.delayed(const Duration(seconds: 3), () {
                            BlocProvider.of<UserLocationBloc>(context).add(
                              UserLocationEvent.started(
                                locationController.latitude.value.toString(),
                                locationController.longitude.value.toString(),
                                locationController.dist.value,
                                locationController.locality.value,
                                locationController.locationAdress.value,
                              ),
                            );
                          }));
                      BlocProvider.of<NotificatioTokenBloc>(context).add(
                        const NotificatioTokenEvent.started(),
                      );
                    }
                  },
                  child: 
                  // state.isloding
                  //     ? Center(
                  //         child: CircularProgressIndicator(
                  //           color: kCardColor,
                  //         ),
                  //       )
                  //     : 
                      Text("Add Member", style: white13B700),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
