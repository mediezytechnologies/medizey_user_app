// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:mediezy_user/Model/Hospital/get_hospital_by_id_model.dart';
import 'package:mediezy_user/Repository/Api/Hospital/hospital_api.dart';
import 'package:meta/meta.dart';
part 'get_hospital_by_id_event.dart';
part 'get_hospital_by_id_state.dart';

class GetHospitalByIdBloc
    extends Bloc<GetHospitalByIdEvent, GetHospitalByIdState> {
  late GetHospitalByIdModel getHospitalByIdModel;
  HospitalApi hospitalApi = HospitalApi();
  GetHospitalByIdBloc() : super(GetHospitalByIdInitial()) {
    on<FetchHospitalById>((event, emit) async {
      emit(GetHospitalByIdLoading());
      try {
        getHospitalByIdModel =
            await hospitalApi.getHospitalById(event.hospitalId);
        emit(GetHospitalByIdLoaded());
      } catch (error) {
        print("<<<<< GET HOSPITAL BY ID ERROR : $error >>>>>");
        emit(GetHospitalByIdError());
      }
    });
  }
}
