part of 'get_docters_bloc.dart';

@freezed
class GetDoctersEvent with _$GetDoctersEvent {
  const factory GetDoctersEvent.started() = _Started;
}