part of 'get_docters_bloc.dart';

@freezed
class GetDoctersEvent with _$GetDoctersEvent {
  const factory GetDoctersEvent.started(
      // required int favId
      ) = _Started;

  const factory GetDoctersEvent.changeFav(int favId) = _ChangeFav;
}
