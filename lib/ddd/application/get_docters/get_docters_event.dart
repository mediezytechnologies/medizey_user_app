part of 'get_docters_bloc.dart';

@freezed
class GetDoctersEvent with _$GetDoctersEvent {
  const factory GetDoctersEvent.started(bool isLoading) = _Started;
  const factory GetDoctersEvent.changeFav(int favId) = _ChangeFav;
  // const factory GetDoctersEvent.getDoctersForcedEvent() =
  //     _GetDoctersForcedEvent;
}
