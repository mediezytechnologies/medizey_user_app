part of 'get_questions_bloc.dart';

@immutable
sealed class GetQuestionsEvent {}

class FetchQuestion extends GetQuestionsEvent {
  final String symptomId;

  FetchQuestion({required this.symptomId});
}
