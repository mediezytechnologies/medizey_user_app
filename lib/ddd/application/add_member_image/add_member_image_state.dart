part of 'add_member_image_bloc.dart';

@freezed
class AddMemberImageState with _$AddMemberImageState {
  const factory AddMemberImageState({
    required bool isloding,
    AddMemberImags? model,
    required Option<Either<MainFailure, AddMemberImags>>
        registerFaileurOrSuccessOption,
  }) = _Initial;

  factory AddMemberImageState.initial() => AddMemberImageState(
      isloding: false, registerFaileurOrSuccessOption: none());
}
