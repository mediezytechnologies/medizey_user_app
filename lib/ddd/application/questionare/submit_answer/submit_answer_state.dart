part of 'submit_answer_bloc.dart';

@freezed
class SubmitAnswerState with _$SubmitAnswerState {
  const factory SubmitAnswerState(
      {required bool isloding,
      required bool isError,
      required String message,
      required bool status,
      SubmitAnswerModel? model}) = _Initial;

  factory SubmitAnswerState.initial() => const SubmitAnswerState(
      isloding: false, isError: false, message: '', status: false);
}
