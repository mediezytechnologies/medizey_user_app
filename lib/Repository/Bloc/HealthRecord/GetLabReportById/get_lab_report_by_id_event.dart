part of 'get_lab_report_by_id_bloc.dart';

@immutable
sealed class GetLabReportByIdEvent {}

class FetchUploadedLabReportByIdEvent extends GetLabReportByIdEvent {
  final String documentId;

  FetchUploadedLabReportByIdEvent({required this.documentId});
}
