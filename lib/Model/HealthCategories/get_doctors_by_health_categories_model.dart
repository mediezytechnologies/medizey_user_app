import 'package:mediezy_user/Model/Clinics/clinic_model.dart';

class GetDoctorsByHealthCategoriesModel {
  bool? status;
  List<HealthConcern>? healthConcern;
  String? message;

  GetDoctorsByHealthCategoriesModel(
      {this.status, this.healthConcern, this.message});

  GetDoctorsByHealthCategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['health_concern'] != null) {
      healthConcern = <HealthConcern>[];
      json['health_concern'].forEach((v) {
        healthConcern!.add(HealthConcern.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (healthConcern != null) {
      data['health_concern'] =
          healthConcern!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class HealthConcern {
  int? id;
  int? userId;
  String? firstname;
  String? secondname;
  String? location;
  String? mainHospital;
  String? specialization;
  String? docterImage;
  List<Clinics>? clinics;

  HealthConcern(
      {this.id,
      this.userId,
      this.firstname,
      this.secondname,
      this.location,
      this.mainHospital,
      this.specialization,
      this.docterImage,
      this.clinics});

  HealthConcern.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['UserId'];
    firstname = json['firstname'];
    secondname = json['secondname'];
    location = json['location'];
    mainHospital = json['MainHospital'];
    specialization = json['Specialization'];
    docterImage = json['DocterImage'];
    if (json['clinics'] != null) {
      clinics = <Clinics>[];
      json['clinics'].forEach((v) {
        clinics!.add(Clinics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['UserId'] = userId;
    data['firstname'] = firstname;
    data['secondname'] = secondname;
    data['location'] = location;
    data['MainHospital'] = mainHospital;
    data['Specialization'] = specialization;
    data['DocterImage'] = docterImage;
    if (clinics != null) {
      data['clinics'] = clinics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


