// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:mediezy_user/Model/AutoFetch/auto_fetch_model.dart';
import 'package:mediezy_user/Model/BookAppointment/book_appointment_model.dart';
import 'package:mediezy_user/Model/GetFamilyMembers/get_family_members_model.dart';
import 'package:mediezy_user/Model/OtherTypePatientDetails/other_type_patient_details_model.dart';
import 'package:mediezy_user/Repository/Api/ApiClient.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/BookAppointment/book_appointment_initial_model.dart';
import '../../../Model/BookAppointment/payment_model.dart';

class BookAppointmentApi {
  ApiClient apiClient = ApiClient();

  //* book appointment
  Future<BookAppointmentModel> bookAppointment(
      {required String patientName,
      required String doctorId,
      required String clinicId,
      required String date,
      required String whenitcomes,
      required String whenitstart,
      required String tokenTime,
      required String tokenNumber,
      required String gender,
      required String age,
      required String mobileNo,
      required String bookingType,
      required List<String> appoinmentfor1,
      required List<int> appoinmentfor2,
      required String patientId,
      required String sheduleType,
      required String tokenId,
      required int resheduleOrNot,
      required String normalResheduleTokenId}) async {
    String basePath = "patient/patientBookGeneratedTokens";
    final preferences = await SharedPreferences.getInstance();
    String? userId = preferences.getString('userId');
    final body = {
      "BookedPerson_id": userId,
      "PatientName": patientName,
      "date": date,
      "whenitcomes": whenitcomes,
      "whenitstart": whenitstart,
      "TokenTime": tokenTime,
      "TokenNumber": tokenNumber,
      "MobileNo": mobileNo,
      "age": age,
      "gender": gender,
      "Appoinmentfor1": appoinmentfor1,
      "Appoinmentfor2": appoinmentfor2,
      "doctor_id": doctorId,
      "clinic_id": clinicId,
      "Bookingtype": bookingType,
      "patient_id": patientId,
      "schedule_type": sheduleType,
      "token_id": tokenId,
      "reschedule_type": resheduleOrNot,
      "normal_reschedule_token_id": normalResheduleTokenId
    };
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    log("Book appointment body : $body");
    log("<<<<<<<<<<BOOK APPOINTMENT WORKED SUCCESSFULLY>>>>>>>>>>");
    return BookAppointmentModel.fromJson(json.decode(response.body));
  }

  //* get family members
  Future<GetFamilyMembersModel> getFamilyMembers() async {
    String basePath = "GetFamily";
    final preferences = await SharedPreferences.getInstance();
    String? userId = preferences.getString('userId');
    final body = {
      "user_id": userId,
    };
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    print("Get Family member body : $body");
    print("<<<<<<<<<< GET FAMILY MEMBERS WORKED SUCCESSFULLY >>>>>>>>>>");
    return GetFamilyMembersModel.fromJson(json.decode(response.body));
  }

  //* auto fetch details
  Future<AutoFetchModel> autoFetchDetails(
      {required String section, required String patientId}) async {
    String basePath = "Autofetch";
    final preferences = await SharedPreferences.getInstance();
    String? userId = preferences.getString('userId');
    final body = {
      "user_id": userId,
      "section": section,
      "patient_id": patientId
    };
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    print("Auto Fetch body :$body");
    print("<<<<<<<<<< AUTO FETCH DETAILS WORKED SUCCESSFULLY >>>>>>>>>>");
    return AutoFetchModel.fromJson(json.decode(response.body));
  }

  //* get other type patientDetails

  Future<OtherTypePatientDetailsModel> otherTypePatientDetails(
      {required String patientId}) async {
    String basePath = "patient/otherUserTokenBooking";
    final body = {
      "mediezy_patient_id": patientId,
    };
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    print("Auto Fetch body :$body");
    print("<<<<<<<<<< OTHER DETAILS WORKED SUCCESSFULLY >>>>>>>>>>");
    return OtherTypePatientDetailsModel.fromJson(json.decode(response.body));
  }

  //* book appointment initial

  Future<BookApointmentInitialModel> bookAppointmentInitial(
      {required String patientName,
      required String doctorId,
      required String clinicId,
      required String date,
      required String whenitcomes,
      required String whenitstart,
      required String tokenTime,
      required String tokenNumber,
      required String gender,
      required String age,
      required String mobileNo,
      required String bookingType,
      required List<String> appoinmentfor1,
      required List<int> appoinmentfor2,
      required String patientId,
      required String sheduleType,
      required String tokenId,
      required int resheduleOrNot,
      required String normalResheduleTokenId}) async {
    String basePath = "patient/initiatePaymentsforTokenBooking";
    final preferences = await SharedPreferences.getInstance();
    String? userId = preferences.getString('userId');
    final body = {
      "BookedPerson_id": userId,
      "PatientName": patientName,
      "date": date,
      "whenitcomes": whenitcomes,
      "whenitstart": whenitstart,
      "TokenTime": tokenTime,
      "TokenNumber": tokenNumber,
      "MobileNo": mobileNo,
      "age": age,
      "gender": gender,
      "Appoinmentfor1": appoinmentfor1,
      "Appoinmentfor2": appoinmentfor2,
      "doctor_id": doctorId,
      "clinic_id": clinicId,
      "Bookingtype": bookingType,
      "patient_id": patientId,
      "schedule_type": sheduleType,
      "token_id": tokenId,
      "reschedule_type": resheduleOrNot,
      "normal_reschedule_token_id": normalResheduleTokenId
    };
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    log("Book appointment inital body : $body");
    log("<<<<<<<<<<BOOK APPOINTMENT INITIAL WORKED SUCCESSFULLY>>>>>>>>>>");
    return BookApointmentInitialModel.fromJson(json.decode(response.body));
  }

  //* payment
  Future<PaymentModel> paymentAmount(
      {required String razorPaymentId,
      required String tokenId,
      required String currency,
      required String contactNumber,
      required String email,
      required double amount}) async {
    String basePath = "patient/capturePayment";

    final body = {
      "razorpay_payment_id": razorPaymentId,
      "token_id": tokenId,
      "amount": amount,
      "currency": currency,
      "contact": contactNumber,
      "email": email
    };
    Response response =
        await apiClient.invokeAPI(path: basePath, method: "POST", body: body);
    log("payment body : $body");
    log("<<<<<<<<<<PAYMENT WORKED SUCCESSFULLY>>>>>>>>>>");
    return PaymentModel.fromJson(json.decode(response.body));
  }
}
