// ignore_for_file: avoid_print

import 'package:http/http.dart';
import 'package:mediezy_user/Repository/Api/ApiClient.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorRecommendApi {
  ApiClient apiClient = ApiClient();

  Future<String> doctorRecommend({
    required String doctorName,
    required String location,
    required String clinicName,
    required String specialization,
    required String phoneNumber,
  }) async {
    final preference = await SharedPreferences.getInstance();
    String userId = preference.getString('userId').toString();
    String basePath = "patient/suggestDoctor";
    final body = {
      "user_id": userId,
      "name": doctorName,
      "place": location,
      "clinic_name": clinicName,
      "specialization": specialization,
      "mobile_number": phoneNumber
    };

    Response response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    print("DOCTOR RECOMMENDED BODY : $body");
    print("<<<<<<<<<< SEND DOCTOR RECOMMENDED WORKED SUCCESSFULLY>>>>>>>>>>");
    return response.body;
  }
}
