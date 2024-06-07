part of 'get_questions_bloc.dart';

@freezed
class GetQuestionsState with _$GetQuestionsState {
  const factory GetQuestionsState({
    required bool isloding,
    required bool isError,
    required String message,
    required bool status,
    required List<QuestionData> model,
  }) = _Initial;

  factory GetQuestionsState.initial() => const GetQuestionsState(
        isloding: false,
        isError: false,
        message: '',
        status: false,
        model: [],
      );
}
