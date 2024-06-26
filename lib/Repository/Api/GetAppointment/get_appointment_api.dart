// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart';
import 'package:mediezy_user/Model/GetAppointments/get_completed_appointments_model.dart';
import 'package:mediezy_user/Model/GetAppointments/get_upcoming_appointments_model.dart';
import 'package:mediezy_user/Repository/Api/ApiClient.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetAppointmentApi {
  ApiClient apiClient = ApiClient();

  //* get up coming appointments
  Future<GetUpComingAppointmentsModel> getUpComingApointments() async {
    String? userId;
    final preference = await SharedPreferences.getInstance();
    userId = preference.getString('userId').toString();
    String basePath = "patient/upcomingEstimateCalculation/$userId";
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    return GetUpComingAppointmentsModel.fromJson(json.decode(response.body));
  }

  //* get completd appointments
  Future<GetCompletedAppointmentsModel> getCompletedApointments() async {
    String? userId;
    final preference = await SharedPreferences.getInstance();
    userId = preference.getString('userId').toString();
    String basePath = "patient/appointment/getPatientCompletedAppointments";
    final body = {"patient_user_id": userId};
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    return GetCompletedAppointmentsModel.fromJson(json.decode(response.body));
  }

  //* get completed feedback appointments
  Future<GetCompletedAppointmentsModel>
      getCompletedFeedBackApointments() async {
    String? userId;
    final preference = await SharedPreferences.getInstance();
    userId = preference.getString('userId').toString();
    String basePath = "userCompletedFeedback";
    final body = {"patient_user_id": userId};
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    return GetCompletedAppointmentsModel.fromJson(json.decode(response.body));
  }
}
