part of 'get_fav_doctor_bloc.dart';

@freezed
class GetFavDoctorState with _$GetFavDoctorState {
  const factory GetFavDoctorState(
      {required bool isloding,
      required List<FavoriteDoctor> model,
      required bool isError,
      required String message,
      required bool status,
      required int favId}) = _Initial;

  factory GetFavDoctorState.initial() => const GetFavDoctorState(
        isloding: false,
        isError: false,
        message: '',
        status: false,
        model: [],
        favId: 0,
      );
}
