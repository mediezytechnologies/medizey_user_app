import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mediezy_user/ddd/application/location_controller/locationcontroller.dart';
import '../../domain/location_model/location_model.dart';

class LocationService {
  static Future<LocationModel?> getLocatioinService() async {
    final controller = Get.put(LocationController());
    try {
      var response = await Dio().get(
        "http://www.postalpincode.in/api/pincode/${controller.postCode}",
      );
      LocationModel locationModel = LocationModel.fromJson(response.data);
      return locationModel;
      // ignore: deprecated_member_use
    } on DioError catch (e) {
    
     // log(e.message.toString());
    } catch (e) {
    //  log(e.toString());
    }
    return null;
  }
}
