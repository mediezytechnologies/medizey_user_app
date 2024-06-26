// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:mediezy_user/ddd/domain/error_model/error_model.dart';
import 'package:mediezy_user/ddd/infrastructure/core/api_end_pont.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/firebase_login/firebase_login_api_impl.dart';
import '../../domain/firebase_login/model/firebase_login_model/firebase_login_model.dart';

// @LazySingleton(as: AddFirebaseLogin)
// class FirebaseLoginImpl implements AddFirebaseLogin {
//   @override
//   Future<Either<ErrorModel, FirebaseLoginModel?>> addFirebaseLogin(
//     String phoneNumber,
//   ) async {
//     final preference = await SharedPreferences.getInstance();
//     String? firebaseToken = preference.getString('firebaseTokens');

//     log("fcm tok : $firebaseToken");
//     // String? token =
//     //     preference.getString('token') ?? preference.getString('tokenD');
//     try {
//       final response = await Dio(BaseOptions(
//         // headers: {'Authorization': 'Bearer $token'},
//         contentType: 'application/json',
//       )).post(
//         ApiEndPoints.firbaseLogin,
//         data: {
//           "access_token": firebaseToken,
//           "mobile_number": phoneNumber,
//         },
//       );
//       log(response.data.toString());
//       Future.delayed(Duration(seconds: 3));
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final result = FirebaseLoginModel.fromJson(response.data);

//         log("result service : $result");
//         preference.setString('token', result.token.toString());
//         String? userId;

//         preference.setString('firstName', result.user.firstname.toString());

//         preference.setString('userId', result.user.id.toString());
//         userId = preference.getString('userId').toString();
//         log("<<<<<<userrr  $userId>>>>>>>>");
//         preference.setString('phoneNumber', result.user.mobileNo.toString());

//         String? userName = preference.getString('firstName');

//         log("fcm tok in api : ${preference.getString('token')}");
//         log("fcm tuserName api : $userName");
//         log("fcm tuser id api : $userId");

//         //  await preference.setInt('patientId', result.user.!);

//         //   int? patianrId;

//         //   patianrId = preference.getInt('patientId');
//         //   log('Response data id : $patianrId');
//         return Right(result);
//       } else {
//         return Left(ErrorModel());
//       }
//     } on DioError catch (e) {
//       log('DioError: ${e.message}');
//       log('DioError type: ${e.type}');
//       log('DioError response: ${e.response}');

//       final err = ErrorModel.fromJson(e.response!.data);
//       log("err=====: $err");
//       return Left(err);
//     }
//   }
// }

//another bloc call//

class FirebaseLogiginOnService {
static Future<FirebaseLoginModel?> firebaseAuthServ(
  String phoneNumber
) async {
  final preference = await SharedPreferences.getInstance();
  try {
      String? firebaseToken = preference.getString('firebaseTokens');
      var formData = {
        "access_token": firebaseToken,
        "mobile_number": phoneNumber
      };
      for (var element in formData.entries) {
        log("key : ${element.key}=======   val : ${element.value}   ");
      }

        var response = await Dio().post(ApiEndPoints.firbaseLogin, data: formData);
    log("API Response: ${response.data}");
    FirebaseLoginModel? model = FirebaseLoginModel.fromJson(response.data);
       //log("result service : $model");
        log("result service : ${response.data}");
       preference.setString('token', model.token.toString());
      String? userId;

     preference.setString('firstName', model.user!.firstname.toString());

     preference.setString('userId', model.user!.id.toString());
     userId = preference.getString('userId').toString();
        log("<<<<<<userrr  $userId>>>>>>>>");
       preference.setString('phoneNumber', model.user!.mobileNo.toString());

     String? userName = preference.getString('firstName');

       log("fcm tok in api : ${preference.getString('token')}");
       log("fcm tuserName api : $userName");
       log("fcm tuser id api : $userId");
      log("fireauth serv form data =============$formData");
      log("fire auth models=============${model.user!.id}");
      log("res ${response.data}");
     return model;
  } on DioError catch (e) {
    log("DioError: ${e.message}");
    log("DioError Response: ${e.response?.data}");
  } catch (e, stackTrace) {
    log("Unexpected error: $e");
    log("Stack trace: $stackTrace");
  }
  return null;
}
}

class FirebseAuthController extends GetxController {
  RxBool loding = true.obs;
  var selectedIndex = 0.obs;
  var fireAuthCtr = FirebaseLoginModel(
    
  ).obs;
Future<void> getFireAuth(String phoneNumber,) async {
  try {
    loding.value = true;
    var data = await FirebaseLogiginOnService.firebaseAuthServ(phoneNumber);
    if (data != null) {
      fireAuthCtr.value = data;
      log("================== ${fireAuthCtr.value.user!.id}");
    } else {
      log('Firebase authentication returned null');
    }
  } catch (e, stackTrace) {
    log('Error in Firebase Authentication: $e');
    log('Stack trace: $stackTrace');
  } finally {
    loding.value = false;
  }
}
}




