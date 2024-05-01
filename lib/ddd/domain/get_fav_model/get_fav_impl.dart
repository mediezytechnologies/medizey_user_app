import 'package:dartz/dartz.dart';
import 'package:mediezy_user/ddd/domain/get_fav_model/model/favorite_doctor.dart';
import 'package:mediezy_user/ddd/domain/get_fav_model/model/get_fav_model.dart';
import '../error_model/error_model.dart';

abstract class GetFavDoctersRepo {
  Future<Either<ErrorModel, List<FavoriteDoctor>>> getFavDocRepo();
}
