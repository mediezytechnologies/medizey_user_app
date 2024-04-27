part of 'get_vitals_bloc.dart';

@immutable
sealed class GetVitalsState {}

class GetVitals extends GetVitalsState {}

class GetVitalsLoading extends GetVitalsState {}

class GetVitalsLoaded extends GetVitalsState {
  final GetVitalsModel getVitalsModel;

  GetVitalsLoaded({required this.getVitalsModel});
}

class GetVitalsError extends GetVitalsState {
  final String errorMessage;

  GetVitalsError({required this.errorMessage});
}
