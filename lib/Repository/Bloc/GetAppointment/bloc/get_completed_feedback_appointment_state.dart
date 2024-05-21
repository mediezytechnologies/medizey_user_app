part of 'get_completed_feedback_appointment_bloc.dart';

@immutable
sealed class GetCompletedFeedBackAppointmentsState {}

final class GetCompletedFeedBackAppointmentsInitial
    extends GetCompletedFeedBackAppointmentsState {}

class GetCompletedFeedBackAppointmentLoading
    extends GetCompletedFeedBackAppointmentsState {}

class GetCompletedFeedBackAppointmentLoaded
    extends GetCompletedFeedBackAppointmentsState {
  final GetCompletedAppointmentsModel getCompletedAppointmentsModel;

  GetCompletedFeedBackAppointmentLoaded(
      {required this.getCompletedAppointmentsModel});
}

class GetCompletedFeedBackAppointmentError
    extends GetCompletedFeedBackAppointmentsState {
  final String errorMessage;

  GetCompletedFeedBackAppointmentError({required this.errorMessage});
}
