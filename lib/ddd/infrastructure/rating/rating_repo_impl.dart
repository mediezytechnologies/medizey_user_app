// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/error_model/error_model.dart';
import 'package:mediezy_user/ddd/domain/rating/model/add_rating_model/add_rating_model.dart';
import 'package:mediezy_user/ddd/domain/rating/rating_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/rating/model/get_rating_model/get_rating_model.dart';
import '../../domain/rating/model/get_rating_model/user_rating.dart';
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

  @override
  Future<Either<ErrorModel, AddRatingModel>> addRatingRepo(
      {required String appointmentId,
      required String rating,
      String? ratingId,
      String? reviewId,
      int? doctorRecommentation,
      int? userComments}) async {
    final preference = await SharedPreferences.getInstance();
    String? token =
        preference.getString('token') ?? preference.getString('tokenD');
    try {
      final response = await Dio(BaseOptions(
        headers: {'Authorization': 'Bearer $token'},
        contentType: 'application/json',
      )).post(
        ApiEndPoints.addRating,
        data: {
          "appointment_id": appointmentId,
          "review_id": reviewId,
          "rating": rating,
          "doctor_recommendation": doctorRecommentation,
          "user_comments": userComments,
          "feedback_status": 1,
          "rating_id": ratingId,
        },
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = AddRatingModel.fromJson(response.data);

        log("result service : $result");
        return Right(result);
      } else {
        return Left(ErrorModel());
      }
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
