import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediezy_user/Model/HealthRecord/GetAllMembers/get_all_members_model.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/DeleteMember/delete_member_bloc.dart';
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
      required this.displayAge});

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

  @override
  State<UserDetailsDisplayCardWidget> createState() =>
      _UserDetailsDisplayCardWidgetState();
}

class _UserDetailsDisplayCardWidgetState
    extends State<UserDetailsDisplayCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFEAF3F8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.patienName,
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: kTextColor),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Gender:",
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: kSubTextColor),
                  ),
                  Text(
                    widget.patientGender,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: kTextColor),
                  ),
                  Row(
                    children: [
                      Text(
                        " | ",
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: kTextColor),
                      ),
                      Text(
                        "Age:",
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: kSubTextColor),
                      ),
                      Text(
                        widget.displayAge,
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: kTextColor),
                      ),
                    ],
                  ),
                  Text(
                    " | ",
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: kTextColor),
                  ),
                  Text(
                    "ID:",
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: kSubTextColor),
                  ),
                  Text(
                    widget.mediezyPatientId,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: kTextColor),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EditPatientScreen(
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
                icon: Icon(
                  Icons.edit_outlined,
                  color: kMainColor,
                  size: 18.sp,
                ),
              ),
              widget.patientIndex == 0
                  ? Container()
                  : IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
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
                      icon: Icon(
                        Icons.delete_outlined,
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
