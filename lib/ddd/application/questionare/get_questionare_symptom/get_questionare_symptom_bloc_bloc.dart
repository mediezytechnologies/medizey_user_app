import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/questionare/get_symptom_model/datum.dart';
import '../../../domain/questionare/questionare_repository.dart';
part 'get_questionare_symptom_bloc_event.dart';
part 'get_questionare_symptom_bloc_state.dart';
part 'get_questionare_symptom_bloc_bloc.freezed.dart';

@injectable
class GetQuestionareSymptomBlocBloc extends Bloc<GetQuestionareSymptomBlocEvent,
    GetQuestionareSymptomBlocState> {
  QuestionareRepository questionareRepository;
  GetQuestionareSymptomBlocBloc(this.questionareRepository)
      : super(GetQuestionareSymptomBlocState.initial()) {
    on<GetQuestionareSymptomBlocEvent>((event, emit) {
       on<_Started>((event, emit) async {
      emit(
        const GetQuestionareSymptomBlocState(
            isloding: true,
            model: [],
            isError: false,
            message: '',
            status: false),
      );
      final getSymptomResult = await questionareRepository.getSymptomRepo();
      emit(getSymptomResult.fold(
          (l) => state.copyWith(
                isloding: false,
                isError: true,
                message: l.message!,
                model: [],
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
    });
  }
}
