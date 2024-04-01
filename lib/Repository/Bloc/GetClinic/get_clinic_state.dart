part of 'get_clinic_bloc.dart';

@immutable
abstract class GetClinicState {}

class GetClinicInitial extends GetClinicState {}

class GetClinicLoading extends GetClinicState {}

class GetClinicLoaded extends GetClinicState {}

class GetClinicError extends GetClinicState {
  final String errorMessage;

  GetClinicError({required this.errorMessage});
}
