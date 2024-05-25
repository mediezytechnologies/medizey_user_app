import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../Model/BookAppointment/payment_model.dart';
import '../../../Api/BookAppointment/book_appointment_api.dart';
part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  BookAppointmentApi bookAppointmentApi = BookAppointmentApi();
  PaymentBloc() : super(PaymentInitial()) {
    on<PassPaymentEvent>((event, emit) async {
      emit(PaymentLoading());
      try {
        final paymentModel = await bookAppointmentApi.paymentAmount(
            amount: event.amount,
            contactNumber: event.contactNumber,
            currency: event.currency,
            email: event.email,
            razorPaymentId: event.razorPaymentId,
            tokenId: event.tokenId);
        emit(PaymentLoaded(paymentModel: paymentModel));
      } catch (error) {
        log("<<<<<<PAYMENT ERROR : $error>>>>>");
        emit(PaymentError(errorMessage: error.toString()));
      }
    });
  }
}
