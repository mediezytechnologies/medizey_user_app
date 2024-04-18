import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mediezy_user/Model/HealthRecord/GetVitals/get_vitals_model.dart';
import 'package:mediezy_user/Repository/Api/HealthRecords/health_record_api.dart';
part 'get_vitals_event.dart';
part 'get_vitals_state.dart';

class GetVitalsBloc extends Bloc<GetVitalsEvent, GetVitalsState> {
  HealthRecordApi healthRecordApi = HealthRecordApi();
  GetVitalsBloc() : super(GetVitals()) {
    on<FetchVitals>((event, emit) async {
      emit(GetVitalsLoading());
      try {
        final getVitalsModel =
            await healthRecordApi.getVitals(patientId: event.patientId);
        emit(GetVitalsLoaded(getVitalsModel: getVitalsModel));
      } catch (error) {
        emit(GetVitalsError(errorMessage: error.toString()));
      }
    });
  }
}
