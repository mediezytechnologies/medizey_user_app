part of 'book_appointment_initial_bloc.dart';

@immutable
abstract class BookAppointmentInitialState {}

final class BookAppointmentInitialInitial extends BookAppointmentInitialState {}

class BookAppointmentInitialLoading extends BookAppointmentInitialState {}

class BookAppointmentInitialLoaded extends BookAppointmentInitialState {
  final BookApointmentInitialModel bookApointmentInitialModel;

  BookAppointmentInitialLoaded({required this.bookApointmentInitialModel});
}

class BookAppointmentInitialError extends BookAppointmentInitialState {
  final String errorMessage;

  BookAppointmentInitialError({required this.errorMessage});
}
