// ignore_for_file: avoid_print

import 'package:http/http.dart';
import 'package:mediezy_user/Repository/Api/ApiClient.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SuggestionApi {
  ApiClient apiClient = ApiClient();

  //* send suggestion about the app
  Future<String> getSuggestions({
    required String message,
  }) async {
    final preference = await SharedPreferences.getInstance();
    String userId = preference.getString('userId').toString();
    String basePath = "addsuggestions";
    final body = {
      "message": message,
      "user_id": userId,
      "type": "user",
    };

    Response response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    print("SUGGESTION BODY : $body");
    print("<<<<<<<<<< SEND SUGGESTION WORKED SUCCESSFULLY>>>>>>>>>>");
    return response.body;
  }
}
