// ignore_for_file: avoid_print, prefer_const_declarations
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MultiApiClient {
  Future<http.Response> uploadFiles({
    required File files,
    required String uploadPath,
    required String uploadFileTitle,
    required Map<String, dynamic>? bodyData,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? prefs.getString('tokenD');
    Map<String, String> headerParams = {
      "Authorization": "Bearer $token",
      "Accept": "application/json",
      "Content-Type": "multipart/form-data",
    };
    print('token: $token');
    print('Upload Path: $uploadPath');
    final String basePath = "https://mediezy.com/api/";
    // final String basePath = "https://test.mediezy.com/api/";

    var request =
        http.MultipartRequest('POST', Uri.parse(basePath + uploadPath));
    request.headers.addAll(headerParams);
    print("Request URL: ${request.url}");
    var multipartFile =
        await http.MultipartFile.fromPath(uploadFileTitle, files.path);
    request.files.add(multipartFile);
    if (bodyData != null) {
      bodyData.forEach((key, value) {
        if (value is String) {
          request.fields[key] = value;
        } else {
          request.fields[key] = value.toString();
        }
      });
    }
    try {
      http.StreamedResponse res = await request.send();
      print("Response: $res");
      http.Response responsed = await http.Response.fromStream(res);
      print("Response Status Code: ${responsed.statusCode}");
      print("Response Body: ${responsed.body}");
      final responseData = json.decode(responsed.body);
      if (responsed.statusCode == 200) {
        print('Success');
        print(responseData);
      } else {
        print('Error');
      }
      print("Reason: $res");
      return responsed;
    } catch (e) {
      print('Error during request: $e');
      return http.Response('Error during request: $e', 500);
    }
  }

  Future<http.Response> uploadFamilyFiles({
    String? files,
    required String uploadPath,
    required String uploadFileTitle,
    required Map<String, dynamic>? bodyData,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? prefs.getString('tokenD');
    Map<String, String> headerParams = {
      "Authorization": "Bearer $token",
      "Accept": "application/json",
      "Content-Type": "multipart/form-data",
    };
    print('token: $token');
    print('Upload Path: $uploadPath');
    final String basePath = "https://mediezy.com/api/";
    // final String basePath = "https://test.mediezy.com/api/";

    var request =
        http.MultipartRequest('POST', Uri.parse(basePath + uploadPath));
    request.headers.addAll(headerParams);
    print("Request URL: ${request.url}");
    var multipartFile =
        await http.MultipartFile.fromPath(uploadFileTitle, files!);
    request.files.add(multipartFile);
    if (bodyData != null) {
      bodyData.forEach((key, value) {
        if (value is String) {
          request.fields[key] = value;
        } else {
          request.fields[key] = value.toString();
        }
      });
    }
    try {
      http.StreamedResponse res = await request.send();
      print("Response: $res");
      http.Response responsed = await http.Response.fromStream(res);
      print("Response Status Code: ${responsed.statusCode}");
      print("Response Body: ${responsed.body}");
      final responseData = json.decode(responsed.body);
      if (responsed.statusCode == 200) {
        print('Success');
        print(responseData);
      } else {
        print('Error');
      }
      print("Reason: $res");
      return responsed;
    } catch (e) {
      print('Error during request: $e');
      return http.Response('Error during request: $e', 500);
    }
  }
}
