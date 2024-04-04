// To parse this JSON data, do
//
//     final clintClinicModelData = clintClinicModelDataFromJson(jsonString);

import 'dart:convert';

ClintClinicModelData clintClinicModelDataFromJson(String str) =>
    ClintClinicModelData.fromJson(json.decode(str));

String clintClinicModelDataToJson(ClintClinicModelData data) =>
    json.encode(data.toJson());

class ClintClinicModelData {
  bool? status;
  ClintClinicModels? clintClinicModels;
  int? patientId;
  String? message;

  ClintClinicModelData({
    this.status,
    this.clintClinicModels,
    this.patientId,
    this.message,
  });

  factory ClintClinicModelData.fromJson(Map<String, dynamic> json) =>
      ClintClinicModelData(
        status: json["status"],
        clintClinicModels: json["clint_clinic_models"] == null
            ? null
            : ClintClinicModels.fromJson(json["clint_clinic_models"]),
        patientId: json["patient_id"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "clint_clinic_models": clintClinicModels?.toJson(),
        "patient_id": patientId,
        "message": message,
      };
}

class ClintClinicModels {
  int? userId;
  String? fullName;
  String? mobileNumber;
  String? gender;
  DateTime? dateOfBirth;
  String? regularMedicine;
  String? medicineTaken;
  String? illness;
  List<Medicine>? medicines;
  List<Allergy>? allergies;
  String? surgeryName;
  String? surgeryDetails;
  String? treatmentTaken;
  String? treatmentTakenDetails;

  ClintClinicModels({
    this.userId,
    this.fullName,
    this.mobileNumber,
    this.gender,
    this.dateOfBirth,
    this.regularMedicine,
    this.medicineTaken,
    this.illness,
    this.medicines,
    this.allergies,
    this.surgeryName,
    this.surgeryDetails,
    this.treatmentTaken,
    this.treatmentTakenDetails,
  });

  factory ClintClinicModels.fromJson(Map<String, dynamic> json) =>
      ClintClinicModels(
        userId: json["user_id"],
        fullName: json["full_name"],
        mobileNumber: json["mobile_number"],
        gender: json["gender"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        regularMedicine: json["regularMedicine"],
        medicineTaken: json["Medicine_Taken"],
        illness: json["illness"],
        medicines: json["medicines"] == null
            ? []
            : List<Medicine>.from(
                json["medicines"]!.map((x) => Medicine.fromJson(x))),
        allergies: json["allergies"] == null
            ? []
            : List<Allergy>.from(
                json["allergies"]!.map((x) => Allergy.fromJson(x))),
        surgeryName: json["surgery_name"],
        surgeryDetails: json["surgery_details"],
        treatmentTaken: json["treatment_taken"],
        treatmentTakenDetails: json["treatment_taken_details"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "full_name": fullName,
        "mobile_number": mobileNumber,
        "gender": gender,
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "regularMedicine": regularMedicine,
        "Medicine_Taken": medicineTaken,
        "illness": illness,
        "medicines": medicines == null
            ? []
            : List<dynamic>.from(medicines!.map((x) => x.toJson())),
        "allergies": allergies == null
            ? []
            : List<dynamic>.from(allergies!.map((x) => x.toJson())),
        "surgery_name": surgeryName,
        "surgery_details": surgeryDetails,
        "treatment_taken": treatmentTaken,
        "treatment_taken_details": treatmentTakenDetails,
      };
}

class Allergy {
  int? allergyId;
  String? allergyDetails;

  Allergy({
    this.allergyId,
    this.allergyDetails,
  });

  factory Allergy.fromJson(Map<String, dynamic> json) => Allergy(
        allergyId: json["allergy_id"],
        allergyDetails: json["allergy_details"],
      );

  Map<String, dynamic> toJson() => {
        "allergy_id": allergyId,
        "allergy_details": allergyDetails,
      };
}

class Medicine {
  String? medicineName;
  String? illness;

  Medicine({
    this.medicineName,
    this.illness,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
        medicineName: json["medicineName"],
        illness: json["illness"],
      );

  Map<String, dynamic> toJson() => {
        "medicineName": medicineName,
        "illness": illness,
      };
}
