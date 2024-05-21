// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/error_model/error_model.dart';
import 'package:mediezy_user/ddd/domain/search_doctor/model/search_doctor.dart';
import 'package:mediezy_user/ddd/domain/search_doctor/search_doctor_repository.dart';
import 'package:mediezy_user/ddd/infrastructure/core/api_end_pont.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/search_doctor/model/search_doctor_model.dart';

@LazySingleton(as: SearchDoctorRepository)
class SearchDoctorRepoImpl implements SearchDoctorRepository {
  @override
  Future<Either<ErrorModel, List<SearchDoctor>>> searchDoctor(
      {required String searchQuery}) async {
    final preference = await SharedPreferences.getInstance();
    String? token =
        preference.getString('token') ?? preference.getString('tokenD');
    try {
      log(ApiEndPoints.searchDoctor);
      final response = await Dio(BaseOptions(
        headers: {'Authorization': 'Bearer $token'},
        contentType: 'application/json',
      )).get(
        "${ApiEndPoints.searchDoctor}$searchQuery",
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchDoctorModel.fromJson(response.data);

        log("result service : $result");
        log("result service  response : ${response.data}");

        return Right(result.searchDoctors!);
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
