class GetUserModel {
  bool? success;
  UserDetails? userDetails;
  String? message;

  GetUserModel({this.success, this.userDetails, this.message});

  GetUserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    userDetails = json['user_details'] != null
        ? UserDetails.fromJson(json['user_details'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (userDetails != null) {
      data['user_details'] = userDetails!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class UserDetails {
  int? id;
  int? userId;
  String? mediezyPatientId;
  String? firstName;
  String? dateOfBirth;
  String? showDob;
  String? mobileNumber;
  String? gender;
  String? location;
  String? email;
  String? userImage;

  UserDetails(
      {this.id,
      this.userId,
      this.mediezyPatientId,
      this.firstName,
      this.dateOfBirth,
      this.showDob,
      this.mobileNumber,
      this.gender,
      this.location,
      this.email,
      this.userImage});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    mediezyPatientId = json['mediezy_patient_id'];
    firstName = json['first_name'];
    dateOfBirth = json['date_of_birth'];
    showDob = json['show_dob'];
    mobileNumber = json['mobile_number'];
    gender = json['gender'];
    location = json['location'];
    email = json['email'];
    userImage = json['user_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['mediezy_patient_id'] = mediezyPatientId;
    data['first_name'] = firstName;
    data['date_of_birth'] = dateOfBirth;
    data['show_dob'] = showDob;
    data['mobile_number'] = mobileNumber;
    data['gender'] = gender;
    data['location'] = location;
    data['email'] = email;
    data['user_image'] = userImage;
    return data;
  }
}
