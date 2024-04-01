part of 'get_uploaded_discharge_summary_bloc.dart';

@immutable
sealed class GetUploadedDischargeSummaryState {}

final class GetUploadedDischargeSummaryInitial
    extends GetUploadedDischargeSummaryState {}

class GetUploadedDischargeSummaryLoading
    extends GetUploadedDischargeSummaryState {}

class GetUploadedDischargeSummaryLoaded
    extends GetUploadedDischargeSummaryState {
  final GetUploadedDischargeSummaryModel getUploadedDischargeSummaryModel;

  GetUploadedDischargeSummaryLoaded(
      {required this.getUploadedDischargeSummaryModel});
}

class GetUploadedDischargeSummaryError
    extends GetUploadedDischargeSummaryState {
  final String errorMessage;

  GetUploadedDischargeSummaryError({required this.errorMessage});
}
