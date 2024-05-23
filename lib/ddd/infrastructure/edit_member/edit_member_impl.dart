// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/add_member/model/add_member_model.dart';
import 'package:mediezy_user/ddd/domain/edit_member/edit_member_service.dart';
import 'package:mediezy_user/ddd/domain/error_model/error_model.dart';
import 'package:mediezy_user/ddd/infrastructure/core/api_end_pont.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: EditMemberRepo)
class RegisterServiceImpl implements EditMemberRepo {
  @override
  Future<Either<ErrorModel, ClintClinicModelData?>> editMemberData(
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
      BuildContext context) async {
    final preference = await SharedPreferences.getInstance();

    String? token =
        preference.getString('token') ?? preference.getString('tokenD');

    var fomData = {
      "patient_id": patientId,
      "full_name": fullName,
      "mobile_number": mobileNumber,
      "gender": gender,
      "date_of_birth": age,
      "regularMedicine": regularMedicine,
      "surgery_name": surgeryName,
      "surgery_details": surgeryDetails,
      "treatment_taken": treatmentTaken,
      "treatment_taken_details": treatmentTakenDetails,
      "allergies": allergies,
      "medicines": medicines,
    };

    log("formData ==== :$fomData");
    log("age ====== $age");
    try {
      final response = await Dio(BaseOptions(
        headers: {'Authorization': 'Bearer $token'},
        contentType: 'application/json',
      )).post(
        ApiEndPoints.editMember,
        data: fomData,
      );
      log("response data ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = ClintClinicModelData.fromJson(response.data);
        log("result service : $result");
        return Right(result);
      } else {
        return Left(ErrorModel());
      }
    } on DioError catch (e) {
      log(e.message!);
      log(e.error.toString());
      final error = ErrorModel.fromJson(e.response!.data);
      log("err: $error");
      return Left(error);
    }
  }
}
