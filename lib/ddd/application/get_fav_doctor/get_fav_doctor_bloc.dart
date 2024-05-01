import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/get_fav_model/model/get_fav_model.dart';

part 'get_fav_doctor_event.dart';
part 'get_fav_doctor_state.dart';
part 'get_fav_doctor_bloc.freezed.dart';

class GetFavDoctorBloc extends Bloc<GetFavDoctorEvent, GetFavDoctorState> {
  GetFavDoctorBloc() : super(GetFavDoctorState.initial()) {
    on<GetFavDoctorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
