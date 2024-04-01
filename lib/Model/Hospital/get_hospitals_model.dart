class GetHospitalModel {
  bool? status;
  String? message;
  List<Clinics>? clinics;

  GetHospitalModel({this.status, this.message, this.clinics});

  GetHospitalModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['clinics'] != null) {
      clinics = <Clinics>[];
      json['clinics'].forEach((v) {
        clinics!.add(Clinics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (clinics != null) {
      data['clinics'] = clinics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Clinics {
  int? clinicId;
  String? clinicName;
  String? address;
  String? location;
  String? clinicMainImage;
  int? doctorCount;
  String? specializations;

  Clinics(
      {this.clinicId,
      this.clinicName,
      this.address,
      this.location,
      this.clinicMainImage,
      this.doctorCount,
      this.specializations});

  Clinics.fromJson(Map<String, dynamic> json) {
    clinicId = json['clinic_id'];
    clinicName = json['clinic_name'];
    address = json['address'];
    location = json['location'];
    clinicMainImage = json['clinic_main_image'];
    doctorCount = json['doctor_count'];
    specializations = json['specializations'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clinic_id'] = clinicId;
    data['clinic_name'] = clinicName;
    data['address'] = address;
    data['location'] = location;
    data['clinic_main_image'] = clinicMainImage;
    data['doctor_count'] = doctorCount;
    data['specializations'] = specializations;
    return data;
  }
}
