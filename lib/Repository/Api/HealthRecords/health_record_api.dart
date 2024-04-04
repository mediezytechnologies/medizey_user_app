// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/src/response.dart';
import 'package:mediezy_user/Model/GetAppointments/get_completed_appointments_model.dart';
import 'package:mediezy_user/Model/HealthRecord/GetAllMembers/get_all_members_model.dart';
import 'package:mediezy_user/Model/HealthRecord/GetAllUploadedDocuments/get_all_uploaded_documet_model.dart';
import 'package:mediezy_user/Model/HealthRecord/GetAllergy/get_allery_model.dart';
import 'package:mediezy_user/Model/HealthRecord/GetDischageSummaryById/get_discharge_summary_by_id_model.dart';
import 'package:mediezy_user/Model/HealthRecord/GetLabReportById/get_lab_report_by_id_model.dart';
import 'package:mediezy_user/Model/HealthRecord/GetMemberAsPerId/get_member_as_per_id_model.dart';
import 'package:mediezy_user/Model/HealthRecord/GetPrescriptionView/get_prescription_view_model.dart';
import 'package:mediezy_user/Model/HealthRecord/GetScanReportById/get_Scan_report_by_id_model.dart';
import 'package:mediezy_user/Model/HealthRecord/GetUploadedDischargeSummary/get_uploaded_discharge_summary_model.dart';
import 'package:mediezy_user/Model/HealthRecord/GetUploadedLabTest/get_uploaded_lab_test_model.dart';
import 'package:mediezy_user/Model/HealthRecord/GetUploadedPrescriptionById/get_uploaded_prescription_by_id_model.dart';
import 'package:mediezy_user/Model/HealthRecord/GetUploadedPrescriptions/get_uploaded_prescription_model.dart';
import 'package:mediezy_user/Model/HealthRecord/GetUploadedScanReport/get_uploaded_scan_report_model.dart';
import 'package:mediezy_user/Model/HealthRecord/TimeLineModel/time_line_model.dart';
import 'package:mediezy_user/Repository/Api/ApiClient.dart';
import 'package:mediezy_user/Repository/Api/ApiException.dart';
import 'package:mediezy_user/Repository/Api/MultiApiClient.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HealthRecordApi {
  ApiClient apiClient = ApiClient();
  MultiApiClient multiApiClient = MultiApiClient();

  Future<String> addFamilyMember({
    required String fullName,
    required String age,
    required String mobileNumber,
    required String gender,
    required String regularMedicine,
    required String surgeryName,
    required String treatmentTaken,
    required String surgeryDetails,
    required String treatmentTakenDetails,
    required List<Map<String, dynamic>> allergies,
    List<Map<String, dynamic>>? medicines,
  }) async {
    try {
      String? userId;
      final preference = await SharedPreferences.getInstance();
      userId = preference.getString('userId').toString();
      String basePath = "patient/addFamilyMember";

      final body = {
        "user_id": userId,
        "full_name": fullName,
        "gender": gender,
        "medicines": medicines,
        "date_of_birth": age,
        "mobile_number": mobileNumber,
        "regularMedicine": regularMedicine,
        "allergies": allergies,
        "surgery_name": surgeryName,
        "treatment_taken": treatmentTaken,
        "surgery_details": surgeryDetails,
        "treatment_taken_details": treatmentTakenDetails,
      };

      log(body.toString());
      Response response =
          await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
      if (response.statusCode == 200) {
        print("ADD MEMBER SUCCESS");
        log("response body ${response.body}");
        return response.body;
      } else {
        print("ADD MEMBER ERROR: ${response.statusCode}");
        throw ApiException(
            message: response.body, statusCode: response.statusCode);
      }
    } catch (e) {
      print("ADD MEMBER ERROR: $e");
      log(e.toString());
      throw ApiException(message: e.toString(), statusCode: 500);
    }
  }

  //edit ===================================//

  //* add patient image
  Future<String> addFamilyMemberImage({String? patientImage}) async {
    int? patientId;
    final preference = await SharedPreferences.getInstance();
    patientId = preference.getInt('patientId');
    String basePath = "patient/addFamilyMember/savePatientImage";
    final body = {"patient_id": patientId, "user_image": patientImage};
    log("Added data call ${body.toString()}");
    var response = await multiApiClient.uploadFamilyFiles(
        files: patientImage,
        uploadPath: basePath,
        uploadFileTitle: "user_image",
        bodyData: body);
    log("response body call ${response.body.toString()}");
    await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    print("<<<<<< GET ALL MEMBERS WORKED SUCCESSFULLY >>>>>>");
    return response.body;
  }

  //* get all members
  Future<GetAllMembersModel> getAllMembers() async {
    String? userId;
    final preference = await SharedPreferences.getInstance();
    userId = preference.getString('userId').toString();
    String basePath = "user/get_patients";
    final body = {
      "user_id": userId,
    };
    var response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    print("<<<<<< GET ALL MEMBERS WORKED SUCCESSFULLY >>>>>>");
    return GetAllMembersModel.fromJson(json.decode(response.body));
  }

  //* get member as per id
  Future<GetMemberAsPerIdModel> getMemberAsPerId(
      {required String patientId}) async {
    String basePath = "patient/getEditPatientDetails/$patientId";
    var response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    print("<<<<<< GET MEMBER AS PER ID WORKED SUCCESSFULLY >>>>>>");
    return GetMemberAsPerIdModel.fromJson(json.decode(response.body));
  }

  //* update member details
  Future<String> updateMember(
    File? patientImage, {
    required String patientId,
    required String fullName,
    required String age,
    required String mobileNumber,
    required String gender,
    required String allergyId,
    required String allergyDetails,
    required String surgeryName,
    required String treatmentTaken,
    required String regularMedicine,
    required String surgeryDetails,
    required String treatmentDetails,
  }) async {
    String basePath = "patient/editPatientDetails";
    final body = {
      "patient_id": patientId,
      "full_name": fullName,
      "dateofbirth": age,
      "mobile_number": mobileNumber,
      "gender": gender,
      "allergy": allergyId,
      "allergy_details": allergyDetails,
      "surgery_name": surgeryName,
      "treatment_taken": treatmentTaken,
      "regular_medicine": regularMedicine,
      "patient_image": patientImage,
      "surgery_details": surgeryDetails,
      "treatment_taken_details": treatmentDetails
    };
    var response = patientImage == null
        ? await apiClient.invokeAPI(path: basePath, method: "POST", body: body)
        : await multiApiClient.uploadFiles(
            files: patientImage,
            uploadPath: basePath,
            uploadFileTitle: "patient_image",
            bodyData: body);
    print("UPDATE MEMBER BODY : $body");
    print("<<<<<<<<<<EDIT MEMBER WORKED SUCCESSFULLY>>>>>>>>>>");
    return response.body;
  }

  //* delete member
  Future<String> deleteMember({
    required String patientId,
  }) async {
    String basePath = "DeleteMemeber/$patientId";
    var response =
        await apiClient.invokeAPI(path: basePath, method: "DELETE", body: null);
    print("<<<<<<<<<<DELETE MEMBER WORKED SUCCESSFULLY>>>>>>>>>>");
    return response.body;
  }

  //* get all uploaded documents
  Future<GetAllUploadedDocumentModel> getAllUploadedDocuments(
      {required String patientId}) async {
    String basePath = "user/get_uploaded_documents";
    String? userId;
    final preference = await SharedPreferences.getInstance();
    userId = preference.getString('userId').toString();
    final body = {"patient_id": patientId, "user_id": userId};
    var response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    print("<<<<<< GET ALL UPLOADED DOCUMENTS WORKED SUCCESSFULLY >>>>>>");
    return GetAllUploadedDocumentModel.fromJson(json.decode(response.body));
  }

  //* get all prescriptions
  Future<GetUploadedPrescriptionModel> getAllUploadedPrescriptions(
      {required String patientId}) async {
    String basePath = "user/get_uploaded_documents";
    String? userId;
    final preference = await SharedPreferences.getInstance();
    userId = preference.getString('userId').toString();
    final body = {"patient_id": patientId, "user_id": userId, "type": "2"};
    var response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    print("<<<<<< GET ALL UPLOADED PRESCRIPTIONS WORKED SUCCESSFULLY >>>>>>");
    return GetUploadedPrescriptionModel.fromJson(json.decode(response.body));
  }

  //* get uploaded lab reports
  Future<GetUploadedLabTestModel> getAllUploadedLabReports(
      {required String patientId}) async {
    String basePath = "user/get_uploaded_documents";
    String? userId;
    final preference = await SharedPreferences.getInstance();
    userId = preference.getString('userId').toString();
    final body = {"patient_id": patientId, "user_id": userId, "type": "1"};
    var response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    print("<<<<<< GET ALL UPLOADED LAB REPORTS WORKED SUCCESSFULLY >>>>>>");
    return GetUploadedLabTestModel.fromJson(json.decode(response.body));
  }

  //* get uploaded scan reports
  Future<GetUploadedScanReportModel> getAllUploadedScanReports(
      {required String patientId}) async {
    String basePath = "user/get_uploaded_documents";
    String? userId;
    final preference = await SharedPreferences.getInstance();
    userId = preference.getString('userId').toString();
    final body = {"patient_id": patientId, "user_id": userId, "type": "4"};
    var response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    print("<<<<<< GET ALL UPLOADED SCAN REPORTS WORKED SUCCESSFULLY >>>>>>");
    return GetUploadedScanReportModel.fromJson(json.decode(response.body));
  }

  //* get uploaded discharge summary
  Future<GetUploadedDischargeSummaryModel> getAllUploadedDischargeSummary(
      {required String patientId}) async {
    String basePath = "user/get_uploaded_documents";
    String? userId;
    final preference = await SharedPreferences.getInstance();
    userId = preference.getString('userId').toString();
    final body = {"patient_id": patientId, "user_id": userId, "type": "3"};
    var response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    print(
        "<<<<<< GET ALL UPLOADED DISCHARGE SUMMARY WORKED SUCCESSFULLY >>>>>>");
    return GetUploadedDischargeSummaryModel.fromJson(
        json.decode(response.body));
  }

  //* view prescriptions
  Future<GetPrescriptionViewModel> getPrescriptionView({
    required String patientId,
  }) async {
    String basePath = "user/get_prescriptions";
    String? userId;
    final preference = await SharedPreferences.getInstance();
    userId = preference.getString('userId').toString();
    final body = {
      "patient_id": patientId,
      "user_id": userId,
    };
    var response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    print("VIEW PRESCRIPTION BODY : $body");
    print("<<<<<< GET VIEW PRESCRIPTION WORKED SUCCESSFULLY >>>>>>");
    return GetPrescriptionViewModel.fromJson(json.decode(response.body));
  }

  //* time line
  Future<TimeLineModel> getTimeLine({
    required String patientId,
  }) async {
    String basePath = "user/reports_time_line";
    String? userId;
    final preference = await SharedPreferences.getInstance();
    userId = preference.getString('userId').toString();
    final body = {
      "patient_id": patientId,
      "user_id": userId,
    };
    var response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    print("TIMELINE BODY : $body ");
    print("<<<<<< GET TIMELINE WORKED SUCCESSFULLY >>>>>>");
    return TimeLineModel.fromJson(
      json.decode(response.body),
    );
  }

  //* get uploaded prescription as per id
  Future<GetUploadedPrescriptionByIdModel> getUploadedPrescriptionAsPerId(
      {required String documentId}) async {
    String basePath = "user/get-health-record";
    String? userId;
    final preference = await SharedPreferences.getInstance();
    userId = preference.getString('userId').toString();
    final body = {"document_id": documentId, "user_id": userId, "type": "2"};
    var response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    print("GET UPLOADED PRESCRIPTIN : $body");
    print(
        "<<<<<< GET UPLOADED PPRESCRIPTION AS PER ID WORKED SUCCESSFULLY >>>>>>");
    return GetUploadedPrescriptionByIdModel.fromJson(
      json.decode(response.body),
    );
  }

  //* get uploaded lab report by id
  Future<GetUploadedLabReportByIdModel> getUploadedLabReportPerId(
      {required String documentId}) async {
    String basePath = "user/get-health-record";
    String? userId;
    final preference = await SharedPreferences.getInstance();
    userId = preference.getString('userId').toString();
    final body = {"document_id": documentId, "user_id": userId, "type": "1"};
    var response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    print("GET UPLOADED LAB REPORT BODY : $body");
    print(
        "<<<<<< GET UPLOADED LAB REPORT AS PER ID WORKED SUCCESSFULLY >>>>>>");
    return GetUploadedLabReportByIdModel.fromJson(
      json.decode(response.body),
    );
  }

  //* get uplaoded scan report by id
  Future<GetScanReporyByIdModel> getUploadedScanReportPerId(
      {required String documentId}) async {
    String basePath = "user/get-health-record";
    String? userId;
    final preference = await SharedPreferences.getInstance();
    userId = preference.getString('userId').toString();
    final body = {"document_id": documentId, "user_id": userId, "type": "4"};
    var response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    print("GET UPLOADED LAB REPORT BODY : $body");
    print(
        "<<<<<< GET UPLOADED SCAN REPORT AS PER ID WORKED SUCCESSFULLY >>>>>>");
    return GetScanReporyByIdModel.fromJson(
      json.decode(response.body),
    );
  }

  Future<GetDischageSummaryByIdModel> getUploadedDischageSummaryPerId(
      {required String documentId}) async {
    String basePath = "user/get-health-record";
    String? userId;
    final preference = await SharedPreferences.getInstance();
    userId = preference.getString('userId').toString();
    final body = {"document_id": documentId, "user_id": userId, "type": "3"};
    var response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    print("GET UPLOADED LAB REPORT BODY : $body");
    print("<<<<<< GET UPLOADED DISCHARGE AS PER ID WORKED SUCCESSFULLY >>>>>>");
    return GetDischageSummaryByIdModel.fromJson(
      json.decode(response.body),
    );
  }

  //* delete uploaded document
  Future<String> deleteUploadedDocument({
    required String documentId,
    required String type,
  }) async {
    String? userId;
    final preference = await SharedPreferences.getInstance();
    userId = preference.getString('userId').toString();
    String basePath = "user/delete-document/$userId/$documentId/$type";
    var response =
        await apiClient.invokeAPI(path: basePath, method: "DELETE", body: null);
    print("<<<<<<<<<<DELETE DOCUMENT WORKED SUCCESSFULLY >>>>>>>>>>");
    return response.body;
  }

  //* get allergy
  Future<GetAllergyModel> getAllery() async {
    String basePath = "user/get_Allergy";
    var response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    print("<<<<<< GET ALL ALLERGY WORKED SUCCESSFULLY>>>>>>");
    return GetAllergyModel.fromJson(json.decode(response.body));
  }

  //* get completed appointments by patient id
  Future<GetCompletedAppointmentsModel> getCompletedAppointmentByPatientId({
    required String patienId,
  }) async {
    String? userId;
    final preference = await SharedPreferences.getInstance();
    userId = preference.getString('userId').toString();
    String basePath = "patient/getSortedPatientAppointments/$patienId/$userId";
    var response =
        await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    print("<<<<<<<<<<DELETE DOCUMENT WORKED SUCCESSFULLY >>>>>>>>>>");
    return GetCompletedAppointmentsModel.fromJson(json.decode(response.body));
  }

  //* add medicine
  Future<String> addMedicine({
    required String medicineName,
    required String illness,
  }) async {
    String basePath = "patient/addPatientMedicine";
    String? userId;
    final preference = await SharedPreferences.getInstance();
    userId = preference.getString('userId').toString();

    final body = {
      "user_id": userId,
      "medicine_name": medicineName,
      "illness": illness
    };
    var response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    print("<<<<<<<<<<ADD MEDICINE WORKED SUCCESSFULLY>>>>>>>>>>");
    return response.body;
  }

  //* delete medicine
  Future<String> deleteMedicine({
    required String medicineId,
    required String patientId,
  }) async {
    String basePath = "patient/deleteMedicines/$medicineId/$patientId";
    var response =
        await apiClient.invokeAPI(path: basePath, method: "DELETE", body: null);
    print("<<<<<<<<<<DELETE MEDICINE WORKED SUCCESSFULLY>>>>>>>>>>");
    return response.body;
  }

  //* update medicine
  Future<String> updateMedcine({
    required String medicineId,
    required String patientId,
    required String illnessName,
    required String medicineName,
  }) async {
    String basePath = "patient/updatetMedicines";
    final body = {
      "patient_id": patientId,
      "id": medicineId,
      "illness": illnessName,
      "medicineName": medicineName
    };
    var response =
        await apiClient.invokeAPI(path: basePath, method: "PUT", body: body);
    print("<<<<<<<<<<UPDATE MEDICINE WORKED SUCCESSFULLY>>>>>>>>>>");
    return response.body;
  }
}
