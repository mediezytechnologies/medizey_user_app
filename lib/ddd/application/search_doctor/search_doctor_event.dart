part of 'search_doctor_bloc.dart';

@freezed
class SearchDoctorEvent with _$SearchDoctorEvent {
  const factory SearchDoctorEvent.started(
      String searchQuery, bool isLoadingNeed) = _Started;
  const factory SearchDoctorEvent.changeFav(int favId) = _ChangeFav;
}
