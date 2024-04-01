import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Model/HealthRecord/GetUploadedLabTest/get_uploaded_lab_test_model.dart';
import 'package:mediezy_user/Repository/Api/HealthRecords/health_record_api.dart';
part 'get_uploaded_lab_report_event.dart';
part 'get_uploaded_lab_report_state.dart';

class GetUploadedLabReportBloc
    extends Bloc<GetUploadedLabReportEvent, GetUploadedLabReportState> {
  HealthRecordApi healthRecordApi = HealthRecordApi();
  GetUploadedLabTestModel getUploadedLabTestModel = GetUploadedLabTestModel();
  GetUploadedLabReportBloc() : super(GetUploadedLabReportInitial()) {
    on<FetchGetUploadedLabReport>((event, emit) async {
      emit(GetUploadedLabReportLoading());
      try {
        final getUploadedLabTestModel = await healthRecordApi
            .getAllUploadedLabReports(patientId: event.patientId);
        emit(GetUploadedLabReportLoaded(
            getUploadedLabTestModel: getUploadedLabTestModel));
      } catch (e) {
        print(
            "<<<<<<<<<<GetAllUploadedLabReportsError>>>>>>>>>>" + e.toString());
        emit(GetUploadedLabReportError(errorMessage: e.toString()));
      }
    });
  }
}
