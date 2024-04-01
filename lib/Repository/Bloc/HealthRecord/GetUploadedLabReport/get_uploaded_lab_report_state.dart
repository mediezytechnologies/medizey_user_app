part of 'get_uploaded_lab_report_bloc.dart';

@immutable
sealed class GetUploadedLabReportState {}

final class GetUploadedLabReportInitial extends GetUploadedLabReportState {}

class GetUploadedLabReportLoading extends GetUploadedLabReportState {}

class GetUploadedLabReportLoaded extends GetUploadedLabReportState {
  final GetUploadedLabTestModel getUploadedLabTestModel;

  GetUploadedLabReportLoaded({required this.getUploadedLabTestModel});
}

class GetUploadedLabReportError extends GetUploadedLabReportState {
  final String errorMessage;

  GetUploadedLabReportError({required this.errorMessage});
}
