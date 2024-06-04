import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/questionare/questionare_repository.dart';
import '../../../domain/questionare/submit_answer_model/submit_answer_model.dart';
part 'submit_answer_event.dart';
part 'submit_answer_state.dart';
part 'submit_answer_bloc.freezed.dart';

@injectable
class SubmitAnswerBloc extends Bloc<SubmitAnswerEvent, SubmitAnswerState> {
  QuestionareRepository questionareRepository;
  SubmitAnswerBloc(this.questionareRepository)
      : super(SubmitAnswerState.initial()) {
    on<_Started>((event, emit) async {
      emit(
        const SubmitAnswerState(
            isloding: true, isError: false, message: "", status: false),
      );
      final getSubmitAnswerResult = await questionareRepository
          .submitAnswerRepo(event.questionId, event.selectAnswer);
      emit(getSubmitAnswerResult.fold(
          (l) => state.copyWith(
                isloding: false,
                isError: true,
                message: l.message!,
                status: false,
              ), (r) {
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
