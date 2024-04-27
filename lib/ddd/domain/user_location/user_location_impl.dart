import 'package:dartz/dartz.dart';
import '../error_model/error_model.dart';
import 'model/user_location_model.dart';

abstract class UserLocationRepo {
  Future<Either<ErrorModel, UserLocationModel?>> userLocation(
    String latitude,
    String longitude,
    String district,
    String city,
    String locationAddress,
  );
}
