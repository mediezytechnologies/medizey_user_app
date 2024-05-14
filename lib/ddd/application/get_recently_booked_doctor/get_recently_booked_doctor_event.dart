part of 'get_recently_booked_doctor_bloc.dart';

@freezed
class GetRecentlyBookedDoctorEvent with _$GetRecentlyBookedDoctorEvent {
  const factory GetRecentlyBookedDoctorEvent.started() = _Started;
  const factory GetRecentlyBookedDoctorEvent.changeFav(int favId) = _ChangeFav;
  const factory GetRecentlyBookedDoctorEvent.getRecentlyBookedDocterForcedEvent() = _GetRecentlyBookedDocterForcedEvent;
}