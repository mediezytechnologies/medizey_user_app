// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, deprecated_member_use, avoid_print, body_might_complete_normally_nullable, unused_local_variable

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/error_model/error_model.dart';
import 'package:mediezy_user/ddd/infrastructure/core/api_end_pont.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/fcmToken/fcmToken_service.dart';

@LazySingleton(as: FccmTokenRepo)
class FcmTokenImpl implements FccmTokenRepo {
  @override
  Future<Either<ErrorModel, dynamic>> getEditmemberImageData() async {
    final preference = await SharedPreferences.getInstance();
    String? fcmToken = preference.getString('fcmToken');
    String? token =
        preference.getString('token') ?? preference.getString('tokenD');
    try {
      final response = await Dio(BaseOptions(
        headers: {'Authorization': 'Bearer $token'},
        contentType: 'application/json',
      )).post(
        ApiEndPoints.addMember,
        data: {
          "fcm_token": fcmToken,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());

        return Right(response.data);
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
