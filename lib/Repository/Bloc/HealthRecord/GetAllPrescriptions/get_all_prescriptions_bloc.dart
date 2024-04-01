import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Model/HealthRecord/GetUploadedPrescriptions/get_uploaded_prescription_model.dart';
import 'package:mediezy_user/Repository/Api/HealthRecords/health_record_api.dart';
part 'get_all_prescriptions_event.dart';
part 'get_all_prescriptions_state.dart';

class GetAllPrescriptionsBloc
    extends Bloc<GetAllPrescriptionsEvent, GetAllPrescriptionsState> {
  HealthRecordApi healthRecordApi = HealthRecordApi();
  GetAllPrescriptionsBloc() : super(GetAllPrescriptionsInitial()) {
    on<FetchUploadedPrescriptions>((event, emit) async {
      emit(GetAllPrescriptionsLoading());
      try {
        final getUploadedPrescriptionModel = await healthRecordApi
            .getAllUploadedPrescriptions(patientId: event.patientId);
        emit(GetAllPrescriptionsLoaded(
            getUploadedPrescriptionModel: getUploadedPrescriptionModel));
      } catch (error) {
        print("<<<<<<<<<<GetAllUploadedPrescriptionsError>>>>>>>>>>" +
            error.toString());
        emit(GetAllPrescriptionsError(errorMessage: error.toString()));
      }
    });
  }
}
