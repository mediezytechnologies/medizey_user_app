import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:mediezy_user/Model/QRScanModel/qr_scan_model.dart';
import 'package:mediezy_user/Repository/Api/ApiClient.dart';

class QRCodeApi {
  ApiClient apiClient = ApiClient();

  Future<QRCodeModel> qrCodeScan(
      {required String patientId,
      required String reachedStaus,
      required String tokenId}) async {
    String basePath = "patient/checkPatientReach/qr";
    final body = {
      "patient_id": patientId,
      "reached_status": reachedStaus,
      "new_token_id": tokenId
    };
    log("qrcode body ${body.toString()}");
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    return QRCodeModel.fromJson(json.decode(response.body));
  }
}
