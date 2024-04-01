import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Repository/Api/HealthRecords/health_record_api.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';

part 'delete_medicine_event.dart';
part 'delete_medicine_state.dart';

class DeleteMedicineBloc
    extends Bloc<DeleteMedicineEvent, DeleteMedicineState> {
  late String deleteSuccessfullyMessage;
  HealthRecordApi healthRecordApi = HealthRecordApi();
  DeleteMedicineBloc() : super(DeleteMedicineInitial()) {
    on<FetchDeleteMedicineEvent>((event, emit) async {
      emit(DeleteMedicineLoading());
      try {
        deleteSuccessfullyMessage = await healthRecordApi.deleteMedicine(
            medicineId: event.medicineId, patientId: event.patientId);
        Map<String, dynamic> data = jsonDecode(deleteSuccessfullyMessage);
        GeneralServices.instance.showToastMessage(data['response']);
        emit(DeleteMedicineLoaded());
      } catch (e) {
        print("<<<<<Delete medicine error>>>>");
        emit(DeleteMedicineError());
      }
    });
  }
}
