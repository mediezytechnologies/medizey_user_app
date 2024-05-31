part of 'forget_password_first_bloc.dart';

@freezed
class ForgetPasswordFirstEvent with _$ForgetPasswordFirstEvent {
  const factory ForgetPasswordFirstEvent.forgetPassword({required String email}) =
      _ForgetPassword;

}