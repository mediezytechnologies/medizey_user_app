// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mediezy_user/Model/auth/login_model.dart';
import 'package:mediezy_user/Repository/Bloc/LoginAndSignUp/login_and_signup_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/bottom_navigation_control_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Data/app_datas.dart';
import 'package:mediezy_user/Ui/Screens/AuthenticationScreens/ForegetPasswordScreen/forget_password_screen.dart';
import 'package:mediezy_user/Ui/Screens/AuthenticationScreens/SignUpScreen/sign_up_screen.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import 'package:mediezy_user/ddd/application/user_location/user_location_bloc.dart';
import '../../../../ddd/application/location_controller/locationcontroller.dart';
import '../../../../ddd/application/notification_token/notificatio_token_bloc.dart';
import '../../../../ddd/firebase_service/firebase_auth_service.dart';
import '../../../Consts/text_style.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusController = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final locationController = Get.put(LocationController());
  late LoginModel loginModel;
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<LoginAndSignupBloc, LoginAndSignupState>(
      listener: (context, state) {
        if (state is LoginLoaded) {
          GeneralServices.instance.showToastMessage("Login Successfully");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavigationControlWidget(
                  selectedIndex: 0,
                ),
              ),
              (route) => false);
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            return Future.value(false);
          },
          child: Scaffold(
            body: FadedSlideAnimation(
              beginOffset: const Offset(0, 0.3),
              endOffset: const Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    SizedBox(
                      height: size.height * .578,
                      child: Swiper(
                        autoplay: true,
                        itemCount: loginScreenImages.length,
                        itemBuilder: ((context, index) {
                          return Image.asset(
                            loginScreenImages[index],
                            fit: BoxFit.cover,
                          );
                        }),
                        pagination: SwiperPagination(
                          alignment: Alignment.bottomCenter,
                          builder: DotSwiperPaginationBuilder(
                              color: Colors.grey,
                              activeColor: Colors.grey[200],
                              size: 8.sp,
                              activeSize: 8.sp),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const VerticalSpacingWidget(height: 400),
                            //! email
                            TextFormField(
                              style: black13B500,
                              cursorColor: kMainColor,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !value.contains("@") ||
                                    !value.contains(".")) {
                                  return "Please enter the valid email address";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: kMainColor,
                                ),
                                hintStyle: grey13B600,
                                hintText: "Enter email",
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
                            const VerticalSpacingWidget(height: 10),
                            //! password
                            TextFormField(
                              style: black13B500,
                              cursorColor: kMainColor,
                              controller: passwordController,
                              keyboardType: TextInputType.text,
                              focusNode: passwordFocusController,
                              textInputAction: TextInputAction.done,
                              obscureText: hidePassword,
                              validator: (value) {
                                if (value!.isEmpty || value.length < 7) {
                                  return "Please enter correct password";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(IconlyLight.password,
                                    color: kMainColor),
                                suffixIcon: hidePassword
                                    ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            hidePassword = !hidePassword;
                                          });
                                        },
                                        icon: Icon(
                                          IconlyLight.hide,
                                          color: kMainColor,
                                        ),
                                      )
                                    : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            hidePassword = !hidePassword;
                                          });
                                        },
                                        icon: Icon(
                                          IconlyLight.show,
                                          color: kMainColor,
                                        ),
                                      ),
                                hintStyle: grey13B600,
                                hintText: "Enter password",
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
                            const VerticalSpacingWidget(height: 4),
                            //! forgetpassword
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgetPasswordScreen(),
                                    ),
                                  );
                                },
                                child:
                                    Text("Forget password", style: main12B600),
                              ),
                            ),
                            const VerticalSpacingWidget(height: 10),
                            //! login
                            CommonButtonWidget(
                                widget: (state is LoginLoading)
                                    ? CircularProgressIndicator(
                                        color: kCardColor)
                                    : Text("Login", style: white13B700),
                                onTapFunction: () {
                                  if (_formKey.currentState!.validate()) {
                                    log("code${locationController.postCode.value}");
                                    BlocProvider.of<LoginAndSignupBloc>(context)
                                        .add(
                                      LoginEvent(
                                          email: emailController.text,
                                          password: passwordController.text),
                                    );
                                    locationController.fetchCountry().then(
                                          (value) =>
                                              BlocProvider.of<UserLocationBloc>(
                                                      context)
                                                  .add(
                                            UserLocationEvent.started(
                                              locationController.latitude.value
                                                  .toString(),
                                              locationController.longitude.value
                                                  .toString(),
                                              locationController.dist.value,
                                              locationController.locality.value,
                                              locationController
                                                  .locationAdress.value,
                                            ),
                                          ),
                                        );
                                    BlocProvider.of<NotificatioTokenBloc>(
                                            context)
                                        .add(
                                      const NotificatioTokenEvent.started(),
                                    );
                                  }
                                }),
                            const VerticalSpacingWidget(height: 5),
                            SignInButton(
                              Buttons.google,
                              text: "Sign in with Google",
                              onPressed: () async {
                                AuthServiceGoogle.instance
                                    .signUpWithGoogle(context);
                              },
                            ),
                            const VerticalSpacingWidget(height: 5),
                            Text("or", style: black13B500),
                            const VerticalSpacingWidget(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account?",
                                    style: black13B500),
                                const HorizontalSpacingWidget(width: 5),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpScreen(),
                                      ),
                                    );
                                  },
                                  child: Text("Sign up", style: main12B600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordFocusController.dispose();
    super.dispose();
  }
}
