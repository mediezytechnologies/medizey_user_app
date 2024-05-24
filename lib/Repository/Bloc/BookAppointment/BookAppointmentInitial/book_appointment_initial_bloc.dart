import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Model/BookAppointment/book_appointment_initial_model.dart';
import '../../../Api/BookAppointment/book_appointment_api.dart';
part 'book_appointment_initial_event.dart';
part 'book_appointment_initial_state.dart';

class BookAppointmentInitialBloc
    extends Bloc<BookAppointmentInitialEvent, BookAppointmentInitialState> {
  BookAppointmentApi bookAppointmentApi = BookAppointmentApi();
  BookAppointmentInitialBloc() : super(BookAppointmentInitialInitial()) {
    on<PassBookAppointMentInitialEvent>((event, emit) async {
      emit(BookAppointmentInitialLoading());
      try {
        final bookAppointmentInitialModel =
            await bookAppointmentApi.bookAppointmentInitial(
                patientName: event.patientName,
                date: event.date,
                whenitcomes: event.whenitcomes,
                whenitstart: event.whenitstart,
                tokenTime: event.tokenTime,
                tokenNumber: event.tokenNumber,
                gender: event.gender,
                age: event.age,
                mobileNo: event.mobileNo,
                appoinmentfor1: event.appoinmentfor1,
                appoinmentfor2: event.appoinmentfor2,
                doctorId: event.doctorId,
                clinicId: event.clinicId,
                bookingType: event.bookingType,
                patientId: event.patientId,
                sheduleType: event.sheduleType,
                tokenId: event.tokenId,
                resheduleOrNot: event.resheduleOrNot,
                normalResheduleTokenId: event.normalResheduleTokenId);
        emit(BookAppointmentInitialLoaded(
            bookApointmentInitialModel: bookAppointmentInitialModel));
      } catch (error) {
        log("<<<<<<BOOK INITIAL APPOINTMENT ERROR : $error>>>>>");
        emit(BookAppointmentInitialError(errorMessage: error.toString()));
      }
    });
  }
}
