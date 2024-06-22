import 'package:dartz/dartz.dart';
import '../error_model/error_model.dart';
import 'model/get_banner_model.dart';

abstract class GetBannerRepository {
  Future<Either<ErrorModel, GetBannerModel>> getBannerRepo(String bannerId);
}