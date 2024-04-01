import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Model/HealthRecord/GetDischageSummaryById/get_discharge_summary_by_id_model.dart';
import 'package:mediezy_user/Repository/Api/HealthRecords/health_record_api.dart';
part 'get_discharge_summary_by_id_dart_event.dart';
part 'get_discharge_summary_by_id_dart_state.dart';

class GetDischargeSummaryByIdDartBloc extends Bloc<
    GetDischargeSummaryByIdDartEvent, GetDischargeSummaryByIdDartState> {
  HealthRecordApi healthRecordApi = HealthRecordApi();
  GetDischargeSummaryByIdDartBloc()
      : super(GetDischargeSummaryByIdDartInitial()) {
    on<FetchDischargeSummaryById>(_onGetDischargeSummaryById);
  }

  void _onGetDischargeSummaryById(
      FetchDischargeSummaryById event, Emitter emit) async {
    emit(GetDischargeSummaryByIdDartLoading());
    try {
      final dischageSummaryById = await healthRecordApi
          .getUploadedDischageSummaryPerId(documentId: event.documentId);
      emit(GetDischargeSummaryByIdDartLoaded(
          getDischageSummaryByIdModel: dischageSummaryById));
    } catch (e) {
      emit(GetDischargeSummaryByIdDartError(errorMessage: e.toString()));
    }
  }
}
