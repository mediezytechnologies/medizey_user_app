part of 'get_hospital_doctor_by_specialisation_bloc.dart';

@immutable
sealed class GetHospitalDoctorBySpecialisationEvent {}

class FetchHospitalDoctorBySpecialisation
    extends GetHospitalDoctorBySpecialisationEvent {
  final String specialisationId;
  final String clinicId;

  FetchHospitalDoctorBySpecialisation(
      {required this.specialisationId, required this.clinicId});
}
