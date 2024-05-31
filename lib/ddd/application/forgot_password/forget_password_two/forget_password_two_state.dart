part of 'forget_password_two_bloc.dart';

@freezed
class ForgetPasswordTwoState with _$ForgetPasswordTwoState {
  const factory ForgetPasswordTwoState({
    required bool isloding,
    required bool isError,
    required String message,
    required bool status,
    OtpVerfiedModel? otpVerfiedModel,
  }) = _Initial;

  factory ForgetPasswordTwoState.initial() => const ForgetPasswordTwoState(
        isloding: false,
        isError: false,
        message: '',
        status: false,
      );
}
