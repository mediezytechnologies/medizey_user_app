// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';
import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mediezy_user/Repository/Bloc/Profile/EditUser/edit_user_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/Profile/UploadUserImage/upload_user_image_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/bottom_navigation_control_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/internet_handle_screen.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Consts/text_style.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen(
      {super.key,
      required this.firstName,
      required this.secondname,
      required this.email,
      required this.phNo,
      required this.location,
      required this.gender,
      required this.imageUrl,
      required this.dob});
  final String firstName;
  final String secondname;
  final String email;
  final String phNo;
  final String location;
  final String gender;
  final String imageUrl;
  final String dob;
  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  String genderValue = "";
  String selectedGender = '';
  File? imageFromGallery;
  late StreamSubscription<ConnectivityResult> subscription;
  String? dateOfBirth;
  DateTime? dOB;

  void handleConnectivityChange(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
    } else {}
  }

  Future<void> setNewUserName(String newName) async {
    final preference = await SharedPreferences.getInstance();
    await preference.remove('firstName');
    preference.setString('firstName', newName);
  }

  @override
  void initState() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      handleConnectivityChange(result);
    });
    firstNameController.text = widget.firstName;
    mobileNoController.text = widget.phNo;
    locationController.text = widget.location == 'null' ? "" : widget.location;
    genderValue = widget.gender == "1"
        ? "Male"
        : (widget.gender == "2")
            ? "Female"
            : "Other";
    selectedGender = widget.gender == "1"
        ? "1"
        : (widget.gender == "2")
            ? "2"
            : "0";
    dateOfBirth = widget.dob == 'null' ? "" : widget.dob;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Edit"),
        centerTitle: true,
      ),
      body: StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            final connectivityResult = snapshot.data;
            if (connectivityResult == ConnectivityResult.none) {
              return const InternetHandleScreen();
            } else {
              return BlocListener<EditUserBloc, EditUserState>(
                listener: (context, state) {
                  if (state is EditUserDetailsLoaded) {
                    GeneralServices.instance
                        .showToastMessage("Profile edit successfully");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) =>
                            BottomNavigationControlWidget(selectedIndex: 3),
                      ),
                    );
                  }
                },
                child: FadedSlideAnimation(
                  beginOffset: const Offset(0, 0.3),
                  endOffset: const Offset(0, 0),
                  slideCurve: Curves.linearToEaseOut,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Column(
                        children: [
                          const VerticalSpacingWidget(height: 10),
                          Stack(
                            children: [
                              FadedScaleAnimation(
                                scaleDuration:
                                    const Duration(milliseconds: 400),
                                fadeDuration: const Duration(milliseconds: 400),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: imageFromGallery != null
                                        ? Image.file(
                                            imageFromGallery!,
                                            height: size.width * .28,
                                            width: size.width * .28,
                                            fit: BoxFit.cover,
                                          )
                                        : (widget.imageUrl == "null"
                                            ? Image.asset(
                                                "assets/icons/profile pic.png",
                                                height: size.width * .28,
                                                width: size.width * .28,
                                                color: kMainColor,
                                              )
                                            : Image.network(
                                                widget.imageUrl,
                                                height: size.width * .28,
                                                width: size.width * .28,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Image.asset(
                                                    "assets/icons/profile pic.png",
                                                    height: size.width * .28,
                                                    width: size.width * .28,
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
                              Positioned(
                                bottom: -10.h,
                                right: -10.w,
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
                              )
                            ],
                          ),
                          const VerticalSpacingWidget(height: 20),
                          //! first name
                          SizedBox(
                            height: size.height * .065,
                            child: TextFormField(
                              style: black13B500,
                              cursorColor: kMainColor,
                              controller: firstNameController,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  IconlyLight.profile,
                                  color: kMainColor,
                                  size: 20.sp,
                                ),
                                hintStyle: grey13B600,
                                hintText: widget.firstName,
                                filled: true,
                                fillColor: kCardColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 10.0),
                              ),
                            ),
                          ),
                          const VerticalSpacingWidget(height: 10),
                          //! phone number
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: size.height * .065,
                                width: 200.w,
                                child: TextFormField(
                                  style: black13B500,
                                  cursorColor: kMainColor,
                                  controller: mobileNoController,
                                  keyboardType: TextInputType.phone,
                                  textInputAction: TextInputAction.next,
                                  maxLength: 10,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    prefixIcon: Icon(
                                      IconlyLight.call,
                                      color: kMainColor,
                                      size: 20.sp,
                                    ),
                                    hintStyle: grey13B600,
                                    hintText: widget.phNo,
                                    filled: true,
                                    fillColor: kCardColor,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 6.h),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  selectDate(
                                    context: context,
                                    date: DateTime.now(),
                                    onDateSelected: (DateTime picked) async {
                                      setState(() {
                                        dOB = picked;
                                      });
                                    },
                                  );
                                },
                                child: Container(
                                  height: size.height * .065,
                                  width: 130.w,
                                  decoration: BoxDecoration(
                                    color: kCardColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        dOB != null
                                            ? DateFormat('dd-MM-yyyy')
                                                .format(dOB!)
                                            : dateOfBirth.toString(),
                                        style: black13B500,
                                      ),
                                      Icon(
                                        IconlyLight.calendar,
                                        color: kMainColor,
                                        size: 20.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          const VerticalSpacingWidget(height: 10),
                          SizedBox(
                            height: size.height * .065,
                            child: TextFormField(
                              style: black13B500,
                              cursorColor: kMainColor,
                              controller: locationController,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  IconlyLight.location,
                                  color: kMainColor,
                                  size: 20.sp,
                                ),
                                hintStyle: grey13B600,
                                hintText: widget.location == 'null'
                                    ? ""
                                    : widget.location,
                                filled: true,
                                fillColor: kCardColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 6.h),
                              ),
                            ),
                          ),
                          const VerticalSpacingWidget(height: 10),
                          //! gender
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    genderValue = "Male";
                                    selectedGender = 1.toString();
                                  });
                                },
                                child: Row(
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
                                    Text(
                                      "Male",
                                      style: black13B500,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    genderValue = "Female";
                                    selectedGender = 2.toString();
                                  });
                                },
                                child: Row(
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
                                    Text(
                                      "Female",
                                      style: black13B500,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    genderValue = "Other";
                                    selectedGender = 3.toString();
                                  });
                                },
                                child: Row(
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
                                    Text(
                                      "Other",
                                      style: black13B500,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const VerticalSpacingWidget(height: 30),
                          CommonButtonWidget(
                              widget: Text("Update", style: white13B700),
                              onTapFunction: () {
                                setNewUserName(firstNameController.text);
                                BlocProvider.of<EditUserBloc>(context).add(
                                  FetchEditUser(
                                      dob: dOB != null
                                          ? DateFormat('yyy-MM-dd').format(dOB!)
                                          : '',
                                      firstName: firstNameController.text,
                                      secondName: secondNameController.text,
                                      mobileNo: mobileNoController.text,
                                      email: emailController.text,
                                      location: locationController.text,
                                      gender: selectedGender),
                                );
                                BlocProvider.of<UploadUserImageBloc>(context)
                                    .add(
                                  FetchUploadUserImage(
                                      userImage: imageFromGallery!),
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,imageQuality: 85);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      File compressedImage = imageFile;
      setState(() {
        imageFromGallery = compressedImage;
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
}
