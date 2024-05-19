part of 'notificatio_token_bloc.dart';

@freezed
class NotificatioTokenState with _$NotificatioTokenState {
  const factory NotificatioTokenState({
    required bool isloding,
    required bool isError,
    required String message,
    required bool status,
  }) = _Initial;
  factory NotificatioTokenState.initial() => NotificatioTokenState(
      isloding: false, isError: false, message: "", status: false);
}
