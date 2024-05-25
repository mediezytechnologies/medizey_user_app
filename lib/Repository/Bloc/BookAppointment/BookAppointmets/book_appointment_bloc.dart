// ignore_for_file: avoid_print

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediezy_user/Model/BookAppointment/book_appointment_model.dart';
import 'package:mediezy_user/Repository/Api/BookAppointment/book_appointment_api.dart';
part 'book_appointment_event.dart';
part 'book_appointment_state.dart';

class BookAppointmentBloc
    extends Bloc<BookAppointmentEvent, BookAppointmentState> {
  late BookAppointmentModel bookAppointmentModel;
  BookAppointmentApi bookAppointmentApi = BookAppointmentApi();
  BookAppointmentBloc() : super(BookAppointmentInitial()) {
    on<PassBookAppointMentEvent>((event, emit) async {
      emit(BookAppointmentLoading());
      try {
        bookAppointmentModel = await bookAppointmentApi.bookAppointment(
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
        emit(BookAppointmentLoaded());
      } catch (error) {
        log("<<<<<<BOOK APPOINTMENT ERROR : $error>>>>>");
        emit(BookAppointmentError(errorMessage: error.toString()));
      }
    });
  }
}
