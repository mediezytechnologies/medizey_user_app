import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:mediezy_user/Repository/Api/HealthRecords/health_record_api.dart';
import 'package:meta/meta.dart';
part 'add_member_event.dart';
part 'add_member_state.dart';

class AddMemberBloc extends Bloc<AddMemberEvent, AddMemberState> {
  HealthRecordApi healthRecordApi = HealthRecordApi();
  AddMemberBloc() : super(AddMemberInitial()) {
    on<FetchAddMember>((event, emit) async {
      try {
        emit(AddMemberLoadingState());
        final response = await healthRecordApi.addFamilyMember(
            age: event.age,
            fullName: event.fullName,
            gender: event.gender,
            mobileNumber: event.mobileNumber,
            regularMedicine: event.regularMedicine,
            surgeryName: event.surgeyName,
            treatmentTaken: event.treatmentTaken,
            medicines: event.medicines,
            allergies: event.allergies,
            surgeryDetails: event.suregeryDetails,
            treatmentTakenDetails: event.treatmentTakenDetails,
            patientImage: event.patientImage);
        // final responseData = json.decode(response);
        // final responseMessage = responseData['response'];
        // emit(AddMemberLoadedState(successMessage: responseMessage));
        final responseData = json.decode(response);
        final status = responseData['status'];
        final message = responseData['message'];

        if (status != null && message != null) {
          if (status == true) {
            emit(AddMemberLoadedState(successMessage: message));
          } else {
            emit(AddMemberErrorState(errorMessage: message));
          }
        } else {
          emit(AddMemberErrorState(errorMessage: "Unexpected response format"));
        }
      } catch (e) {
        final errorMessage = _extractErrorMessage(e.toString());
      print(errorMessage);
        emit(AddMemberErrorState(errorMessage: "Family Member already exit"));
      }
    });
  }

  String _extractErrorMessage(String errorMessage) {
    try {
      final jsonData = json.decode(errorMessage);
      return jsonData['response'];
    } catch (e) {
      return e.toString();
    }
  }
}
