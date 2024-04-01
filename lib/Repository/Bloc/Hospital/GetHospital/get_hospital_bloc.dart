import 'package:bloc/bloc.dart';
import 'package:mediezy_user/Model/Hospital/get_hospitals_model.dart';
import 'package:mediezy_user/Repository/Api/Hospital/hospital_api.dart';
import 'package:meta/meta.dart';
part 'get_hospital_event.dart';
part 'get_hospital_state.dart';

class GetHospitalBloc extends Bloc<GetHospitalEvent, GetHospitalState> {
   late GetHospitalModel getHospitalModel;
  HospitalApi hospitalApi = HospitalApi();
  GetHospitalBloc() : super(GetHospitalInitial()) {
    on<GetHospitalEvent>((event, emit)async {
       emit(GetHospitalLoading());
        try {
          getHospitalModel = await hospitalApi.getHospitals();
          emit(GetHospitalLoaded());
        } catch (error) {
          print(
              "<<<<< GET ALL HOSPITAL ERROR : $error >>>>>");
          emit(GetHospitalError());
        }
    });
  }
}
