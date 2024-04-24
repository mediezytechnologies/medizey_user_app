import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/docters_model/docters_impl.dart';
import '../../domain/docters_model/model/docters_model.dart';
import '../../domain/error_model/error_model.dart';

part 'get_docters_event.dart';
part 'get_docters_state.dart';
part 'get_docters_bloc.freezed.dart';


@injectable
class GetDoctersBloc extends Bloc<GetDoctersEvent, GetDoctersState> {
  final GetDoctersRepo getDoctersRepo;
  GetDoctersBloc(this.getDoctersRepo) : super(GetDoctersState.initial()) {
    on<_Started>((event, emit) async{
      emit(const GetDoctersState( isloding: true, isError: false, message: "", status: false),);
       log(emit.toString());
       final getDoctorResult =await getDoctersRepo.getDoctersRepo();


     //  final  data=getDoctorResult.fold();

       final state = getDoctorResult.fold((ErrorModel error) {
        return GetDoctersState(
            isloding: false,
            isError: true,
            message: error.message!,
            status: false);
      }, (DoctersModel? success) {
        return GetDoctersState(
            isloding: false,
            isError: false,
            message: success!.message!,
            status: success.status!);
      });
      emit(state);
    });
  }
}