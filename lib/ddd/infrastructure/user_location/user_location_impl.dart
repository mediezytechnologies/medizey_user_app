// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages, deprecated_member_use, avoid_print, body_might_complete_normally_nullable, unused_local_variable

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/application/location_controller/locationcontroller.dart';
import 'package:mediezy_user/ddd/domain/error_model/error_model.dart';
import 'package:mediezy_user/ddd/domain/user_location/user_location_impl.dart';
import 'package:mediezy_user/ddd/infrastructure/core/api_end_pont.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/user_location/model/user_location_model.dart';

@LazySingleton(as: UserLocationRepo)
class UserLoacationImpl implements UserLocationRepo {
  @override
  Future<Either<ErrorModel, UserLocationModel?>> userLocation(
    String latitude,
    String longitude,
    String district,
    String city,
    String locationAddress,
  ) async {
    final preference = await SharedPreferences.getInstance();
    final controller = Get.put(LocationController());
    String userId = preference.getString('userId').toString();
    String? token =
        preference.getString('token') ?? preference.getString('tokenD');
    try {
      log("user id : $userId");
      log(" get the try bloc");
      log(" latitude:${controller.latitude.value}");
      log(" dis ========================== >>>>>>>>>>>:${controller.dist.value}");
      log(" latitude:${controller.dist.value}");

      Map<String, String> data = {
        "user_id": userId,
        "latitude": latitude,
        "longitude": longitude,
        "district": district,
        "city": city,
        "location_address": locationAddress,
      };
      log("map data ==========================  ${data.toString()}");
      final response = await Dio(BaseOptions(
        headers: {'Authorization': 'Bearer $token'},
        //  contentType: 'application/json',
      )).post(
        ApiEndPoints.userLocation,
        data: {
          "user_id": userId,
          "latitude": latitude,
          "longitude": longitude,
          "district": district,
          "city": city,
          "location_address": locationAddress,
        },
      );
      log('inside try bloc');
      log("res [[[]]]==========${response.data.toString()}");

      final result = UserLocationModel.fromJson(response.data);
      log("res ===${result.data!.latitude}");
      return Right(result);
    } on DioError catch (e) {
      log("dio error");
      log(e.message!);
      log(e.error.toString());
      log(e.error.toString());

      final err = ErrorModel.fromJson(e.response!.data);
      log("err: $err");
      return Left(err);
    }
  }
}
