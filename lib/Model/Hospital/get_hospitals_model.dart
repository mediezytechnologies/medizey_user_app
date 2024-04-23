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
  String? latitude;
  String? longitude;
  String? clinicMainImage;
  String? specializations;
  int? doctorCount;
  String? distanceFromUser;

  Clinics(
      {this.clinicId,
      this.clinicName,
      this.address,
      this.location,
      this.latitude,
      this.longitude,
      this.clinicMainImage,
      this.specializations,
      this.doctorCount,
      this.distanceFromUser});

  Clinics.fromJson(Map<String, dynamic> json) {
    clinicId = json['clinic_id'];
    clinicName = json['clinic_name'];
    address = json['address'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    clinicMainImage = json['clinic_main_image'];
    specializations = json['specializations'];
    doctorCount = json['doctor_count'];
    distanceFromUser = json['distance_from_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clinic_id'] = clinicId;
    data['clinic_name'] = clinicName;
    data['address'] = address;
    data['location'] = location;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['clinic_main_image'] = clinicMainImage;
    data['specializations'] = specializations;
    data['doctor_count'] = doctorCount;
    data['distance_from_user'] = distanceFromUser;
    return data;
  }
}
