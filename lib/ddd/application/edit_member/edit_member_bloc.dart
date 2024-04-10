import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/add_member/model/add_member_model.dart';
import 'package:mediezy_user/ddd/domain/core/failures/main_failure.dart';
import 'package:mediezy_user/ddd/domain/edit_member/edit_member_service.dart';
part 'edit_member_event.dart';
part 'edit_member_state.dart';
part 'edit_member_bloc.freezed.dart';

@injectable
class EditMemberBloc extends Bloc<EditMemberEvent, EditMemberState> {
  final EditMemberRepo editMemberRepo;
  EditMemberBloc(this.editMemberRepo) : super(EditMemberState.initial()) {
    on<_Started>((event, emit) async {
      emit(state.copyWith(
          isloding: true, registerFaileurOrSuccessOption: none()));
      log(emit.toString());
      final Either<MainFailure, ClintClinicModelData?> editMemberOption =
          await editMemberRepo.editMemberData(
        event.patientId,
        event.fullName,
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
        event.context,
      );
      log("${editMemberOption.toString()} ======");
      emit(
        editMemberOption.fold(
          (failure) => state.copyWith(
            isloding: false,
            registerFaileurOrSuccessOption: some(
              left(
                failure,
              ),
            ),
          ),
          (success) => state.copyWith(
            isloding: false,
            model: success,
            registerFaileurOrSuccessOption: some(
              right(
                success!,
              ),
            ),
          ),
        ),
      );
    });
  }
}
