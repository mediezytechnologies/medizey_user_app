// ignore_for_file: unused_local_variable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetUploadedPrescriptionById/get_uploaded_prescription_by_id_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/UploadDocument/UploadDocumentFinal/upload_document_lab_and_scan_final_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/common_button_widget.dart';
import 'package:mediezy_user/Ui/CommonWidgets/vertical_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import '../../../../Repository/Bloc/HealthRecord/GetAllMembers/get_all_members_bloc.dart';
import '../../../Consts/text_style.dart';

class EditPrescriptionScreen extends StatefulWidget {
  const EditPrescriptionScreen({
    super.key,
    required this.documentId,
    required this.patientId,
  });

  final String documentId;
  final String patientId;

  @override
  State<EditPrescriptionScreen> createState() => _EditPrescriptionScreenState();
}

class _EditPrescriptionScreenState extends State<EditPrescriptionScreen> {
  final TextEditingController doctorNameController = TextEditingController();
  final TextEditingController fileNameController = TextEditingController();
  final TextEditingController additionalNoteController =
      TextEditingController();
  File? imageFromGallery;
  File? imageFromCamera;
  File? editedImage;
  DateTime today = DateTime.now();

  @override
  void initState() {
    BlocProvider.of<GetUploadedPrescriptionByIdBloc>(context).add(
      FetchUploadedPrescriptionById(documentId: widget.documentId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Platform.isIOS
          ? SizedBox(
              height: size.height * 0.038,
              width: double.infinity,
            )
          : const SizedBox(),
      appBar: AppBar(
        title: const Text("Edit Prescription"),
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
                .showErrorMessage(context, "Edit prescription error");
          }
        },
        child: BlocBuilder<GetUploadedPrescriptionByIdBloc,
            GetUploadedPrescriptionByIdState>(
          builder: (context, state) {
            if (state is GetUploadedPrescriptionByIdLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: kMainColor,
                ),
              );
            }
            if (state is GetUploadedPrescriptionByIdError) {
              return Center(
                child: Image(
                  image: const AssetImage(
                      "assets/images/something went wrong-01.png"),
                  height: 200.h,
                  width: 200.w,
                ),
              );
            }
            if (state is GetUploadedPrescriptionByIdLoaded) {
              final prescription = state.getUploadedPrescriptionByIdModel;
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
                                  prescription.healthRecord!.document
                                      .toString(),
                                ),
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
                        "Record Date : ${prescription.healthRecord!.date}",
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
                      TextFormField(
                        cursorColor: kMainColor,
                        controller: doctorNameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintStyle:
                              TextStyle(fontSize: 13.sp, color: kSubTextColor),
                          hintText: prescription.healthRecord?.doctorName ?? "",
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
                          hintStyle:
                              TextStyle(fontSize: 13.sp, color: kSubTextColor),
                          hintText:
                              prescription.healthRecord!.fileName.toString(),
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
                        "Additional Notes",
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
                          hintText: prescription.healthRecord!.notes == null
                              ? " "
                              : prescription.healthRecord!.notes.toString(),
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
                      const VerticalSpacingWidget(height: 20),
                      CommonButtonWidget(
                        widget: Text("Update", style: white13B700),
                        onTapFunction: () {
                          if (imageFromGallery != null) {
                            BlocProvider.of<UploadDocumentFinalBloc>(context)
                                .add(
                              EditImageDocument(
                                  documentId: widget.documentId,
                                  type: "2",
                                  document: imageFromGallery!),
                            );
                            GeneralServices.instance.showToastMessage(
                                "Update prescription successfully");
                            Navigator.pop(context);
                            BlocProvider.of<GetAllMembersBloc>(context)
                                .add(FetchAllMembers());
                          } else {
                            BlocProvider.of<UploadDocumentFinalBloc>(context)
                                .add(
                              UploadDocumentFinal(
                                  documentId: widget.documentId,
                                  patientId: widget.patientId,
                                  type: "2",
                                  doctorName: doctorNameController.text == ""
                                      ? prescription.healthRecord!.doctorName
                                          .toString()
                                      : doctorNameController.text,
                                  date: today.toString(),
                                  fileName: fileNameController.text,
                                  testName: "",
                                  labName: "",
                                  admittedFor: "",
                                  hospitalName: "",
                                  notes: additionalNoteController.text == ""
                                      ? prescription.healthRecord!.notes
                                          .toString()
                                      : additionalNoteController.text),
                            );
                            GeneralServices.instance.showToastMessage(
                                "Update prescription successfully");
                            Navigator.pop(context);
                            BlocProvider.of<GetAllMembersBloc>(context)
                                .add(FetchAllMembers());
                          }
                        },
                      ),
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

  Future pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 85);

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
