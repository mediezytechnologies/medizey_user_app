part of 'other_type_patient_details_bloc.dart';

@immutable
sealed class OtherTypePatientDetailsEvent {}

class FetchOtherTypePatientDetails extends OtherTypePatientDetailsEvent {
  final String patientId;

  FetchOtherTypePatientDetails({required this.patientId});
}
