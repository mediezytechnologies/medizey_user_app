// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:mediezy_user/Model/AutoFetch/auto_fetch_model.dart';
import 'package:mediezy_user/Repository/Api/BookAppointment/book_appointment_api.dart';
import 'package:meta/meta.dart';
part 'auto_fetch_event.dart';
part 'auto_fetch_state.dart';

class AutoFetchBloc extends Bloc<AutoFetchEvent, AutoFetchState> {
  BookAppointmentApi bookAppointmentApi = BookAppointmentApi();
  AutoFetchBloc() : super(AutoFetchInitial()) {
    on<FetchAutoFetch>((event, emit) async {
      emit(AutoFetchLoading());
      try {
        final autoFetchModel = await bookAppointmentApi.autoFetchDetails(
            section: event.section, patientId: event.patientId);
        emit(AutoFetchLoaded(autoFetchModel: autoFetchModel));
      } catch (error) {
        print("<<<<<<< AUTH FETCH DETAILS ERROR : $error>>>>>>");
        emit(AutoFetchError(errorMessage: error.toString()));
      }
    });
  }
}
