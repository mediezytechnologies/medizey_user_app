import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/questionare/get_questions_model/question_data.dart';
import '../../../domain/questionare/questionare_repository.dart';
part 'get_questions_event.dart';
part 'get_questions_state.dart';
part 'get_questions_bloc.freezed.dart';

@injectable
class GetQuestionsBloc extends Bloc<GetQuestionsEvent, GetQuestionsState> {
  QuestionareRepository questionareRepository;
  GetQuestionsBloc(this.questionareRepository)
      : super(GetQuestionsState.initial()) {
    on<_GetQuestions>((event, emit) async {
      emit(
        const GetQuestionsState(
            isloding: true,
            isError: false,
            message: '',
            status: false,
            model: [],
           ),
      );
      final getQuestionResult =
          await questionareRepository.getQuestionRepo(event.symptomId);
      emit(getQuestionResult.fold(
          (l) => state.copyWith(
              isloding: false,
              isError: true,
              message: l.message!,
              status: false,
              model: []), (r) {
        return state.copyWith(
          isloding: false,
          isError: false,
          message: state.message,
          status: state.status,
          model: r,
        );
      }));
    });

   
  }
}
