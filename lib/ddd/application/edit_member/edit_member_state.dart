part of 'edit_member_bloc.dart';

@freezed
class EditMemberState with _$EditMemberState {
  const factory EditMemberState({
    required bool isloding,
    ClintClinicModelData? model,
    required bool isError,
    required String message,
  }) = _Initial;

  factory EditMemberState.initial() =>
      EditMemberState(isloding: false, isError: false,message: '');
}
