part of 'get_docters_bloc.dart';

@freezed
class GetDoctersEvent with _$GetDoctersEvent {
  const factory GetDoctersEvent.started(
    
      bool isLoadingNeed) = _Started;

  const factory GetDoctersEvent.changeFav(int favId) = _ChangeFav;
}
