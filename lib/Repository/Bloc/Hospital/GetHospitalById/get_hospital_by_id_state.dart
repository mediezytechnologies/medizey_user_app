part of 'get_hospital_by_id_bloc.dart';

@immutable
sealed class GetHospitalByIdState {}

final class GetHospitalByIdInitial extends GetHospitalByIdState {}


class GetHospitalByIdLoading extends GetHospitalByIdState {}
class GetHospitalByIdLoaded extends GetHospitalByIdState {}
class GetHospitalByIdError extends GetHospitalByIdState {}


