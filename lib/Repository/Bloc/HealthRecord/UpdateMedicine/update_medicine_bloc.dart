import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Repository/Api/HealthRecords/health_record_api.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
part 'update_medicine_event.dart';
part 'update_medicine_state.dart';

class UpdateMedicineBloc
    extends Bloc<UpdateMedicineEvent, UpdateMedicineState> {
  late String updateSuccessfullyMessage;
  HealthRecordApi healthRecordApi = HealthRecordApi();
  UpdateMedicineBloc() : super(UpdateMedicineInitial()) {
    on<FetchUpdateMedicine>((event, emit) async {
      emit(UpdateMedicineLoading());
      try {
        updateSuccessfullyMessage = await healthRecordApi.updateMedcine(
            medicineId: event.medicineId,
            patientId: event.parientId,
            illnessName: event.illnessName,
            medicineName: event.medicineName);
        Map<String, dynamic> data = jsonDecode(updateSuccessfullyMessage);
        GeneralServices.instance.showToastMessage(data['response']);
        emit(UpdateMedicineLoaded());
      } catch (e) {
        emit(
          UpdateMedicineError(),
        );
      }
    });
  }
}
