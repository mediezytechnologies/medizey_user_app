class GetHospitalByIdModel {
  bool? status;
  String? message;
  List<ClinicDetails>? clinicDetails;

  GetHospitalByIdModel({this.status, this.message, this.clinicDetails});

  GetHospitalByIdModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['clinic_details'] != null) {
      clinicDetails = <ClinicDetails>[];
      json['clinic_details'].forEach((v) {
        clinicDetails!.add(ClinicDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (clinicDetails != null) {
      data['clinic_details'] = clinicDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClinicDetails {
  int? clinicId;
  String? clinicName;
  String? clinicDescription;
  String? address;
  String? location;
  List<String>? images;
  List<Specializations>? specializations;

  ClinicDetails(
      {this.clinicId,
      this.clinicName,
      this.clinicDescription,
      this.address,
      this.location,
      this.images,
      this.specializations});

  ClinicDetails.fromJson(Map<String, dynamic> json) {
    clinicId = json['clinic_id'];
    clinicName = json['clinic_name'];
    clinicDescription = json['clinic_description'];
    address = json['address'];
    location = json['location'];
    images = json['images'].cast<String>();
    if (json['specializations'] != null) {
      specializations = <Specializations>[];
      json['specializations'].forEach((v) {
        specializations!.add(Specializations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clinic_id'] = clinicId;
    data['clinic_name'] = clinicName;
    data['clinic_description'] = clinicDescription;
    data['address'] = address;
    data['location'] = location;
    data['images'] = images;
    if (specializations != null) {
      data['specializations'] =
          specializations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Specializations {
  int? specializationId;
  String? specializationName;
  String? specializationIcon;
  int? availableDoctorCount;

  Specializations(
      {this.specializationId,
      this.specializationName,
      this.specializationIcon,
      this.availableDoctorCount});

  Specializations.fromJson(Map<String, dynamic> json) {
    specializationId = json['specialization_id'];
    specializationName = json['specialization_name'];
    specializationIcon = json['specialization_icon'];
    availableDoctorCount = json['available_doctor_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['specialization_id'] = specializationId;
    data['specialization_name'] = specializationName;
    data['specialization_icon'] = specializationIcon;
    data['available_doctor_count'] = availableDoctorCount;
    return data;
  }
}
