part of 'get_uploaded_discharge_summary_bloc.dart';

@immutable
sealed class GetUploadedDischargeSummaryEvent {}

class FetchGetUploadedDischargeSummary
    extends GetUploadedDischargeSummaryEvent {
  final String patientId;

  FetchGetUploadedDischargeSummary({required this.patientId});
}
