
import 'package:dartz/dartz.dart';
import '../error_model/error_model.dart';

abstract class FccmTokenRepo {
  Future<Either<ErrorModel, dynamic>> fcmTokenData(
    );
}
