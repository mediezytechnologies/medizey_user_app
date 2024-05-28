// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'dart:io';
import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mediezy_user/Model/Profile/get_user_model.dart';
import 'package:mediezy_user/Repository/Bloc/Profile/GetUser/get_user_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/bottom_navigation_control_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/AuthenticationScreens/LoginScreen/login_screen.dart';
import 'package:mediezy_user/Ui/Screens/ProfileScreen/AboutUsScreen/about_us_Screen.dart';
import 'package:mediezy_user/Ui/Screens/ProfileScreen/ContactUsScreen/contact_us_screen.dart';
import 'package:mediezy_user/Ui/Screens/ProfileScreen/PrivacyPolicy/privacy_policy_screen.dart';
import 'package:mediezy_user/Ui/Screens/ProfileScreen/ProfileEditScreen/profile_edit_screen.dart';
import 'package:mediezy_user/Ui/Screens/ProfileScreen/RecentBookedDoctorsScreen/recent_booked_doctors_screen.dart';
import 'package:mediezy_user/Ui/Screens/ProfileScreen/SavedDoctorsScreen/saved_doctors_screen.dart';
import 'package:mediezy_user/Ui/Screens/ProfileScreen/TermsAndConditions/terms_and_conditions_screen.dart';
import 'package:mediezy_user/Ui/Screens/ProfileScreen/Widgets/profile_card_widget.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import '../../../ddd/firebase_service/firebase_auth_service.dart';
import '../../Consts/text_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late GetUserModel getUserModel;
  File? imageFromGallery;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetUserBloc>(context).add(FetchUserDetails());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavigationControlWidget(
              selectedIndex: 0,
            ),
          ),
        );
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Account"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: FadedSlideAnimation(
          beginOffset: const Offset(0, 0.3),
          endOffset: const Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  //! first section
                  BlocBuilder<GetUserBloc, GetUserState>(
                    builder: (context, state) {
                      if (state is GetUserDetailsLoading) {
                        return Shimmer.fromColors(
                          baseColor: kShimmerBaseColor,
                          highlightColor: kShimmerHighlightColor,
                          child: Container(
                            width: double.infinity,
                            height: size.height * .14,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        );
                      }
                      if (state is GetUserDetailsError) {
                        return const Center(
                          child: Text("Something Went Wrong"),
                        );
                      }
                      if (state is GetUserDetailsLoaded) {
                        getUserModel =
                            BlocProvider.of<GetUserBloc>(context).getUserModel;
                        return Container(
                          decoration: BoxDecoration(
                            color: kCardColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FadedScaleAnimation(
                                  scaleDuration:
                                      const Duration(milliseconds: 400),
                                  fadeDuration:
                                      const Duration(milliseconds: 400),
                                  child: Container(
                                    height: size.height * .09,
                                    width: size.width * .18,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: FadedScaleAnimation(
                                      scaleDuration:
                                          const Duration(milliseconds: 400),
                                      fadeDuration:
                                          const Duration(milliseconds: 400),
                                      child: ClipOval(
                                        child: (getUserModel
                                                    .userdetails!.userProfile ==
                                                null
                                            ? Image.asset(
                                                "assets/icons/profile pic.png",
                                                height: size.height * .09,
                                                width: size.width * .18,
                                                color: kMainColor,
                                              )
                                            : Image.network(
                                                getUserModel
                                                    .userdetails!.userProfile
                                                    .toString(),
                                                height: size.height * .09,
                                                width: size.width * .18,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Image.asset(
                                                    "assets/icons/profile pic.png",
                                                    height: size.height * .09,
                                                    width: size.width * .18,
                                                    color: kMainColor,
                                                  ),
                                                ),
                                                loadingBuilder:
                                                    (BuildContext context,
                                                        Widget child,
                                                        ImageChunkEvent?
                                                            loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  }
                                                  return Center(
                                                    child: Shimmer.fromColors(
                                                      baseColor:
                                                          kShimmerBaseColor,
                                                      highlightColor:
                                                          kShimmerHighlightColor,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      80.r),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              )),
                                      ),
                                    ),
                                  ),
                                ),
                                const HorizontalSpacingWidget(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        getUserModel.userdetails!.firstname
                                            .toString(),
                                        style: black15B600),
                                    const VerticalSpacingWidget(height: 2),
                                    Text(
                                        getUserModel.userdetails!.email
                                            .toString(),
                                        style: grey13B400),
                                    const VerticalSpacingWidget(height: 2),
                                    Text(
                                        "+91 ${getUserModel.userdetails!.mobileNo.toString()}",
                                        style: grey13B400),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                  const VerticalSpacingWidget(height: 5),

                  //! profile card items
                  Row(
                    children: [
                      Expanded(
                        child: ProfileCardWidget(
                          title: "My profile",
                          subTitle: "Edit profile",
                          icon: Icons.edit_outlined,
                          onTapFunction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => ProfileEditScreen(
                                  firstName: getUserModel.userdetails!.firstname
                                      .toString(),
                                  secondname: getUserModel.userdetails!.lastname
                                      .toString(),
                                  email: getUserModel.userdetails!.email
                                      .toString(),
                                  phNo: getUserModel.userdetails!.mobileNo
                                      .toString(),
                                  location: getUserModel.userdetails!.location
                                      .toString(),
                                  gender: getUserModel.userdetails!.gender
                                      .toString(),
                                  imageUrl: getUserModel
                                      .userdetails!.userProfile
                                      .toString(),
                                  dob: getUserModel.userdetails!.dateofbirth
                                      .toString(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const HorizontalSpacingWidget(width: 5),
                      Expanded(
                        child: ProfileCardWidget(
                            title: "Favourite doctors",
                            subTitle: "Doctors",
                            icon: Icons.bookmark_outline,
                            onTapFunction: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SavedDoctorsScreen(),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                  const VerticalSpacingWidget(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: ProfileCardWidget(
                          title: "About us",
                          subTitle: "Know more",
                          icon: Icons.assignment_turned_in_outlined,
                          onTapFunction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AboutUsScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      const HorizontalSpacingWidget(width: 5),
                      Expanded(
                        child: ProfileCardWidget(
                            title: "Recent booked",
                            subTitle: "Doctors",
                            icon: Icons.book,
                            onTapFunction: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RecentBookedDoctorsScreen(),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                  const VerticalSpacingWidget(height: 5),
                  const VerticalSpacingWidget(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: ProfileCardWidget(
                          title: "Terms & conditions",
                          subTitle: "Know more",
                          icon: Icons.assignment_turned_in_outlined,
                          onTapFunction: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const TermsAndConditionScreen()));
                          },
                        ),
                      ),
                      const HorizontalSpacingWidget(width: 5),
                      Expanded(
                        child: ProfileCardWidget(
                            title: "Privacy policy",
                            subTitle: "Know more",
                            icon: Icons.assignment_turned_in_outlined,
                            onTapFunction: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const PrivacyPolicyScreen(),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                  const VerticalSpacingWidget(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: ProfileCardWidget(
                          title: "Contact us",
                          subTitle: "Contact mediezy",
                          icon: Icons.mail_outline,
                          onTapFunction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ContactUsScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      const HorizontalSpacingWidget(width: 5),
                      Expanded(
                        child: ProfileCardWidget(
                            title: "Log out",
                            subTitle: "log out",
                            icon: Icons.logout,
                            onTapFunction: () async {
                              GeneralServices.instance.appCloseDialogue(
                                  context, "Are you sure to log out", () async {
                                final preferences =
                                    await SharedPreferences.getInstance();
                                await preferences.remove('token');
                                await preferences.remove('firstName');
                                await preferences.remove('lastName');
                                await preferences.remove('userId');
                                await preferences.remove('phoneNumber');
                                await preferences.remove('email');
                                AuthServiceGoogle.instance.logOut(context);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              });
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //* pick image from gallery
  Future pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        imageFromGallery = File(pickedFile.path);
      } else {
        GeneralServices.instance.showToastMessage('Please select image');
      }
    });
  }
}
