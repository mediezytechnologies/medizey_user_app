part of 'suggestion_bloc.dart';

@immutable
sealed class SuggestionEvent {}

class FetchSuggestions extends SuggestionEvent {
  final String message;

  FetchSuggestions({
    required this.message,
  });
}
