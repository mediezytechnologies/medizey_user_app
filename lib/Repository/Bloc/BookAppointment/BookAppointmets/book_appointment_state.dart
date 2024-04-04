part of 'book_appointment_bloc.dart';

@immutable
abstract class BookAppointmentState {}

final class BookAppointmentInitial extends BookAppointmentState {}

class BookAppointmentLoading extends BookAppointmentState {}

class BookAppointmentLoaded extends BookAppointmentState {}

<<<<<<< HEAD
class BookAppointmentError extends BookAppointmentState {
  final String errorMessage;

  BookAppointmentError({required this.errorMessage});
}
=======
class BookAppointmentError extends BookAppointmentState {}
>>>>>>> fe0e675d98c5501f7e9ae26aef4a7c9763a660c3
