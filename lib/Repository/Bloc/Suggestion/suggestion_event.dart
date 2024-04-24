part of 'suggestion_bloc.dart';

@immutable
sealed class SuggestionEvent {}

class FetchSuggestions extends SuggestionEvent {
  final String message;
  final BuildContext context;

  FetchSuggestions({required this.message, required this.context});
}
