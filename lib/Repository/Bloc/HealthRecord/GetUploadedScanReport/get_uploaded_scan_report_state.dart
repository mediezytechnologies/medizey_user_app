part of 'get_uploaded_scan_report_bloc.dart';

@immutable
sealed class GetUploadedScanReportState {}

final class GetUploadedScanReportInitial extends GetUploadedScanReportState {}

class GetUploadedScanReportLoading extends GetUploadedScanReportState {}

class GetUploadedScanReportLoaded extends GetUploadedScanReportState {
  final GetUploadedScanReportModel getUploadedScanReportModel;

  GetUploadedScanReportLoaded({required this.getUploadedScanReportModel});
}

class GetUploadedScanReportError extends GetUploadedScanReportState {
  final String errorMessage;

  GetUploadedScanReportError({required this.errorMessage});
}
