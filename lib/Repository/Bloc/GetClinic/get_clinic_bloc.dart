import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Model/GetClinic/get_clinic_model.dart';
import 'package:mediezy_user/Repository/Api/GetClinic/get_clinic_api.dart';

part 'get_clinic_event.dart';
part 'get_clinic_state.dart';

class GetClinicBloc extends Bloc<GetClinicEvent, GetClinicState> {
  GetClinicModel getClinicModel = GetClinicModel();
  GetClinicApi getClinicApi = GetClinicApi();
  GetClinicBloc() : super(GetClinicInitial()) {
    on<FetchClinicByDoctorIdEvent>((event, emit) async {
      emit(GetClinicLoading());
      try {
        getClinicModel =
            await getClinicApi.getClinicByDoctor(doctorId: event.doctorId);
        emit(GetClinicLoaded());
      } catch (error) {
        emit(GetClinicError(errorMessage: error.toString()));
      }
    });
  }
}
