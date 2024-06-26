// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, deprecated_member_use, avoid_print, body_might_complete_normally_nullable, unused_local_variable

import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/error_model/error_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/get_doctors/docters_impl.dart';
import '../../domain/get_doctors/model/all_doctor.dart';
import '../../domain/get_doctors/model/get_doctor_model.dart';
import '../core/api_end_pont.dart';

@LazySingleton(as: GetDoctersRepo)
class GetDoctorsImpl implements GetDoctersRepo {
  @override
  Future<Either<ErrorModel, List<AllDoctor>>> getDoctersRepo() async {
    final preference = await SharedPreferences.getInstance();
    String userId = preference.getString('userId').toString();
    // log("id ==========$userId");
    String? token =
        preference.getString('token') ?? preference.getString('tokenD');
    try {
      final response = await Dio(BaseOptions(
        headers: {'Authorization': 'Bearer $token'},
        contentType: 'application/json',
      )).get(
        ApiEndPoints.getDoctors,
      );
      // log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = GetDoctorModel.fromJson(response.data);

        // log("result service : $result");
        // log("result service  response : ${response.data}");

        return Right(result.allDoctors!);
      } else {
        return Left(ErrorModel());
      }
    } on DioError catch (e) {
      // log("error ===================== ${e.message}");
      // log(e.error.toString());
      // log(e.error.toString());

      final err = ErrorModel.fromJson(e.response!.data);
      // log("err: $err");
      return Left(err);
    }
  }
}
