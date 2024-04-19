part of 'user_location_bloc.dart';

@freezed
class UserLocationState with _$UserLocationState {
  const factory UserLocationState({
    required bool isloding,
    UserLocationModel? model,
    required bool isError,
    required String message,
    required bool status,
  }) = _Initial;
  factory UserLocationState.initial() => const UserLocationState(
      isloding: false, isError: false, message: '', status: false);
}
