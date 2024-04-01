part of 'get_completed_appointmets_by_patient_id_bloc.dart';

@immutable
sealed class GetCompletedAppointmetsByPatientIdState {}

final class GetCompletedAppointmetsByPatientIdInitial
    extends GetCompletedAppointmetsByPatientIdState {}

class GetCompletedAppointmetsByPatientIdLoading
    extends GetCompletedAppointmetsByPatientIdState {}

class GetCompletedAppointmetsByPatientIdLoaded
    extends GetCompletedAppointmetsByPatientIdState {
  final GetCompletedAppointmentsModel getCompletedAppointmentsModel;

  GetCompletedAppointmetsByPatientIdLoaded(
      {required this.getCompletedAppointmentsModel});
}

class GetCompletedAppointmetsByPatientIdError
    extends GetCompletedAppointmetsByPatientIdState {
  final String errorMessage;

  GetCompletedAppointmetsByPatientIdError({required this.errorMessage});
}
