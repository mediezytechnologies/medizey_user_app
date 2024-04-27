import 'package:mediezy_user/ddd/infrastructure/core/baseurl.dart.dart';

class ApiEndPoints {
  static const addMember = "$baseUrl/patient/addFamilyMember";
  static const addMemberImage =
      "$baseUrl/patient/addFamilyMember/savePatientImage";
  static const editMember = "$baseUrl/patient/editFamilyMembers";
  static const userLocation =
      '$baseUrl/patient/user_locations/addUserLocations';
  static const getDoctors = '$baseUrl/docter';
}
