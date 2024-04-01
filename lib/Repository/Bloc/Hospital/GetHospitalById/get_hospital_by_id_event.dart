part of 'get_hospital_by_id_bloc.dart';

@immutable
sealed class GetHospitalByIdEvent {}

class FetchHospitalById extends GetHospitalByIdEvent {
  final String hospitalId;

  FetchHospitalById({required this.hospitalId});
}
