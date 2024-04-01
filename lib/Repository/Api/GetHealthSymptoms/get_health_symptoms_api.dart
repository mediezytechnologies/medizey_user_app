// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart';
import 'package:mediezy_user/Model/GetSymptomAndDoctor/get_doctor_as_per_health_symptoms_model.dart';
import 'package:mediezy_user/Model/GetSymptomAndDoctor/get_health_symptoms_model.dart';
import 'package:mediezy_user/Repository/Api/ApiClient.dart';

class GetHealthSympyomsApi{
  ApiClient apiClient = ApiClient();

  //* get all health symptoms
  Future<GetHealthSymptomsModel> getAllHealthSymptoms() async {
    String basePath = "Showsymptoms";
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    print("<<<<<< GET HEALTH SYMPTOMS WORKED SUCCESSFULLY >>>>>");
    return GetHealthSymptomsModel.fromJson(json.decode(response.body));
  }


   //* get doctor as per health symptoms
   Future<GetDoctorAsPerHealthSymptomsModel> getDoctorsAsPerHealthSymptoms(
    {required String id}
  ) async {
    String basePath = "ShowCategoriessymptoms/$id";
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    print("<<<<GET DOCTORS AS PER HEALTH SYMPTOMS WORKED SUCCESSFULLY>>>");
    return GetDoctorAsPerHealthSymptomsModel.fromJson(json.decode(response.body));
  }
}