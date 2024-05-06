import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:mediezy_user/Model/GetClinic/get_clinic_model.dart';
import 'package:mediezy_user/Repository/Api/ApiClient.dart';

class GetClinicApi {
  ApiClient apiClient = ApiClient();
  Future<GetClinicModel> getClinicByDoctor({required String doctorId}) async {
    String basePath = "user/doctorbyclinics/$doctorId";
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    log("<<<<< GET CLINIC AS PER DOCTOR ID WORKED SUCCESSFULLY >>>>>");
    return GetClinicModel.fromJson(json.decode(response.body));
  }
}
