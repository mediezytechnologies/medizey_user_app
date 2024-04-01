// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:mediezy_user/Model/Hospital/get_hospital_doctor_by_specialisation_model.dart';
import 'package:mediezy_user/Repository/Api/Hospital/hospital_api.dart';
import 'package:meta/meta.dart';
part 'get_hospital_doctor_by_specialisation_event.dart';
part 'get_hospital_doctor_by_specialisation_state.dart';

class GetHospitalDoctorBySpecialisationBloc extends Bloc<
    GetHospitalDoctorBySpecialisationEvent,
    GetHospitalDoctorBySpecialisationState> {
  late GetHospitalDoctorBySpecialisationModel
      getHospitalDoctorBySpecialisationModel;
  HospitalApi hospitalApi = HospitalApi();
  GetHospitalDoctorBySpecialisationBloc()
      : super(GetHospitalDoctorBySpecialisationInitial()) {
    on<FetchHospitalDoctorBySpecialisation>((event, emit) async {
      try {
        emit(GetHospitalDoctorBySpecialisationLoading());
        getHospitalDoctorBySpecialisationModel =
            await hospitalApi.getHospitalDoctorBySpecialisation(
                event.specialisationId, event.clinicId);
        emit(GetHospitalDoctorBySpecialisationLoaded());
      } catch (error) {
        print(
            "<<<<< GET HOSPITAL DOCTOR BY SPECIALISATION ERROR : $error >>>>>");
        emit(GetHospitalDoctorBySpecialisationError());
      }
    });
  }
}
