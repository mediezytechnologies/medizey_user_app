part of 'get_all_uploaded_documents_bloc.dart';

@immutable
sealed class GetAllUploadedDocumentsState {}

final class GetAllUploadedDocumentsInitial
    extends GetAllUploadedDocumentsState {}

class GetAllUploadedDocumentsLoading extends GetAllUploadedDocumentsState {}

class GetAllUploadedDocumentsLoaded extends GetAllUploadedDocumentsState {
  final GetAllUploadedDocumentModel getAllUploadedDocumentModel;

  GetAllUploadedDocumentsLoaded({required this.getAllUploadedDocumentModel});
}

class GetAllUploadedDocumentsError extends GetAllUploadedDocumentsState {
  final String errorMessage;

  GetAllUploadedDocumentsError({required this.errorMessage});
}
