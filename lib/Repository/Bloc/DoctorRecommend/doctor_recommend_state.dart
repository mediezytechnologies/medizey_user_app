part of 'doctor_recommend_bloc.dart';

@immutable
abstract class DoctorRecommendState {}

class DoctorRecommendInitial extends DoctorRecommendState {}

class DoctorRecommendLoading extends DoctorRecommendState {}

class DoctorRecommendLoaded extends DoctorRecommendState {
  final String successMesseage;

  DoctorRecommendLoaded({required this.successMesseage});
}

class DoctorRecommendError extends DoctorRecommendState {
  final String errorMessage;

  DoctorRecommendError({required this.errorMessage});
}
