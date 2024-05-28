import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/HealthRecord/GetAllMembers/get_all_members_model.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/DeleteMember/delete_member_bloc.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/GetAllMembers/get_all_members_bloc.dart';
import 'package:mediezy_user/Ui/CommonWidgets/horizontal_spacing_widget.dart';
import 'package:mediezy_user/Ui/Consts/text_style.dart';
import 'package:mediezy_user/Ui/Consts/app_colors.dart';
import 'package:mediezy_user/Ui/Screens/HealthRecordScreen/EditPatientScreen/edit_patient_screen.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';

class UserDetailsDisplayCardWidget extends StatefulWidget {
  const UserDetailsDisplayCardWidget(
      {super.key,
      required this.patientId,
      required this.patienName,
      required this.patientAge,
      required this.patientNumber,
      required this.patientGender,
      required this.patientImage,
      required this.regularMedicine,
      required this.surgeryName,
      required this.treatmentTaken,
      required this.medicineList,
      required this.allergiesDetails,
      required this.surgeryDetails,
      required this.treatmentDetails,
      required this.dateOfBirth,
      required this.mediezyPatientId,
      required this.patientIndex,
      required this.displayAge,
      required this.dobShow});

  final String patientId;
  final String patienName;
  final String patientAge;
  final String patientNumber;
  final String patientGender;
  final String patientImage;
  final String regularMedicine;
  final List<String> surgeryName;
  final List<String> treatmentTaken;
  final List<MedicineDetails> medicineList;
  final List<AllergiesDetails> allergiesDetails;
  final String surgeryDetails;
  final String treatmentDetails;
  final String dateOfBirth;
  final String mediezyPatientId;
  final int patientIndex;
  final String displayAge;
  final String dobShow;

  @override
  State<UserDetailsDisplayCardWidget> createState() =>
      _UserDetailsDisplayCardWidgetState();
}

class _UserDetailsDisplayCardWidgetState
    extends State<UserDetailsDisplayCardWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: const Color(0xFFEAF3F8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * .55,
                child: Text(
                  widget.patienName,
                  style: black12B500,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Text("Gender: ", style: grey10B400),
                  Text(
                      widget.patientGender == "1"
                          ? "Male"
                          : (widget.patientGender == "2")
                              ? "Female"
                              : "Other",
                      style: black10B500),
                  Row(
                    children: [
                      Text(" | ", style: black10B500),
                      Text("Age: ", style: grey10B400),
                      Text(widget.displayAge, style: black10B500),
                    ],
                  ),
                  Text(" | ", style: black10B500),
                  Text("ID: ", style: grey10B400),
                  Text(widget.mediezyPatientId, style: black10B500),
                ],
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  BlocProvider.of<GetAllMembersBloc>(context)
                      .add(FetchAllMembers());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EditPatientScreen(
                          dobShow: widget.dobShow,
                          dateOfBirth: widget.dateOfBirth,
                          surgeryDetails: widget.surgeryDetails.toString(),
                          treatmentDetails: widget.treatmentDetails.toString(),
                          medicineList: widget.medicineList.toList(),
                          patientId: widget.patientId,
                          patientGender: widget.patientGender.toString(),
                          patienName: widget.patienName.toString(),
                          patientAge: widget.patientAge,
                          patientImage: widget.patientImage,
                          patientNumber: widget.patientNumber.toString(),
                          regularMedicine: widget.regularMedicine.toString(),
                          allergiesDetails: widget.allergiesDetails.toList(),
                          surgeryName: widget.surgeryName.toList(),
                          treatmentTaken: widget.treatmentTaken.toList(),
                        );
                      },
                    ),
                  );
                },
                child: Icon(
                  Platform.isIOS ? CupertinoIcons.pen : Icons.edit_outlined,
                  color: kMainColor,
                  size: 18.sp,
                ),
              ),
              HorizontalSpacingWidget(width: 5.w),
              widget.patientIndex == 0
                  ? Container()
                  : GestureDetector(
                      onTap: () {
                        GeneralServices.instance.appCloseDialogue(
                          context,
                          "Are you sure to delete?",
                          () {
                            BlocProvider.of<DeleteMemberBloc>(context).add(
                              FetchDeleteMember(
                                patientId: widget.patientId,
                              ),
                            );
                            Navigator.pop(context);
                          },
                        );
                      },
                      child: Icon(
                        Platform.isIOS
                            ? CupertinoIcons.delete
                            : Icons.delete_outlined,
                        color: kMainColor,
                        size: 18.sp,
                      ),
                    ),
            ],
          )
        ],
      ),
    );
  }
}
