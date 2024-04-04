import 'package:mediezy_user/Model/Clinics/clinic_model.dart';

class DoctorModel {
  bool? success;
  List<AllDoctors>? allDoctors;
  String? code;
  String? message;

  DoctorModel({this.success, this.allDoctors, this.code, this.message});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['All Doctors'] != null) {
      allDoctors = <AllDoctors>[];
      json['All Doctors'].forEach((v) {
        allDoctors!.add(AllDoctors.fromJson(v));
      });
    }
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (allDoctors != null) {
      data['All Doctors'] = allDoctors!.map((v) => v.toJson()).toList();
    }
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class AllDoctors {
  int? id;
  int? userId;
  String? firstname;
  String? secondname;
  String? specialization;
  String? docterImage;
  String? location;
  String? mainHospital;
  List<Clinics>? clinics;
  int? favoriteStatus;

  AllDoctors(
      {this.id,
      this.userId,
      this.firstname,
      this.secondname,
      this.specialization,
      this.docterImage,
      this.location,
      this.mainHospital,
      this.clinics,
      this.favoriteStatus});

  AllDoctors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['UserId'];
    firstname = json['firstname'];
    secondname = json['secondname'];
    specialization = json['Specialization'];
    docterImage = json['DocterImage'];
    location = json['Location'];
    mainHospital = json['MainHospital'];
    if (json['clinics'] != null) {
      clinics = <Clinics>[];
      json['clinics'].forEach((v) {
        clinics!.add(Clinics.fromJson(v));
      });
    }
    favoriteStatus = json['favoriteStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['UserId'] = userId;
    data['firstname'] = firstname;
    data['secondname'] = secondname;
    data['Specialization'] = specialization;
    data['DocterImage'] = docterImage;
    data['Location'] = location;
    data['MainHospital'] = mainHospital;
    if (clinics != null) {
      data['clinics'] = clinics!.map((v) => v.toJson()).toList();
    }
    data['favoriteStatus'] = favoriteStatus;
    return data;
  }
}
