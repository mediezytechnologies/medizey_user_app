part of 'get_discharge_summary_by_id_dart_bloc.dart';

@immutable
sealed class GetDischargeSummaryByIdDartState {}

final class GetDischargeSummaryByIdDartInitial
    extends GetDischargeSummaryByIdDartState {}

final class GetDischargeSummaryByIdDartLoading
    extends GetDischargeSummaryByIdDartState {}

final class GetDischargeSummaryByIdDartLoaded
    extends GetDischargeSummaryByIdDartState {
  final GetDischageSummaryByIdModel getDischageSummaryByIdModel;

  GetDischargeSummaryByIdDartLoaded(
      {required this.getDischageSummaryByIdModel});
}

final class GetDischargeSummaryByIdDartError
    extends GetDischargeSummaryByIdDartState {
  final String errorMessage;

  GetDischargeSummaryByIdDartError({required this.errorMessage});
}
