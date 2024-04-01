class GetAllMembersModel {
  bool? status;
  List<PatientData>? patientData;

  GetAllMembersModel({this.status, this.patientData});

  GetAllMembersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['patient_data'] != null) {
      patientData = <PatientData>[];
      json['patient_data'].forEach((v) {
        patientData!.add(PatientData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (patientData != null) {
      data['patient_data'] = patientData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PatientData {
  int? id;
  String? patientName;
  String? mediezyPatientId;
  int? patientAge;
  String? dob;
  String? patientGender;
  String? patientMobileNumber;
  String? allergyId;
  String? allergyName;
  String? allergyDetail;
  String? regularMedicine;
  List<String>? surgeryName;
  List<String>? treatmentTaken;
  String? surgeryDetails;
  String? treatmentTakenDetails;
  String? patientImage;
  List<MedicineDetails>? medicineDetails;
  String? displayAge;

  PatientData(
      {this.id,
      this.patientName,
      this.mediezyPatientId,
      this.patientAge,
      this.dob,
      this.patientGender,
      this.patientMobileNumber,
      this.allergyId,
      this.allergyName,
      this.allergyDetail,
      this.regularMedicine,
      this.surgeryName,
      this.treatmentTaken,
      this.surgeryDetails,
      this.treatmentTakenDetails,
      this.patientImage,
      this.medicineDetails,
      this.displayAge});

  PatientData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientName = json['patient_name'];
    mediezyPatientId = json['mediezy_patient_id'];
    patientAge = json['patient_age'];
    dob = json['dob'];
    patientGender = json['patient_gender'];
    patientMobileNumber = json['patient_mobile_number'];
    allergyId = json['allergy_id'];
    allergyName = json['allergy_name'];
    allergyDetail = json['allergy_detail'];
    regularMedicine = json['regular_medicine'];
    surgeryName = json['surgery_name'].cast<String>();
    treatmentTaken = json['treatment_taken'].cast<String>();
    surgeryDetails = json['surgery_details'];
    treatmentTakenDetails = json['treatment_taken_details'];
    patientImage = json['patient_image'];
    if (json['medicine_details'] != null) {
      medicineDetails = <MedicineDetails>[];
      json['medicine_details'].forEach((v) {
        medicineDetails!.add(MedicineDetails.fromJson(v));
      });
    }
    displayAge = json['display_age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patient_name'] = patientName;
    data['mediezy_patient_id'] = mediezyPatientId;
    data['patient_age'] = patientAge;
    data['dob'] = dob;
    data['patient_gender'] = patientGender;
    data['patient_mobile_number'] = patientMobileNumber;
    data['allergy_id'] = allergyId;
    data['allergy_name'] = allergyName;
    data['allergy_detail'] = allergyDetail;
    data['regular_medicine'] = regularMedicine;
    data['surgery_name'] = surgeryName;
    data['treatment_taken'] = treatmentTaken;
    data['surgery_details'] = surgeryDetails;
    data['treatment_taken_details'] = treatmentTakenDetails;
    data['patient_image'] = patientImage;
    if (medicineDetails != null) {
      data['medicine_details'] =
          medicineDetails!.map((v) => v.toJson()).toList();
    }
    data['display_age'] = displayAge;
    return data;
  }
}

class MedicineDetails {
  int? medicineId;
  String? medicineName;
  String? illness;

  MedicineDetails({this.medicineId, this.medicineName, this.illness});

  MedicineDetails.fromJson(Map<String, dynamic> json) {
    medicineId = json['medicine_id'];
    medicineName = json['medicine_name'];
    illness = json['illness'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medicine_id'] = medicineId;
    data['medicine_name'] = medicineName;
    data['illness'] = illness;
    return data;
  }
}
