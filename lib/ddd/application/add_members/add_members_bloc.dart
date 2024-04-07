import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/errors/errores_model/errores_model.dart';

import '../../domain/add_member/add_member_service.dart';
import '../../domain/core/failures/main_failure.dart';
import '../../domain/add_member/model/add_member_model.dart';

part 'add_members_event.dart';
part 'add_members_state.dart';
part 'add_members_bloc.freezed.dart';

@injectable
class AddMembersBloc extends Bloc<AddMembersEvent, AddMembersState> {
  
  final AddMemberRepo _addMemberRepo;
  AddMembersBloc(this._addMemberRepo) : super(AddMembersState.initial()) {
     on<AddMembersEvent>((event, emit) async {

emit(AddMembersState.initial());
final _result =await _addMemberRepo.getdoctersData(event.fullName,
            event.age,
            event.mobileNumber,
             event.gender,
              event.regularMedicine,
             event.surgeryName,
            event.treatmentTaken,
               event.surgeryDetails,
          event.treatmentTakenDetails,
       event.allergies,
           event.medicines,
             event.context,);
             final _state =_result.fold((ErroresModel l) {
              return  AddMembersState(isloding: false,
               isError: true, message: l.message!, status: false);
             },
              (ClintClinicModelData? r) {
                return AddMembersState(isloding: false,
                 isError: false, 
                 message: r!.message!, status: r.status!);

              });
emit(_state);

      // emit(state.copyWith(
      //     isloding: true, registerFaileurOrSuccessOption: none()));
      // log(emit.toString());
      // final Either<MainFailure, ClintClinicModelData?> addMemberOption =
      //     await addMemberRepo.getdoctersData(
      //         event.fullName,
      //       event.age,
      //       event.mobileNumber,
      //        event.gender,
      //         event.regularMedicine,
      //        event.surgeryName,
      //       event.treatmentTaken,
      //          event.surgeryDetails,
      //     event.treatmentTakenDetails,
      //  event.allergies,
      //      event.medicines,
      //        event.context,
      //         );
      // log("${addMemberOption.toString()} ======");
      // emit(
      //   addMemberOption.fold(
      //     (failure) => state.copyWith(
      //       isloding: true,
      //       registerFaileurOrSuccessOption: some(
      //         left(
      //           failure,
      //         ),
      //       ),
      //     ),
      //     (success) => state.copyWith(
      //       isloding: false,
      //       model: success,
      //       registerFaileurOrSuccessOption: some(
      //         right(
      //           success!,
      //         ),
      //       ),
      //     ),
      //   ),
      // );
    });
  }
}
