part of 'forget_password_three_bloc.dart';

@freezed
class ForgetPasswordThreeEvent with _$ForgetPasswordThreeEvent {
 const factory ForgetPasswordThreeEvent.successPassword(
      {required String newPassword}) = _SuccessPassword;
}