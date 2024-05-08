part of 'get_fav_doctor_bloc.dart';

@freezed
class GetFavDoctorEvent with _$GetFavDoctorEvent {
  const factory GetFavDoctorEvent.started(
    bool isLoadingNeed
  ) = _Started;
  const factory GetFavDoctorEvent.changeFav(int favId) = _ChangeFav;
}
