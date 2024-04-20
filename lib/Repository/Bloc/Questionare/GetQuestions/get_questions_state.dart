part of 'get_questions_bloc.dart';

@immutable
sealed class GetQuestionsState {}

final class GetQuestionsInitial extends GetQuestionsState {}

class GetQuestionsLoading extends GetQuestionsState {}

class GetQuestionsLoaded extends GetQuestionsState {
  final GetQuestionModel getQuestionModel;

  GetQuestionsLoaded({required this.getQuestionModel});
}

class GetQuestionsError extends GetQuestionsState {
  final String errorMessage;

  GetQuestionsError({required this.errorMessage});
}
