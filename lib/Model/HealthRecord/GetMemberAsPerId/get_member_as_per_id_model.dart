class GetMemberAsPerIdModel {
  bool? status;
  String? message;
  PatientData? patientData;

  GetMemberAsPerIdModel({this.status, this.message, this.patientData});

  GetMemberAsPerIdModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    patientData = json['patient_data'] != null
        ? PatientData.fromJson(json['patient_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (patientData != null) {
      data['patient_data'] = patientData!.toJson();
    }
    return data;
  }
}

class PatientData {
  String? patientName;
  int? patientAge;
  String? patientGender;
  String? patientMobileNumber;
  String? allergyId;
  String? allergyName;
  String? allergyDetail;
  String? regularMedicine;
  String? illness;
  String? medicineTaken;
  List<String>? surgeryName;
  List<String>? treatmentTaken;
  String? patientImage;

  PatientData(
      {this.patientName,
      this.patientAge,
      this.patientGender,
      this.patientMobileNumber,
      this.allergyId,
      this.allergyName,
      this.allergyDetail,
      this.regularMedicine,
      this.illness,
      this.medicineTaken,
      this.surgeryName,
      this.treatmentTaken,
      this.patientImage});

  PatientData.fromJson(Map<String, dynamic> json) {
    patientName = json['patient_name'];
    patientAge = json['patient_age'];
    patientGender = json['patient_gender'];
    patientMobileNumber = json['patient_mobile_number'];
    allergyId = json['allergy_id'];
    allergyName = json['allergy_name'];
    allergyDetail = json['allergy_detail'];
    regularMedicine = json['regular_medicine'];
    illness = json['illness'];
    medicineTaken = json['medicine_taken'];
    surgeryName = json['surgery_name'].cast<String>();
    treatmentTaken = json['treatment_taken'].cast<String>();
    patientImage = json['patient_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['patient_name'] = patientName;
    data['patient_age'] = patientAge;
    data['patient_gender'] = patientGender;
    data['patient_mobile_number'] = patientMobileNumber;
    data['allergy_id'] = allergyId;
    data['allergy_name'] = allergyName;
    data['allergy_detail'] = allergyDetail;
    data['regular_medicine'] = regularMedicine;
    data['illness'] = illness;
    data['medicine_taken'] = medicineTaken;
    data['surgery_name'] = surgeryName;
    data['treatment_taken'] = treatmentTaken;
    data['patient_image'] = patientImage;
    return data;
  }
}
