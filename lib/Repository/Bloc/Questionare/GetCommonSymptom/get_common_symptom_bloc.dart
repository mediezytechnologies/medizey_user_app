import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mediezy_user/Model/Questionare/common_symptom_model.dart';
import 'package:mediezy_user/Repository/Api/Questionare/questionare_api.dart';
part 'get_common_symptom_event.dart';
part 'get_common_symptom_state.dart';

class GetCommonSymptomBloc
    extends Bloc<GetCommonSymptomEvent, GetCommonSymptomState> {
  QuestionareApi questionareApi = QuestionareApi();
  GetCommonSymptomBloc() : super(GetCommonSymptomInitial()) {
    on<FetchCommonSymptoms>((event, emit) async {
      emit(GetCommonSymptomLoading());
      try {
        final commonSymptom = await questionareApi.getCommonSymtoms();
        emit(
          GetCommonSymptomLoaded(commonSymptomModel: commonSymptom),
        );
      } catch (e) {
        emit(
          GetCommonSymptomError(
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }
}
