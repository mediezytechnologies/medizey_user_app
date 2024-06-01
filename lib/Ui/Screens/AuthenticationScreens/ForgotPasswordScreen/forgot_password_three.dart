import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Screens/AuthenticationScreens/LoginScreen/login_screen.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import '../../../../ddd/application/forgot_password/forget_password_three/forget_password_three_bloc.dart';
import '../../../Consts/app_colors.dart';
import '../../../Consts/text_style.dart';

class ForgotPasswordThree extends StatefulWidget {
  const ForgotPasswordThree({super.key});

  @override
  State<ForgotPasswordThree> createState() => _ForgotPasswordThreeState();
}

class _ForgotPasswordThreeState extends State<ForgotPasswordThree> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController newPasswordConfirmController =
      TextEditingController();

  bool hideNewPassword = true;
  bool hideNewConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<ForgetPasswordThreeBloc, ForgetPasswordThreeState>(
        listener: (context, state) {
          if (state.isError) {
            GeneralServices.instance.showErrorMessage(context, state.message);
          }
          if (state.status) {
            GeneralServices.instance
                .showToastMessage("Password reset successfully");
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/icons/mediezyIcon.png"),
                  ),
                  const VerticalSpacingWidget(height: 20),
                  Text("Create new password", style: black15B600),
                  const VerticalSpacingWidget(height: 10),
                  Text("Please enter below your new password",
                      style: grey13B500),
                  const VerticalSpacingWidget(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("New password", style: grey12B500),
                      const VerticalSpacingWidget(height: 5),
                      TextFormField(
                        style: black13B500,
                        cursorColor: kMainColor,
                        controller: newPasswordController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        obscureText: hideNewPassword,
                        decoration: InputDecoration(
                          prefixIcon:
                              Icon(IconlyLight.password, color: kMainColor),
                          suffixIcon: hideNewPassword
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      hideNewPassword = !hideNewPassword;
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
                                      hideNewPassword = !hideNewPassword;
                                    });
                                  },
                                  icon: Icon(
                                    IconlyLight.show,
                                    color: kMainColor,
                                  ),
                                ),
                          hintStyle: grey13B600,
                          hintText: "Enter new password",
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
                      Text("Confirm password", style: grey12B500),
                      const VerticalSpacingWidget(height: 5),
                      TextFormField(
                        style: black13B500,
                        cursorColor: kMainColor,
                        controller: newPasswordConfirmController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        obscureText: hideNewConfirmPassword,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 7) {
                            return "Please check password";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon:
                              Icon(IconlyLight.password, color: kMainColor),
                          suffixIcon: hideNewConfirmPassword
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      hideNewConfirmPassword =
                                          !hideNewConfirmPassword;
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
                                      hideNewConfirmPassword =
                                          !hideNewConfirmPassword;
                                    });
                                  },
                                  icon: Icon(
                                    IconlyLight.show,
                                    color: kMainColor,
                                  ),
                                ),
                          hintStyle: grey13B600,
                          hintText: "Re enter new password",
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
                      const VerticalSpacingWidget(height: 30),
                    ],
                  ),
                  CommonButtonWidget(
                      widget: Text("Reset password", style: white13B700),
                      onTapFunction: () {
                        if (newPasswordController.text.length < 7 ||
                            newPasswordConfirmController.text.length < 7) {
                          GeneralServices.instance.showErrorMessage(context,
                              "Password must be at lease 7 characters");
                        } else if (newPasswordController.text !=
                            newPasswordConfirmController.text) {
                          GeneralServices.instance.showErrorMessage(context,
                              "Password is not matching\nplease check");
                        } else {
                          BlocProvider.of<ForgetPasswordThreeBloc>(context).add(
                            ForgetPasswordThreeEvent.successPassword(
                                newPassword: newPasswordController.text),
                          );
                        }
                      })
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
