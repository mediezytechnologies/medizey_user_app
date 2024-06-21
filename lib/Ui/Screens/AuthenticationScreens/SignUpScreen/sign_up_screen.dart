// ignore_for_file: unused_local_variable

import 'dart:io';
import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mediezy_user/Model/auth/sign_up_model.dart';
import 'package:mediezy_user/Repository/Bloc/LoginAndSignUp/login_and_signup_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/AuthenticationScreens/LoginScreen/login_screen.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';

import '../../../Consts/text_style.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final FocusNode lastNameFocusController = FocusNode();
  final FocusNode emailFocusController = FocusNode();
  final FocusNode phoneNumberFocusController = FocusNode();
  final FocusNode passwordFocusController = FocusNode();
  final FocusNode ageFocusController = FocusNode();
  final FocusNode locationFocusController = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late SignUpModel signUpModel;
  bool hidePassword = true;
  String genderValue = "Male";
  String selectedGender = "1";
  File? imageFromGallery;
  DateTime? dateOfBirth;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<LoginAndSignupBloc, LoginAndSignupState>(
      listener: (context, state) {
        if (state is SignUpLoaded) {
          GeneralServices.instance.showToastMessage("Sign Up Successfully");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Register Now"),
          centerTitle: true,
        ),
        body: FadedSlideAnimation(
          beginOffset: const Offset(0, 0.3),
          endOffset: const Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const VerticalSpacingWidget(height: 5),
                    //! heading
                    Text(
                      "You have not registered yet.\nLet us know basic details for registration",
                      style: black13B500,
                      textAlign: TextAlign.center,
                    ),
                    const VerticalSpacingWidget(height: 5),
                    Stack(
                      children: [
                        FadedScaleAnimation(
                          scaleDuration: const Duration(milliseconds: 400),
                          fadeDuration: const Duration(milliseconds: 400),
                          child: ClipOval(
                            child: imageFromGallery != null
                                ? Image.file(
                                    imageFromGallery!,
                                    height: size.height * .14,
                                    width: size.width * .30,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    "assets/icons/profile pic.png",
                                    height: size.height * .14,
                                    width: size.width * .30,
                                    color: kMainColor,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        Positioned(
                          bottom: -10.h,
                          right: -12.w,
                          child: IconButton(
                            onPressed: () {
                              pickImageFromGallery();
                            },
                            icon: Icon(
                              Icons.add_a_photo,
                              size: 26.sp,
                              weight: 5,
                              color: kMainColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const VerticalSpacingWidget(height: 10),
                    //! full name
                    TextFormField(
                      style: black13B500,
                      cursorColor: kMainColor,
                      controller: firstNameController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Fullname is missing";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          IconlyLight.profile,
                          color: kMainColor,
                        ),
                        hintStyle: grey13B600,
                        hintText: "Enter full name",
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
                    const VerticalSpacingWidget(height: 5),
                    //! email
                    TextFormField(
                      style: black13B500,
                      cursorColor: kMainColor,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      focusNode: emailFocusController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !value.contains("@") ||
                            !value.contains(".")) {
                          return "Email is missing";
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
                    const VerticalSpacingWidget(height: 5),
                    //! phone number
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
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
                                Icons.phone_iphone,
                                color: kMainColor,
                              ),
                              hintStyle: grey13B600,
                              hintText: "Enter phonenumber",
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
                        const HorizontalSpacingWidget(width: 5),
                        //! age
                        InkWell(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            selectIosDate(
                              context: context,
                              date: dateOfBirth ?? DateTime.now(),
                              onDateSelected: (DateTime picked) async {
                                setState(() {
                                  dateOfBirth = picked;
                                });
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              },
                            );
                          },
                          child: Container(
                            height: size.height * .065,
                            width: size.width * .32,
                            decoration: BoxDecoration(
                              color: kCardColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  dateOfBirth != null
                                      ? DateFormat('dd-MM-yyyy')
                                          .format(dateOfBirth!)
                                      : 'DOB',
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                      color: kTextColor),
                                ),
                                Icon(
                                  IconlyLight.calendar,
                                  color: kMainColor,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const VerticalSpacingWidget(height: 5),
                    //! password
                    TextFormField(
                      style: black13B500,
                      cursorColor: kMainColor,
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      focusNode: passwordFocusController,
                      textInputAction: TextInputAction.next,
                      obscureText: hidePassword,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 7) {
                          return "Password is missing and must have 7 digits";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(IconlyLight.password, color: kMainColor),
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
                    const VerticalSpacingWidget(height: 5),
                    //!location
                    TextFormField(
                      style: black13B500,
                      cursorColor: kMainColor,
                      controller: locationController,
                      keyboardType: TextInputType.text,
                      focusNode: locationFocusController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Location is missing";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          IconlyLight.location,
                          color: kMainColor,
                        ),
                        hintStyle: grey13B600,
                        hintText: "Enter location",
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
                    const VerticalSpacingWidget(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Radio<String>(
                                activeColor: kMainColor,
                                visualDensity:
                                    const VisualDensity(horizontal: -4),
                                value: "Male",
                                groupValue: genderValue,
                                onChanged: (value) {
                                  setState(() {
                                    genderValue = value!;
                                    selectedGender = 1.toString();
                                  });
                                }),
                            Text("Male", style: black13B500),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<String>(
                                activeColor: kMainColor,
                                visualDensity:
                                    const VisualDensity(horizontal: -4),
                                value: "Female",
                                groupValue: genderValue,
                                onChanged: (value) {
                                  setState(() {
                                    genderValue = value!;
                                    selectedGender = 2.toString();
                                  });
                                }),
                            Text("Female", style: black13B500),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<String>(
                                activeColor: kMainColor,
                                visualDensity:
                                    const VisualDensity(horizontal: -4),
                                value: "Other",
                                groupValue: genderValue,
                                onChanged: (value) {
                                  setState(() {
                                    genderValue = value!;
                                    selectedGender = 3.toString();
                                  });
                                }),
                            Text("Other", style: black13B500),
                          ],
                        )
                      ],
                    ),
                    const VerticalSpacingWidget(height: 10),
                    //! signup
                    CommonButtonWidget(
                        widget: Text("Sign up", style: white13B700),
                        onTapFunction: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<LoginAndSignupBloc>(context).add(
                              SignUpEvent(
                                  email: emailController.text,
                                  age: DateFormat('yyy-MM-dd')
                                      .format(dateOfBirth!),
                                  location: locationController.text,
                                  gender: selectedGender,
                                  password: passwordController.text,
                                  firstname: firstNameController.text,
                                  secondname: lastNameController.text,
                                  mobileNo: phoneNumberController.text,
                                  userImage: imageFromGallery),
                            );
                          }
                        }),
                    const VerticalSpacingWidget(height: 20),
                    //! log in
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?", style: black13B500),
                        const HorizontalSpacingWidget(width: 5),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: Text("Login", style: main12B600),
                        ),
                      ],
                    ),
                    const VerticalSpacingWidget(height: 5),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,imageQuality: 85);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
   //   File compressedImage = await compressImage(imageFile);
      setState(() {
        imageFromGallery = imageFile;
      });
    } else {
      setState(() {
        GeneralServices.instance.showToastMessage('Please select an image');
      });
    }
  }

//* Image compression function
  // Future<File> compressImage(File imageFile) async {
  //   int fileSize = await imageFile.length();
  //   int maxFileSize = 2048 * 1024;
  //   if (fileSize <= maxFileSize) {
  //     return imageFile;
  //   }
  //   Uint8List? compressedBytes = await FlutterImageCompress.compressWithFile(
  //     imageFile.path,
  //     quality: 85,
  //   );
  //   if (compressedBytes != null) {
  //     List<int> compressedList = compressedBytes.toList();
  //     File compressedImage = File(imageFile.path)
  //       ..writeAsBytesSync(compressedList);
  //     return compressedImage;
  //   } else {
  //     throw Exception('Image compression failed');
  //   }
  // }

  //! select date
  Future<void> selectDate({
    required BuildContext context,
    required DateTime date,
    required Function(DateTime) onDateSelected,
  }) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 100)),
      lastDate: DateTime.now(),
      builder: ((context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: kMainColor,
            ),
          ),
          child: child!,
        );
      }),
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }

  Future<void> selectIosDate({
    required BuildContext context,
    required DateTime date,
    required Function(DateTime) onDateSelected,
  }) async {
    final DateTime? picked = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300.0,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: date,
            minimumDate:
                DateTime.now().subtract(const Duration(days: 365 * 100)),
            maximumDate: DateTime.now(),
            onDateTimeChanged: (DateTime newDate) {
              onDateSelected(newDate);
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    lastNameFocusController.dispose();
    emailFocusController.dispose();
    phoneNumberFocusController.dispose();
    passwordFocusController.dispose();
  }
}
