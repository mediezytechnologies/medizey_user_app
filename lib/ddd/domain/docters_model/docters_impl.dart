import 'package:dartz/dartz.dart';
import 'package:mediezy_user/ddd/domain/docters_model/model/docters_model.dart';
import '../error_model/error_model.dart';

abstract class GetDoctersRepo {
  Future<Either<ErrorModel, DoctersModel?>> getDoctersRepo();
}
