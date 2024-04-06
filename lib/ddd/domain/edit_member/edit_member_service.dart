import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mediezy_user/ddd/domain/add_member/model/add_member_model.dart';
import 'package:mediezy_user/ddd/domain/core/failures/main_failure.dart';

abstract class EditMemberRepo {
  Future<Either<MainFailure, ClintClinicModelData?>> editMemberData(
      String patientId,
      String fullName,
      String age,
      String mobileNumber,
      String gender,
      String regularMedicine,
      String surgeryName,
      String treatmentTaken,
      String surgeryDetails,
      String treatmentTakenDetails,
      List<Allergy>? allergies,
      List<Medicine>? medicines,
      BuildContext context);
}