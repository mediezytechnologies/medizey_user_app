import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/add_member/model/add_member_model.dart';
import 'package:mediezy_user/ddd/domain/edit_member/edit_member_service.dart';
import 'package:mediezy_user/ddd/domain/error_model/error_model.dart';
part 'edit_member_event.dart';
part 'edit_member_state.dart';
part 'edit_member_bloc.freezed.dart';

@injectable
class EditMemberBloc extends Bloc<EditMemberEvent, EditMemberState> {
  final EditMemberRepo editMemberRepo;
  EditMemberBloc(this.editMemberRepo) : super(EditMemberState.initial()) {
    on<_Started>((event, emit) async {
      emit(
        const EditMemberState(
            isloding: true, isError: false, message: "", status: false),
      );

      final editMemberOptionResult = await editMemberRepo.editMemberData(
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
      final state = editMemberOptionResult.fold((ErrorModel error) {
        return EditMemberState(
            isloding: false,
            isError: true,
            message: error.message!,
            status: false);
      }, (ClintClinicModelData? success) {
        return EditMemberState(
            isloding: false,
            isError: false,
            message: success!.message!,
            status: true);
      });
      emit(state);
    });
  }
}
