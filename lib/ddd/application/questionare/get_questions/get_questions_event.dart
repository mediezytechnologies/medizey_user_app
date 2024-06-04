part of 'get_questions_bloc.dart';

@freezed
class GetQuestionsEvent with _$GetQuestionsEvent {
  const factory GetQuestionsEvent.getQuestions(String symptomId) =
      _GetQuestions;
  
}
