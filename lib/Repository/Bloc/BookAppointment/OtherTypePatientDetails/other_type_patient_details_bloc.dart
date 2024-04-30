import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mediezy_user/Model/OtherTypePatientDetails/other_type_patient_details_model.dart';
import 'package:mediezy_user/Repository/Api/BookAppointment/book_appointment_api.dart';
part 'other_type_patient_details_event.dart';
part 'other_type_patient_details_state.dart';

class OtherTypePatientDetailsBloc
    extends Bloc<OtherTypePatientDetailsEvent, OtherTypePatientDetailsState> {
  BookAppointmentApi bookAppointmentApi = BookAppointmentApi();
  OtherTypePatientDetailsBloc() : super(OtherTypePatientDetailsInitial()) {
    on<FetchOtherTypePatientDetails>((event, emit) async {
      emit(OtherTypePatientDetailsLoading());
      try {
        final model = await bookAppointmentApi.otherTypePatientDetails(
            patientId: event.patientId);
        emit(
          OtherTypePatientDetailsLoaded(otherTypePatientDetailsModel: model),
        );
      } catch (error) {
        log("<<<<<<< OTHER PATIENT DETAILS FETCH DETAILS ERROR : $error>>>>>>");
        emit(
          OtherTypePatientDetailsError(
            errorMessage: error.toString(),
          ),
        );
      }
    });
  }
}
