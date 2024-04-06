import 'package:bloc/bloc.dart';
import 'package:mediezy_user/Repository/Api/HealthRecords/health_record_api.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/bloc/get_updated_medicine_event.dart';
import 'package:mediezy_user/Repository/Bloc/HealthRecord/bloc/get_updated_medicine_state.dart';




class GetUpdatedMedicineBloc
    extends Bloc<GetUpdatedMedicineEvent, GetUpdatedMedicineState> {
  HealthRecordApi healthRecordApi = HealthRecordApi();
  GetUpdatedMedicineBloc() : super(GetUpdatedMedicine()) {
    on<GetFetchUpdatedMedicineEvent>((event, emit) async {
      emit(GetUpdatedMedicineLoading());
      try {
        final getUpdatedMedicineModel = await healthRecordApi
            .getUpdatedMedicine(patientId: event.patientId);
        emit(GetUpdatedMedicineLoaded(
            getUpdatedMedicineModel: getUpdatedMedicineModel));
      } catch (error) {
        print("<<<<<<<<<<<<<get updated medicine  error>>>>>>");
        emit(GetUpdatedMedicineError(errorMessage: error.toString()));
      }
    });
  }
}
