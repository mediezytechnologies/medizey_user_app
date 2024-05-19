part of 'get_recently_booked_doctor_bloc.dart';

@freezed
class GetRecentlyBookedDoctorState with _$GetRecentlyBookedDoctorState {
  const factory GetRecentlyBookedDoctorState(
      {required bool isloding,
      required List<RecentlyBookedDoctor> model,
      required bool isError,
      required String message,
      required bool status,
      required int favId}) = _Initial;

  factory GetRecentlyBookedDoctorState.initial() =>
      const GetRecentlyBookedDoctorState(
        isloding: false,
        isError: false,
        message: '',
        status: false,
        model: [],
        favId: 0,
      );
}
