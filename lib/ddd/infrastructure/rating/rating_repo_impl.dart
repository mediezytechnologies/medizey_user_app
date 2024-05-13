// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/error_model/error_model.dart';
import 'package:mediezy_user/ddd/domain/rating/model/user_rating.dart';
import 'package:mediezy_user/ddd/domain/rating/rating_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/rating/model/get_rating_model.dart';
import '../core/api_end_pont.dart';

@LazySingleton(as: RatingRepository)
class RatingRepoImpl implements RatingRepository {
  @override
  Future<Either<ErrorModel, List<UserRating>>> getRatingRepo(
      {required String ratingText}) async {
    final preference = await SharedPreferences.getInstance();
    String? token =
        preference.getString('token') ?? preference.getString('tokenD');
    try {
      log("${ApiEndPoints.getRating}$ratingText");
      final response = await Dio(BaseOptions(
        headers: {'Authorization': 'Bearer $token'},
        contentType: 'application/json',
      )).get(
        "${ApiEndPoints.getRating}$ratingText",
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = GetRatingModel.fromJson(response.data);

        log("result service : $result");
        log("result service  response : ${response.data}");

        return Right(result.userRating!);
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
