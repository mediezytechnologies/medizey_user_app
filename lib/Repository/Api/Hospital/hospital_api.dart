// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart';
import 'package:mediezy_user/Model/Hospital/get_hospital_by_id_model.dart';
import 'package:mediezy_user/Model/Hospital/get_hospital_doctor_by_specialisation_model.dart';
import 'package:mediezy_user/Model/Hospital/get_hospitals_model.dart';
import 'package:mediezy_user/Repository/Api/ApiClient.dart';

class HospitalApi {
  ApiClient apiClient = ApiClient();

  //* get all hospitals
  Future<GetHospitalModel> getHospitals() async {
    String basePath = "patient/getAllClinics";
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    print("<<<<< GET ALL HOSPITALS WORKED SUCCESSFULLY >>>>>");
    return GetHospitalModel.fromJson(json.decode(response.body));
  }

  //* get hospital by id
  Future<GetHospitalByIdModel> getHospitalById(String id) async {
    String basePath = "patient/getAllClinicDetails/$id";
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    print("<<<<< GET HOSPITAL AS PER ID WORKED SUCCESSFULLY >>>>>");
    return GetHospitalByIdModel.fromJson(json.decode(response.body));
  }

  //* get hospital doctor by specilaisation
  Future<GetHospitalDoctorBySpecialisationModel>
      getHospitalDoctorBySpecialisation(
          String specialisationId, String clinicId) async {
    String basePath =
        "patient/getSpecializationDoctors/$specialisationId/$clinicId";
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    print("<<<<< GET HOSPITAL DOCTOR  AS PER ID WORKED SUCCESSFULLY >>>>>");
    return GetHospitalDoctorBySpecialisationModel.fromJson(
        json.decode(response.body));
  }
}
