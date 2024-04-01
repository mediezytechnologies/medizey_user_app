class AutoFetchModel {
  bool? status;
  List<Details>? details;
  String? message;

  AutoFetchModel({this.status, this.details, this.message});

  AutoFetchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(Details.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (details != null) {
      data['details'] = details!.map((v) => v.toJson()).toList();
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
  String? displayAge;

  Details(
      {this.patientId,
      this.firstname,
      this.dateofbirth,
      this.mobileNo,
      this.gender,
      this.age,
      this.displayAge});

  Details.fromJson(Map<String, dynamic> json) {
    patientId = json['patientId'];
    firstname = json['firstname'];
    dateofbirth = json['dateofbirth'];
    mobileNo = json['mobileNo'];
    gender = json['gender'];
    age = json['age'];
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
    data['displayAge'] = displayAge;
    return data;
  }
}
