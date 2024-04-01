part of 'get_uploaded_lab_report_bloc.dart';

@immutable
sealed class GetUploadedLabReportEvent {}

class FetchGetUploadedLabReport extends GetUploadedLabReportEvent {
  final String patientId;

  FetchGetUploadedLabReport({required this.patientId});
}
