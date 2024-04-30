class OtherTypePatientDetailsModel {
  bool? status;
  Details? details;
  String? message;

  OtherTypePatientDetailsModel({this.status, this.details, this.message});

  OtherTypePatientDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    details =
        json['details'] != null ? Details.fromJson(json['details']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (details != null) {
      data['details'] = details!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Details {
  int? patientId;
  String? firstname;
  String? dateofbirth;
  String? mobileNo;
  String? gender;
  int? age;
  String? mediezyPatientId;
  String? displayAge;

  Details(
      {this.patientId,
      this.firstname,
      this.dateofbirth,
      this.mobileNo,
      this.gender,
      this.age,
      this.mediezyPatientId,
      this.displayAge});

  Details.fromJson(Map<String, dynamic> json) {
    patientId = json['patientId'];
    firstname = json['firstname'];
    dateofbirth = json['dateofbirth'];
    mobileNo = json['mobileNo'];
    gender = json['gender'];
    age = json['age'];
    mediezyPatientId = json['mediezy_patient_id'];
    displayAge = json['displayAge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['patientId'] = patientId;
    data['firstname'] = firstname;
    data['dateofbirth'] = dateofbirth;
    data['mobileNo'] = mobileNo;
    data['gender'] = gender;
    data['age'] = age;
    data['mediezy_patient_id'] = mediezyPatientId;
    data['displayAge'] = displayAge;
    return data;
  }
}
