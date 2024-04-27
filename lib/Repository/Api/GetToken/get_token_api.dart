// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart';
import 'package:mediezy_user/Model/GetSymptoms/get_symptoms_model.dart';
import 'package:mediezy_user/Model/GetTokens/GetTokenModel.dart';
import 'package:mediezy_user/Repository/Api/ApiClient.dart';

class GetTokenApi {
  ApiClient apiClient = ApiClient();

  //* get token as per clinic and date
  Future<GetTokenModel> getTokens({
    required String doctorId,
    required String clinicId,
    required String date,
  }) async {
    String basePath =
        "patient/getPatientTokenDetails/$date/$clinicId/$doctorId";
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    print("<<<<<<<< TOKEN FETCHED WORKED SUCCESSFULLY >>>>>>>>>>");
    return GetTokenModel.fromJson(json.decode(response.body));
  }

  //*Get doctor Symptoms
  Future<GetSymptomsModel> getSymptoms({required String doctorId}) async {
    String basePath = "symptoms/$doctorId";
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    print("<<<<<<<<<<GET SYMPTOMS WORKED SUCCESSFULLY>>>>>>>>>>");
    return GetSymptomsModel.fromJson(json.decode(response.body));
  }
}
