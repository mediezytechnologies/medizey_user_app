import 'package:dartz/dartz.dart';
import 'package:mediezy_user/ddd/domain/error_model/error_model.dart';

import 'model/firebase_login_model/firebase_login_model.dart';

abstract class AddFirebaseLogin {
  Future<Either<ErrorModel, FirebaseLoginModel?>> addFirebaseLogin(
    String phoneNumber,
  );
}
