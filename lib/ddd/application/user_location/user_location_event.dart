part of 'user_location_bloc.dart';

@freezed
class UserLocationEvent with _$UserLocationEvent {
  const factory UserLocationEvent.started(
    String latitude,
    String longitude,
    String district,
    String city,
    String locationAddress,
  ) = _Started;
}
