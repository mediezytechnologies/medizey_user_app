import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mediezy_user/Model/Questionare/get_question_model.dart';
import 'package:mediezy_user/Repository/Api/Questionare/questionare_api.dart';
part 'get_questions_event.dart';
part 'get_questions_state.dart';

class GetQuestionsBloc extends Bloc<GetQuestionsEvent, GetQuestionsState> {
  QuestionareApi questionareApi = QuestionareApi();
  GetQuestionsBloc() : super(GetQuestionsInitial()) {
    on<FetchQuestion>((event, emit) async {
      emit(GetQuestionsLoading());
      try {
        final question =
            await questionareApi.getQuestions(symptomId: event.symptomId);
        emit(
          GetQuestionsLoaded(getQuestionModel: question),
        );
      } catch (e) {
        emit(
          GetQuestionsError(
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }
}
