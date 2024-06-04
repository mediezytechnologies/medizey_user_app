// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/error_model/error_model.dart';
import 'package:mediezy_user/ddd/domain/questionare/get_questions_model/get_questions_model.dart';
import 'package:mediezy_user/ddd/domain/questionare/get_symptom_model/datum.dart';
import 'package:mediezy_user/ddd/domain/questionare/questionare_repository.dart';
import 'package:mediezy_user/ddd/domain/questionare/submit_answer_model/submit_answer_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/questionare/get_questions_model/question_data.dart';
import '../../domain/questionare/get_symptom_model/get_symptom_model.dart';
import '../core/api_end_pont.dart';

@LazySingleton(as: QuestionareRepository)
class QuestionareRepoImpl implements QuestionareRepository {
  @override
  Future<Either<ErrorModel, List<Datum>>> getSymptomRepo() async {
    final preference = await SharedPreferences.getInstance();
    String? token =
        preference.getString('token') ?? preference.getString('tokenD');
    try {
      final response = await Dio(BaseOptions(
        headers: {'Authorization': 'Bearer $token'},
        contentType: 'application/json',
      )).get(
        ApiEndPoints.questionareGetSymptoms,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = GetSymptomModel.fromJson(response.data);
        return Right(result.data!);
      } else {
        return Left(ErrorModel());
      }
    } on DioError catch (e) {
      final err = ErrorModel.fromJson(e.response!.data);
      return Left(err);
    }
  }

  @override
  Future<Either<ErrorModel, List<QuestionData>>> getQuestionRepo(
      String symptomId) async {
    final preference = await SharedPreferences.getInstance();
    String? token =
        preference.getString('token') ?? preference.getString('tokenD');

    try {
      final response = await Dio(BaseOptions(
        headers: {'Authorization': 'Bearer $token'},
        contentType: 'application/json',
      )).post(
        ApiEndPoints.getQuestions,
        data: {
          "symptom_id": symptomId,
        },
      );
      final result = GetQuestionsModel.fromJson(response.data);
      return Right(result.data!);
    } on DioError catch (e) {
      final err = ErrorModel.fromJson(e.response!.data);

      return Left(err);
    }
  }

  @override
  Future<Either<ErrorModel, SubmitAnswerModel>> submitAnswerRepo(
      String questionId, String selectedOption) async {
    final preference = await SharedPreferences.getInstance();
    String? token =
        preference.getString('token') ?? preference.getString('tokenD');
    String userId = preference.getString('userId').toString();
    try {
      final response = await Dio(BaseOptions(
        headers: {'Authorization': 'Bearer $token'},
        contentType: 'application/json',
      )).post(
        ApiEndPoints.submitAnswer,
        data: {
          "user_id": userId,
          "selected_option": selectedOption,
          "question_id": questionId
        },
      );
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SubmitAnswerModel.fromJson(response.data);
        return Right(result);
      } else {
        return Left(ErrorModel());
      }
    } on DioError catch (e) {
      final err = ErrorModel.fromJson(e.response!.data);

      return Left(err);
    }
  }
}
