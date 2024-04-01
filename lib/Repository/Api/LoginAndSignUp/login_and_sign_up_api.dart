// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mediezy_user/Model/auth/login_model.dart';
import 'package:mediezy_user/Model/auth/sign_up_model.dart';
import 'package:mediezy_user/Repository/Api/ApiClient.dart';
import 'package:mediezy_user/Repository/Api/MultiApiClient.dart';

class LoginAndSignUpApi {
  ApiClient apiClient = ApiClient();
  MultiApiClient multiApiClient = MultiApiClient();

  //* login
  Future<LoginModel> login(
      {required String email, required String password}) async {
    String basePath = "auth/login";
    final body = {"email": email, "password": password};
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    print("LOGIN BODY : $body");
    print("<<<<< LOGIN WORKED SUCCESSFULLY >>>>>");
    return LoginModel.fromJson(json.decode(response.body));
  }

  //* SIGN UP
  Future<SignUpModel> signUp(
    File? userImage, {
    required String firstName,
    required String secondName,
    required String email,
    required String mobileNumber,
    required String password,
    required String location,
    required String age,
    required String gender,
  }) async {
    String basePath = "Userregister";
    final body = {
      "firstname": firstName,
      "secondname": secondName,
      "mobileNo": mobileNumber,
      "email": email,
      "password": password,
      "location": location,
      "gender": gender,
      "dateofbirth": age,
      "user_image": userImage,
    };
    Response response = userImage == null
        ? await apiClient.invokeAPI(path: basePath, method: "POST", body: body)
        : await multiApiClient.uploadFiles(
            files: userImage,
            uploadPath: basePath,
            uploadFileTitle: "user_image",
            bodyData: body);
    print("SIGN UP BODY : $body");
    print("<<<<< SIGNUP WORKED SUCCESSFULLY >>>>>");
    return SignUpModel.fromJson(json.decode(response.body));
  }
}
