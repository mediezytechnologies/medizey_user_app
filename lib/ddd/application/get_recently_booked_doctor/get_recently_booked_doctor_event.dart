part of 'get_recently_booked_doctor_bloc.dart';

@freezed
class GetRecentlyBookedDoctorEvent with _$GetRecentlyBookedDoctorEvent {
  const factory GetRecentlyBookedDoctorEvent.started( bool isLoadingNeed) = _Started;
  const factory GetRecentlyBookedDoctorEvent.changeFav(int favId) = _ChangeFav;
}