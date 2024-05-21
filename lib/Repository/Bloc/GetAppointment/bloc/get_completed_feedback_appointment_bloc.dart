import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../Model/GetAppointments/get_completed_appointments_model.dart';
import '../../../Api/GetAppointment/get_appointment_api.dart';
part 'get_completed_feedback_appointment_event.dart';
part 'get_completed_feedback_appointment_state.dart';

class GetCompletedFeedbackAppointmentBloc extends Bloc<
    GetCompletedFeedbackAppointmentsEvent,
    GetCompletedFeedBackAppointmentsState> {
  GetAppointmentApi getAppointmentApi = GetAppointmentApi();
  GetCompletedFeedbackAppointmentBloc()
      : super(GetCompletedFeedBackAppointmentsInitial()) {
    on<FetchCompletedFeedbackAppointments>((event, emit) async {
      emit(GetCompletedFeedBackAppointmentLoading());
      try {
        final model = await getAppointmentApi.getCompletedFeedBackApointments();
        emit(
          GetCompletedFeedBackAppointmentLoaded(
              getCompletedAppointmentsModel: model),
        );
      } catch (e) {
        emit(
          GetCompletedFeedBackAppointmentError(
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }
}
