part of 'get_hospital_doctor_by_specialisation_bloc.dart';

@immutable
sealed class GetHospitalDoctorBySpecialisationState {}

final class GetHospitalDoctorBySpecialisationInitial
    extends GetHospitalDoctorBySpecialisationState {}

class GetHospitalDoctorBySpecialisationLoading
    extends GetHospitalDoctorBySpecialisationState {}

class GetHospitalDoctorBySpecialisationLoaded
    extends GetHospitalDoctorBySpecialisationState {}

class GetHospitalDoctorBySpecialisationError
    extends GetHospitalDoctorBySpecialisationState {}
