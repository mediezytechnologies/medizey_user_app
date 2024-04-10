class SignUpModel {
  bool? success;
  Users? users;
  String? code;
  String? message;

  SignUpModel({this.success, this.users, this.code, this.message});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    users = json['users'] != null ? Users.fromJson(json['users']) : null;
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (users != null) {
      data['users'] = users!.toJson();
    }
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class Users {
  String? firstname;
  String? mobileNo;
  String? email;
  int? age;
  String? location;
  String? gender;
  int? userId;
  String? mediezyPatientId;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? dob;

  Users(
      {this.firstname,
      this.mobileNo,
      this.email,
      this.age,
      this.location,
      this.gender,
      this.userId,
      this.mediezyPatientId,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.dob});

  Users.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    mobileNo = json['mobileNo'];
    email = json['email'];
    age = json['age'];
    location = json['location'];
    gender = json['gender'];
    userId = json['UserId'];
    mediezyPatientId = json['mediezy_patient_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstname'] = firstname;
    data['mobileNo'] = mobileNo;
    data['email'] = email;
    data['age'] = age;
    data['location'] = location;
    data['gender'] = gender;
    data['UserId'] = userId;
    data['mediezy_patient_id'] = mediezyPatientId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['dob'] = dob;
    return data;
  }
}
