part of 'notificatio_token_bloc.dart';

@freezed
class NotificatioTokenEvent with _$NotificatioTokenEvent {
  const factory NotificatioTokenEvent.started() = _Started;
}