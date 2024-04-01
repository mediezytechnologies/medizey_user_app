part of 'get_scan_report_by_id_bloc.dart';

@immutable
sealed class GetScanReportByIdState {}

final class GetScanReportByIdInitial extends GetScanReportByIdState {}

final class GetScanReportByIdLoading extends GetScanReportByIdState {}

final class GetScanReportByIdLoaded extends GetScanReportByIdState {
  final GetScanReporyByIdModel getScanReporyByIdModel;

  GetScanReportByIdLoaded({required this.getScanReporyByIdModel});
}

final class GetScanReportByIdError extends GetScanReportByIdState {
  final String errorMessage;

  GetScanReportByIdError({required this.errorMessage});
}
