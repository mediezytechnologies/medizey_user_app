part of 'get_uploaded_prescription_by_id_bloc.dart';

@immutable
sealed class GetUploadedPrescriptionByIdState {}

final class GetUploadedPrescriptionByIdInitial
    extends GetUploadedPrescriptionByIdState {}

class GetUploadedPrescriptionByIdLoading
    extends GetUploadedPrescriptionByIdState {}

class GetUploadedPrescriptionByIdLoaded
    extends GetUploadedPrescriptionByIdState {
  final GetUploadedPrescriptionByIdModel getUploadedPrescriptionByIdModel;

  GetUploadedPrescriptionByIdLoaded(
      {required this.getUploadedPrescriptionByIdModel});
}

class GetUploadedPrescriptionByIdError
    extends GetUploadedPrescriptionByIdState {
  final String errorMessage;

  GetUploadedPrescriptionByIdError({required this.errorMessage});
}
