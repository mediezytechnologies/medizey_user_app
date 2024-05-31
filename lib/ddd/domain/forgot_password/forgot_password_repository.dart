import 'package:dartz/dartz.dart';
import '../error_model/error_model.dart';
import 'forgot_password_model/forgot_password_model.dart';
import 'otp_verfied_model/otp_verfied_model.dart';
import 'success_password_model/success_password_model.dart';

abstract class ForgotPasswordRepository {
  Future<Either<ErrorModel, ForgotPasswordModel>> forgotPasswordRepo(
      String email);
  Future<Either<ErrorModel, OtpVerfiedModel>> otpVerficationRepo(String otp);
  Future<Either<ErrorModel, SuccessPasswordModel>> successPasswordRepo(String newPassword);
}
