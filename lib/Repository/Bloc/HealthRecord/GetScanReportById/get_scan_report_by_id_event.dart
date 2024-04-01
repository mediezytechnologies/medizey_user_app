part of 'get_scan_report_by_id_bloc.dart';

@immutable
sealed class GetScanReportByIdEvent {}

final class FetchScanReportById extends GetScanReportByIdEvent {
  final String documentId;

  FetchScanReportById({required this.documentId});
}
