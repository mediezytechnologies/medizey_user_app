import 'dart:developer';

import 'package:bloc/bloc.dart';
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
      emit(state.copyWith(
          isloding: true,
          isError: false,
          message: "",
          status: false,
          model: []));
      print(emit);

      // emit(const GetDoctersState( isloding: true, isError: false, message: "", status: false),);
      log(emit.toString());
      final getDoctorResult = await getDoctersRepo.getDoctersRepo();

      print("${getDoctorResult.toString()} ======");
      //  final  data=getDoctorResult.fold();
      emit(getDoctorResult.fold(
          (l) => state.copyWith(
              isloding: false,
              isError: true,
              message: l.message!,
              model: [],
              status: false),
          (r) => state.copyWith(
                isloding: false,
                isError: false,
                message: state.message,
                status: state.status,
                model: r,
              )));

      
    });
  }
}
