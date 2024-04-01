// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart';
import 'package:mediezy_user/Model/HealthCategories/get_doctors_by_health_categories_model.dart';
import 'package:mediezy_user/Model/HealthCategories/get_health_categories_model.dart';
import 'package:mediezy_user/Repository/Api/ApiClient.dart';

class HealthCategoriesApi {
  ApiClient apiClient = ApiClient();

  //* get health categories
  Future<GetHealthCategoriesModel> getHealthCategories() async {
    String basePath = "Showcategories";
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    print("<<<<<<<<<<GET HEALTH CATEGORIES WORKED SUCCESSFULLY>>>>>>>>>>");
    return GetHealthCategoriesModel.fromJson(json.decode(response.body));
  }

  //* get doctors by health categories
   Future<GetDoctorsByHealthCategoriesModel> getDoctorsByHealthCategories({required String healthCategoryId}) async {
    String basePath = "ShowCategoriesdocter/$healthCategoryId";
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    print("<<<<<<<<<<GET DOCTORS BY HEALTH CATEGORIES WORKED SUCCESSFULLY>>>>>>>>>>");
    return GetDoctorsByHealthCategoriesModel.fromJson(json.decode(response.body));
  }

}
