import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetAllMembers/get_all_members_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetDischageSummaryById/get_discharge_summary_by_id_dart_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/UploadDocument/UploadDocumentFinal/upload_document_lab_and_scan_final_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';

import '../../../Consts/text_style.dart';

class EditDischageSummaryScreen extends StatefulWidget {
  const EditDischageSummaryScreen({
    super.key,
    required this.documentId,
    required this.patientId,
  });

  final String documentId;
  final String patientId;

  @override
  State<EditDischageSummaryScreen> createState() =>
      _EditDischageSummaryScreenState();
}

class _EditDischageSummaryScreenState extends State<EditDischageSummaryScreen> {
  final TextEditingController admittedForController = TextEditingController();
  final TextEditingController hospitalNameController = TextEditingController();
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
    BlocProvider.of<GetDischargeSummaryByIdDartBloc>(context)
        .add(FetchDischargeSummaryById(documentId: widget.documentId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit discharge summary"),
        centerTitle: true,
      ),
      body: BlocListener<UploadDocumentFinalBloc, UploadDocumentFinalState>(
        listener: (context, state) {
          if (state is UploadDocumentFinalLoaded) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UploadDocumentFinalError) {
            GeneralServices.instance
                .showErrorMessage(context, "Edit discharge summary error");
          }
        },
        child: BlocBuilder<GetDischargeSummaryByIdDartBloc,
            GetDischargeSummaryByIdDartState>(
          builder: (context, state) {
            if (state is GetDischargeSummaryByIdDartError) {
              GeneralServices.instance
                  .showErrorMessage(context, state.errorMessage);
            }
            if (state is GetDischargeSummaryByIdDartLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: kMainColor,
                ),
              );
            }
            if (state is GetDischargeSummaryByIdDartLoaded) {
              final dischageSummary = state.getDischageSummaryByIdModel;
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              : Image.network(dischageSummary
                                  .healthRecord!.document
                                  .toString()),
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
                        "Record date : ${dischageSummary.healthRecord!.date}",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: kTextColor),
                      ),
                      const VerticalSpacingWidget(height: 10),
                      Text(
                        "Doctor name",
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
                            hintText: dischageSummary.healthRecord!.doctorName
                                .toString(),
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
                        "Hospital name",
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
                          controller: hospitalNameController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: dischageSummary.healthRecord!.labName
                                .toString(),
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
                        "File name",
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
                          hintText:
                              dischageSummary.healthRecord!.fileName.toString(),
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
                        "Admitted for",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: kTextColor),
                      ),
                      const VerticalSpacingWidget(height: 5),
                      TextFormField(
                        cursorColor: kMainColor,
                        controller: admittedForController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText:
                              dischageSummary.healthRecord!.testName.toString(),
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
                        "Additional note",
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
                          hintText: dischageSummary.healthRecord!.notes == null
                              ? " "
                              : dischageSummary.healthRecord!.notes.toString(),
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
                                    type: "3",
                                    document: imageFromGallery!),
                              );
                              GeneralServices.instance.showToastMessage(
                                  "Update discharge summary successfully");
                              Navigator.pop(context);
                              BlocProvider.of<GetAllMembersBloc>(context)
                                  .add(FetchAllMembers());
                            } else {
                              BlocProvider.of<UploadDocumentFinalBloc>(context)
                                  .add(
                                UploadDocumentFinal(
                                  documentId: widget.documentId,
                                  patientId: widget.patientId,
                                  type: "3",
                                  doctorName: drNameController.text == ""
                                      ? dischageSummary.healthRecord!.doctorName
                                          .toString()
                                      : drNameController.text,
                                  date: today.toString(),
                                  fileName: fileNameController.text,
                                  testName: "",
                                  labName: "",
                                  notes: additionalNoteController.text,
                                  admittedFor: admittedForController.text == ""
                                      ? dischageSummary.healthRecord!.testName
                                          .toString()
                                      : admittedForController.text,
                                  hospitalName: hospitalNameController.text ==
                                          ""
                                      ? dischageSummary.healthRecord!.labName
                                          .toString()
                                      : hospitalNameController.text,
                                ),
                              );
                              GeneralServices.instance.showToastMessage(
                                  "Update discharge summary successfully");
                              Navigator.pop(context);
                              BlocProvider.of<GetAllMembersBloc>(context)
                                  .add(FetchAllMembers());
                            }
                          }),
                      const VerticalSpacingWidget(height: 10),
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

  Future pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery,imageQuality: 85);

    if (pickedFile != null) {
      File compressedImage = File(pickedFile.path);
      setState(() {
        editedImage = compressedImage;
      });
      imageFromGallery = compressedImage;
    } else {
      GeneralServices.instance.showToastMessage('No image selected');
    }
  }

  //* Image compression function
  // Future<File> compressImage(String imagePath) async {
  //   File imageFile = File(imagePath);
  //   int fileSize = await imageFile.length();
  //   int maxFileSize = 2048 * 1024;
  //   if (fileSize <= maxFileSize) {
  //     return imageFile;
  //   }
  //   Uint8List? compressedBytes = await FlutterImageCompress.compressWithFile(
  //     imagePath,
  //     quality: 85,
  //   );
  //   if (compressedBytes != null) {
  //     List<int> compressedList = compressedBytes.toList();
  //     File compressedImage = File(imagePath)..writeAsBytesSync(compressedList);
  //     return compressedImage;
  //   } else {
  //     throw Exception('Image compression failed');
  //   }
  // }
}
