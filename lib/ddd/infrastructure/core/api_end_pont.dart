import 'package:mediezy_user/ddd/infrastructure/core/baseurl.dart.dart';

class ApiEndPoints {
  static const addMember = "${baseUrl}patient/addFamilyMember";
  static const addMemberImage =
      "${baseUrl}patient/addFamilyMember/savePatientImage";
  static const editMember = "${baseUrl}patient/editFamilyMembers";
  static const userLocation =
      '${baseUrl}patient/user_locations/addUserLocations';
  static const getDoctors = '${baseUrl}docter';
  static const getFavDoctors = '${baseUrl}user/getallfavourites/';
  static const getRecentlyBookedDoctors = '${baseUrl}user/recentlyBookedDoctor';
  static const searchDoctor = '${baseUrl}searchdoctor?name=';
  static const getRating = '${baseUrl}getUserRating/';
  static const firbaseLogin = "${baseUrl}auth/social-accounts/login";
  static const addRating = '${baseUrl}addDoctorReview';
  static const fcmToken = '${baseUrl}reciveFCMToken';
  static const forgotPassword = '${baseUrl}user/forgot-password';
  static const otpVerfication = '${baseUrl}user/forgot-password/verify-otp';
  static const resetPassword = '${baseUrl}user/forgot-password/reset-password';
  static const questionareGetSymptoms = '${baseUrl}patient/listSymptoms';
  static const getQuestions = '${baseUrl}patient/getSymptomsQuestions';
  static const submitAnswer = '${baseUrl}patient/addSymptomUserResponse';
}
