part of 'get_doctors_as_per_specialisation_bloc.dart';

@immutable
sealed class GetDoctorsAsPerSpecialisationState {}

final class GetDoctorsAsPerSpecialisationInitial extends GetDoctorsAsPerSpecialisationState {}

class GetDoctorsAsperSpecialisationLoading extends GetDoctorsAsPerSpecialisationState{}
class GetDoctorsAsperSpecialisationLoaded extends GetDoctorsAsPerSpecialisationState{}
class GetDoctorsAsperSpecialisationError extends GetDoctorsAsPerSpecialisationState{}
