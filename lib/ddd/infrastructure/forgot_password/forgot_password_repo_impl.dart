// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/error_model/error_model.dart';
import 'package:mediezy_user/ddd/domain/forgot_password/forgot_password_model/forgot_password_model.dart';
import 'package:mediezy_user/ddd/domain/forgot_password/forgot_password_repository.dart';
import 'package:mediezy_user/ddd/domain/forgot_password/otp_verfied_model/otp_verfied_model.dart';
import 'package:mediezy_user/ddd/domain/forgot_password/success_password_model/success_password_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/api_end_pont.dart';

@LazySingleton(as: ForgotPasswordRepository)
class ForgotPasswordRepoImpl implements ForgotPasswordRepository {
  @override
  Future<Either<ErrorModel, ForgotPasswordModel>> forgotPasswordRepo(
      String email) async {
    final preference = await SharedPreferences.getInstance();
    try {
      final response = await Dio(BaseOptions(
        contentType: 'application/json',
      )).post(
        ApiEndPoints.forgotPassword,
        data: {
          "email": email,
        },
      );
      log(response.data.toString());
      log(response.statusCode.toString());
      final result = ForgotPasswordModel.fromJson(response.data);
      log(response.data.toString());
      log(result.toString());
      log("User id from response>> ${result.userId.toString()}");
      preference.setString('generated_user_id', result.userId.toString());
      return Right(result);
    } on DioError catch (e) {
      log(e.message!);
      log("errrr : ${e.error.toString()}");
      log(e.error.toString());
      final err = ErrorModel.fromJson(e.response!.data);
      log("err: $err");
      return Left(err);
    }
  }

  @override
  Future<Either<ErrorModel, OtpVerfiedModel>> otpVerficationRepo(
      String otp) async {
    final preference = await SharedPreferences.getInstance();
    String? generatedUserId = preference.getString('generated_user_id');
    try {
      final response = await Dio(BaseOptions(
        contentType: 'application/json',
      )).post(
        ApiEndPoints.otpVerfication,
        data: {"otp": otp, "user_id": generatedUserId},
      );
      log(response.data.toString());
      log(response.statusCode.toString());
      final result = OtpVerfiedModel.fromJson(response.data);
      log(response.data.toString());
      log(result.toString());
      return Right(result);
    } on DioError catch (e) {
      log(e.message!);
      log("errrr : ${e.error.toString()}");
      log(e.error.toString());
      final err = ErrorModel.fromJson(e.response!.data);
      log("err: $err");
      return Left(err);
    }
  }

  @override
  Future<Either<ErrorModel, SuccessPasswordModel>> successPasswordRepo(
      String newPassword) async {
    final preference = await SharedPreferences.getInstance();
    String? generatedUserId = preference.getString('generated_user_id');
    try {
      final response = await Dio(BaseOptions(
        contentType: 'application/json',
      )).post(
        ApiEndPoints.resetPassword,
        data: {"password": newPassword, "user_id": generatedUserId},
      );
      log(response.data.toString());
      log(response.statusCode.toString());
      final result = SuccessPasswordModel.fromJson(response.data);
      log(response.data.toString());
      log(result.toString());
      return Right(result);
    } on DioError catch (e) {
      log(e.message!);
      log("errrr : ${e.error.toString()}");
      log(e.error.toString());
      final err = ErrorModel.fromJson(e.response!.data);
      log("err: $err");
      return Left(err);
    }
  }
}
