part of 'chat_bloc.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final ChatModel chatModel;

  ChatLoaded({required this.chatModel});
}

class ChatError extends ChatState {
  final String errorMessage;

  ChatError({required this.errorMessage});
}
