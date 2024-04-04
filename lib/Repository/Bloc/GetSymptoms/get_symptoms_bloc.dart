// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:bloc/bloc.dart';
import 'package:mediezy_user/Model/GetSymptoms/get_symptoms_model.dart';
import 'package:mediezy_user/Repository/Api/GetToken/get_token_api.dart';
import 'package:meta/meta.dart';
part 'get_symptoms_event.dart';
part 'get_symptoms_state.dart';

class GetSymptomsBloc extends Bloc<GetSymptomsEvent, GetSymptomsState> {
  late GetSymptomsModel getSymptomsModel;
  GetTokenApi getTokenApi = GetTokenApi();
  GetSymptomsBloc() : super(GetSymptomsInitial()) {
    on<FetchSymptoms>((event, emit) async {
      emit(GetSymptomsLoading());
      try {
        getSymptomsModel =
            await getTokenApi.getSymptoms(doctorId: event.doctorId);
        emit(GetSymptomsLoaded());
      } catch (error) {
        print("<<<<< GET SYMPTOMS ERROR : $error >>>>>");
        emit(GetSymptomsError());
      }
    });
  }
}
