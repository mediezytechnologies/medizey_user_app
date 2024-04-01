// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Model/GetAppointments/get_completed_appointments_model.dart';
import 'package:mediezy_user/Repository/Api/HealthRecords/health_record_api.dart';
part 'get_completed_appointmets_by_patient_id_event.dart';
part 'get_completed_appointmets_by_patient_id_state.dart';

class GetCompletedAppointmetsByPatientIdBloc extends Bloc<
    GetCompletedAppointmetsByPatientIdEvent,
    GetCompletedAppointmetsByPatientIdState> {
  HealthRecordApi healthRecordApi = HealthRecordApi();
  GetCompletedAppointmetsByPatientIdBloc()
      : super(GetCompletedAppointmetsByPatientIdInitial()) {
    on<FetchCompletedAppointmentsByPatientId>((event, emit) async {
      emit(GetCompletedAppointmetsByPatientIdLoading());
      try {
        final getCompletedAppointmentsModel = await healthRecordApi
            .getCompletedAppointmentByPatientId(patienId: event.patientId);
        emit(GetCompletedAppointmetsByPatientIdLoaded(
            getCompletedAppointmentsModel: getCompletedAppointmentsModel));
      } catch (error) {
        print(
            "<<<<<<<<<<GET COMPLETED APPOINTMENTS BY PATIENT ID ERROR>>>>>>>>>>$error");
        emit(GetCompletedAppointmetsByPatientIdError(
            errorMessage: error.toString()));
      }
    });
  }
}
