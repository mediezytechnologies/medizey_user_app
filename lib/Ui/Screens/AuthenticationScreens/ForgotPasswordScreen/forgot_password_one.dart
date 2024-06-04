import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Screens/AuthenticationScreens/ForgotPasswordScreen/forgot_password_two.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import '../../../../ddd/application/forgot_password/forget_password_first/forget_password_first_bloc.dart';
import '../../../CommonWidgets/common_button_widget.dart';
import '../../../Consts/app_colors.dart';
import '../../../Consts/text_style.dart';

class ForgotPasswordOne extends StatefulWidget {
  const ForgotPasswordOne({super.key});

  @override
  State<ForgotPasswordOne> createState() => _ForgotPasswordOneState();
}

class _ForgotPasswordOneState extends State<ForgotPasswordOne> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<ForgetPasswordFirstBloc, ForgetPasswordFirstState>(
        listener: (context, state) {
          if (state.isError) {
            GeneralServices.instance.showErrorMessage(context, state.message);
          }
          if (state.status) {
            GeneralServices.instance.showToastMessage(
                "An email with a one-time password (OTP) has been sent to your ${emailController.text}");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ForgetPasswordTwo(
                  email: emailController.text.trim(),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const VerticalSpacingWidget(height: 50),
                    Image(
                        image: const AssetImage(
                          "assets/icons/forgot_password_one.png",
                        ),
                        height: size.height * .17),
                    const VerticalSpacingWidget(height: 30),
                    Text("Forgot password", style: black15B600),
                    const VerticalSpacingWidget(height: 15),
                    Text("Please enter your Email ID and get code",
                        style: grey13B500),
                    const VerticalSpacingWidget(height: 20),
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
                    const VerticalSpacingWidget(height: 30),
                    CommonButtonWidget(
                        widget: state.isloding
                            ? CircularProgressIndicator(color: kCardColor)
                            : Text("Submit", style: white13B700),
                        onTapFunction: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<ForgetPasswordFirstBloc>(context)
                                .add(
                              ForgetPasswordFirstEvent.forgetPassword(
                                email: emailController.text.trim(),
                              ),
                            );
                          }
                        }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
