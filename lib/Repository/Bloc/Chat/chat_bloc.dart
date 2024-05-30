import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mediezy_user/Model/Chat/chat_model.dart';
import 'package:mediezy_user/Repository/Api/Chat/chat_api.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatApi chatApi = ChatApi();
  ChatBloc() : super(ChatInitial()) {
    on<AddChatEvent>((event, emit) async {
      emit(ChatLoading());
      try {
        final chatModel = await chatApi.chatBot(message: event.message);
        emit(ChatLoaded(chatModel: chatModel));
      } catch (e) {
        emit(
          ChatError(
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }
}
