class GetCompletedAppointmentsModel {
  bool? status;
  List<CompletedAppointments>? completedAppointments;

  GetCompletedAppointmentsModel({this.status, this.completedAppointments});

  GetCompletedAppointmentsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['completed_appointments'] != null) {
      completedAppointments = <CompletedAppointments>[];
      json['completed_appointments'].forEach((v) {
        completedAppointments!.add(CompletedAppointments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (completedAppointments != null) {
      data['completed_appointments'] =
          completedAppointments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompletedAppointments {
  int? tokenId;
  int? doctorId;
  int? clinicId;
  int? tokenNumber;
  String? tokenStartTime;
  String? doctorName;
  String? doctorImage;
  String? clinicName;
  MainSymptoms? mainSymptoms;
  OtherSymptom? otherSymptom;
  String? patientName;
  String? notes;
  int? reviewAfter;
  String? labTest;
  String? tokenTime;
  String? tokenDate;
  String? prescriptionImage;
  String? labName;
  String? medicalStoreName;
  List<MedicalPrescriptions>? medicalPrescriptions;

  CompletedAppointments(
      {this.tokenId,
      this.doctorId,
      this.clinicId,
      this.tokenNumber,
      this.tokenStartTime,
      this.doctorName,
      this.doctorImage,
      this.clinicName,
      this.mainSymptoms,
      this.otherSymptom,
      this.patientName,
      this.notes,
      this.reviewAfter,
      this.labTest,
      this.tokenTime,
      this.tokenDate,
      this.prescriptionImage,
      this.labName,
      this.medicalStoreName,
      this.medicalPrescriptions});

  CompletedAppointments.fromJson(Map<String, dynamic> json) {
    tokenId = json['token_id'];
    doctorId = json['doctor_id'];
    clinicId = json['clinic_id'];
    tokenNumber = json['token_number'];
    tokenStartTime = json['token_start_time'];
    doctorName = json['doctor_name'];
    doctorImage = json['doctor_image'];
    clinicName = json['clinic_name'];
    mainSymptoms = json['main_symptoms'] != null
        ? MainSymptoms.fromJson(json['main_symptoms'])
        : null;
    otherSymptom = json['other_symptom'] != null
        ? OtherSymptom.fromJson(json['other_symptom'])
        : null;
    patientName = json['patient_name'];
    notes = json['notes'];
    reviewAfter = json['review_after'];
    labTest = json['lab_test'];
    tokenTime = json['token_time'];
    tokenDate = json['token_date'];
    prescriptionImage = json['prescription_image'];
    labName = json['lab_name'];
    medicalStoreName = json['medical_store_name'];
    if (json['medical_prescriptions'] != null) {
      medicalPrescriptions = <MedicalPrescriptions>[];
      json['medical_prescriptions'].forEach((v) {
        medicalPrescriptions!.add(MedicalPrescriptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token_id'] = tokenId;
    data['doctor_id'] = doctorId;
    data['clinic_id'] = clinicId;
    data['token_number'] = tokenNumber;
    data['token_start_time'] = tokenStartTime;
    data['doctor_name'] = doctorName;
    data['doctor_image'] = doctorImage;
    data['clinic_name'] = clinicName;
    if (mainSymptoms != null) {
      data['main_symptoms'] = mainSymptoms!.toJson();
    }
    if (otherSymptom != null) {
      data['other_symptom'] = otherSymptom!.toJson();
    }
    data['patient_name'] = patientName;
    data['notes'] = notes;
    data['review_after'] = reviewAfter;
    data['lab_test'] = labTest;
    data['token_time'] = tokenTime;
    data['token_date'] = tokenDate;
    data['prescription_image'] = prescriptionImage;
    data['lab_name'] = labName;
    data['medical_store_name'] = medicalStoreName;
    if (medicalPrescriptions != null) {
      data['medical_prescriptions'] =
          medicalPrescriptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MainSymptoms {
  String? mainsymptoms;

  MainSymptoms({this.mainsymptoms});

  MainSymptoms.fromJson(Map<String, dynamic> json) {
    mainsymptoms = json['Mainsymptoms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Mainsymptoms'] = mainsymptoms;
    return data;
  }
}

class OtherSymptom {
  String? symtoms;

  OtherSymptom({this.symtoms});

  OtherSymptom.fromJson(Map<String, dynamic> json) {
    symtoms = json['symtoms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['symtoms'] = symtoms;
    return data;
  }
}

class MedicalPrescriptions {
  String? medicineName;
  String? medicineDosage;
  String? medicineNumberOfdays;
  int? noon;
  int? night;
  int? morning;
  int? medicineType;

  MedicalPrescriptions(
      {this.medicineName,
      this.medicineDosage,
      this.medicineNumberOfdays,
      this.noon,
      this.night,
      this.morning,
      this.medicineType});

  MedicalPrescriptions.fromJson(Map<String, dynamic> json) {
    medicineName = json['medicine_name'];
    medicineDosage = json['medicine_dosage'];
    medicineNumberOfdays = json['medicine_number_ofdays'];
    noon = json['Noon'];
    night = json['night'];
    morning = json['morning'];
    medicineType = json['medicine_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medicine_name'] = medicineName;
    data['medicine_dosage'] = medicineDosage;
    data['medicine_number_ofdays'] = medicineNumberOfdays;
    data['Noon'] = noon;
    data['night'] = night;
    data['morning'] = morning;
    data['medicine_type'] = medicineType;
    return data;
  }
}
