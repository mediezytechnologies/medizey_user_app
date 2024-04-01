import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Model/HealthRecord/GetLabReportById/get_lab_report_by_id_model.dart';
import 'package:mediezy_user/Repository/Api/HealthRecords/health_record_api.dart';
part 'get_lab_report_by_id_event.dart';
part 'get_lab_report_by_id_state.dart';

class GetLabReportByIdBloc
    extends Bloc<GetLabReportByIdEvent, GetLabReportByIdState> {
  HealthRecordApi healthRecordApi = HealthRecordApi();
  GetLabReportByIdBloc() : super(GetLabReportByIdInitial()) {
    on<FetchUploadedLabReportByIdEvent>(_onFetchUploadedLabReportById);
  }

  void _onFetchUploadedLabReportById(
      FetchUploadedLabReportByIdEvent event, Emitter emit) async {
    emit(GetLabReportByIdLoading());
    try {
      final scanReportById = await healthRecordApi.getUploadedLabReportPerId(
          documentId: event.documentId);
      emit(GetLabReportByIdLoaded(
          getUploadedLabReportByIdModel: scanReportById));
    } catch (e) {
      emit(GetLabReportByIdError(errorMessage: e.toString()));
    }
  }
}
