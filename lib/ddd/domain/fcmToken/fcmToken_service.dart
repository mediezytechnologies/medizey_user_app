// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import '../error_model/error_model.dart';

abstract class FccmTokenRepo {
  Future<Either<ErrorModel, dynamic>> fcmTokenData(
    );
}
