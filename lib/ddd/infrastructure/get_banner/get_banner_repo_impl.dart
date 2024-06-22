import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/error_model/error_model.dart';
import 'package:mediezy_user/ddd/domain/get_banner/model/get_banner_model.dart';
import 'package:mediezy_user/ddd/infrastructure/core/api_end_pont.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/get_banner/get_banner_repository.dart';


@LazySingleton(as: GetBannerRepository)
class GetRepoBannerImpl implements GetBannerRepository {
  @override
  Future<Either<ErrorModel, GetBannerModel>> getBannerRepo(
      String bannerId) async {
    final preference = await SharedPreferences.getInstance();
    String? token =
        preference.getString('token') ?? preference.getString('tokenD');
    try {

      log("hasdjhsadshajdjhsadghsajgh============================= ${ApiEndPoints.getBanner}$bannerId");
      final response = await Dio(BaseOptions(
        headers: {'Authorization': 'Bearer $token'},
        contentType: 'application/json',
      )).get(
        "${ApiEndPoints.getBanner}$bannerId",
      );
      // log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = GetBannerModel.fromJson(response.data);

        log("result service : $result");
        log("result service  response : ${response.data}");

        return Right(result);
      } else {
        return Left(ErrorModel());
      }
    } on DioException catch (e) {
      log("error ===================== ${e.message}");
      log(e.error.toString());
      log(e.error.toString());

      final err = ErrorModel.fromJson(e.response!.data);
      log("err: $err");
      return Left(err);
    }
  }
}
