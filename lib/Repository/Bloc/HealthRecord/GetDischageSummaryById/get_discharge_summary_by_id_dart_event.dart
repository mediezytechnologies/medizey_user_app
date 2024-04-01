part of 'get_discharge_summary_by_id_dart_bloc.dart';

@immutable
sealed class GetDischargeSummaryByIdDartEvent {}

final class FetchDischargeSummaryById extends GetDischargeSummaryByIdDartEvent {
  final String documentId;

  FetchDischargeSummaryById({required this.documentId});
}
