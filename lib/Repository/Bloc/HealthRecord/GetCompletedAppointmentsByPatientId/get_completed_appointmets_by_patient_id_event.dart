part of 'get_completed_appointmets_by_patient_id_bloc.dart';

@immutable
sealed class GetCompletedAppointmetsByPatientIdEvent {}

class FetchCompletedAppointmentsByPatientId
    extends GetCompletedAppointmetsByPatientIdEvent {
  final String patientId;

  FetchCompletedAppointmentsByPatientId({required this.patientId});
}
