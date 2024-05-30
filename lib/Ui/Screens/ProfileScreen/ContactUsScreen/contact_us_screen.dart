import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Repository/Bloc/ContactUs/contact_us_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import '../../../Consts/text_style.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final FocusNode messageFocusController = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Us"),
        centerTitle: true,
      ),
      body: BlocListener<ContactUsBloc, ContactUsState>(
        listener: (context, state) {
          if (state is ContactUsLoaded) {
            GeneralServices.instance
                .showDelaySuccessMessage(context, state.successMessage);
          }
          if (state is ContactUsError) {
            GeneralServices.instance
                .showErrorMessage(context, state.errorMessage);
          }
        },
        child: FadedSlideAnimation(
          beginOffset: const Offset(0, 0.3),
          endOffset: const Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const VerticalSpacingWidget(height: 10),
                    Text("How may we\nhelp you?", style: black16B600),
                    const VerticalSpacingWidget(height: 13),
                    Text("Let us know your queries & feedbacks",
                        style: black13B500),
                    const VerticalSpacingWidget(height: 20),
                    //! email
                    SizedBox(
                      height: size.height * .085,
                      child: TextFormField(
                        style: black13B500,
                        cursorColor: kMainColor,
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !value.contains("@") ||
                              !value.contains(".")) {
                            return "Please enter the valid email address";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            IconlyLight.message,
                            color: kMainColor,
                          ),
                          hintStyle: grey13B600,
                          hintText: "philipe@gmail.com",
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

                    const VerticalSpacingWidget(height: 15),

                    //! message
                    SizedBox(
                      child: TextFormField(
                        style: black13B500,
                        maxLines: 4,
                        cursorColor: kMainColor,
                        controller: messageController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter message";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            IconlyLight.edit,
                            color: kMainColor,
                          ),
                          hintStyle: grey13B600,
                          hintText: "Write your message",
                          filled: true,
                          fillColor: kCardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const VerticalSpacingWidget(height: 20),
                    //! submit
                    CommonButtonWidget(
                        widget: Text("Submit", style: white13B700),
                        onTapFunction: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<ContactUsBloc>(context).add(
                              AddContactUs(
                                  description: messageController.text,
                                  email: emailController.text),
                            );
                            emailController.clear();
                            messageController.clear();
                          }
                        }),

                    const VerticalSpacingWidget(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    messageController.dispose();
    messageFocusController.dispose();
  }
}
