// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/error_model/error_model.dart';
import 'package:mediezy_user/ddd/domain/get_recently_booked_doctors/get_recently_booked_doctors_repository.dart';
import 'package:mediezy_user/ddd/domain/get_recently_booked_doctors/model/recently_booked_doctor.dart';
import 'package:mediezy_user/ddd/domain/get_recently_booked_doctors/model/recently_booked_doctor_model.dart';
import 'package:mediezy_user/ddd/infrastructure/core/api_end_pont.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: GetRecentlyBookedDoctorRepository)
class GetRecentlyBookedDoctorsImpl
    implements GetRecentlyBookedDoctorRepository {
  @override
  Future<Either<ErrorModel, List<RecentlyBookedDoctor>>>
      getRecentlyBookedDoctorsRepo() async {
    final preference = await SharedPreferences.getInstance();
    String? token =
        preference.getString('token') ?? preference.getString('tokenD');
    try {
      log(ApiEndPoints.getRecentlyBookedDoctors);
      final response = await Dio(BaseOptions(
        headers: {'Authorization': 'Bearer $token'},
        contentType: 'application/json',
      )).get(
        ApiEndPoints.getRecentlyBookedDoctors,
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = RecentlyBookedDoctorModel.fromJson(response.data);

        log("result service : $result");
        log("result service  response : ${response.data}");

        return Right(result.recentlyBookedDoctor!);
      } else {
        return Left(ErrorModel());
      }
    } on DioError catch (e) {
      log("error ===================== ${e.message}");
      log(e.error.toString());
      log(e.error.toString());

      final err = ErrorModel.fromJson(e.response!.data);
      log("err: $err");
      return Left(err);
    }
  }
}
