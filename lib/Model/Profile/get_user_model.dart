class GetUserModel {
  bool? success;
  Userdetails? userdetails;
  String? code;
  String? message;

  GetUserModel({this.success, this.userdetails, this.code, this.message});

  GetUserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    userdetails = json['Userdetails'] != null
        ? Userdetails.fromJson(json['Userdetails'])
        : null;
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (userdetails != null) {
      data['Userdetails'] = userdetails!.toJson();
    }
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class Userdetails {
  int? id;
  String? mediezyPatientId;
  String? firstname;
  String? lastname;
  int? age;
  String? dateofbirth;
  String? userImage;
  String? mobileNo;
  String? gender;
  String? location;
  String? email;
  int? userId;
  String? createdAt;
  String? updatedAt;
  int? userType;
  String? regularMedicine;
  String? illness;
  String? medicineTaken;
  String? allergyId;
  String? allergyName;
  String? surgeryName;
  String? surgeryDetails;
  String? treatmentTaken;
  String? treatmentTakenDetails;
  String? userProfile;

  Userdetails(
      {this.id,
      this.mediezyPatientId,
      this.firstname,
      this.lastname,
      this.age,
      this.dateofbirth,
      this.userImage,
      this.mobileNo,
      this.gender,
      this.location,
      this.email,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.userType,
      this.regularMedicine,
      this.illness,
      this.medicineTaken,
      this.allergyId,
      this.allergyName,
      this.surgeryName,
      this.surgeryDetails,
      this.treatmentTaken,
      this.treatmentTakenDetails,
      this.userProfile});

  Userdetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediezyPatientId = json['mediezy_patient_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    age = json['age'];
    dateofbirth = json['dateofbirth'];
    userImage = json['user_image'];
    mobileNo = json['mobileNo'];
    gender = json['gender'];
    location = json['location'];
    email = json['email'];
    userId = json['UserId'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userType = json['user_type'];
    regularMedicine = json['regularMedicine'];
    illness = json['illness'];
    medicineTaken = json['Medicine_Taken'];
    allergyId = json['allergy_id'];
    allergyName = json['allergy_name'];
    surgeryName = json['surgery_name'];
    surgeryDetails = json['surgery_details'];
    treatmentTaken = json['treatment_taken'];
    treatmentTakenDetails = json['treatment_taken_details'];
    userProfile = json['UserProfile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mediezy_patient_id'] = mediezyPatientId;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['age'] = age;
    data['dateofbirth'] = dateofbirth;
    data['user_image'] = userImage;
    data['mobileNo'] = mobileNo;
    data['gender'] = gender;
    data['location'] = location;
    data['email'] = email;
    data['UserId'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['user_type'] = userType;
    data['regularMedicine'] = regularMedicine;
    data['illness'] = illness;
    data['Medicine_Taken'] = medicineTaken;
    data['allergy_id'] = allergyId;
    data['allergy_name'] = allergyName;
    data['surgery_name'] = surgeryName;
    data['surgery_details'] = surgeryDetails;
    data['treatment_taken'] = treatmentTaken;
    data['treatment_taken_details'] = treatmentTakenDetails;
    data['UserProfile'] = userProfile;
    return data;
  }
}
