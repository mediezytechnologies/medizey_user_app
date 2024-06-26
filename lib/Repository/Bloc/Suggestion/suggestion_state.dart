part of 'suggestion_bloc.dart';

@immutable
sealed class SuggestionState {}

final class SuggestionInitial extends SuggestionState {}

class SuggestionLoading extends SuggestionState {}

class SuggestionLoaded extends SuggestionState {
  final String successMessage;

  SuggestionLoaded({required this.successMessage});
}

class SuggestionError extends SuggestionState {
  final String errorMessage;

  SuggestionError({required this.errorMessage});
}
