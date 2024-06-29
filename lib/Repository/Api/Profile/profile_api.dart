// ignore_for_file: avoid_print, use_rethrow_when_possible, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mediezy_user/Model/Profile/edit_user_model.dart';
import 'package:mediezy_user/Model/Profile/get_user_model.dart';
import 'package:mediezy_user/Repository/Api/ApiClient.dart';
import 'package:mediezy_user/Repository/Api/MultiApiClient.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileApi {
  ApiClient apiClient = ApiClient();
  MultiApiClient multiApiClient = MultiApiClient();

  //* get user details
  Future<GetUserModel> getUserDetails() async {
    final preferences = await SharedPreferences.getInstance();
    String? userId = preferences.getString('userId');
    log(" userId  clint side  $userId");
    String basePath = "Useredit/$userId";
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    log("<<<<<<<<GET USER DETAILS WORKED SUCCESSFULLY>>>>>>");
    return GetUserModel.fromJson(
      json.decode(response.body),
    );
  }

  //* edit user details
  Future<EditUserModel> editUserDetails(
      {required String firstName,
      required String secondName,
      required String email,
      required String mobileNo,
      required String location,
      required String gender,
      required String dob}) async {
    final preferences = await SharedPreferences.getInstance();
    String? userId = preferences.getString('userId');
    String basePath = "Userupdate/$userId";
    final body = {
      "firstname": firstName,
      "secondname": secondName,
      "email": email,
      "mobileNo": mobileNo,
      "location": location,
      "gender": gender,
      "dateofbirth": dob
    };

    Response response =
        await apiClient.invokeAPI(path: basePath, method: "PUT", body: body);
    print("GET USER BY ID BODY : $body");
    print("<<<<<<<<GET USER BY ID WORKED SUCCESSFULLY>>>>>>");
    return EditUserModel.fromJson(json.decode(response.body));
  }

  //* update user image
  Future<String> uploadUserImage({required File userImage}) async {
    String? userId;
    final preference = await SharedPreferences.getInstance();
    userId = preference.getString('userId').toString();
    String basePath = "UserDP/$userId";
    final body = {"user_image": userImage};
    print("UPDAED USER IMAGE BODY : $body ");
    try {
      Response response = await multiApiClient.uploadFiles(
          bodyData: body,
          files: userImage,
          uploadFileTitle: "user_image",
          uploadPath: basePath);
      print("<<<<<< UPLOAD USER IMAGE WORKED SUCCESSFULLY >>>>>>");
      return response.body;
    } catch (error) {
      print(
          "<<<<<<<<<<UPLOADED USER IMAGE ERRORR>>>>>>>>>>" + error.toString());
      throw error;
    }
  }
}
