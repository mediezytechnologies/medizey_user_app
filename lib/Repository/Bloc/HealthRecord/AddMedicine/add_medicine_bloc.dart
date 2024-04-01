import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:mediezy_user/Repository/Api/HealthRecords/health_record_api.dart';
import 'package:mediezy_user/Ui/Services/general_services.dart';
import 'package:meta/meta.dart';
part 'add_medicine_event.dart';
part 'add_medicine_state.dart';

class AddMedicineBloc extends Bloc<AddMedicineEvent, AddMedicineState> {
  late String updatedSuccessfullyMessage;
  HealthRecordApi healthRecordApi = HealthRecordApi();
  AddMedicineBloc() : super(AddMedicineInitial()) {
    on<FetchAddMedicineEvent>((event, emit) async {
      emit(AddMedicineLoading());
      try {
        updatedSuccessfullyMessage = await healthRecordApi.addMedicine(
            illness: event.illnessName, medicineName: event.medicineName);
        emit(AddMedicineLoaded());
        Map<String, dynamic> data = jsonDecode(updatedSuccessfullyMessage);
        GeneralServices.instance.showToastMessage(data['message']);
      } catch (error) {
        print("<<<<<<< Add medicine error>>>$error");
        emit(AddMedicineError());
        GeneralServices.instance.showToastMessage(error.toString());
      }
    });
  }
}
