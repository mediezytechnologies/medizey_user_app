part of 'submit_answer_bloc.dart';

@freezed
class SubmitAnswerEvent with _$SubmitAnswerEvent {
  const factory SubmitAnswerEvent.started(
    String questionId,
    String selectAnswer,
  ) = _Started;
}
