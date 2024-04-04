import 'package:mediezy_user/Model/Clinics/clinic_model.dart';

class GetDoctersAsPerSpecialisationModel {
  bool? success;
  List<DoctorBySpecialization>? doctorBySpecialization;
  String? code;
  String? message;

  GetDoctersAsPerSpecialisationModel(
      {this.success, this.doctorBySpecialization, this.code, this.message});

  GetDoctersAsPerSpecialisationModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['Doctor_By_Specialization'] != null) {
      doctorBySpecialization = <DoctorBySpecialization>[];
      json['Doctor_By_Specialization'].forEach((v) {
        doctorBySpecialization!.add(DoctorBySpecialization.fromJson(v));
      });
    }
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (doctorBySpecialization != null) {
      data['Doctor_By_Specialization'] =
          doctorBySpecialization!.map((v) => v.toJson()).toList();
    }
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class DoctorBySpecialization {
  int? id;
  int? userId;
  String? firstname;
  String? secondname;
  String? specialization;
  String? docterImage;
  String? location;
  String? mainHospital;
  List<Clinics>? clinics;

  DoctorBySpecialization(
      {this.id,
      this.userId,
      this.firstname,
      this.secondname,
      this.specialization,
      this.docterImage,
      this.location,
      this.mainHospital,
      this.clinics});

  DoctorBySpecialization.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
