part of 'edit_member_image_bloc.dart';

@freezed
class EditMemberImageState with _$EditMemberImageState {
  const factory EditMemberImageState({
    required bool isloding,
    AddMemberImags? model,
    required Option<Either<MainFailure, AddMemberImags>>
        registerFaileurOrSuccessOption,
  }) = _Initial;

  factory EditMemberImageState.initial() => EditMemberImageState(
      isloding: false, registerFaileurOrSuccessOption: none());
}
