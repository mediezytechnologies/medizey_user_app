import 'dart:developer';
import 'dart:io';

import "package:async/async.dart";
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http_parser/http_parser.dart';

import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/core/failures/main_failure.dart';
import 'package:mediezy_user/ddd/domain/add_member_image/model/add_member_image.dart';
import 'package:mediezy_user/ddd/domain/add_member/model/add_member_model.dart';
import 'package:mediezy_user/ddd/infrastructure/core/api_end_pont.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/add_member/add_member_service.dart';
import '../../domain/errors/errores_model/errores_model.dart';

@LazySingleton(as: AddMemberRepo)
class RegisterServiceImpl implements AddMemberRepo {
  @override
  Future<Either<ErroresModel, ClintClinicModelData?>> getdoctersData(
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
      //  log(response.toString());
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = ClintClinicModelData.fromJson(response.data);

        log("result service : $result");
        await preference.setInt('patientId', result.patientId!);
//log("message id is : ${result.patientId}");

        int? patianrId;
        patianrId = preference.getInt('patientId');
        log('Response data id : $patianrId');

        return Right(result);
      } else {
        log("${MainFailure.clientFailure()}");
        return Left(ErroresModel());
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      log(e.message!);
      log(e.error.toString());
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text(e.response!.data['response'].toString())));
      log(e.error.toString());
   
      final err= ErroresModel.fromJson(e.response!.data);
         log("err: $err");
      return Left(err);
    }
  }
}

class ApiService {
  Future<ClintClinicModelData?> postData(
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

    print("token : $token");

    log(userId);
    log(fullName);
    log(age);

    log(mobileNumber);
    log(gender);

    log(userId);
    log(userId);
    log(userId);
    log(userId);
    log(userId);
    try {
      var response = await Dio(BaseOptions(
        headers: {'Authorization': 'Bearer $token'},
        contentType: 'application/json',
      )).post('https://mediezy.com/api/patient/addFamilyMember', data: {
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
      }
          //     {
          //   "user_id": 765,
          //   "full_name": "Atipjjpps15r2",
          //   "mobile_number": "177567890",
          //   "gender": 1,
          //   "date_of_birth": "1990-05-15",
          //   "regularMedicine": "No",
          //   "Medicine_Taken": "Medicine name",
          //   "illness": "Illness description",
          //   "medicines": [
          //     {"medicineName": "Medicine name", "illness": "Illness description"},
          //     {"medicineName": "Medicine name", "illness": "Illness descri"}
          //   ],
          //   "allergies": [
          //     {"allergy_id": 1, "allergy_details": "Allergy details"},
          //     {"allergy_id": 2, "allergy_details": "Another allergy details"}
          //   ],
          //   "surgery_name": "Surgery name",
          //   "surgery_details": "Surgery details",
          //   "treatment_taken": "Treatment taken",
          //   "treatment_taken_details": "Treatment details"
          // }
          );
      if (response.statusCode == 400) {
        log("message");
        log('Failed to load data: ${response.statusMessage}');
      } else if (response.statusCode == 200 || response.statusCode == 201) {
        // Request was successful
        final result = ClintClinicModelData.fromJson(response.data);

        //  final storage = GetStorage();
        log("message ststus true");
        await preference.setInt('patientId', result.patientId!);
        log("message id is : ${result.patientId}");

        int? patianrId;
        patianrId = preference.getInt('patientId');
        log('Response data id : $patianrId');

        log('Response: ${response.requestOptions}');
        log('Response data: ${response.data}');

        return result;
      } else {
        log('Response: ${response.data}');
      }
    }

    // ignore: deprecated_member_use

    on DioError catch (e) {
      log('fjklsfjkdfs');
      log(e.response!.statusCode.toString());
      log(e.response!.data!['response'].toString());
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.response!.data['response'].toString())));
      log(e.error.toString());
    } catch (e) {
      // Exception occurred
      print('Exception: $e');
    }
    return null;
  }

//imageeeeeee//

  Future<AddMemberImags?> imageUplodService(
      String imagePath, BuildContext context) async {
    final preference = await SharedPreferences.getInstance();
    String? token =
        preference.getString('token') ?? preference.getString('tokenD');
    int? patianrId;
    patianrId = preference.getInt('patientId');
    try {
      log("message  : $patianrId ");
      MultipartFile addMemberImage = await MultipartFile.fromFile(imagePath,
          filename: imagePath, contentType: MediaType('image', 'jpg'));
      FormData formData = FormData.fromMap({
        'patient_id': patianrId,
        'user_image': addMemberImage,
      });
      var response = await Dio(BaseOptions(
        headers: {'Authorization': 'Bearer $token'},
        contentType: 'application/json',
      )).post(
          'https://mediezy.com/api/patient/addFamilyMember/savePatientImage',
          data: formData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = AddMemberImags.fromJson(response.data);
        log("message fdata $formData");
        log("res img : ${response.data}");
      } else {
        log('Response: ${response.data}');
      }
    }

    // ignore: deprecated_member_use

    on DioError catch (e) {
      log('fjklsfjkdfs');
      log(e.response!.statusCode.toString());
      log(e.response!.data!['response'].toString());
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text(e.response!.data['response'].toString())));
      log(e.error.toString());
    } catch (e) {
      // Exception occurred
      print('Exception: $e');
    }
  }
}
// To parse this JSON data, do
//
//     final clintClinicModels = clintClinicModelsFromJson(jsonString);

class AddMemberImageService {}
