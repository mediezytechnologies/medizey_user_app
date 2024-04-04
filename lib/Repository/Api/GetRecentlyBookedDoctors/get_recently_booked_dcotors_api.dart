// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart';
import 'package:mediezy_user/Model/GetRecentlyBookedDoctor/get_recently_booked_doctor_model.dart';
import 'package:mediezy_user/Repository/Api/ApiClient.dart';

class GetRecentlyBookedDoctorApi {
  ApiClient apiClient = ApiClient();
  Future<GetRecentlyBookedDoctorModel> getAllRecentlyBookedDoctor() async {
    String basePath = "user/recentlyBookedDoctor";
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    print(
        "<<<<<<<<<<GET ALL RECENTLY BOOKED DOCTORS WORKED SUCCESSFULLY>>>>>>>>>>");
    return GetRecentlyBookedDoctorModel.fromJson(json.decode(response.body));
  }
}
