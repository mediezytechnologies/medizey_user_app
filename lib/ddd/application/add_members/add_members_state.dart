part of 'add_members_bloc.dart';

@freezed
class AddMembersState with _$AddMembersState {
const factory AddMembersState({
required bool isloding,
    ClintClinicModelData? model,
    required bool isError,
     required String message,
    required bool status,
    // required Option<Either<MainFailure, ClintClinicModelData>>
    //     registerFaileurOrSuccessOption,
})= _Initial;

   factory AddMembersState.initial() =>AddMembersState(isloding: false, isError: false, message: '', status: false);
}
