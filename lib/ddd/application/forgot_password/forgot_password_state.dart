part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState(
      {required bool forgetPasswordisloding,
      required bool forgetPasswordisError,
      required String forgetPasswordmessage,
      required bool forgetPasswordstatus,
      ForgotPasswordModel? forgotPasswordModel,
      required bool otpVerfiedisloding,
      required bool otpVerfiedisError,
      required String otpVerfiedmessage,
      required bool otpVerfiedstatus,
      OtpVerfiedModel? otpVerfiedModel,
      required bool successPasswordisloding,
      required bool successPasswordisError,
      required String successPasswordmessage,
      required bool successPasswordstatus,
      SuccessPasswordModel? successPasswordModel}) = _Initial;

  factory ForgotPasswordState.initial() => const ForgotPasswordState(
      forgetPasswordisloding: false,
      forgetPasswordisError: false,
      forgetPasswordmessage: '',
      forgetPasswordstatus: false,
      otpVerfiedisloding: false,
      otpVerfiedisError: false,
      otpVerfiedmessage: '',
      otpVerfiedstatus: false,
      successPasswordisloding: false,
      successPasswordisError: false,
      successPasswordmessage: '',
      successPasswordstatus: false);
}
