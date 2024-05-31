part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordEvent with _$ForgotPasswordEvent {
  const factory ForgotPasswordEvent.forgetPassword({required String email}) =
      _ForgetPassword;

  const factory ForgotPasswordEvent.otpVerification({required String otp}) =
      _OtpVerification;

  const factory ForgotPasswordEvent.successPassword(
      {required String newPassword}) = _SuccessPassword;
}
