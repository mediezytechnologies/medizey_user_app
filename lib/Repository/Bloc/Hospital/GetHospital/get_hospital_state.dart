part of 'get_hospital_bloc.dart';

@immutable
sealed class GetHospitalState {}

final class GetHospitalInitial extends GetHospitalState {}


class GetHospitalLoading extends GetHospitalState {}
class GetHospitalLoaded extends GetHospitalState {}
class GetHospitalError extends GetHospitalState {}
