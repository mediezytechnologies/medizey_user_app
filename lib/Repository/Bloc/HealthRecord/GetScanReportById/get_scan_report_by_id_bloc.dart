import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Model/HealthRecord/GetScanReportById/get_Scan_report_by_id_model.dart';
import 'package:mediezy_user/Repository/Api/HealthRecords/health_record_api.dart';
part 'get_scan_report_by_id_event.dart';
part 'get_scan_report_by_id_state.dart';

class GetScanReportByIdBloc
    extends Bloc<GetScanReportByIdEvent, GetScanReportByIdState> {
  HealthRecordApi healthRecordApi = HealthRecordApi();
  GetScanReportByIdBloc() : super(GetScanReportByIdInitial()) {
    on<FetchScanReportById>(_onFetchUploadedScanReportById);
  }

  void _onFetchUploadedScanReportById(
      FetchScanReportById event, Emitter emit) async {
    emit(GetScanReportByIdLoading());
    try {
      final getScanReportById = await healthRecordApi
          .getUploadedScanReportPerId(documentId: event.documentId);
      emit(GetScanReportByIdLoaded(getScanReporyByIdModel: getScanReportById));
    } catch (e) {
      emit(GetScanReportByIdError(errorMessage: e.toString()));
    }
  }
}
