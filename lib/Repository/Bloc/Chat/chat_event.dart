part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}

class AddChatEvent extends ChatEvent {
  final String message;

  AddChatEvent({
    required this.message,
  });
}
