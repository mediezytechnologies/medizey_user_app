import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Model/HealthRecord/GetUploadedDischargeSummary/get_uploaded_discharge_summary_model.dart';
import 'package:mediezy_user/Repository/Api/HealthRecords/health_record_api.dart';
part 'get_uploaded_discharge_summary_event.dart';
part 'get_uploaded_discharge_summary_state.dart';

class GetUploadedDischargeSummaryBloc extends Bloc<
    GetUploadedDischargeSummaryEvent, GetUploadedDischargeSummaryState> {
  HealthRecordApi healthRecordApi = HealthRecordApi();
  GetUploadedDischargeSummaryBloc()
      : super(GetUploadedDischargeSummaryInitial()) {
    on<FetchGetUploadedDischargeSummary>((event, emit) async {
      emit(GetUploadedDischargeSummaryLoading());
      try {
        final getUploadedDischargeSummaryModel = await healthRecordApi
            .getAllUploadedDischargeSummary(patientId: event.patientId);
        emit(GetUploadedDischargeSummaryLoaded(
            getUploadedDischargeSummaryModel:
                getUploadedDischargeSummaryModel));
      } catch (e) {
        print("<<<<<<<<<<GetAllDischargeSummaryError>>>>>>>>>>" + e.toString());
        emit(GetUploadedDischargeSummaryError(errorMessage: e.toString()));
      }
    });
  }
}
