class GetUpdatedMedicineModel {
  bool? status;
  List<MedicineDetails>? medicineDetails;

  GetUpdatedMedicineModel({this.status, this.medicineDetails});

  GetUpdatedMedicineModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['medicine_details'] != null) {
      medicineDetails = <MedicineDetails>[];
      json['medicine_details'].forEach((v) {
        medicineDetails!.add(MedicineDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (medicineDetails != null) {
      data['medicine_details'] =
          medicineDetails!.map((v) => v.toJson()).toList();
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
