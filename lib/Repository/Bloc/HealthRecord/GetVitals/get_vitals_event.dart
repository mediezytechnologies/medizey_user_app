part of 'get_vitals_bloc.dart';

@immutable
sealed class GetVitalsEvent {}

class FetchVitals extends GetVitalsEvent {
  final String patientId;

  FetchVitals({required this.patientId});
}
