part of 'get_common_symptom_bloc.dart';

@immutable
sealed class GetCommonSymptomEvent {}

class FetchCommonSymptoms extends GetCommonSymptomEvent {}
