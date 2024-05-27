import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/add_member/model/add_member_model.dart';
import 'package:mediezy_user/ddd/domain/error_model/error_model.dart';
import 'package:mediezy_user/ddd/infrastructure/core/api_end_pont.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/firebase_login/firebase_login_api_impl.dart';
import '../domain/firebase_login/model/firebase_login_model/firebase_login_model.dart';

@LazySingleton(as: AddFirebaseLogin)
class FirebaseLoginImpl implements AddFirebaseLogin {
  @override
  Future<Either<ErrorModel, FirebaseLoginModel?>> addFirebaseLogin(
    String phoneNumber,
  ) async {
    final preference = await SharedPreferences.getInstance();
    String? firebaseToken = preference.getString('firebaseTokens');

    log("fcm tok : $firebaseToken");
  
    try {
      final response = await Dio(BaseOptions(
        // headers: {'Authorization': 'Bearer $token'},
        contentType: 'application/json',
      )).post(
        ApiEndPoints.firbaseLogin,
        data: {
          "access_token": firebaseToken,
          "mobile_number": phoneNumber,
        },
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = FirebaseLoginModel.fromJson(response.data);

        log("result service : $result");
        preference.setString('token', result.token.toString());
        String? userId;

        preference.setString('firstName', result.user!.firstname.toString());

        preference.setString('userId', result.user!.id.toString());
        userId = preference.getString('userId').toString();
        print("<<<<<<userrr  $userId>>>>>>>>");
        preference.setString('phoneNumber', result.user!.mobileNo.toString());

        String? userName = preference.getString('firstName');

        log("fcm tok in api : ${preference.getString('token')}");
                log("fcm tuserName api : $userName");
                        log("fcm tuser id api : $userId");
                              
        //  await preference.setInt('patientId', result.patientId!);

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