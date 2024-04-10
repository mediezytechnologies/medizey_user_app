part of 'edit_member_bloc.dart';

@freezed
class EditMemberState with _$EditMemberState {
  const factory EditMemberState({
    required bool isloding,
    ClintClinicModelData? model,
    required Option<Either<MainFailure, ClintClinicModelData>>
        registerFaileurOrSuccessOption,
  }) = _Initial;

  factory EditMemberState.initial() =>
      EditMemberState(isloding: false, registerFaileurOrSuccessOption: none());
}
