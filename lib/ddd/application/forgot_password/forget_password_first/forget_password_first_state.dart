part of 'forget_password_first_bloc.dart';

@freezed
class ForgetPasswordFirstState with _$ForgetPasswordFirstState {
  const factory ForgetPasswordFirstState({
    required bool isloding,
    required bool isError,
    required String message,
    required bool status,
    ForgotPasswordModel? forgotPasswordModel,
  }) = _Initial;

  factory ForgetPasswordFirstState.initial() => const ForgetPasswordFirstState(
        isloding: false,
        isError: false,
        message: '',
        status: false,
      );
}
