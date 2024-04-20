part of 'get_common_symptom_bloc.dart';

@immutable
sealed class GetCommonSymptomState {}

final class GetCommonSymptomInitial extends GetCommonSymptomState {}

class GetCommonSymptomLoading extends GetCommonSymptomState {}

class GetCommonSymptomLoaded extends GetCommonSymptomState {
  final CommonSymptomModel commonSymptomModel;

  GetCommonSymptomLoaded({required this.commonSymptomModel});
}

class GetCommonSymptomError extends GetCommonSymptomState {
  final String errorMessage;

  GetCommonSymptomError({required this.errorMessage});
}
