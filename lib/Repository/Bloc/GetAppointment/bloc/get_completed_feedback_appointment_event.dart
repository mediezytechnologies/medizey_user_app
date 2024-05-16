part of 'get_completed_feedback_appointment_bloc.dart';

@immutable
sealed class GetCompletedFeedbackAppointmentsEvent {}

class FetchCompletedFeedbackAppointments
    extends GetCompletedFeedbackAppointmentsEvent {}
