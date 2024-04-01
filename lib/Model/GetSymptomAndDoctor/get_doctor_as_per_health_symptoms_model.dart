import 'package:mediezy_user/Model/Clinics/clinic_model.dart';

class GetDoctorAsPerHealthSymptomsModel {
  bool? status;
  List<Data>? data;
  String? message;

  GetDoctorAsPerHealthSymptomsModel({this.status, this.data, this.message});

  GetDoctorAsPerHealthSymptomsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  String? firstname;
  String? secondname;
  String? location;
  String? mainHospital;
  String? docterImage;
  String? specialization;
  List<Clinics>? clincs;
  String? firstClinicName;
  int? firstTokenCount;

  Data(
      {this.id,
      this.userId,
      this.firstname,
      this.secondname,
      this.location,
      this.mainHospital,
      this.docterImage,
      this.specialization,
      this.clincs,
      this.firstClinicName,
      this.firstTokenCount});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['UserId'];
    firstname = json['firstname'];
    secondname = json['secondname'];
    location = json['location'];
    mainHospital = json['MainHospital'];
    docterImage = json['docter_image'];
    specialization = json['Specialization'];
    if (json['clincs'] != null) {
      clincs = <Clinics>[];
      json['clincs'].forEach((v) {
        clincs!.add(Clinics.fromJson(v));
      });
    }
    firstClinicName = json['first_clinic_name'];
    firstTokenCount = json['firstTokenCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['UserId'] = userId;
    data['firstname'] = firstname;
    data['secondname'] = secondname;
    data['location'] = location;
    data['MainHospital'] = mainHospital;
    data['docter_image'] = docterImage;
    data['Specialization'] = specialization;
    if (clincs != null) {
      data['clincs'] = clincs!.map((v) => v.toJson()).toList();
    }
    data['first_clinic_name'] = firstClinicName;
    data['firstTokenCount'] = firstTokenCount;
    return data;
  }
}


