part of 'other_type_patient_details_bloc.dart';

@immutable
sealed class OtherTypePatientDetailsState {}

final class OtherTypePatientDetailsInitial
    extends OtherTypePatientDetailsState {}

class OtherTypePatientDetailsLoading extends OtherTypePatientDetailsState {}

class OtherTypePatientDetailsLoaded extends OtherTypePatientDetailsState {
  final OtherTypePatientDetailsModel otherTypePatientDetailsModel;

  OtherTypePatientDetailsLoaded({required this.otherTypePatientDetailsModel});
}

class OtherTypePatientDetailsError extends OtherTypePatientDetailsState {
  final String errorMessage;

  OtherTypePatientDetailsError({required this.errorMessage});
}
