import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/search_doctor/model/search_doctor.dart';
import '../../domain/search_doctor/search_doctor_repository.dart';
part 'search_doctor_event.dart';
part 'search_doctor_state.dart';
part 'search_doctor_bloc.freezed.dart';


@injectable
class SearchDoctorBloc extends Bloc<SearchDoctorEvent, SearchDoctorState> {
  final SearchDoctorRepository searchDoctorRepository;
  SearchDoctorBloc(this.searchDoctorRepository)
      : super(SearchDoctorState.initial()) {
    on<_Started>((event, emit) async {
      emit(state.copyWith(
        isloding: true,
        isError: false,
        message: "",
        status: false,
        model: [],
      ));
      log(emit.toString());
      log(emit.toString());
      final searchDoctor = await searchDoctorRepository.searchDoctor(
          searchQuery: event.searchQuery);
      log("${searchDoctor.toString()} ======");
      emit(searchDoctor.fold(
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
