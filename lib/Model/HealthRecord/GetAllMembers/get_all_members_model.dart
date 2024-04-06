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
  String? displayAge;
  String? patientGender;
  String? patientMobileNumber;
  String? regularMedicine;
  List<String>? surgeryName;
  List<String>? treatmentTaken;
  String? surgeryDetails;
  String? treatmentTakenDetails;
  String? patientImage;
  List<MedicineDetails>? medicineDetails;
  List<AllergiesDetails>? allergiesDetails;

  PatientData(
      {this.id,
      this.patientName,
      this.mediezyPatientId,
      this.patientAge,
      this.dob,
      this.displayAge,
      this.patientGender,
      this.patientMobileNumber,
      this.regularMedicine,
      this.surgeryName,
      this.treatmentTaken,
      this.surgeryDetails,
      this.treatmentTakenDetails,
      this.patientImage,
      this.medicineDetails,
      this.allergiesDetails});

  PatientData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientName = json['patient_name'];
    mediezyPatientId = json['mediezy_patient_id'];
    patientAge = json['patient_age'];
    dob = json['dob'];
    displayAge = json['display_age'];
    patientGender = json['patient_gender'];
    patientMobileNumber = json['patient_mobile_number'];
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
    if (json['allergies_details'] != null) {
      allergiesDetails = <AllergiesDetails>[];
      json['allergies_details'].forEach((v) {
        allergiesDetails!.add(AllergiesDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patient_name'] = patientName;
    data['mediezy_patient_id'] = mediezyPatientId;
    data['patient_age'] = patientAge;
    data['dob'] = dob;
    data['display_age'] = displayAge;
    data['patient_gender'] = patientGender;
    data['patient_mobile_number'] = patientMobileNumber;
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
    if (allergiesDetails != null) {
      data['allergies_details'] =
          allergiesDetails!.map((v) => v.toJson()).toList();
    }
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
    medicineName = json['medicineName'];
    illness = json['illness'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medicine_id'] = medicineId;
    data['medicineName'] = medicineName;
    data['illness'] = illness;
    return data;
  }
}

class AllergiesDetails {
  int? allergyId;
  String? allergyDetails;

  AllergiesDetails({this.allergyId, this.allergyDetails});

  AllergiesDetails.fromJson(Map<String, dynamic> json) {
    allergyId = json['allergy_id'];
    allergyDetails = json['allergy_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['allergy_id'] = allergyId;
    data['allergy_details'] = allergyDetails;
    return data;
  }
}