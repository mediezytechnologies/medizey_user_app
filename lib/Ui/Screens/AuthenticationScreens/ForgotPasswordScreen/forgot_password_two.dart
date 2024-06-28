import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/AuthenticationScreens/ForgotPasswordScreen/forgot_password_three.dart';
import 'package:mediezy_user/ddd/application/forgot_password/forget_password_two/forget_password_two_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../ddd/application/forgot_password/forget_password_first/forget_password_first_bloc.dart';
import '../../../CommonWidgets/common_button_widget.dart';
import '../../../CommonWidgets/vertical_spacing_widget.dart';
import '../../../Consts/text_style.dart';
import '../../../Services/general_services.dart';

class ForgetPasswordTwo extends StatefulWidget {
  const ForgetPasswordTwo({super.key, required this.email});

  final String email;

  @override
  State<ForgetPasswordTwo> createState() => _ForgetPasswordTwoState();
}

class _ForgetPasswordTwoState extends State<ForgetPasswordTwo> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<ForgetPasswordTwoBloc, ForgetPasswordTwoState>(
        listener: (context, state) {
          if (state.isError) {
            GeneralServices.instance.showErrorMessage(context, state.message);
          }
          if (state.status) {
            GeneralServices.instance.showToastMessage(
                "OTP verified successfully\nYou can reset you password");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ForgotPasswordThree(),
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    const VerticalSpacingWidget(height: 60),
                  Image(
                      image: const AssetImage(
                        "assets/icons/forgot_password_two.png",
                      ),
                      height: size.height * .17),
                  const VerticalSpacingWidget(height: 30),
                  Text("Verify your code", style: black15B600),
                  const VerticalSpacingWidget(height: 15),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Please enter 4 digit code sent your email ",
                      style: grey13B500,
                      children: [
                        TextSpan(
                          text: widget.email,
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpacingWidget(height: 10),
                  PinCodeTextField(
                    mainAxisAlignment: MainAxisAlignment.center,
                    cursorColor: kTextColor,
                    textStyle: black16B600,
                    controller: otpController,
                    appContext: context,
                    length: 4,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                        fieldOuterPadding:
                            EdgeInsets.symmetric(horizontal: 10.w),
                        activeBorderWidth: .5.w,
                        inactiveBorderWidth: 1.5.w,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10.r),
                        fieldHeight: 50.h,
                        fieldWidth: 42.w,
                        activeColor: kMainColor,
                        selectedColor: kMainColor,
                        selectedFillColor: kCardColor,
                        inactiveFillColor: kSubTextColor,
                        inactiveColor: kMainColor),
                  ),
                  const VerticalSpacingWidget(height: 30),
                  CommonButtonWidget(
                      widget: state.isloding
                          ? CircularProgressIndicator(color: kCardColor)
                          : Text("Verify", style: white13B700),
                      onTapFunction: () {
                        BlocProvider.of<ForgetPasswordTwoBloc>(context).add(
                          ForgetPasswordTwoEvent.otpVerification(
                              otp: otpController.text),
                        );
                      }),
                  const VerticalSpacingWidget(height: 10),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<ForgetPasswordFirstBloc>(context).add(
                          ForgetPasswordFirstEvent.forgetPassword(
                            email: widget.email,
                          ),
                        );
                      },
                      child: Text("Resend OTP", style: main13B600),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
