import 'package:dartz/dartz.dart';
import '../error_model/error_model.dart';
import 'model/add_rating_model/add_rating_model.dart';
import 'model/get_rating_model/get_rating_model.dart';

abstract class RatingRepository {
  Future<Either<ErrorModel, GetRatingModel>> getRatingRepo(
      {required String ratingText});
  Future<Either<ErrorModel, AddRatingModel>> addRatingRepo(
      {required int appointmentId,
      required double rating,
      int? ratingId,
      int? reviewId,
      int? doctorRecommentation,
      int? userComments});
}
