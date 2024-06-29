// ignore_for_file: use_build_context_synchronously, avoid_print, must_be_immutable

import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/DocumentPreviewScreen/document_preview_screen.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';

class AddDocumentScreen extends StatefulWidget {
  AddDocumentScreen(
      {super.key,
      required this.appBarTitle,
      required this.stringType,
      required this.type,
      this.image});

  final String appBarTitle;
  final String stringType;
  final int type;
  String? image;

  @override
  State<AddDocumentScreen> createState() => _AddDocumentScreenState();
}

class _AddDocumentScreenState extends State<AddDocumentScreen> {
  File? imageFromGallery;
  File? imageFromCamera;
  String? filePath;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    log("image ${widget.image}");
    return Scaffold(
      bottomNavigationBar: Platform.isIOS
          ? SizedBox(
              height: size.height * 0.038,
              width: double.infinity,
            )
          : const SizedBox(),
      appBar: AppBar(
        title: Text(widget.appBarTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  Icons.error,
                  size: 30.sp,
                ),
                const HorizontalSpacingWidget(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What is valid ${widget.stringType}?",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    const VerticalSpacingWidget(height: 5),
                    widget.image == null
                        ? const SizedBox()
                        : Image(
                            image: AssetImage(
                              widget.image.toString(),
                            ),
                            height: size.height * .2),
                    const VerticalSpacingWidget(height: 5),
                    Text(
                      "Why upload a ${widget.stringType}",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            const VerticalSpacingWidget(height: 10),
            Row(
              children: [
                Icon(
                  Icons.description_outlined,
                  size: 26.sp,
                ),
                const HorizontalSpacingWidget(width: 10),
                SizedBox(
                  height: 60.h,
                  width: 280.w,
                  child: Text(
                    "Our team will verify your ${widget.stringType} and call back to confirm your lab test order",
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            const VerticalSpacingWidget(height: 10),
            Row(
              children: [
                Icon(
                  Icons.smartphone_outlined,
                  size: 26.sp,
                ),
                const HorizontalSpacingWidget(width: 10),
                SizedBox(
                  height: 80.h,
                  width: 300.w,
                  child: Text(
                    "Your ${widget.stringType} will always available in your account so that you can access it anytime anywhere",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            const VerticalSpacingWidget(height: 10),
            Row(
              children: [
                Icon(
                  Icons.lock_outline,
                  size: 26.sp,
                ),
                const HorizontalSpacingWidget(width: 10),
                Text(
                  "Details from your ${widget.stringType} are only\nvisible to our team of specialist",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                )
              ],
            ),
            const VerticalSpacingWidget(height: 50),
            Text(
              "Upload ${widget.stringType} from",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            const VerticalSpacingWidget(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //! camera
                InkWell(
                  onTap: () {
                    pickImageFromCamera();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    height: 40.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                      color: kMainColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: const AssetImage("assets/icons/camera.png"),
                          color: Colors.white,
                          height: 32.h,
                        ),
                        Text(
                          "Camera",
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                //! gallery
                InkWell(
                  onTap: () {
                    pickImageFromGallery();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    height: 40.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                      color: kMainColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: const AssetImage("assets/icons/gallery.png"),
                          color: Colors.white,
                          height: 32.h,
                        ),
                        Text(
                          "Gallery",
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const VerticalSpacingWidget(height: 10),
          ],
        ),
      ),
    );
  }

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 85);

    if (pickedFile != null) {   
      File imageFile = File(pickedFile.path);
      int fileSizeInBytes = await imageFile.length();
      double fileSizeInMB = fileSizeInBytes / (1024 * 1024);

      if (fileSizeInMB > 2) {
        setState(() {
          GeneralServices.instance.showToastMessage(
              'Image size exceeds 2MB. Please select a smaller image.');
        });
      } else {
        File compressedImage = imageFile;
        setState(() {
          imageFromGallery = compressedImage;
        });
      }
    } else {
      setState(() {
        GeneralServices.instance.showToastMessage('Please select an image');
      });
    }
  }

  Future<void> pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 85);

    if (pickedFile != null) {
      try {
        File file = File(pickedFile.path);
        int fileSizeInBytes = await file.length();
        double fileSizeInMB = fileSizeInBytes / (1024 * 1024);

        if (fileSizeInMB > 2) {
          GeneralServices.instance.showToastMessage(
              'Image size exceeds 2MB. Please take a smaller image.');
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DocumentPreviewScreen(
                imageFile: file,
                type: widget.type,
              ),
            ),
          );
        }
      } catch (e) {
        print('Error processing image: $e');
        GeneralServices.instance.showToastMessage('Error processing image');
      }
    } else {
      GeneralServices.instance.showToastMessage('No image captured');
    }
  }
}
