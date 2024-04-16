// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, deprecated_member_use, avoid_print, body_might_complete_normally_nullable, unused_local_variable

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/add_member/model/add_member_model.dart';
import 'package:mediezy_user/ddd/domain/error_model/error_model.dart';
import 'package:mediezy_user/ddd/infrastructure/core/api_end_pont.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/add_member/add_member_service.dart';
import '../../domain/errors/errores_model/errores_model.dart';

@LazySingleton(as: AddMemberRepo)
class RegisterServiceImpl implements AddMemberRepo {
  @override
  Future<Either<ErrorModel, ClintClinicModelData?>> addFamilyMember(
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
    String userId = preference.getString('userId').toString();
    String? token =
        preference.getString('token') ?? preference.getString('tokenD');
    try {
      final response = await Dio(BaseOptions(
        headers: {'Authorization': 'Bearer $token'},
        contentType: 'application/json',
      )).post(
        ApiEndPoints.addMember,
        data: {
          "user_id": userId,
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
        },
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = ClintClinicModelData.fromJson(response.data);

        log("result service : $result");
        await preference.setInt('patientId', result.patientId!);

        int? patianrId;
        patianrId = preference.getInt('patientId');
        log('Response data id : $patianrId');
        return Right(result);
      } else {
        return Left(ErrorModel());
      }
    } on DioError catch (e) {
      log(e.message!);
      log(e.error.toString());
      log(e.error.toString());

      final err = ErrorModel.fromJson(e.response!.data);
      log("err: $err");
      return Left(err);
    }
  }
}
