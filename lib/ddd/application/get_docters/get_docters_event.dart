part of 'get_docters_bloc.dart';

@freezed
class GetDoctersEvent with _$GetDoctersEvent {
  const factory GetDoctersEvent.started() = _Started;
  const factory GetDoctersEvent.changeFav(int favId) = _ChangeFav;
  const factory GetDoctersEvent.getDoctersForcedEvent() = _GetDoctersForcedEvent;
}
