import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/error_model/error_model.dart';
import '../../domain/add_member/add_member_service.dart';
import '../../domain/add_member/model/add_member_model.dart';
part 'add_members_event.dart';
part 'add_members_state.dart';
part 'add_members_bloc.freezed.dart';

@injectable
class AddMembersBloc extends Bloc<AddMembersEvent, AddMembersState> {
  final AddMemberRepo addMemberRepo;
  AddMembersBloc(this.addMemberRepo) : super(AddMembersState.initial()) {
    on<_Started>((event, emit) async {
      emit(
        const AddMembersState(
            isloding: true, isError: false, message: "", status: false),
      );
      log(emit.toString());
      final addMemberResult = await addMemberRepo.addFamilyMember(
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

      final state = addMemberResult.fold((ErrorModel error) {
        return AddMembersState(
            isloding: false,
            isError: true,
            message: error.message!,
            status: false);
      }, (ClintClinicModelData? success) {
        return AddMembersState(
            isloding: false,
            isError: false,
            message: success!.message!,
            status: success.status!);
      });
      emit(state);
    });
  }
}
