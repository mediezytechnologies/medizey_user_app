part of 'add_members_bloc.dart';

@freezed
class AddMembersState with _$AddMembersState {
  const factory AddMembersState({
    required bool isloding,
    ClintClinicModelData? model,
    required bool isError,
    required String message,
    required bool status,
  }) = _Initial;

  factory AddMembersState.initial() => const AddMembersState(
      isloding: false, isError: false, message: '', status: false);
}
