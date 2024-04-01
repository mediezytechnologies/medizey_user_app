
import 'package:http/http.dart';
import 'package:mediezy_user/Repository/Api/ApiClient.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactUsApi {
  ApiClient apiClient = ApiClient();
  Future<String> addContactUs({
    required String email,
    required String description,
  }) async {
    String? userId;
    final preference = await SharedPreferences.getInstance();
    userId = preference.getString('userId').toString();

    String basePath = "getContactUsDetails";

    final body = {
      "email": email,
      "description": description,
      "UserId": userId,
    };
    Response response =
    await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    return response.body;
  }
}
