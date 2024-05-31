part of 'forget_password_three_bloc.dart';

@freezed
class ForgetPasswordThreeState with _$ForgetPasswordThreeState {
  const factory ForgetPasswordThreeState({
    required bool isloding,
    required bool isError,
    required String message,
    required bool status,
    SuccessPasswordModel? successPasswordModel,
  }) = _Initial;

  factory ForgetPasswordThreeState.initial() => const ForgetPasswordThreeState(
        isloding: false,
        isError: false,
        message: '',
        status: false,
      );
}
