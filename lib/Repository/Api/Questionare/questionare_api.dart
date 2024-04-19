import 'dart:convert';
import 'dart:developer';
import 'package:mediezy_user/Model/Questionare/common_symptom_model.dart';
import 'package:mediezy_user/Repository/Api/ApiClient.dart';
import 'package:http/http.dart';

class QuestionareApi {
  ApiClient apiClient = ApiClient();

  //* get all hospitals
  Future<CommonSymptomModel> getCommonSymtoms() async {
    String basePath = "patient/listSymptoms";
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    log("<<<<< GET COMMON SYMPTOMS WORKED SUCCESSFULLY >>>>>");
    return CommonSymptomModel.fromJson(json.decode(response.body));
  }
}
