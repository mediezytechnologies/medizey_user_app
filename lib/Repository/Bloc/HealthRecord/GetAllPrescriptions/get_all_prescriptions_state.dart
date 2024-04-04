part of 'get_all_prescriptions_bloc.dart';

@immutable
sealed class GetAllPrescriptionsState {}

final class GetAllPrescriptionsInitial extends GetAllPrescriptionsState {}

class GetAllPrescriptionsLoading extends GetAllPrescriptionsState {}

class GetAllPrescriptionsLoaded extends GetAllPrescriptionsState {
  final GetUploadedPrescriptionModel getUploadedPrescriptionModel;

  GetAllPrescriptionsLoaded({required this.getUploadedPrescriptionModel});
}

class GetAllPrescriptionsError extends GetAllPrescriptionsState {
  final String errorMessage;

  GetAllPrescriptionsError({required this.errorMessage});
}
