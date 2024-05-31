part of 'forget_password_two_bloc.dart';

@freezed
class ForgetPasswordTwoEvent with _$ForgetPasswordTwoEvent {
const factory ForgetPasswordTwoEvent.otpVerification({required String otp}) =
      _OtpVerification;
}