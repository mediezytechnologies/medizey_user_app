import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:mediezy_user/Model/Banner/banner_model.dart';
import 'package:mediezy_user/Repository/Api/ApiClient.dart';

class BannerApi {
  ApiClient apiClient = ApiClient();
  Future<BannerModel> getBanner({required String type}) async {
    String basePath = "userbanner/$type";
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    log("<<<<< GET BANNER AS PER ID WORKED SUCCESSFULLY >>>>>");
    return BannerModel.fromJson(json.decode(response.body));
  }
}
