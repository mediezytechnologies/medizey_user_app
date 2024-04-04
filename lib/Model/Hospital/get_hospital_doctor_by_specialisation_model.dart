import 'package:mediezy_user/Model/Clinics/clinic_model.dart';

class GetHospitalDoctorBySpecialisationModel {
  bool? status;
  String? message;
  List<DoctorDetails>? doctorDetails;

  GetHospitalDoctorBySpecialisationModel(
      {this.status, this.message, this.doctorDetails});

  GetHospitalDoctorBySpecialisationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['doctor_details'] != null) {
      doctorDetails = <DoctorDetails>[];
      json['doctor_details'].forEach((v) {
        doctorDetails!.add(DoctorDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (doctorDetails != null) {
      data['doctor_details'] = doctorDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DoctorDetails {
  int? id;
  int? userId;
  String? firstname;
  String? lastname;
  String? location;
  String? servicesAt;
  String? docterImage;
  String? specialization;
  List<Clinics>? clinics;

  DoctorDetails(
      {this.id,
      this.userId,
      this.firstname,
      this.lastname,
      this.location,
      this.servicesAt,
      this.docterImage,
      this.specialization,
      this.clinics});

  DoctorDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['UserId'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    location = json['location'];
    servicesAt = json['Services_at'];
    docterImage = json['docter_image'];
    specialization = json['Specialization'];
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
    data['lastname'] = lastname;
    data['location'] = location;
    data['Services_at'] = servicesAt;
    data['docter_image'] = docterImage;
    data['Specialization'] = specialization;
    if (clinics != null) {
      data['clinics'] = clinics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
