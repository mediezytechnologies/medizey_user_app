// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import 'package:mediezy_user/ddd/domain/add_member/model/add_member_model.dart';
import 'package:mediezy_user/ddd/domain/core/failures/main_failure.dart';
import 'package:mediezy_user/ddd/domain/edit_member/edit_member_service.dart';
import 'package:mediezy_user/ddd/infrastructure/core/api_end_pont.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: EditMemberRepo)
class RegisterServiceImpl implements EditMemberRepo {
  @override
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
      BuildContext context) async {
    final preference = await SharedPreferences.getInstance();

    String? token =
        preference.getString('token') ?? preference.getString('tokenD');
    try {
      final response = await Dio(BaseOptions(
        headers: {'Authorization': 'Bearer $token'},
        contentType: 'application/json',
      )).post(
        ApiEndPoints.editMember,
        data: {
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
        },
      );

      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = ClintClinicModelData.fromJson(response.data);

        log("result : $result");
        await preference.setInt('patientId', result.patientId!);
        log("message id is : ${result.patientId}");

        int? patianrId;
        patianrId = preference.getInt('patientId');
        log('Response data id : $patianrId');
        log('Response: ${response.requestOptions}');
        log('Response data: ${response.data}');
        log("Call addedd Message >>>> ${result.message.toString()}");
        GeneralServices.instance.showToastMessage(result.message.toString());
        return Right(result);
      } else {
        log("${const MainFailure.clientFailure()}");
        return const Left(MainFailure.clientFailure());
      }
    } on DioError catch (e) {
      log(e.message!);
      log(e.error.toString());

      GeneralServices.instance
          .showErrorMessage(context, e.response!.data['message'].toString());
      log(e.error.toString());
      log("${const MainFailure.serverFailure()}");
      return const Left(MainFailure.serverFailure());
    }
  }
}