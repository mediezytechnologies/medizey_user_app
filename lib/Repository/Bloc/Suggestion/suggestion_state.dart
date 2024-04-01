part of 'suggestion_bloc.dart';

@immutable
sealed class SuggestionState {}

final class SuggestionInitial extends SuggestionState {}

class SuggestionLoading extends SuggestionState {}

class SuggestionLoaded extends SuggestionState {}

class SuggestionError extends SuggestionState {}
