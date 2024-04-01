part of 'get_lab_report_by_id_bloc.dart';

@immutable
sealed class GetLabReportByIdState {}

final class GetLabReportByIdInitial extends GetLabReportByIdState {}

final class GetLabReportByIdLoading extends GetLabReportByIdState {}

final class GetLabReportByIdLoaded extends GetLabReportByIdState {
  final GetUploadedLabReportByIdModel getUploadedLabReportByIdModel;

  GetLabReportByIdLoaded({required this.getUploadedLabReportByIdModel});
}

final class GetLabReportByIdError extends GetLabReportByIdState {
  final String errorMessage;

  GetLabReportByIdError({required this.errorMessage});
}
