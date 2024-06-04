part of 'get_questionare_symptom_bloc_bloc.dart';

@freezed
class GetQuestionareSymptomBlocState with _$GetQuestionareSymptomBlocState {
  const factory GetQuestionareSymptomBlocState({
     required bool isloding,
    required List<Datum> model,
    required bool isError,
    required String message,
    required bool status,
  }) = _Initial;

   factory GetQuestionareSymptomBlocState.initial() => const GetQuestionareSymptomBlocState(
        isloding: false,
        isError: false,
        message: '',
        status: false,
        model: [],
      );
}
