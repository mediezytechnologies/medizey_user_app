// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, deprecated_member_use, avoid_print, body_might_complete_normally_nullable, unused_local_variable

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/docters_model/model/get_docters_model.dart';
import 'package:mediezy_user/ddd/domain/error_model/error_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/docters_model/docters_impl.dart';
import '../../domain/docters_model/model/all_doctor.dart';
import '../core/api_end_pont.dart';

@LazySingleton(as: GetDoctersRepo)
class GetDoctorsImpl implements GetDoctersRepo {
  @override
  Future<Either<ErrorModel, List<AllDoctor>>> getDoctersRepo() async {
    final preference = await SharedPreferences.getInstance();
    String userId = preference.getString('userId').toString();
    log("id ==========$userId");
    String? token =
        preference.getString('token') ?? preference.getString('tokenD');
    try {
      final response = await Dio(BaseOptions(
        headers: {'Authorization': 'Bearer $token'},
        contentType: 'application/json',
      )).get(
     ApiEndPoints.getDoctors  ,
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = GetDoctersModel.fromJson(response.data);

        log("result service : $result");
        log("result service  response : ${response.data}");

        return Right(result.allDoctors!);
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
var mapUrl ='https://www.google.com/maps/dir/Maradu,+Ernakulam,+Kerala/9.968904,76.31772/@9.9528712,76.296456,14z/data=!3m2!4b1!5s0x3b0872d584a84845:0xe070adb103aa2bd4!4m9!4m8!1m5!1m1!1s0x3b08730f810fd53d:0xacae3aa002984036!2m2!1d76.3180429!2d9.9367552!1m1!4e1?entry=ttu';