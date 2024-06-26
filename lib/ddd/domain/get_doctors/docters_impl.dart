import 'package:dartz/dartz.dart';
import 'package:mediezy_user/ddd/domain/get_doctors/model/all_doctor.dart';
import '../error_model/error_model.dart';

abstract class GetDoctersRepo {
  Future<Either<ErrorModel, List<AllDoctor>>> getDoctersRepo();
}
