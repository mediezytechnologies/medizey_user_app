import 'package:dartz/dartz.dart';
import 'package:mediezy_user/ddd/domain/rating/model/user_rating.dart';
import '../error_model/error_model.dart';

abstract class RatingRepository {
  Future<Either<ErrorModel, List<UserRating>>> getRatingRepo(
      {required String ratingText});
}
