import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/docters_model/docters_impl.dart';
import '../../domain/docters_model/model/all_doctor.dart';
part 'get_docters_event.dart';
part 'get_docters_state.dart';
part 'get_docters_bloc.freezed.dart';

@injectable
class GetDoctersBloc extends Bloc<GetDoctersEvent, GetDoctersState> {
  GetDoctersRepo getDoctersRepo;
  GetDoctersBloc(this.getDoctersRepo) : super(GetDoctersState.initial()) {
    on<_Started>((event, emit) async {
      if (event.isLoadingNeed) {
        emit(state.copyWith(
          isloding: true,
          isError: false,
          message: "",
          status: false,
          model: [],
        ));
      }

      log(emit.toString());
      log("loading>>>>> ${state.isloding}");
      log(emit.toString());
      final getDoctorResult = await getDoctersRepo.getDoctersRepo();
      emit(getDoctorResult.fold(
          (l) => state.copyWith(
                isloding: false,
                isError: true,
                message: l.message!,
                model: [],
                status: false,
              ),
          (r) => state.copyWith(
                isloding: false,
                isError: false,
                message: state.message,
                status: state.status,
                model: r,
              )));
    });
    on<_ChangeFav>((event, emit) {
      final updatedDoctors = state.model.map((doctor) {
        if (doctor.id == event.favId) {
          doctor.favoriteStatus = doctor.favoriteStatus == 1 ? 0 : 1;
        }
        return doctor;
      }).toList();
      emit(state.copyWith(model: updatedDoctors));
    });
  }
}
