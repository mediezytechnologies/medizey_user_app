part of 'get_uploaded_scan_report_bloc.dart';

@immutable
sealed class GetUploadedScanReportEvent {}

class FetchGetUploadedScanReport extends GetUploadedScanReportEvent {
  final String patientId;

  FetchGetUploadedScanReport({required this.patientId});
}
