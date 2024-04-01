class GetClinicModel {
  bool? success;
  List<ClinicDetails>? clinicDetails;
  String? code;
  String? message;

  GetClinicModel({this.success, this.clinicDetails, this.code, this.message});

  GetClinicModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['Clinic Details'] != null) {
      clinicDetails = <ClinicDetails>[];
      json['Clinic Details'].forEach((v) {
        clinicDetails!.add(ClinicDetails.fromJson(v));
      });
    }
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (clinicDetails != null) {
      data['Clinic Details'] = clinicDetails!.map((v) => v.toJson()).toList();
    }
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class ClinicDetails {
  int? clinicId;
  String? clinicName;
  String? clinicStartTime;
  String? clinicEndTime;
  String? clinicAddress;
  String? clinicLocation;
  String? clinicMainImage;
  String? clinicDescription;
  int? totalTokenCount;
  int? availableTokenCount;

  ClinicDetails(
      {this.clinicId,
      this.clinicName,
      this.clinicStartTime,
      this.clinicEndTime,
      this.clinicAddress,
      this.clinicLocation,
      this.clinicMainImage,
      this.clinicDescription,
      this.totalTokenCount,
      this.availableTokenCount});

  ClinicDetails.fromJson(Map<String, dynamic> json) {
    clinicId = json['clinic_id'];
    clinicName = json['clinic_name'];
    clinicStartTime = json['clinic_start_time'];
    clinicEndTime = json['clinic_end_time'];
    clinicAddress = json['clinic_address'];
    clinicLocation = json['clinic_location'];
    clinicMainImage = json['clinic_main_image'];
    clinicDescription = json['clinic_description'];
    totalTokenCount = json['total_token_count'];
    availableTokenCount = json['available_token_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clinic_id'] = clinicId;
    data['clinic_name'] = clinicName;
    data['clinic_start_time'] = clinicStartTime;
    data['clinic_end_time'] = clinicEndTime;
    data['clinic_address'] = clinicAddress;
    data['clinic_location'] = clinicLocation;
    data['clinic_main_image'] = clinicMainImage;
    data['clinic_description'] = clinicDescription;
    data['total_token_count'] = totalTokenCount;
    data['available_token_count'] = availableTokenCount;
    return data;
  }
}
