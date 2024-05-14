import 'package:dartz/dartz.dart';
import '../error_model/error_model.dart';
import 'model/add_rating_model/add_rating_model.dart';
import 'model/get_rating_model/user_rating.dart';

abstract class RatingRepository {
  Future<Either<ErrorModel, List<UserRating>>> getRatingRepo(
      {required String ratingText});
  Future<Either<ErrorModel, AddRatingModel>> addRatingRepo(
      {required String appointmentId,
      required String rating,
      String? ratingId,
      String? reviewId,
      int? doctorRecommentation,
      int? userComments});
}
