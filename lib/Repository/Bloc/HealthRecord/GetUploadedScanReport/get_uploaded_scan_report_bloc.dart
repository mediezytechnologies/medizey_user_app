import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Model/HealthRecord/GetUploadedScanReport/get_uploaded_scan_report_model.dart';
import 'package:mediezy_user/Repository/Api/HealthRecords/health_record_api.dart';
part 'get_uploaded_scan_report_event.dart';
part 'get_uploaded_scan_report_state.dart';

class GetUploadedScanReportBloc
    extends Bloc<GetUploadedScanReportEvent, GetUploadedScanReportState> {
  HealthRecordApi healthRecordApi = HealthRecordApi();
  GetUploadedScanReportBloc() : super(GetUploadedScanReportInitial()) {
    on<FetchGetUploadedScanReport>((event, emit) async {
      emit(GetUploadedScanReportLoading());
      try {
        final getUploadedScanReportModel = await healthRecordApi
            .getAllUploadedScanReports(patientId: event.patientId);
        emit(GetUploadedScanReportLoaded(
            getUploadedScanReportModel: getUploadedScanReportModel));
      } catch (e) {
        print("<<<<<<<<<<GetAllUploadedScanReportsError>>>>>>>>>>" +
            e.toString());
        emit(GetUploadedScanReportError(errorMessage: e.toString()));
      }
    });
  }
}
