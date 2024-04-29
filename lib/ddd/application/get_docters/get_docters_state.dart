part of 'get_docters_bloc.dart';

@freezed
class GetDoctersState with _$GetDoctersState {
  const factory GetDoctersState({
    required bool isloding,
    required List<AllDoctor> model,
    required bool isError,
    required String message,
    required bool status,
    required int favId
  }) = _Initial;
  factory GetDoctersState.initial() => GetDoctersState(
      isloding: false, isError: false, message: '', status: false, model: [], favId: 0,);
}
