part of 'add_member_bloc.dart';

@freezed
class AddMemberState with _$AddMemberState {
  const factory AddMemberState({
    required bool isloding,
    AddMemberModel? model,
    required Option<Either<MainFailure, AddMemberModel>>
        registerFaileurOrSuccessOption,
  }) = _Initial;

  factory AddMemberState.initial() =>
      AddMemberState(isloding: false, registerFaileurOrSuccessOption: none());
}
