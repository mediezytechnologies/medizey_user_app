import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/add_member/add_member_service.dart';
import 'package:mediezy_user/ddd/domain/add_member/model/add_member_model.dart';
import 'package:mediezy_user/ddd/domain/add_member/model/medicines.dart';
import 'package:mediezy_user/ddd/domain/core/failures/main_failure.dart';

part 'add_member_event.dart';
part 'add_member_state.dart';
part 'add_member_bloc.freezed.dart';

@injectable
class AddMemberBloc extends Bloc<AddMemberEvent, AddMemberState> {
  final AddMemberRepo addMemberRepo;
  AddMemberBloc(this.addMemberRepo) : super(AddMemberState.initial()) {
    on<_Started>((event, emit) async {
      emit(state.copyWith(
          isloding: true, registerFaileurOrSuccessOption: none()));
      log(emit.toString());
      final Either<MainFailure, AddMemberModel> addMemberOption =
          await addMemberRepo.getdoctersData(
              fullName: event.fullName,
              age: event.age,
              mobileNumber: event.mobileNumber,
              gender: event.gender,
              regularMedicine: event.regularMedicine,
              surgeryName: event.surgeryName,
              treatmentTaken: event.treatmentTaken,
              surgeryDetails: event.surgeryDetails,
              treatmentTakenDetails: event.treatmentTakenDetails,
              medicines: event.medicines,
              allergies: event.allergies);
      log("${addMemberOption.toString()} ======");
      emit(
        addMemberOption.fold(
          (failure) => state.copyWith(
            isloding: true,
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
                success,
              ),
            ),
          ),
        ),
      );
    });
  }
}
