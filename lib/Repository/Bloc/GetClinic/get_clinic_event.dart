part of 'get_clinic_bloc.dart';

@immutable
sealed class GetClinicEvent {}

class FetchClinicByDoctorIdEvent extends GetClinicEvent {
  final String doctorId;

  FetchClinicByDoctorIdEvent({required this.doctorId});
}
