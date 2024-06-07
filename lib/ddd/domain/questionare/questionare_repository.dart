import 'package:dartz/dartz.dart';
import 'package:mediezy_user/ddd/domain/error_model/error_model.dart';
import 'get_questions_model/question_data.dart';
import 'get_symptom_model/datum.dart';
import 'submit_answer_model/submit_answer_model.dart';

abstract class QuestionareRepository {
  Future<Either<ErrorModel, List<Datum>>> getSymptomRepo();
  Future<Either<ErrorModel, List<QuestionData>>> getQuestionRepo(
      String symptomId);
  Future<Either<ErrorModel, SubmitAnswerModel>> submitAnswerRepo(
      String questionId, String selectedOption);
}
