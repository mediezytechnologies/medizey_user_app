import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Model/Chat/chat_model.dart';
import '../ApiClient.dart';

class ChatApi {
  ApiClient apiClient = ApiClient();
  Future<ChatModel> chatBot({required String message}) async {
    final preference = await SharedPreferences.getInstance();
    String userId = preference.getString('userId').toString();
    String basePath = "user/chat";
    final body = {"user_id": userId, "message": message};
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    log("CHAT BODY : $body");
    log("<<<<< CHAT WORKED SUCCESSFULLY >>>>>");
    return ChatModel.fromJson(json.decode(response.body));
  }
}
