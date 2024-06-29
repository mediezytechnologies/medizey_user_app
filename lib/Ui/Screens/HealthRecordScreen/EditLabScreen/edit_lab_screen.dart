import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetAllMembers/get_all_members_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetLabReportById/get_lab_report_by_id_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/UploadDocument/UploadDocumentFinal/upload_document_lab_and_scan_final_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';

import '../../../Consts/text_style.dart';

class EditLabScreen extends StatefulWidget {
  const EditLabScreen({
    super.key,
    required this.documentId,
    required this.patientId,
  });

  final String documentId;
  final String patientId;

  @override
  State<EditLabScreen> createState() => _EditLabScreenState();
}

class _EditLabScreenState extends State<EditLabScreen> {
  final TextEditingController labTestNameController = TextEditingController();
  final TextEditingController labNameController = TextEditingController();
  final TextEditingController fileNameController = TextEditingController();
  final TextEditingController drNameController = TextEditingController();
  final TextEditingController additionalNoteController =
      TextEditingController();
  File? imageFromGallery;
  File? editedImage;
  DateTime today = DateTime.now();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetLabReportByIdBloc>(context)
        .add(FetchUploadedLabReportByIdEvent(documentId: widget.documentId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Lab Report"),
        centerTitle: true,
      ),
      body: BlocListener<UploadDocumentFinalBloc, UploadDocumentFinalState>(
        listener: (context, state) {
          if (state is UploadDocumentFinalLoaded) {
            Center(
              child: CircularProgressIndicator(
                color: kMainColor,
              ),
            );
          }
          if (state is UploadDocumentFinalError) {
            GeneralServices.instance
                .showErrorMessage(context, "Edit lab report error");
          }
        },
        child: BlocBuilder<GetLabReportByIdBloc, GetLabReportByIdState>(
          builder: (context, state) {
            if (state is GetLabReportByIdError) {
              GeneralServices.instance
                  .showErrorMessage(context, state.errorMessage);
            }
            if (state is GetLabReportByIdLoading) {
              return Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: kMainColor,
                ),
              );
            }
            if (state is GetLabReportByIdLoaded) {
              final labReport = state.getUploadedLabReportByIdModel;
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VerticalSpacingWidget(height: 10),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 200.h,
                          width: 200.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: editedImage != null
                              ? Image.file(editedImage!)
                              : Image.network(
                                  labReport.healthRecord!.document.toString()),
                        ),
                      ),
                      const VerticalSpacingWidget(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image(
                                    image: const AssetImage(
                                        "assets/icons/gallery.png"),
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
                      Text(
                        "Record Date : ${labReport.healthRecord!.date}",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: kTextColor),
                      ),
                      const VerticalSpacingWidget(height: 10),
                      Text(
                        "Doctor Name",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: kTextColor),
                      ),
                      const VerticalSpacingWidget(height: 5),
                      SizedBox(
                        height: 45.h,
                        width: double.infinity,
                        child: TextFormField(
                          cursorColor: kMainColor,
                          controller: drNameController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText:
                                labReport.healthRecord!.doctorName.toString(),
                            hintStyle: TextStyle(
                                fontSize: 13.sp, color: kSubTextColor),
                            filled: true,
                            fillColor: kCardColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 15.h),
                          ),
                        ),
                      ),
                      const VerticalSpacingWidget(height: 10),
                      Text(
                        "Lab Name",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: kTextColor),
                      ),
                      const VerticalSpacingWidget(height: 5),
                      SizedBox(
                        height: 45.h,
                        width: double.infinity,
                        child: TextFormField(
                          cursorColor: kMainColor,
                          controller: labNameController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText:
                                labReport.healthRecord!.labName.toString(),
                            hintStyle: TextStyle(
                                fontSize: 13.sp, color: kSubTextColor),
                            filled: true,
                            fillColor: kCardColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 15.h),
                          ),
                        ),
                      ),
                      const VerticalSpacingWidget(height: 10),
                      Text(
                        "File Name",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: kTextColor),
                      ),
                      const VerticalSpacingWidget(height: 5),
                      TextFormField(
                        cursorColor: kMainColor,
                        controller: fileNameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: labReport.healthRecord!.fileName.toString(),
                          hintStyle:
                              TextStyle(fontSize: 13.sp, color: kSubTextColor),
                          filled: true,
                          fillColor: kCardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 15.h),
                        ),
                      ),
                      const VerticalSpacingWidget(height: 10),
                      Text(
                        "Test Name",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: kTextColor),
                      ),
                      const VerticalSpacingWidget(height: 5),
                      TextFormField(
                        cursorColor: kMainColor,
                        controller: labTestNameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: labReport.healthRecord!.testName.toString(),
                          hintStyle:
                              TextStyle(fontSize: 13.sp, color: kSubTextColor),
                          filled: true,
                          fillColor: kCardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 15.h),
                        ),
                      ),
                      const VerticalSpacingWidget(height: 10),
                      Text(
                        "Additional Note",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: kTextColor),
                      ),
                      const VerticalSpacingWidget(height: 5),
                      TextFormField(
                        cursorColor: kMainColor,
                        controller: additionalNoteController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintStyle:
                              TextStyle(fontSize: 13.sp, color: kSubTextColor),
                          hintText: labReport.healthRecord!.notes == null
                              ? " "
                              : labReport.healthRecord!.notes.toString(),
                          filled: true,
                          fillColor: kCardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 15.h),
                        ),
                      ),
                      const VerticalSpacingWidget(height: 10),
                      CommonButtonWidget(
                          widget: Text("Update", style: white13B700),
                          onTapFunction: () {
                            if (imageFromGallery != null) {
                              BlocProvider.of<UploadDocumentFinalBloc>(context)
                                  .add(
                                EditImageDocument(
                                    documentId: widget.documentId,
                                    type: "1",
                                    document: imageFromGallery!),
                              );
                              GeneralServices.instance.showToastMessage(
                                  "Update lab report successfully");
                              Navigator.pop(context);
                              BlocProvider.of<GetAllMembersBloc>(context)
                                  .add(FetchAllMembers());
                            } else {
                              BlocProvider.of<UploadDocumentFinalBloc>(context)
                                  .add(
                                UploadDocumentFinal(
                                  documentId: widget.documentId,
                                  patientId: widget.patientId,
                                  type: "1",
                                  doctorName: drNameController.text == ""
                                      ? labReport.healthRecord!.doctorName
                                          .toString()
                                      : drNameController.text,
                                  date: today.toString(),
                                  fileName: fileNameController.text,
                                  testName: labTestNameController.text == ""
                                      ? labReport.healthRecord!.testName
                                          .toString()
                                      : labTestNameController.text,
                                  labName: labNameController.text == ""
                                      ? labReport.healthRecord!.labName
                                          .toString()
                                      : labNameController.text,
                                  notes: additionalNoteController.text,
                                  admittedFor: "",
                                  hospitalName: "",
                                ),
                              );
                              GeneralServices.instance.showToastMessage(
                                  "Update lab report successfully");
                              Navigator.pop(context);
                              BlocProvider.of<GetAllMembersBloc>(context)
                                  .add(FetchAllMembers());
                            }
                          }),
                      const VerticalSpacingWidget(height: 20),
                    ],
                  ),
                ),
              );
            }

            return Container();
          },
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


  
}
