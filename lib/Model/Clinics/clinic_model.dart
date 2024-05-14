class Clinics {
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
  String? nextAvailableTokenTime;
  String? nextDateAvailableTokenTime;
  String? distanceFromClinic;
  int? consultationFee;

  Clinics(
      {this.clinicId,
      this.clinicName,
      this.clinicStartTime,
      this.clinicEndTime,
      this.clinicAddress,
      this.clinicLocation,
      this.clinicMainImage,
      this.clinicDescription,
      this.totalTokenCount,
      this.availableTokenCount,
      this.nextAvailableTokenTime,
      this.nextDateAvailableTokenTime,
      this.distanceFromClinic,
      this.consultationFee});

  Clinics.fromJson(Map<String, dynamic> json) {
    clinicId = json['clinic_id'];
    clinicName = json['clinic_name'];
    clinicStartTime = json['clinic_start_time'];
    clinicEndTime = json['clinic_end_time'];
    clinicAddress = json['clinic_address'];
    clinicLocation = json['clinic_location'];
    clinicMainImage = json['clinic_main_image'];
    clinicDescription = json['clinic_description'];
    totalTokenCount = json['total_token_Count'];
    availableTokenCount = json['available_token_count'];
    nextAvailableTokenTime = json['next_available_token_time'];
    nextDateAvailableTokenTime = json['next_date_available_token_time'];
    distanceFromClinic = json['distance_from_clinic'];
    consultationFee = json['consultation_fee'];
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
    data['total_token_Count'] = totalTokenCount;
    data['available_token_count'] = availableTokenCount;
    data['next_available_token_time'] = nextAvailableTokenTime;
    data['next_date_available_token_time'] = nextDateAvailableTokenTime;
    data['distance_from_clinic'] = distanceFromClinic;
    data['consultation_fee'] = consultationFee;
    return data;
  }
}
