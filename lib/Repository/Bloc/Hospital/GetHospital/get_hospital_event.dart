part of 'get_hospital_bloc.dart';

@immutable
sealed class GetHospitalEvent {}

class FetchAllHospitals extends GetHospitalEvent {}
