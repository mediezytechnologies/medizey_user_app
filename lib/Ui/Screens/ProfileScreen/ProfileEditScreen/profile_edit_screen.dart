import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
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

  @override
  void initState() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      handleConnectivityChange(result);
    });
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
    dateOfBirth = widget.dob;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        builder: (ctx) => const BottomNavigationControlWidget(),
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
                              Container(
                                height: 100.h,
                                width: 105.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: FadedScaleAnimation(
                                  scaleDuration:
                                      const Duration(milliseconds: 400),
                                  fadeDuration:
                                      const Duration(milliseconds: 400),
                                  child: ClipOval(
                                    child: imageFromGallery != null
                                        ? Image.file(
                                            imageFromGallery!,
                                            height: 80.h,
                                            width: 80.w,
                                            fit: BoxFit.cover,
                                          )
                                        : (widget.imageUrl ==
                                                "https://mediezy.com/UserImages"
                                            ? Image.asset(
                                                "assets/icons/profile pic.png",
                                                height: 80.h,
                                                width: 80.w,
                                                color: kMainColor,
                                              )
                                            : Image.network(
                                                widget.imageUrl,
                                                height: 80.h,
                                                width: 80.w,
                                                fit: BoxFit.cover,
                                              )),
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
                              )
                            ],
                          ),
                          const VerticalSpacingWidget(height: 20),
                          //! first name
                          TextFormField(
                            cursorColor: kMainColor,
                            controller: firstNameController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                IconlyLight.profile,
                                color: kMainColor,
                              ),
                              hintStyle: TextStyle(
                                  fontSize: 15.sp, color: kSubTextColor),
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
                          const VerticalSpacingWidget(height: 10),
                          //! phone number
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 50.h,
                                width: 200.w,
                                child: TextFormField(
                                  cursorColor: kMainColor,
                                  controller: mobileNoController,
                                  keyboardType: TextInputType.phone,
                                  textInputAction: TextInputAction.next,
                                  maxLength: 10,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    prefixIcon: Icon(
                                      Icons.phone_iphone,
                                      color: kMainColor,
                                    ),
                                    hintStyle: TextStyle(
                                        fontSize: 15.sp, color: kSubTextColor),
                                    hintText: widget.phNo,
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
                                  height: 50.h,
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
                                        // dateOfBirth!,
                                        dOB != null
                                            ? DateFormat('dd-MM-yyyy')
                                                .format(dOB!)
                                            : dateOfBirth.toString(),
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
                          const VerticalSpacingWidget(height: 10),
                          TextFormField(
                            cursorColor: kMainColor,
                            controller: locationController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.location_on_outlined,
                                color: kMainColor,
                              ),
                              hintStyle: TextStyle(
                                  fontSize: 15.sp, color: kSubTextColor),
                              hintText: widget.location,
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
                                      style: TextStyle(fontSize: 15.sp),
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
                                      style: TextStyle(fontSize: 15.sp),
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
                                      style: TextStyle(fontSize: 15.sp),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const VerticalSpacingWidget(height: 30),
                          CommonButtonWidget(
                              title: "Update",
                              onTapFunction: () {
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
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      File compressedImage = await compressImage(imageFile);
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
  Future<File> compressImage(File imageFile) async {
    int fileSize = await imageFile.length();
    int maxFileSize = 2048 * 1024;
    if (fileSize <= maxFileSize) {
      return imageFile;
    }
    Uint8List? compressedBytes = await FlutterImageCompress.compressWithFile(
      imageFile.path,
      quality: 85,
    );
    if (compressedBytes != null) {
      List<int> compressedList = compressedBytes.toList();
      File compressedImage = File(imageFile.path)
        ..writeAsBytesSync(compressedList);
      return compressedImage;
    } else {
      throw Exception('Image compression failed');
    }
  }

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
