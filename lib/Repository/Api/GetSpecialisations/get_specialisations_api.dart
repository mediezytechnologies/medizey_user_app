// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart';
import 'package:mediezy_user/Model/GetSpecialisations/get_doctors_as_per_specialisation_model.dart';
import 'package:mediezy_user/Model/GetSpecialisations/get_specialisations_model.dart';
import 'package:mediezy_user/Repository/Api/ApiClient.dart';

class GetSpecialisationsApi {
  ApiClient apiClient = ApiClient();

  //* get all specilaisations
  Future<GetSpecialisationsModel> getAllSpecialisations() async {
    String basePath = "specialize";
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    print("<<<<< GET SPECIALISATIONS WORKED SUCCESSFULLY >>>>>");
    return GetSpecialisationsModel.fromJson(json.decode(response.body));
  }

  //* get doctor as per specialisations
  Future<GetDoctersAsPerSpecialisationModel> getDoctorsAsPerSpecialisation(
    {required String id}
  ) async {
    String basePath = "docter/docterByspecialization/$id";
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    print("<<<<< GET DOCTORS AS PER SPECIALISATIONS WORKED SUCCESSFULLY >>>>>>");
    return GetDoctersAsPerSpecialisationModel.fromJson(json.decode(response.body));
  }



  
}